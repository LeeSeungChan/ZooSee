<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	function clickNotification(notification, flag){
		// notification 클릭하면 새로 이동
		notification.onclick = function(event) {
			var petMasterSignal = 0;
			if("${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.rank}" == "petmaster"){
				petMasterSignal = 2;
			}
			
			if(flag == "request"){
				location.href='reserve_reserveMyList.do?petMasterSignal='+petMasterSignal;
			}
			if(flag == "complete"){
				location.href='reserve_reserveMyList.do?petMasterSignal='+petMasterSignal;
			}
			if(flag == "deal"){
				location.href='tradeInfo_getTradeMyList.do';
			}
		}
	}
	
	function showNotification(title1, title2, title3, image, flag){
		if(title1 != null && flag == "request"){
			options1 = {
		    	body: title1,
		    	icon: '${initParam.root}'+image
		    }
			var notification = new Notification("ZooSee Alarm", options1);
			setTimeout(notification.close.bind(notification), 5000);
			clickNotification(notification, flag);
		}
		if(title2 != null && flag == "complete"){
			options2 = {
		    	body: title2,
		    	icon: '${initParam.root}'+image
		    }
			
			var notification2 = new Notification("ZooSee Alarm", options2);
			setTimeout(notification2.close.bind(notification2), 5000);
			clickNotification(notification2, flag);
		}
		if(title3 != null && flag == "deal"){
			options3 = {
		    	body: title3,
		    	icon: '${initParam.root}'+image
		    }
			
			var notification3 = new Notification("ZooSee Alarm", options3);
			setTimeout(notification3.close.bind(notification3), 5000);
			clickNotification(notification3, flag);
		}
	}
	
	function prepareNotification(petMomName, petsitterName, petImg, flag){
		var str = new Array();
		var options1, options2;
		var rank = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.rank}";
		
		if(rank == "petsitter" || rank == "petmaster"){
			str[0] = "'" + petMomName + "'님이 '" + petsitterName + "'님에게 '예약신청'하였습니다.";
			str[2] = "'" + petMomName + "'님이 신청한 예약이 '결제완료'되었습니다.";
			
			showNotification(str[0], null, str[2], petImg, flag);
		}else if(rank == "petmom"){
			str[1] = "'" + petMomName + "(본인)'님이 신청한 예약이 '예약완료'되었습니다.";
			
			showNotification(null, str[1], null, petImg, flag);	
		}
	}

	$(document).ready(function(){
		alert("로그인에 성공하셨습니다.");

   		<c:forEach items="${requestScope.reserveTotalList.reserveRequestList}" var="reserveVO">
   			prepareNotification("${reserveVO.memberVO.name}","${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}", "${reserveVO.petVO.petImg}", "request")
  		</c:forEach>
  		<c:forEach items="${requestScope.reserveTotalList.reserveCompleteList}" var="reserveVO">
  			prepareNotification("${reserveVO.memberVO.name}", "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}", "${reserveVO.petVO.petImg}", "complete");
		</c:forEach>
		<c:forEach items="${requestScope.reserveTotalList.reserveDealList}" var="reserveVO">
			prepareNotification("${reserveVO.memberVO.name}", "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}", "${reserveVO.petVO.petImg}", "deal");
		</c:forEach>
	});
</script>

<div class="BJMainKING">
	<div class="BJMainDivCenter">
		<div class="BJMainText"  align="center" >
			<h1 style="color:white; font-size:350%;">믿고 맡길 수 있는 펫시터를 찾아보세요!!</h1>
			<h3 style="color:white;">답답한 케이지가 아닌 펫시터의 집에서 당신의 강아지만 돌봐드립니다</h3> 
		</div>
		<div class="WJMainSection">
			<form role="search" action="findAllPetsitterList.do">
				<div class="WJMainSearchDiv">
					<div style="float: left; width: 70%;">
						<input type="text" class="WJform-control3" name="address" placeholder="서울/경기/인천" />
					</div>
					<div style="float: right; width: 29%;">   
						<button type="submit" class="active WJbtn2 btn-block btn-default">펫시터찾기</button>
					</div>
				</div> 
			</form>
		</div>
	</div>
	<div class="BJMainDIVBottom" align="center">
		<div class="BJMainBoardDiv" >
			<div class="BJMainBoardC1">
				<a href="${initParam.root}petsitter_register.do">
					<img  src="${initParam.root }resources/image/petsitterimg2V2.jpg" style="width: 100%; height:100%; max-width: 760px; vertical-align: middle" />
				</a>
			</div>
			<div class="BJMainBoardC2">
				<a href="${initParam.root}qna_list.do">
					<img src="${initParam.root }resources/image/zoosee3.jpg" style="width: 100%; height:100%; max-width: 760px; vertical-align: middle" />
				</a>
			</div>
			<div class="BJMainBoardC3">
				<a href="${initParam.root}freeBoard_list.do">
					<img src="${initParam.root }resources/image/pet5v1.jpg" style="width: 100%; height:100%; max-width: 760px; vertical-align: middle" />
				</a>
			</div>
		</div>  
	</div>
</div>	