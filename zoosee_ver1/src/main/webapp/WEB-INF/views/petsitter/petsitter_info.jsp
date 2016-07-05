<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}interceptor_pet_list.do">펫목록</a>
			<a class="BJA" href="${initParam.root}interceptor_pet_register.do">펫등록</a>
			<c:choose>
				<c:when test="${mvo.rank=='petsitter' || mvo.rank=='petmaster'}">
					<a class="BJA"
						href="${initParam.root}interceptor_petsitter_updateform.do">펫시터
						정보 수정</a>
					<a class="BJA"
						href="${initParam.root}interceptor_petsitter_info.do?id=${sessionScope.mvo.id}">펫시터
						정보 보기</a>
				</c:when>
				<c:otherwise>
					<a class="BJA" href="${initParam.root}petsitter_register.do">펫시터신청</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<div class="BJMainKING">
	<form name="updateForm" action="interceptor_petsitter_update.do"
		style="text-align: center;" method="post"
		enctype="multipart/form-data" id="updateForm">
		<h3 align="center">ZOOSEE 펫시터 정보</h3>
		<br> <br>
		<div class="HGDiv">
			<br>
			<div class="HGDiv2" align="center">
				<img id="UploadedImg2" style="border: 3px solid #DFDFDF;"
					src="${petsitterVO.petsitterImg}"
					class="center-block img-circle img-responsive" width="90%"
					height="90%"> *펫시터 사진
			</div>
			<div style="margin: 0 auto; width: 500px; height: 500px;"
				align="center">
				<img id="UploadedImg" style="border: 3px solid #DFDFDF;"
					src="${petsitterVO.houseImg}"
					class="center-block img-circle img-responsive" width="90%"
					height="90%"> *집 사진
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*펫시터님 아이디</label>
				<div class="input-group">
					<span class="input-group-addon">ID</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly"
						value="${petsitterVO.memberVO.id }">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*펫시터님 이름</label>
				<div class="input-group">
					<span class="input-group-addon">NAME</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly"
						value="${petsitterVO.memberVO.name }">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*원하시는 가격(1박)</label>
				<div class="input-group">
					<span class="input-group-addon">$</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" name="price"
						id="price" value="${petsitterVO.price }" readonly="readonly">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*팻 종류</label>
				<div class="input-group">
					<span class="input-group-addon">Type</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly" value="${petsitterVO.petType }">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*팻 크기</label>
				<div class="input-group">
					<span class="input-group-addon">Size</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly" value="${petsitterVO.petSize }">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*돌봄 가능한 팻</label>
				<div class="input-group">
					<span class="input-group-addon">How many</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly"
						value="${petsitterVO.petNumber }">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*제공 서비스</label>
				<div class="input-group">
					<span class="input-group-addon">Service</span> <input type="text"
						class="form-control"
						style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly" value="${petsitterVO.service }">
				</div>
			</div>
			<br> <br> <input type="button"
				class="active btn btn-block btn-default" value="홈으로"
				onclick="location.href='home.do' "> <br> <br>
		</div>
	</form>
</div>
