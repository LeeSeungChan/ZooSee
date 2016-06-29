<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		var recog = "${reserveVO.reserve_recog}";
		if(recog == 1){
			$("#okBtn").button({disabled:true}); 
			$("#noBtn").button({disabled:true}); 
		}
		
		$(":input[name=okBtn]").click(function(){
			/* var trTag = $("#reserveForm #okBtn").parent().parent().parent().children();
			var trIndex = trTag.index($(this).parent().parent());
			var reserve_no = trTag.eq(trIndex).children().eq(0).text();
			var id = trTag.eq(trIndex).children().eq(1).text();
			alert(trTag.eq(trIndex).children().eq(0).text()); */
			
			if(confirm("예약 승낙하시겠습니까?")){
				var str = "interceptor_reserve_reserveAccept.do?reserve_no=${reserveVO.reserve_no}&";
				str += "id=${memberVO.id}&petsitterNo=${petsitterboardVO.petsitterVO.petsitterNo}";
				
				location.replace(str);
			}
		});
		
		$(":input[name=noBtn]").click(function(){
			if(confirm("예약 거절하시겠습니까?")){
				location.replace("interceptor_reserve_reserveCancel.do?reserve_no=${reserveVO.reserve_no}&petsitterId=${mvo.id}&petmomId=${memberVO.id}");
			}
		});
		$(":input[name=backBtn]").click(function(){
			location.replace("reserve_reserveMyList.do?id=${sessionScope.mvo.id}");
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
<a href="interceptor_reserve_reservePetDetail.do?petNo=${reserveVO.petVO.petNo}"><img
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




<%-- 
<table border="1">
	<caption>신청자 정보</caption>
	<tbody>
		<tr>
			<th>아이디</th>
			<td>${memberVO.id}</td>
			<th>이름</th>
			<td>${memberVO.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${memberVO.address}</td>
			<th>성별</th>
			<td>${memberVO.gender}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${memberVO.tel}</td>
			<th>이메일</th>
			<td>${memberVO.email}</td>
		</tr>
		<tr>
			<th>직업</th>
			<td>${memberVO.job}</td>
			<th>경험여부</th>
			<td>${memberVO.existence}</td>
		</tr>
		<tr>
			<th>펫이름</th>
			<td>
				<a href="interceptor_reserve_reservePetDetail.do?petNo=${reserveVO.petVO.petNo}">${reserveVO.petVO.petName}</a>
			</td>
			<th>펫타입</th>
			<td>${reserveVO.petVO.petType}</td>
		</tr>
		<tr>
    		<td colspan="4">
				<input type="button" value="뒤로" id="backBtn" name="backBtn"/>
	    		<input type="button" value="승인" id="okBtn" name="okBtn"/>
				<input type="button" value="거절" id="noBtn" name="noBtn"/>
			</td>
    	</tr>
	</tbody>
</table>
 --%>