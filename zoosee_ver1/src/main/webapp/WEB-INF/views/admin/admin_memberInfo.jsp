<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 멤버 정보 보기 -->

<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}admin_memberlist.do?rank=normal">일반회원</a>
			<a class="BJA" href="${initParam.root}admin_petmomList.do">펫맘</a> 
			<a class="BJA" href="${initParam.root}admin_petsitterList.do?value=recog">펫시터</a>
			<a class="BJA" href="${initParam.root}admin_petsitterList.do?value=nonrecog">펫시터 신청자</a>
		</div>
	</div>
</div>

<div class="BJMainDiv">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">일반회원 정보</h3>
			</div>
			<div class="panel-body">일반회원 정보를 보여드리는 공간입니다.</div>
		</div>
		<div class="well well-sm">${memberVO.name }님의 회원정보</div>
	</div>
	<div class="BJWriteTableLine" style="text-align: left; margin-left: 10%; margin-right: 10%;">
		<table style=" margin-left: 25%; width: 50%; margin-top: 2%; margin-bottom: 2%;">
			<tr>
				<th style=" text-align: right; vertical-align: middle; width: 25%;">아이디</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
						<input class="WJform-control6" type="text" value="${memberVO.id}" readonly="readonly" style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: right; vertical-align: middle;">이름</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
						<input class="WJform-control6" type="text" value="${memberVO.name}" readonly="readonly" style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: right; vertical-align: middle;">주소</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
						<input class="WJform-control6" type="text" value="우편번호 : ${memberVO.addressCode}" readonly="readonly"
							style="background-color: #F4F4F4;">
						<input class="WJform-control6" type="text" value="${memberVO.address}" readonly="readonly"
							style="background-color: #F4F4F4;">
						<input class="WJform-control6" type="text" value="${memberVO.detailAddress}" readonly="readonly"
							style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: right; vertical-align: middle;">성별</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%;  margin-left: 10%;">
						<input class="WJform-control6" type="text" value="${memberVO.gender}" readonly="readonly" style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: right; vertical-align: middle;">전화번호</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
						<input class="WJform-control6" type="text" value="${memberVO.tel}" readonly="readonly" style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: right; vertical-align: middle;">직업</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
						<input class="WJform-control6" type="text" value="${memberVO.job}" readonly="readonly" style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
			<tr>
				<th style="text-align: right; vertical-align: middle;">펫 키운 경험</th>
				<td>
					<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
						<input class="WJform-control6" type="text" value="${memberVO.existence}" readonly="readonly" style="background-color: #F4F4F4;">
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
<div style="width:100%; height: 50px; margin-top: 2%;">
	<input class="active WJbtn btn-block btn-info" style="width:5%; margin-left:47%; "onclick="history.go(-1)" type="button" value="확인" >   
</div>
			<%--
			<label>이름</label> <input class="WJform-control6" type="text"
				value="${memberVO.id}" readonly="readonly"
				style="background-color: #F4F4F4;">	 		
				<label>이름</label> <input class="WJform-control6" type="text"
				value="${memberVO.name}" readonly="readonly"
				style="background-color: #F4F4F4;">	
			<label>주소</label> <input class="WJform-control6" type="text"
				value="우편번호 :${memberVO.addressCode}" readonly="readonly"
				style="background-color: #F4F4F4;">
			<input class="WJform-control6" type="text"
				value=" ${memberVO.address}" readonly="readonly"
				style="background-color: #F4F4F4;">
			<input class="WJform-control6" type="text"
				value="${memberVO.detailAddress}" readonly="readonly"
				style="background-color: #F4F4F4;">
			<label>이메일</label> <input class="WJform-control6" type="text"
				value="${memberVO.email}" readonly="readonly"
				style="background-color: #F4F4F4;">			
			<label>성별</label> <input class="WJform-control6" type="text"
				value="${memberVO.gender}" readonly="readonly"
				style="background-color: #F4F4F4;">
			<label>전화번호</label> <input class="WJform-control6" type="text"
				value="${memberVO.tel}" readonly="readonly"
				style="background-color: #F4F4F4;">
			<label>직업</label> <input class="WJform-control6" type="text"
				value="${memberVO.job}" readonly="readonly"
				style="background-color: #F4F4F4;">
			<label>펫 키운 경험</label> <input class="WJform-control6" type="text"
				value="${memberVO.existence}" readonly="readonly"
				style="background-color: #F4F4F4;"> --%>
	