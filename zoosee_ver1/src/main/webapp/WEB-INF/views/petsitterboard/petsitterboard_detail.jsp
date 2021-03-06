<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	var a = new Array();
	var receiveData = new Array();
  	// Controller로부터 예약된 날짜 리스트를 받아와서 JS Array object로 변환
  	function dateFormatChange(){
	   	var data = "${calendarList}";
	    data = data.substring(1, data.length-1);
	    a = data.split(",");
	    receiveData = [];
	    for(var i = 0; i < a.length; i++){
	    	a[i] = a[i].trim();
	        receiveData[i] = a[i];
	    }
  	}
      
	$(document).ready(function(){
		dateFormatChange();

      	$("#deleteId").click(function(){
        	if(confirm("삭제하시겠습니까?")){
            	location.href="${initParam.root}psboard_petsitterboard_myPetsitterBoardDelete.do?petsitterboard_no=${petsitterboardVO.petsitterboard_no}";
        	} 
      	});
      
      	var startDay = "${petsitterboardVO.startDay}";
      	var endDay = "${petsitterboardVO.endDay}";

      	$.ajax({
        	type:"POST",
            url:"avg_star_rate.do",
            data:"id=${requestScope.reviewList[0].ref_id }",
            dataType:"json",
            success:function(result){
            	var avg = result.avg*20;
                $("#star-rating").css({width: avg+'%'});  
                if(result.avg>=1){
            	$("#avgStar-rating").html("평균별점:"+result.avg+"점");
                }else{
               	$("#avgStar-rating").html("등록된 후기가 없습니다! >_<");	
                }
            }
        });
      
        $("#sdate").datepicker({
           	closeText: '닫기',
            prevText: '이전달',
            nextText: '다음달',
            currentText: '오늘',
            monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
                         '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNames: ['일','월','화','수','목','금','토'],
            dayNamesShort: ['일','월','화','수','목','금','토'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            weekHeader: 'Wk',
            dateFormat: 'yy-mm-dd',
            firstDay: 0,
            isRTL: false,
            showMonthAfterYear: true,
            yearSuffix: '',
            showOn: 'focus',
            //buttonText: "달력",
            //buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
            //buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            yearRange: ':c+10',
            beforeShowDay: function(date){
            	var day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                  
               	//for (var i = 0; i < disabledDays.length; i++) {
              	if($.inArray(day, receiveData) > -1) {
                	return [false];
            	}else{
                   	return [true];
               	}
         	},
            minDate: startDay,
            maxDate: endDay,
            onSelect:function(selectedDate){
            	$("#edate").datepicker("option", "minDate", selectedDate );
            } 
      	});
         
        var reserve_price;
        var interval;
        var price = new Number("${petsitterboardVO.petsitterVO.price}");
         
        $("#edate").datepicker({
        	closeText: '닫기',
            prevText: '이전달',
            nextText: '다음달',
            currentText: '오늘',
            monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
                         '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNames: ['일','월','화','수','목','금','토'],
            dayNamesShort: ['일','월','화','수','목','금','토'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            weekHeader: 'Wk',
            dateFormat: 'yy-mm-dd',
            firstDay: 0,
            isRTL: false,
            showMonthAfterYear: true,
            yearSuffix: '',
            showOn: 'focus',
            //buttonText: "달력",
            //buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
            //buttonImageOnly: false,
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            yearRange: ':c+10',
            beforeShowDay: function(date){
            	var day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
                  
                if($.inArray(day, receiveData) > -1) {
                	return [false];
                }else{
                    return [true];
                  }
            },
            minDate: startDay,
            maxDate: endDay,
            onSelect: function(selectedDate){
				var sDay= $("#sdate").val().split("-");
               	var eDay=$("#edate").val().split("-");
            	var rDay=receiveData
            	var length=eDay[2]-sDay[2];
            	var result=1;//0 예약불가 1 예약가능
            
            	if(sDay[1]==eDay[1]){
               		for(var i=0;i<length;i++){
                   		for(var j=0;j<receiveData.length;j++){
                        	var rDay=[];
                          	rDay=receiveData[j].split("-");
                          	if(sDay[2]==rDay[2]){
                            	result=0;
                             	break;
                          	}
                       	}
                       	sDay[2]++;
                    } 
            	}else{
               		var lastDay=new Date(sDay[0],sDay[1],0);
               		for(var i=sDay[2];i<lastDay.getDate();i++){
                    	for(var j=0;j<receiveData.length;j++){
                        	var rDay=[];
                          	rDay=receiveData[j].split("-");
                          
	                        /*if(sDay[2]==lastDay.getDate()){
	                        	sDay[2]=1;
	                        }*/
                          	if(sDay[2]==rDay[2]){
                            	result=0;
                             	break;
                          	}
                       	}
                       	sDay[2]++;
                    } 
            	}

            	if(result==0){
            		alert("날짜를 다시 확인하세요");
                	$("#edate").val("");
            	}
   
           		if($("#sdate").val() == ""){
           			alert("시작일을 먼저 입력하세요");
               		$("#edate").val(""); 	
           		}else{
           			var sdate = new Date($("#sdate").datepicker("getDate"));
                    var edate = new Date($("#edate").datepicker("getDate"));
            
                    if((edate.getMonth() - sdate.getMonth()) > 1){
                    	alert("두 달 이내로 선택하세요");
                    }else if(edate.getMonth() == sdate.getMonth()){
                       	interval = edate.getDate() - sdate.getDate();
                     
                       	if(interval == 0){
                        	interval = 1;
                           	price = price/2;
                       	}
                     	}else{
                       		var month  = sdate.getMonth()+1;
                       		var sday;
                       		var eday = edate.getDate();
                     
                        	switch(month){
                           		case 1: case 3: case 5: case 7: case 8: case 10: case 12:{
                                	sday = 31 - sdate.getDate();
                                	break;
                           		}
                           		case 4: case 6: case 9: case 11: {
                                	sday = 30 - sdate.getDate();
                                 	break;
                          		}
                           		case 2:{
                                	sday = 28 - sdate.getDate();
                                	break;
                           		}
                        	}
                        	var tday = (eday + sday + 1);
                     
                        	//alert((tday - 1) + "박" + tday + "일");
                        	interval = new Number(eday + sday + 1);
                     	}
                   
                    reserve_price = Math.floor(interval*price*1.1);
                    //alert(reserve_price + "토탈 가격");
                    $("#reserveRegForm :input[name=reserve_price]").val(reserve_price);
                    $(".days").text(interval + "박");
                    $(".totalPrice").text(interval*price + "원");
                    var totalPrice = new Number(interval*price);
                    var tax = Math.floor(totalPrice*0.1);
                    $(".tax").text(tax + "원");
                    $(".totalPricePlusTax").text(reserve_price + "원");
				}
			}
		});
        /*$.datepicker.setDefaults($.datepicker.regional['ko']); 
        $.datepicker.regional['ko'] = {
        };*/

        $("#petCheckNumber").change(function(){
        	var petCheckNumber = new Number($("#petCheckNumber").val());
            reserve_price = interval*price*(petCheckNumber+1);
            
            $("#reserveRegForm :input[name=reserve_price]").val(reserve_price);
        });
         
        $("#reserveRegForm").submit(function(){
            var rank = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.rank}";
            var id = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}";
            var boardId = "${petsitterboardVO.petsitterVO.memberVO.id}";
            
            if($("#sdate").val() == ""){
               	alert("시작일을 선택해 주세요.");
                return false;
            }else if($("#edate").val() == ""){
                alert("종료일을 선택해 주세요.");
                return false;
            }
            if(confirm("예약 요청하시겠습니까?")){
            	if(id == boardId){
                	alert("본인한테 예약 불가합니다.");
                    this.reset();
                    return false;
               }else if(id == null || id == ""){
                    alert("로그인 후 예약 가능합니다.");
                  	location.href="${initParam.root}member_login.do";
                    return false;
               }else if(rank == 'normal' || rank == 'petsitter' || rank == 'pre_petsitter'){
                    alert("펫등록 후 예약 가능합니다.");
                    location.href="${initParam.root}pet_register.do";
                    return false;
                }
            }else{
               return false;
            }
         });
        
        $("#addressMap").click(function(){
	        //alert("${petsitterboardVO.petsitterVO.memberVO.address}");
	        var address = "${petsitterboardVO.petsitterVO.memberVO.address}";
	        var id = "${petsitterboardVO.petsitterVO.memberVO.id}";
	         
	        window.open("${initParam.root}mapDetail.do?id="+id+"&address="+address,"",
               "toolbar=yes,scrollbars=yes,top=100,left=600,width=740,height=760");
      });
   });
</script>

<c:set var="petsitterVO" value="${petsitterboardVO.petsitterVO }"></c:set>
<c:set var="memberVO" value="${petsitterboardVO.petsitterVO.memberVO}"></c:set>

<!-- 더블헤더 -->
<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id== petsitterboardVO.petsitterVO.memberVO.id}">
	<div class="BJHeaderLayout0">
		<div class="BJHeaderLayout" >
			<div class="BJHeader2" >
				<a class="BJA" href="${initParam.root}m_member_detail.do">마이페이지</a>
				<a class="BJA" href="${initParam.root}m_member_update.do">회원정보수정</a>
				<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
			       <a class="BJA" href="${initParam.root}psboard_petsitterboard_registerform.do?id=<sec:authentication property="principal.id"/>"> 펫시터게시글등록</a>
			       <a class="BJA" href="${initParam.root}psboard_petsitterboard_myPetsitterBoard.do">내 글 보기</a>
			       <a class="BJA" href="${initParam.root}psboard_petsitterboard_myPetsitterBoardUpdateView.do?petsitterboard_no=${petsitterboardVO.petsitterboard_no}">내 글 수정</a>
			       <a class="BJA" id="deleteId" href="#">내 글 삭제</a>
		    	</sec:authorize>
			</div>
		</div>
	</div>
</c:if>

<div class="BJMainKING">
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">펫시터 게시판</h3>
			</div>
			<div class="panel-body">고객님의 소중한 반려견을 위해 임시보호를 지원하는 펫시터 게시판입니다.</div>
		</div>
		<div class="well well-sm">펫시터 정보 확인 및 예약</div>
	</div>
	<div class="BJMain2Div">
	<form method="post" action="reserveRegister.do" id="reserveRegForm">
		<input type="hidden" name="petsitterboard_no" value="${petsitterboardVO.petsitterboard_no}" />
		<input type="hidden" name="id" value="<sec:authentication property="principal.id"/>" />
     	<input type="hidden" name="petsitterId" value="${petsitterboardVO.petsitterVO.memberVO.id}"/>
     	<input type="hidden" name="petCheckNumber" value="0"/>
     	<input type="hidden" name="reserve_price" />
      	<!-- 리모콘 -->
      	<div style="float: right; width: 30%;">
        	<div class="SBremote">
	            <div class="SBremote_main">
	            	<div class="SBremote_Img_form">
		                <img src="${initParam.root}${petsitterVO.petsitterImg}" class="SBImg">
	               	</div>
	                <div class="SBremote_name">
	                	<h4 style="font-weight:bold; color:gray;">${memberVO.name}</h4>
	                	<h6 style="font-size: 11px;">${memberVO.address}</h6>
	                	<span class="label label-success" id="addressMap">지도 보기</span>
	                </div>
	            </div><br/>
	            <div class="SBremote_main2" >
		            <div style="float: left; width: 50%;">
		            	<input type="text" placeholder="Start Date" class="datepicker" readonly="readonly" id="sdate" name="startDay" style="width: 95%; margin-right: 5%">
		            </div>
		            <div style="float: right; width: 50%;">
						<input type="text" placeholder="End Date" class="datepicker" readonly="readonly" id="edate" name="endDay" style="width: 95%; margin-left: 5%">
		            </div>
	            </div>
	            <div class="SBremote_main3">
	            	<div align="center">
	                	<span class="SBrenote_price">${petsitterVO.price}원</span> / 1박
	                </div>
	                <table class="table" style="margin-top: 5%; border-bottom: 1px solid #DDDDDD;">
						<tr>
	                    	<td><label class="days" style="float: left;">0박</label></td>
	                     	<td><label class="totalPrice" style="float: right;">${petsitterVO.price}원</label></td>
	                 	</tr>
	                  	<tr>
		                     <td><label style="float: left;">부가세</label></td>
		                     <td><label class="tax" style="float: right;">원</label></td>
	                  	</tr>
	                  	<tr>
		                     <td><label style="float: left;">총합계</label></td>
		                     <td><label class="totalPricePlusTax" style="float: right;">원</label>
	                     </td>
	                  	</tr>
	               	</table>
	            </div>
	            <div class="SBremote_main4">
	               <input type="submit" class="active WJbtn btn-block btn-default" id="reserveBtn" value="예약요청하기">
	            </div>
         	</div>
		</div>
	</form>
      
	<!-- 페이지화면 -->
    <div class="SBmainDivLeft" style="overflow:hidden;">
    	<div class="SBmainDivImg">
        	<div class="SBremote_Img_form2">
            	<img src="${initParam.root}${petsitterVO.houseImg}" class="SBImg2">
            </div>
        </div>
        <div class="SBmainDivImg2">
        	<div style="float: left;" class="SBdiv">
            	<img src="resources//image//SBdogImg.png" class="SBremote_Img_form3">
                <div class="SBtextDiv">
                	<img src="resources//image//mmm.png" style="width: 15px;">
                  	희망 동물 종류 : ${petsitterVO.petType} <br> 
                  	<img src="resources//image//mmm.png" style="width: 15px;"> 
                  	희망 동물 크기 : ${petsitterVO.petSize} <br> 
                  	<img src="resources//image//mmm.png" style="width: 15px;"> 
                  	가능한 서비스 : ${petsitterVO.service}
               </div>
            </div>
            <div style="float: right;" class="SBdiv">
            	<img src="resources//image//c.png" class="SBremote_Img_form3">
                <div class="SBtextDiv2">
                	<img src="resources//image//mmm.png" style="width: 15px;">
						체크인&체크 아웃:<br> 09:00 AM ~ 09:00PM
                </div>
            </div>
		</div>
        <div class="SBmainDivImg2" style="border-top: 1px solid #AFAFAF;">
        	<div class="SBtextDiv3">
            	<div class="SBtextDiv3_tiltle">${memberVO.name}펫시터소개</div><br>
            	<div class="SBtextDiv3_content">${petsitterboardVO.petsitterVO.memberVO.existence}</div>
            </div>
        </div>
        <div class="SBmainDivImg2" style="border-top: 1px solid #AFAFAF;">
        	<div class="SBtextDiv3">
            	<div class="SBtextDiv3_tiltle">${petsitterboardVO.petsitterboard_title }</div><br>
                <div class="SBtextDiv3_content">${petsitterboardVO.petsitterboard_contents }</div>
            </div><hr/> 
            
			<div style="margin-bottom: 5%; ">
			<!-- 평균 별점 -->
				<div style=" height:45px; width:100%; font-size: 25px; vertical-align: middle;">
					후기(${requestScope.reviewList.size()}) 
					<div style="display:inline;  margin-right:50%; margin-bottom: 2%;">  
						<span class="star-rating"  style="margin-top: 1%;">
							<span id="star-rating" style ="width:100%;"></span>
						</span>  
					<h6 style="display: inline;">
						<span id="avgStar-rating"></span>
					</h6>
					</div>
				</div>	
 				<!-- 리뷰 리스트 -->
				<c:forEach items="${requestScope.reviewList }" varStatus="status" var="reviewList">
				<div class="BJReplyList" style=" width:100%; margin-left: 0%">
					<table style="width:100%;">
					<c:if test="${reviewList==null }">
						<tr>
							<td colspan="5" align="center">
								<h3 style="color: #6EB9B5;">등록된 후기가 없습니다!!<br>첫번 째 고객님이 되어주세요!!</h3>
							</td>
						</tr>
					</c:if>
						<tr>
							<td align="left" >${reviewList.name}</td>
							<td>
								<span class="star-rating2" style="margin-left:75%; float: right;" >
									<span id="star-rating${status.index }" style="width:${reviewList.star_rate*17}%; float:left;"></span>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="left">${reviewList.content}</td>
						</tr>
						<tr>
							<td colspan="2" align="left">${reviewList.time_posted}</td>
						</tr>
					</table><hr>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>
</div>
</div>