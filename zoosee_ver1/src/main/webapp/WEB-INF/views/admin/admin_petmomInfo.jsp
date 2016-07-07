<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h3 class="panel-title">펫맘회원 정보</h3>
			</div>
			<div class="panel-body">펫맘회원 정보를 보여드리는 공간입니다.</div>
		</div>
		<div class="well well-sm">${memberVO.name }님의 회원정보</div>
	</div>
	<div class="BJWriteTableLine" style="text-align: left; margin-left: 10%; margin-right: 10%;">
			<table style=" margin-left: 25%; width: 50%; margin-top: 2%; margin-bottom: 2%;">
				<tr>
					<th style=" text-align: right; vertical-align: middle; width: 25%;">아이디</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
							<input class="WJform-control6" type="text" value="${memberVO.id}" readonly="readonly" 
								style="background-color: #F4F4F4;">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; vertical-align: middle;">이름</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
							<input class="WJform-control6" type="text" value="${memberVO.name}" readonly="readonly"
								style="background-color: #F4F4F4;">
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
							<input class="WJform-control6" type="text" value="${memberVO.gender}" readonly="readonly"
								style="background-color: #F4F4F4;">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; vertical-align: middle;">전화번호</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
							<input class="WJform-control6" type="text" value="${memberVO.tel}" readonly="readonly"
								style="background-color: #F4F4F4;">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; vertical-align: middle;">직업</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
							<input class="WJform-control6" type="text" value="${memberVO.job}" readonly="readonly"
								style="background-color: #F4F4F4;">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: right; vertical-align: middle;">펫 키운 경험</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%; margin-left: 10%;">
							<input class="WJform-control6" type="text" value="${memberVO.existence}" readonly="readonly"
								style="background-color: #F4F4F4;">
						</div>
					</td>
				</tr>
			</table>
			<div align="center" style="margin-bottom: 2%;">
			<table>
				<c:forEach items="${petList}" var="p">
				<tr>
					<td>
						<img src="${L.petImg}" width="70" height="70" style="border-radius: 100px; 
							-moz-border-radius: 100px;-khtml-border-radius: 100px;-webkit-border-radius: 100px;">
                 		<div style="margin-bottom: 3%; margin-top: 3%;"></div>
                	 </td>
                 	<td>
                 		<div style="width: 200px;margin-left: 5%;">(${p.petName}, ${p.petType}, ${p.petGender}, ${p.petAge})</div>
                 		</td>
                 </tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<div style="width:100%; height: 50px; margin-top: 2%;">
	<input class="active WJbtn btn-block btn-info" style="width:5%; margin-left:47%; "onclick="history.go(-1)" type="button" value="확인" >   
</div>
	
<%-- 
<div class="BJMainDiv">
	<div class="BJMain2Div">
		<div class="BJWriteTableLine">

			<div class="WJLayout" style="text-align: left; margin-bottom: 5%;">
				<form>
					<h3>${memberVO.name }님의회원정보</h3>
					<div class="WJform-group">
						<label>id</label> <input class="WJform-control" type="text"
							value="${memberVO.id}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Name</label> <input class="WJform-control" type="text"
							value="${memberVO.name}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Address</label> <input class="WJform-control"
							value="우편번호 : ${memberVO.addressCode}" disabled="disabled">
						<input class="WJform-control" value="${memberVO.address}"
							disabled="disabled"> <input class="WJform-control"
							value="${memberVO.detailAddress}" disabled="disabled">
					</div>
					<div class="WJform-group">
						<label>Email address</label> <input class="WJform-control"
							type="text" value="${memberVO.email}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Gender</label> <input class="WJform-control" type="text"
							value="${memberVO.gender}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Tel</label> <input class="WJform-control" type="text"
							value="${memberVO.tel}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Job</label> <input class="WJform-control" type="text"
							value="${memberVO.job }" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Existence</label> <input class="WJform-control"
							value="${memberVO.existence}" disabled="disabled">
					</div>
					<c:forEach items="${petList}" var="p">
					${p}
					</c:forEach> 
				</form>
			</div>
		</div>
	</div>
</div> --%>