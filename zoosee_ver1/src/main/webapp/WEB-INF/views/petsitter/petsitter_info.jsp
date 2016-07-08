<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function(){
		var petSize = $(":input[name=petSize]").val();
		var petType = $(":input[name=petType]").val();
		
		if(petSize == "small"){
			$(":input[name=petSize]").val("소형");
		}else if(petSize == "middle"){
			$(":input[name=petSize]").val("중형");
		}else if(petSize == "large"){
			$(":input[name=petSize]").val("대형");
		}
		
		if(petType == "dog"){
			$(":input[name=petType]").val("강아지");
		}else if(petType == "cat"){
			$(":input[name=petType]").val("고양이");
		}else if(petType == "etc"){
			$(":input[name=petType]").val("기타");
		}
	});
</script>

<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}pet_list.do">펫목록</a>
			<a class="BJA" href="${initParam.root}pet_register.do">펫등록</a>
			<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
				<a class="BJA" href="${initParam.root}ps_petsitter_updateform.do">펫시터 정보 수정</a>
				<a class="BJA" href="${initParam.root}ps_petsitter_info.do?id=<sec:authentication property="principal.id"/>">
					펫시터 정보 보기</a>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_MEMBER,ROLE_PETMOM">
				<a class="BJA" href="${initParam.root}petsitter_register.do">펫시터신청</a>
			</sec:authorize>
		</div>
	</div>
</div>
<div class="BJMainKING">
	<form name="updateForm" action="ps_petsitter_update.do" style="text-align:center;" method="post"
		enctype="multipart/form-data" id="updateForm">
		<h3 align="center">ZOOSEE 펫시터 정보</h3><br><br>
		<div class="HGDiv">
			<br>
			<div class="HGDiv2" align="center">
				<img id="UploadedImg2" style="border: 3px solid #DFDFDF;" src="${petsitterVO.petsitterImg}"
					class="center-block img-circle img-responsive" width="90%" height="90%"> *펫시터 사진
			</div>
			<div style="margin:0 auto; width:500px; height: 500px;" align="center">
				<img id="UploadedImg" style="border: 3px solid #DFDFDF;" src="${petsitterVO.houseImg}"
					class="center-block img-circle img-responsive" width="90%" height="90%"> *집 사진
			</div><br>
			<div class="form-group" style="width:200px; text-align:center; margin-left:auto; margin-right:auto;">
				<label class="control-label">*펫시터님 아이디</label>
				<div class="input-group">
					<span class="input-group-addon">ID</span> 
					<input type="text" class="form-control" style="height: 60%; background-color: #F4F4F4;" id="name"
						name="id" readonly="readonly" value="${petsitterVO.memberVO.id }">
				</div>
			</div><br>
			<div class="form-group" style="width: 200px; text-align:center; margin-left:auto; margin-right:auto;">
				<label class="control-label">*펫시터님 이름</label>
				<div class="input-group">
					<span class="input-group-addon">NAME</span> 
					<input type="text" class="form-control" style="height:60%; background-color:#F4F4F4;" id="name"
						name="name" readonly="readonly" value="${petsitterVO.memberVO.name }">
				</div>
			</div><br>
			<div class="form-group" style="width:200px; text-align:center; margin-left:auto; margin-right:auto;">
				<label class="control-label">*원하시는 가격(1박)</label>
				<div class="input-group">
					<span class="input-group-addon">$</span> 
					<input type="text" class="form-control" style="height:60%; background-color:#F4F4F4;" name="price"
						id="price" value="${petsitterVO.price}" readonly="readonly">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*펫 종류</label>
				<div class="input-group">
					<span class="input-group-addon">Type</span> 
					<input type="text" class="form-control" style="height: 60%; background-color: #F4F4F4;" id="name"
						name="petType" readonly="readonly" value="${petsitterVO.petType}">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*펫 크기</label>
				<div class="input-group">
					<span class="input-group-addon">Size</span> 
					<input type="text" class="form-control" style="height: 60%; background-color: #F4F4F4;" id="name"
						name="petSize" readonly="readonly" value="${petsitterVO.petSize}">
				</div>
			</div>
			<br>
			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*돌봄 가능한 펫</label>
				<div class="input-group">
					<span class="input-group-addon">How many</span> 
					<input type="text" class="form-control" style="height:60%; background-color:#F4F4F4;" id="name"
						name="petNumber" readonly="readonly" value="${petsitterVO.petNumber}">
				</div>
			</div>
			<br>
			<div class="form-group" style="width:200px; text-align:center; margin-left:auto; margin-right:auto;">
				<label class="control-label">*제공 서비스</label>
				<div class="input-group">
					<span class="input-group-addon">Service</span> 
					<input type="text" class="form-control" style="height:60%; background-color:#F4F4F4;" id="name"
						name="service" readonly="readonly" value="${petsitterVO.service}">
				</div>
			</div>
			<br> <br> 
			<input type="button" class="active btn btn-block btn-default" value="홈으로" onclick="location.href='home.do'"><br><br>
		</div>
	</form>
</div>
