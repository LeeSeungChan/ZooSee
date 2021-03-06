<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="BJMainKING">
<div class="BJMainDiv" style="margin-bottom: 6%;margin-top: 5%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">펫시터 상세정보</h3>
			</div>
			<div class="panel-body">${petsitterVO.memberVO.name}님의 펫시터 상세정보를 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">${petsitterVO.memberVO.name}님의 상세정보</div>
	</div>
	
	
	<div class="WJcontainer7">
		<div style="float: left; width: 50%;"><br/>
			<div style="margin:9% auto 0 auto; width: 300px; height: 300px;">
				<img style="border: 1px solid black;" src="${initParam.root}${petsitterVO.petsitterImg}" 
					class="center-block img-circle img-responsive" width="90%" height="90%">
			</div>
			<div style="margin:4% auto 0 auto; width:150px; height:150px;">
				<a href="reserve_reservePetDetail.do?petNo=${petVO.petNo}">
					<img src="${initParam.root}${petVO.petImg}" class="center-block img-circle img-responsive"><br/> 
					<span style="margin:0 auto 0 auto;">펫 "${petVO.petName}" 상세보기</span>
				</a>
			</div>
		</div>
		<div style="float: right; width: 50%;" >
			<label>Petsitter id</label> 
			<input class="WJform-control" type="text" value="${petsitterVO.memberVO.id}" readonly="readonly" 
				style="background-color: #F4F4F4;"> 
			<label>Petsitter Name</label> 
			<input class="WJform-control" type="text" value="${petsitterVO.memberVO.name}" readonly="readonly"
				style="background-color: #F4F4F4">
			<label>Petsitter Address</label> 
			<input class="WJform-control"type="text" value="${petsitterVO.memberVO.address}" readonly="readonly"
				style="background-color: #F4F4F4"> 
			<label>Petsitter Gender</label> 
			<input class="WJform-control"type="text" value="${petsitterVO.memberVO.gender}" readonly="readonly"
				style="background-color: #F4F4F4"> 
			<label>Petsitter Tel</label> 
			<input class="WJform-control"type="text" value="${petsitterVO.memberVO.tel}" readonly="readonly"
				style="background-color: #F4F4F4"> 
			<label>Petsitter email</label>
			<input class="WJform-control"  type="text" value="${petsitterVO.memberVO.email}" readonly="readonly"
				style="background-color: #F4F4F4"> 
			<label>Petsitter Job</label>
			<input class="WJform-control"  type="text" value="${petsitterVO.memberVO.job}" readonly="readonly"
				style="background-color: #F4F4F4"> 
			<label>Petsitter ex</label>
			<input class="WJform-control"  type="text" value="${petsitterVO.memberVO.existence}" readonly="readonly"
				style="background-color: #F4F4F4"> 
			<br>
			<input type="button" value="뒤로가기" onclick="history.go(-1)" class="active WJbtn btn-block btn-default"/>
		</div>
	</div>
</div>
</div>

