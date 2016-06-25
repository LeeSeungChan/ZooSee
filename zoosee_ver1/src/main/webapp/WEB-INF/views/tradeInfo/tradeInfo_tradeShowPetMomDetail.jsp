<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 더블헤더 -->
<%--  <div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="interceptor_reserve_reservePetDetail.do?petNo=${petVO.petNo}">펫 정보 보기 </a>
		</div>
	</div>
</div>  --%>
<div class="BJMainKING">
<div class="BJMainDiv" style="margin-bottom: 2%; margin-top: 5%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">펫맘 상세정보</h3>
			</div>
			<div class="panel-body">펫맘 "${petVO.memberVO.name}"님의 상세정보를 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">펫맘 "${petVO.memberVO.name}"님의 상세정보</div>
	</div>
<div class="WJcontainer8">
<div align="center">
<a href="interceptor_reserve_reservePetDetail.do?petNo=${petVO.petNo}"><img
				src="${initParam.root}resources/image/Mzoosee.png"><br>
				"${petVO.memberVO.name}"님의 펫 "${petVO.petName}" 상세보기</a>
</div>	
<!-- 전체 시작 -->
	<!-- 왼쪽 시작-->
	<div style="width: 50%; float: left;">
 	<div style="width: 80%; margin-left: 10%;" >
		<label>펫맘 아이디</label> 
		<input class="WJform-control" type="text" value="${petVO.memberVO.id}" readonly="readonly" style="background-color: #F4F4F4;"> 
	<label>펫맘 주소</label> 
		<input
			class="WJform-control"type="text"
			value="${petVO.memberVO.address}" readonly="readonly"
			style="background-color: #F4F4F4">
	<label>펫맘 전화번호</label> 
		<input
			class="WJform-control"type="text"
			value="${petVO.memberVO.tel}" readonly="readonly"
			style="background-color: #F4F4F4">	
	<label>펫맘 직업</label>
		<input
			class="WJform-control"  type="text"
			value="${petVO.memberVO.job}" readonly="readonly"
			style="background-color: #F4F4F4"> 
	<label>펫맘 경험여부</label>
		<input
			class="WJform-control"  type="text"
			value="${petVO.memberVO.existence}" readonly="readonly"
			style="background-color: #F4F4F4"> 					
	</div> 
	</div>
	<!-- 왼쪽 끝 -->
	<!-- 오른쪽 시작 -->
	<div style="width: 50%; float: right;">
	<div style="width: 80%; margin-left: 10%;">
		 <label>펫맘 이름</label> 
		<input class="WJform-control" 
			type="text" value="${petVO.memberVO.name}" readonly="readonly"
			style="background-color: #F4F4F4">
		<label>펫맘 성별</label> 
		<input
			class="WJform-control"type="text"
			value="${petVO.memberVO.gender}" readonly="readonly"
			style="background-color: #F4F4F4"> 	
		 	
		<label>펫맘 email</label>
		<input
			class="WJform-control"  type="text"
			value="${petVO.memberVO.email}" readonly="readonly"
			style="background-color: #F4F4F4"> 
		
		
		<label>펫 타입</label>
		<input
			class="WJform-control"  type="text"
			value="${petVO.petType}" readonly="readonly"
			style="background-color: #F4F4F4; margin-bottom: 6.4%;" >
	<%-- 	<label>펫이름</label>
		<a href="interceptor_reserve_reservePetDetail.do?petNo=${petVO.petNo}">${petVO.petName}</a> --%>
		
		<input type="button" value="확인" onclick="history.go(-1)"
		class="active WJbtn btn-block btn-info"/> 
		</div>
	</div>
	</div>
</div>
</div>
<%-- 
<table border="1">
	<caption>펫맘 정보</caption>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${petVO.memberVO.id}</td>
				<th>이름</th>
				<td>${petVO.memberVO.name}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${petVO.memberVO.address}</td>
				<th>성별</th>
				<td>${petVO.memberVO.gender}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${petVO.memberVO.tel}</td>
				<th>이메일</th>
				<td>${petVO.memberVO.email}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${petVO.memberVO.job}</td>
				<th>경험여부</th>
				<td>${petVO.memberVO.existence}</td>
			</tr>
			<tr>
				<th>펫이름</th>
				<td>
					<a href="interceptor_reserve_reservePetDetail.do?petNo=${petVO.petNo}">${petVO.petName}</a>
				</td>
				<th>펫타입</th>
				<td>${petVO.petType}</td>
			</tr>
			<tr>
				<td><input type="button" value="뒤로" onclick="history.go(-1)"/></td>
			</tr>
		</tbody>
</table>
 --%>