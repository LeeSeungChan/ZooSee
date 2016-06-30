<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<script type="text/javascript">
		/* var notification = new Notification(title, options);

		function notifyMe() {
			// Let's check if the browser support notifications
			if(!"Notification" in window) {
				alert("This browser does not support desktop notification");
			}
			// Let's check if the user is okay to get some notification
			else if(Notification.permission === "granted") {
				// If it's okay let's create a notification
				var notification = new Notification("xxx님이 YYY님에게 예약하였습니다..");
			}
			// Otherwise, we need to ask the user for it's permission
			// Note, Chrome does not implement the permission static property
			// So we have to check for NOT 'denied' instead of 'default'
			else if(Notification.permission !== 'denied') {
				Notification.requestPermission(function (permission) {
					// Whatever the user answers, we make sure Chrome store the information
			   	 	if(!('permission' in Notification)) {
			    		Notification.permission = permission;
			    	}
			    	// If the user is okay, let's create a notification
			    	if (permission === "granted") {
			    		var notification = new Notification("XXX님이 YYY님에게 예약하였습니다.");
			    	}
				});
			}
		}
		// At last, if the user already denied any notification, and you 
		// want to be respectful there is no need to bother him any more. */

		function navChange(searchAddress){			
			if(searchAddress == ""){
				$(".nav-tabs .order").parent().children().eq(0).attr("class", "active order");
				$(".nav-tabs .order").parent().children().eq(1).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(2).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(3).attr("class", "order");
				$("#a1").attr("aria-expanded", "true");
				$("#a2").attr("aria-expanded", "false");
				$("#a3").attr("aria-expanded", "false");
				$("#a4").attr("aria-expanded", "false");
			}else if(searchAddress == "서울"){
				$(".nav-tabs .order").parent().children().eq(0).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(1).attr("class", "active order");
				$(".nav-tabs .order").parent().children().eq(2).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(3).attr("class", "order");
				$("#a1").attr("aria-expanded", "false");
				$("#a2").attr("aria-expanded", "true");
				$("#a3").attr("aria-expanded", "false");
				$("#a4").attr("aria-expanded", "false");
			}else if(searchAddress == "경기"){
				$(".nav-tabs .order").parent().children().eq(0).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(1).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(2).attr("class", "active order");
				$(".nav-tabs .order").parent().children().eq(3).attr("class", "order");
				$("#a1").attr("aria-expanded", "false");
				$("#a2").attr("aria-expanded", "false");
				$("#a3").attr("aria-expanded", "true");
				$("#a4").attr("aria-expanded", "false");
			}else if(searchAddress == "인천"){
				$(".nav-tabs .order").parent().children().eq(0).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(1).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(2).attr("class", "order");
				$(".nav-tabs .order").parent().children().eq(3).attr("class", "active order");
				$("#a1").attr("aria-expanded", "false");
				$("#a2").attr("aria-expanded", "false");
				$("#a3").attr("aria-expanded", "false");
				$("#a4").attr("aria-expanded", "true");
			}
		}
		
		$(document).ready(function(){
			var searchAddress = "${address}";
			if(searchAddress != null){
				//alert("받아온 주소:[" + searchAddress + "]");
				navChange(searchAddress);
			}
			
			$("#searchForm #searchBtn").click(function(){
				if($("#searchForm :input:radio[name=service]:checked").length==0){
					alert("서비스를 선택하세요");
					return false;
				}
				if($("#searchForm :input:radio[name=petSize]:checked").length==0){
					alert("펫 사이즈를 선택하세요.");
					return false;
				}
				if($("#searchForm :input:radio[name=petType]:checked").length==0){
					alert("펫 종류를 선택하세요.");
					return false;
				}
			});
		});
	</script>
	
<div class="BJMainKING">
	<div class="BJMainDiv" style=" margin-top:5%;">
		<div class="BJMain2Div" >
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">펫시터 검색</h3>
				</div>
				<div class="panel-body">마음에 드는 펫시터를 찾아보세요!</div>
			</div>
			<div class="well well-sm">펫시터 목록</div>
			
			<div>
				<ul class="nav nav-tabs">
					<li class="active order">
						<a href="findAllPetsitterList.do?address=" data-toggle="tab" id="a1" aria-expanded="true">전체</a>
					</li>
					<li class="order">
						<a href="findAllPetsitterList.do?address=서울" data-toggle="tab" id="a2" aria-expanded="false">서울</a>
					</li>
					<li class="order">
						<a href="findAllPetsitterList.do?address=경기" data-toggle="tab" id="a3" aria-expanded="false">경기</a>
					</li>
					<li class="order">
						<a href="findAllPetsitterList.do?address=인천" data-toggle="tab" id="a4" aria-expanded="false">인천</a>
					</li>
				</ul>
			</div>
			
			<div class="BJWriteTableLine2">
				<div class="SBHrAllLine">
					<form method="get" action="getConditionList.do" id="searchForm">
					<!-- 검색조건 두덩어리 -->
					<div class="BJBoardSearchLayout2">
						<!-- 검색조건 한덩어리 -->
						<div class="BJBoardSearchLayout">
							<div><h4>서비스</h4></div>
							<input type="radio" name="service" id="checkbox1" value="목욕"/>목욕
							<input type="radio" name="service" id="checkbox2" value="산책"/>산책
							<input type="radio" name="service" id="checkbox3" value="픽업"/>픽업
						</div>
						<div class="BJBoardSearchLayoutRight" >
							<div><h4>펫 종류</h4></div>
							<input type="radio" name="petType" id="checkbox1" value="dog"/>
							<label for="checkbox1">강아지</label>
							<input type="radio" name="petType" id="checkbox2" value="cat"/>
							<label for="checkbox2">고양이</label>
							<input type="radio" name="petType" id="checkbox3" value="bird"/>
							<label for="checkbox3">새</label>
							<input type="radio" name="petType" id="checkbox4" value="bird"/>
							<label for="checkbox3">물고기</label>
							<input type="radio" name="petType" id="checkbox5" value="etc"/>
							<label for="checkbox5">기타</label><br/>
						</div>
 					</div>
				 	<!-- 검색조건 두덩어리 -->
					<div class="BJBoardSearchLayout2">
						<!-- 검색조건 한덩어리 -->
						<div class="BJBoardSearchLayout">
							<div><h4>반려견크기</h4></div>
							<input type="radio" name="petSize" id="checkbox1" value="small"/>
							<label for="checkbox1">소형</label>
							<input type="radio" name="petSize" id="checkbox2" value="middle"/>
							<label for="checkbox2">중형</label>
							<input type="radio" name="petSize" id="checkbox3" value="large"/>
							<label for="checkbox4">대형</label><br/>
						</div>
 						<div class="BJBoardSearchLayout" style="margin-left: 5%; margin-top: 5%;">
							<div align="center" style="float:left;width:350px;">
								<input style="float:left;width:130px; margin-left:5%;" class="BJbtn2" type="submit" value="검색" id="searchBtn"/>
								<input style="float:left;width:130px; margin-left:5%;" class="BJbtn2" type="reset" value="선택 초기화" id="resetBtn"/>
							</div>
						</div>
 					</div>
 					</form>
 				</div>
			</div>
		</div><br/>

<button onclick="notifyMe()">Notify me!</button>

		<div align="center">
		<!-- <div align="right" style="border:1px solid blue;">	 -->
			<ul class="pager">
			<c:choose>
			<c:when test="${requestScope.condition == 'search'}">
				<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
					-
				</c:if>
				<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
					<li><a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1}&address=${requestScope.address}">이전</a></li>&nbsp;&nbsp;&nbsp;	
					<li><a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1}&address=${requestScope.address}">다음</a></li>
				</c:if>		
				<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
					<li><a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1}&address=${requestScope.address}">다음</a></li>
					<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
				</c:if>
				<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
					<li><a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1}&address=${requestScope.address}">이전</a></li>
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
					-
				</c:if>
				<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
					<li><a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1}&service=${requestScope.service}&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a></li>&nbsp;&nbsp;&nbsp;	
					<li><a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1}&service=${requestScope.service}&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a></li>
				</c:if>		
				<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
					<li><a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1}&service=${requestScope.service}&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a></li>
					<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
				</c:if>
				<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
					<li><a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1}&service=${requestScope.service}&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a></li>
				</c:if>
			</c:otherwise>
			</c:choose>
			</ul>
		</div><hr/>
		  
		<!-- 펫시터리스트 영역 -->
		<div class="BJPetsitterListLayout" style=" height: 800px;">
		
			<!-- 펫시터 3덩어리 묶음 -->
			<div class="BJPetsitterListLayoutIN1" style=" height: 380px;">
		
		  	<c:forEach items="${lvo.map}" var="map" varStatus="i">
			<%-- <a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">${map.value}</a> --%>
			<%-- 	<c:if test="${i.index%3 == 2 && i.index+1 != list.size()}">	
					</c:if>--%>
		
				<!-- 펫시터보드 객체 하나 -->
				<div style="border:2px solid #f4f4f4;  position:relative;  float:left; height: 380px; width: 33%;   margin-right: 0.3%;  margin-bottom: 2.5%; padding-left: 1.25%; padding-right: 1.25%;">
					<!-- 집이미지 -->
					<div style=" height: 55%;  position:relative; z-index: 2;">
						<a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">
							<img src="${initParam.root}${map.value.petsitterVO.houseImg}" style="width:100%; height: 100%;"/>
						</a>
						<!-- <img src="${initParam.root}${map.value.petsitterVO.houseImg}" style="width:100%; height: 100%;"/> -->
					</div>
					<!-- 펫시터이미지 -->
					<div class="center-block img-circle img-responsive" style=" width:25%; height: 25%; float: left;  position: absolute; z-index: 3;  margin-left:5%; top:43%;  ">
						<a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">
							<img class="center-block img-circle img-responsive" src="${initParam.root}${map.value.petsitterVO.petsitterImg}" style="width:100%; height: 100%;"/>
						</a>
						<%-- <img class="center-block img-circle img-responsive" src="${initParam.root}${map.value.petsitterVO.petsitterImg}" style="width:100%; height: 100%;"/> --%>
					</div>
					<!-- 펫시터이름 -->
					<div style=" height: 10%; width: 30%; margin-left:37%;	">
				   		<h3 style="margin: auto;">${map.value.petsitterVO.memberVO.name}</h3>
					</div>
					<!-- 펫시터보드 타이틀 -->
					<div style=" height: auto;  margin-top: 4%;	">
				   		<h3 style="margin: auto;">${map.value.petsitterboard_title }</h3>
				  		<%-- ${map.value.title} --%>
					</div>
					<!-- 펫시터보드 가격 -->
					<div style=" height: auto; ">
				   		<h5 style="margin-left: 51%;" align="right">1박 / ${map.value.petsitterVO.price}</h5>
					</div><hr />
					<!-- 펫시터보드 서비스 -->
					<div style="border: height: auto; width: auto;">
						<div style="border: 1px solid #c0c0c0; border-radius: 10px; text-align: center;">
					 		${map.value.petsitterVO.memberVO.address }
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
	

<%-- <div>
	<form method="get" action="getConditionList.do" id="searchForm">
		<div>
			서비스<br/>
			<input type="radio" name="service" id="checkbox1" value="목욕"/>목욕
			<input type="radio" name="service" id="checkbox2" value="산책"/>산책
			<input type="radio" name="service" id="checkbox3" value="픽업"/>픽업
		</div><br/>
		<div>
			펫 사이즈<br/>
			<input type="radio" name="petSize" id="checkbox1" value="small"/>
			<label for="checkbox1">소형</label>
			<input type="radio" name="petSize" id="checkbox2" value="normal"/>
			<label for="checkbox2">중형</label>
			<input type="radio" name="petSize" id="checkbox3" value="large"/>
			<label for="checkbox4">대형</label><br/>
		</div><br/>
		<div>
			펫 종류 <br/>
			<input type="radio" name="petType" id="checkbox1" value="dog"/>
			<label for="checkbox1">강아지</label>
			<input type="radio" name="petType" id="checkbox2" value="cat"/>
			<label for="checkbox2">고양이</label>
			<input type="radio" name="petType" id="checkbox3" value="bird"/>
			<label for="checkbox3">새</label>
			<input type="radio" name="petType" id="checkbox4" value="bird"/>
			<label for="checkbox3">물고기</label>
			<input type="radio" name="petType" id="checkbox5" value="etc"/>
			<label for="checkbox5">기타</label><br/>
		</div><br/>
		<!-- 가격정보 추가 -->
		<div>
			<input type="submit" value="검색" id="searchBtn"/>
			<input type="reset" value="선택 초기화" id="resetBtn"/>
		</div>
	</form><br/><br/>
</div>

<div>	
	<c:choose>
	<c:when test="${requestScope.condition == 'search'}">
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>&nbsp;&nbsp;&nbsp;	
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
			<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>&nbsp;&nbsp;&nbsp;	
			<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
		<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>
		</c:if>
	</c:otherwise>
	</c:choose>
	
	<table border="1">
		<tr>
			<c:forEach items="${lvo.map}" var="map" varStatus="i">
				<td><a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">${map.value}</a></td>
				<c:if test="${i.index%3 == 2 && i.index+1 != list.size()}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>
</div> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#searchForm #searchBtn").click(function(){
				if($("#searchForm :input:radio[name=service]:checked").length==0){
					alert("서비스를 선택하세요");
					return false;
				}
				if($("#searchForm :input:radio[name=petSize]:checked").length==0){
					alert("펫 사이즈를 선택하세요.");
					return false;
				}
				if($("#searchForm :input:radio[name=petType]:checked").length==0){
					alert("펫 종류를 선택하세요.");
					return false;
				}
			});
		});
	</script>
	
	<div class="BJMainKING">
 <div class="BJMainDiv" style=" margin-top:5%; ">
 
 <div class="BJMain2Div" >
 <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">펫시터 검색</h3>
  </div>
  <div class="panel-body">
    마음에 드는 펫시터를 찾아보세요!
  </div>
</div>
<div class="well well-sm">
  펫시터 목록
</div>

<div class="BJWriteTableLine2"  >
<div class="SBHrAllLine">
 <form method="get" action="getConditionList.do" id="searchForm">
<!-- 검색조건 두덩어리 -->
<div class="BJBoardSearchLayout2" >
<!-- 검색조건 한덩어리 -->
 <div class="BJBoardSearchLayout" >
 <div >
 <h4>서비스</h4>
 </div>
	<input type="radio" name="service" id="checkbox1" value="목욕"/>목욕
	<input type="radio" name="service" id="checkbox2" value="산책"/>산책
	<input type="radio" name="service" id="checkbox3" value="픽업"/>픽업
</div>
 
 
   <div class="BJBoardSearchLayoutRight" >
 <div >
 <h4>펫 종류</h4>
 </div>
	<input type="radio" name="petType" id="checkbox1" value="dog"/>
	<label for="checkbox1">강아지</label>
	<input type="radio" name="petType" id="checkbox2" value="cat"/>
	<label for="checkbox2">고양이</label>
	<input type="radio" name="petType" id="checkbox3" value="bird"/>
	<label for="checkbox3">새</label>
	<input type="radio" name="petType" id="checkbox4" value="bird"/>
	<label for="checkbox3">물고기</label>
	<input type="radio" name="petType" id="checkbox5" value="etc"/>
	<label for="checkbox5">기타</label><br/>
</div>
 </div>
 
 
 <!-- 검색조건 두덩어리 -->
<div class="BJBoardSearchLayout2" >
<!-- 검색조건 한덩어리 -->
 <div class="BJBoardSearchLayout" >
 <div >
 <h4>반려견크기</h4>
 </div>

	<input type="radio" name="petSize" id="checkbox1" value="small"/>
	<label for="checkbox1">소형</label>
	<input type="radio" name="petSize" id="checkbox2" value="normal"/>
	<label for="checkbox2">중형</label>
	<input type="radio" name="petSize" id="checkbox3" value="large"/>
	<label for="checkbox4">대형</label><br/>
</div>
 
 <div class="BJBoardSearchLayout" style="margin-left: 5%; margin-top: 5%;">

<div align="center" style="float:left;width:350px; ">
			<input style="float:left;width:100px; margin-left: 5%;" class="BJbtn2" type="submit" value="검색" id="searchBtn"/>
			<input style="float:left;width:200px; margin-left: 5%;" class="BJbtn2" type="reset" value="선택 초기화" id="resetBtn"/>
		</div>

</div>
 
 
 </div>
 
 </form>
 </div>
 </div>
</div>


<div 	 align="right">	
	<c:choose>
	<c:when test="${requestScope.condition == 'search'}">
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>&nbsp;&nbsp;&nbsp;	
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
			<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>&nbsp;&nbsp;&nbsp;	
			<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
		<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>
		</c:if>
	</c:otherwise>
	</c:choose>
	</div>
  <hr>
  
  
  
   
  
  
<!-- 펫시터리스트 영역 -->
<div class="BJPetsitterListLayout" style=" height: 800px;">

<!-- 펫시터 3덩어리 묶음 -->
<div class="BJPetsitterListLayoutIN1" style=" height: 380px;">

  <c:forEach items="${lvo.map}" var="map" varStatus="i">
<a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">${map.value}</a>
				<c:if test="${i.index%3 == 2 && i.index+1 != list.size()}">
					
				</c:if>


 <!-- 펫시터보드 객체 하나 -->
<div  style="border:2px solid #f4f4f4;  position:relative;  float:left; height: 380px; width: 33%;   margin-right: 0.3%;  margin-bottom: 2.5%; padding-left: 1.25%; padding-right: 1.25%;">
	
	<!-- 집이미지 -->
	<div style=" height: 55%;  position:relative; z-index: 2;">
		<a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}"><img src="${initParam.root}${map.value.petsitterVO.houseImg}" style="width:100%; height: 100%;"/></a>
		<!-- <img src="${initParam.root}${map.value.petsitterVO.houseImg}" style="width:100%; height: 100%;"/> -->
	</div>
	<!-- 펫시터이미지 -->
	<div class="center-block img-circle img-responsive" style=" width:25%; height: 25%; float: left;  position: absolute; z-index: 3;  margin-left:5%; top:43%;  ">
		<a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}"><img class="center-block img-circle img-responsive" src="${initParam.root}${map.value.petsitterVO.petsitterImg}" style="width:100%; height: 100%;"/></a>
		<img class="center-block img-circle img-responsive" src="${initParam.root}${map.value.petsitterVO.petsitterImg}" style="width:100%; height: 100%;"/>
	</div>
	<!-- 펫시터이름 -->
	<div style=" height: 10%; width: 30%; margin-left:37%;	">
   	 <h3 style="margin: auto;">${map.value.petsitterVO.memberVO.name }</h3>
	</div>
	<!-- 펫시터보드 타이틀 -->
	<div style=" height: auto;  margin-top: 4%;	">
   	 <h3 style="margin: auto;">${map.value.petsitterboard_title }</h3>
   ${map.value.title }
	</div>
	<!-- 펫시터보드 가격 -->
	<div style=" height: auto; ">
   	 <h5 style="margin-left: 51%;" align="right">1박 / ${map.value.petsitterVO.price }</h5>
	</div>
	<hr >
	<!-- 펫시터보드 서비스 -->
	<div style="border: height: auto; width: auto;">
	<div style="border: 1px solid #c0c0c0; border-radius: 10px; text-align: center;">
	 ${map.value.petsitterVO.memberVO.address }
	</div>
	</div>
</div>
	</c:forEach>





 


 
 



</div>
</div>
</div>
</div>
	
 
 

 
<div>
	<form method="get" action="getConditionList.do" id="searchForm">
		<div>
			서비스<br/>
			<input type="radio" name="service" id="checkbox1" value="목욕"/>목욕
			<input type="radio" name="service" id="checkbox2" value="산책"/>산책
			<input type="radio" name="service" id="checkbox3" value="픽업"/>픽업
		</div><br/>
		<div>
			펫 사이즈<br/>
			<input type="radio" name="petSize" id="checkbox1" value="small"/>
			<label for="checkbox1">소형</label>
			<input type="radio" name="petSize" id="checkbox2" value="normal"/>
			<label for="checkbox2">중형</label>
			<input type="radio" name="petSize" id="checkbox3" value="large"/>
			<label for="checkbox4">대형</label><br/>
		</div><br/>
		<div>
			펫 종류 <br/>
			<input type="radio" name="petType" id="checkbox1" value="dog"/>
			<label for="checkbox1">강아지</label>
			<input type="radio" name="petType" id="checkbox2" value="cat"/>
			<label for="checkbox2">고양이</label>
			<input type="radio" name="petType" id="checkbox3" value="bird"/>
			<label for="checkbox3">새</label>
			<input type="radio" name="petType" id="checkbox4" value="bird"/>
			<label for="checkbox3">물고기</label>
			<input type="radio" name="petType" id="checkbox5" value="etc"/>
			<label for="checkbox5">기타</label><br/>
		</div><br/>
		<!-- 가격정보 추가 -->
		<div>
			<input type="submit" value="검색" id="searchBtn"/>
			<input type="reset" value="선택 초기화" id="resetBtn"/>
		</div>
	</form><br/><br/>
</div>

<div>	
	<c:choose>
	<c:when test="${requestScope.condition == 'search'}">
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>&nbsp;&nbsp;&nbsp;	
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
			<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>&nbsp;&nbsp;&nbsp;	
			<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
		<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>
		</c:if>
	</c:otherwise>
	</c:choose>
	
	<table border="1">
		<tr>
			<c:forEach items="${lvo.map}" var="map" varStatus="i">
				<td><a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">${map.value}</a></td>
				<c:if test="${i.index%3 == 2 && i.index+1 != list.size()}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>
</div>
 --%>