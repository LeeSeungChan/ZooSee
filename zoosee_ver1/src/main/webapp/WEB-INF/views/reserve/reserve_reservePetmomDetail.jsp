<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function(){
		var recog = "${reserveVO.reserve_recog}";
		if(recog == 1){
			$("#okBtn").button({disabled:true}); 
			$("#noBtn").button({disabled:true}); 
		}
		
		$(":input[name=okBtn]").click(function(){
			
			if(confirm("예약 승낙하시겠습니까?")){
				var str = "reserve_reserveAccept.do?reserve_no=${reserveVO.reserve_no}&";
				str += "id=${memberVO.id}&petsitterNo=${petsitterboardVO.petsitterVO.petsitterNo}";
				
				location.replace(str);
			}
		});
		
		$(":input[name=noBtn]").click(function(){
			if(confirm("예약 거절하시겠습니까?")){
				location.replace("reserve_reserveCancel.do?reserve_no=${reserveVO.reserve_no}&petsitterId=<sec:authentication property='principal.id'/>&petmomId=${memberVO.id}");
			}
		});
		$(":input[name=backBtn]").click(function(){
			location.replace("reserve_reserveMyList.do?id=<sec:authentication property='principal.id'/>");
		});
	});
</script>
<div class="BJMainKING">
<div class="BJMainDiv" style="margin-bottom: 2%; margin-top: 5%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">신청자 상세정보</h3>
			</div>
			<div class="panel-body">신청자 "${memberVO.name}"님의 상세정보를 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">신청자 "${memberVO.name}"님의 상세정보</div>
	</div>
<div class="WJcontainer9">
<div align="center">
<a href="reserve_reservePetDetail.do?petNo=${reserveVO.petVO.petNo}"><img
				src="${initParam.root}resources/image/Mzoosee.png"><br>
				"${memberVO.name}"님의 펫 상세보기</a>
</div>	
<!-- 전체 시작 -->
	<!-- 왼쪽 시작-->
	<div style="width: 50%; float: left;">
 	<div style="width: 80%; margin-left: 10%;" >
		<label>펫맘 아이디</label> 
		<input class="WJform-control" type="text" value="${memberVO.id}" readonly="readonly" style="background-color: #F4F4F4;"> 
	<label>펫맘 주소</label> 
		<input
			class="WJform-control"type="text"
			value="거래가 완료되면 보여집니다." readonly="readonly"
			style="background-color: #F4F4F4">
	<label>펫맘 전화번호</label> 
		<input
			class="WJform-control"type="text"
			value="거래가 완료되면 보여집니다." readonly="readonly"
			style="background-color: #F4F4F4">	
	<label>펫맘 직업</label>
		<input
			class="WJform-control"  type="text"
			value="${memberVO.job}" readonly="readonly"
			style="background-color: #F4F4F4"> 
	<label>펫맘 경험여부</label>
		<input
			class="WJform-control"  type="text"
			value="${memberVO.existence}" readonly="readonly"
			style="background-color: #F4F4F4; margin-bottom: 6.4%; ">
		<input type="button" value="승인" id="okBtn" name="okBtn"
		class="active WJbtn btn-block btn-info"/>  					
	</div> 
	</div>
	<!-- 왼쪽 끝 -->
	<!-- 오른쪽 시작 -->
	<div style="width: 50%; float: right;">
	<div style="width: 80%; margin-left: 10%;">
		 <label>펫맘 이름</label> 
		<input class="WJform-control" 
			type="text" value="${memberVO.name}" readonly="readonly"
			style="background-color: #F4F4F4">
		<label>펫맘 성별</label> 
		<input
			class="WJform-control"type="text"
			value="${memberVO.gender}" readonly="readonly"
			style="background-color: #F4F4F4"> 	
		 	
		<label>펫맘 email</label>
		<input
			class="WJform-control"  type="text"
			value="거래가 완료되면 보여집니다." readonly="readonly"
			style="background-color: #F4F4F4"> 
		<label>펫 타입</label>
		<input
			class="WJform-control"  type="text"
			value="${reserveVO.petVO.petType}" readonly="readonly"
			style="background-color: #F4F4F4; margin-bottom: 6.5%;" >
		<input type="button" value="거절" id="noBtn" name="noBtn"
		class="active WJbtn btn-block btn-info" style="margin-bottom: 4.8%;"/>
		<input type="button" value="확인" onclick="history.go(-1)"
		class="active WJbtn btn-block btn-info"/> 
		</div>
	</div>
	</div>
</div>
</div> 
