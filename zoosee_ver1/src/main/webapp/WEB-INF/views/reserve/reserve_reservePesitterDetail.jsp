<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		var recog = "${reserveVO.reserve_recog}";
		if(recog == 0){
			$("#okBtn").button({disabled:true}); 
		}
			$(":input[name=okBtn]").click(function(){
				if(confirm("결제하시겠습니까?")){
					var page="popup_payment.do?reserve_no=${reserveVO.reserve_no}";
					window.open(page,'팝업창','width=700, height=510, left=600, top=150, resizable=no');
				}
				return false;
			 });
			
		$(":input[name=noBtn]").click(function(){
			if(confirm("예약을 취소하시겠습니까?")){
				location.replace("reserve_reserveCancel.do?reserve_no=${reserveVO.reserve_no}&petsitterId=${petsitterboardVO.petsitterVO.memberVO.id}"+
						"&petmomId=${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}");
			}else{
				return false;
			}
		});
		
	});
</script>


<div class="BJMainKING">
<div class="BJMainDiv" style="margin-bottom:13%;margin-top: 5%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">펫시터 상세정보</h3>
			</div>
			<div class="panel-body">펫시터 "${petsitterboardVO.petsitterVO.memberVO.name}"님의 상세정보를 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">"${petsitterboardVO.petsitterVO.memberVO.name}"님의 상세정보</div>
	</div>
<!-- 전체 시작 -->
<div class="WJcontainer7">
	<!-- 왼쪽 시작-->
	<div style="float: left; width: 50%;">
		<br>
		<div style="margin-top: 15%; width: 400px; height: 400px;">
			<img style="border: 1px solid black;"
				src="${initParam.root}${petsitterboardVO.petsitterVO.petsitterImg}"
				class="center-block img-circle img-responsive" width="90%"
				height="90%">
				</div>
	</div>
	<!-- 오른쪽 시작 -->
	<div style="float: right; width: 50%;" >
		<label>펫시터 아이디</label> 
		<input class="WJform-control" type="text" value="${petsitterboardVO.petsitterVO.memberVO.id}" readonly="readonly" style="background-color: #F4F4F4;"> 
		<label>펫시터 이름</label> 
		<input class="WJform-control" 
			type="text" value="${petsitterboardVO.petsitterVO.memberVO.name}" readonly="readonly"
			style="background-color: #F4F4F4">
		<label>펫시터 주소</label> 
		<input
			class="WJform-control"type="text"
			value="${petsitterboardVO.petsitterVO.memberVO.address}" readonly="readonly"
			style="background-color: #F4F4F4"> 
		<label>성별</label>
		<input
			class="WJform-control"type="text"
			value="${petsitterboardVO.petsitterVO.memberVO.gender}" readonly="readonly"
			style="background-color: #F4F4F4"> 	
		
		<label>펫시터 이메일</label>
		<input
			class="WJform-control"  type="text"
			value="${petsitterboardVO.petsitterVO.memberVO.email}" readonly="readonly"
			style="background-color: #F4F4F4"> 
		<label>펫시터 직업</label>
		<input
			class="WJform-control"  type="text"
			value="${petsitterboardVO.petsitterVO.memberVO.job}" readonly="readonly"
			style="background-color: #F4F4F4"> 
		<label>펫시터 경험여부</label>
		<input
			class="WJform-control"  type="text"
			value="${petsitterboardVO.petsitterVO.memberVO.existence}"readonly="readonly"
			style="background-color: #F4F4F4"> 
			<br>
		<input class="WJform-control" style="float: left; width: 49.5%; background-color: #F4F4F4; text-align: center; margin-bottom: 4%;" 
		type="text" value="시작일 : ${reserveSdate.pet_calDate}" 
		readonly="readonly">
		
		<input class="WJform-control" style="float: right; width: 49.5%; background-color: #F4F4F4; text-align: center; margin-bottom: 4%;"
		type="text" value="종료일 : ${reserveEdate.pet_calDate}" 
		 readonly="readonly" >
		 <label>Total Price</label>
		<input
			class="WJform-control"  type="text"
			value="${reserveVO.reserve_price}" readonly="readonly"
			style="background-color: #F4F4F4; margin-bottom: 4%;"> 
		
		<div style="float: left; width: 49.5%;">
		<input type="button" value="거래하기" id="okBtn" name="okBtn"
		class="active WJbtn btn-block btn-default">
		</div>
		<div style="float: right; width: 49.5%;">
		<input type="button" value="취소하기" id="noBtn" name="noBtn"
		class="active WJbtn btn-block btn-default">
		</div>
	</div>
	</div>
</div>
</div>
