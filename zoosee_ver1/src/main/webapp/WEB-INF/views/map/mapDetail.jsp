<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Map Info</title>
	<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/bootstrap.css">
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlsO7TdNNljmvFRGvg2QoMt78rxH9fYt4&callback=initMap"></script>
	<script type="text/javascript">
/* 		function googleapisView() {
			
		} */
		var latitude; 	// 위도
		var longitude;  // 경도
		
		$(document).ready(function(){
			var address = encodeURIComponent("${requestScope.memberVO.address}");
			var geocode = "http://maps.googleapis.com/maps/api/geocode/json?address="+address+"&sensor=false";
			    
			$.ajax({
				url: geocode,
				type: 'POST',
				success: function(myJSONResult){
					if(myJSONResult.status == 'OK') {
						var tag = "";
						
						for (var i = 0; i < myJSONResult.results.length; i++) {
							tag += "주소 : " + myJSONResult.results[i].formatted_address + " <br />";
							tag += "위도 : " + myJSONResult.results[i].geometry.location.lat + " <br />";
							tag += "경도 : " + myJSONResult.results[i].geometry.location.lng + " <br />";
			                    
							latitude = myJSONResult.results[i].geometry.location.lat;
							longitude = myJSONResult.results[i].geometry.location.lng;              
						}
						document.getElementById("message").innerHTML = tag;
					}else if(myJSONResult.status == 'ZERO_RESULTS') {
						alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
					}else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
						alert("할당량이 초과되었습니다.");
					}else if(myJSONResult.status == 'REQUEST_DENIED') {
						alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
					}else if(myJSONResult.status == 'INVALID_REQUEST') {
						alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
					}
				}
			});
		});
		
		function initialize() {
		    var mapLocation = new google.maps.LatLng(latitude, longitude); 
		    // 지도에서 가운데로 위치할 위도와 경도
		    var markLocation = new google.maps.LatLng(latitude, longitude); 
		    // 마커가 위치할 위도와 경도
		     
		    var mapOptions = {
		      	center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
		      	zoom: 16, // 지도 zoom단계
		      	mapTypeId: google.maps.MapTypeId.ROADMAP
		    };
		    
		    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
		    // id가 map-canvas, body에 있는 div태그의 id와 같아야 함
		        
		    var size_x = 100; // 마커로 사용할 이미지의 가로 크기
		    var size_y = 100; // 마커로 사용할 이미지의 세로 크기
		     
		    // 마커로 사용할 이미지 주소
		    var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
		                new google.maps.Size(size_x, size_y),'','', new google.maps.Size(size_x, size_y));
		     
		    var marker = new google.maps.Marker({
	        	position: markLocation, // 마커가 위치할 위도와 경도(변수)
	           	map: map,
	           	icon: image, // 마커로 사용할 이미지(변수)
			  //info: '말풍선 안에 들어갈 내용',
	            title: '${requestScope.memberVO.address}' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
	    	});
	     
	    	var content = "이곳은 펫시터 '${requestScope.memberVO.name}님'의 주소 근처입니다."; // 말풍선 안에 들어갈 내용
	    	// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
	    	var infowindow = new google.maps.InfoWindow({content: content});
	
	   		google.maps.event.addListener(marker, "mouseover", function() {infowindow.open(map, marker);});
	   		
  		}
  		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>
<body>
	<div id="map-canvas" style="width: 700px; height: 600px; margin:0 auto;"></div><br/>
	
	<div class="well well-sm">
		<h4 style="text-align:center;">
			<span>※※ 상세 주소는 거래가 성사되면 볼 수 있습니다. ※※</span>
		</h4><br/>
		
		<div id="message" style="margin-left:8%;"></div>
	</div>
</body>
</html>
