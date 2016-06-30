<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(
								'input:radio[name="petType"]:input[value="${petsitterVO.petType}"]')
								.attr("checked", true);
						$(
								'input:radio[name="petSize"]:input[value="${petsitterVO.petSize}"]')
								.attr("checked", true);
						$(
								'input:radio[name="petNumber"]:input[value="${petsitterVO.petNumber}"]')
								.attr("checked", true);
						$(
								'input:radio[name="service"]:input[value="${petsitterVO.service }"]')
								.attr("checked", true);
						$("#updateForm").submit(
								function() {
									var price = $("#price").val();
									var petNumber = $(
											"input[name=petNumber].checked")
											.val();
									var service = $(
											"input[name=service]:checked")
											.val();
									var petType = $(
											"input[name=petType]:checked")
											.val();
									var petSize = $(
											"input[name=petSize]:checked")
											.val();
									var house_img = $("#house_img").val();
									var petsitter_img = $("#petsitter_img")
											.val();
									var checkedAll = $(
											"input[name=checkedAll]:checked")
											.val();
									if (price == "") {
										alert("가격을 입력해주세요!");
										return false;
									} else if (isNaN(price)) {
										alert("가격을 숫자로 입력해주세요!");
										return false;
									} else if (service == undefined) {
										alert("제공 가능한 서비스를 선택해주세요!")
										return false;
									} else if (petType == undefined) {
										alert("팻 종류를 선택해주세요!");
										return false;
									} else if (petSize == undefined) {
										alet("팻 사이즈를 선택해주세요!");
										return false;
									} else if (checkedAll == undefined) {
										alert("필수사항에 체크해주세요!");
										return false;
									}
									if (confirm("수정 하시겠습니까?")) {
										return true;
									} else {
										return false;
									}
								});//submit
					});//ready
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg2').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
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
		<h3 align="center">ZOOSEE 돌보미 정보수정</h3>
		<br> <br>
		<div
			style="text-align: center; text-align: center; width: 30%; margin-left: 35%">
			<blockquote>
				<p>
					*수정하기전 확인해주세요!<br> 회원정보 수정시 일반등급의 회원으로 재조정되며<br> 관리자의 승인을
					다시 받아야 합니다.<br> <br> *승인신청은 자동으로 되며 관리자 승인 후 돌보미게시판을 이용하실
					수 있습니다!<br> <br>
				</p>
			</blockquote>
		</div>
		<br>


		<div class="HGDiv">

			<br>

			<div class="form-group"
				style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*돌보미님 아이디</label>
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
				<label class="control-label">*돌보미님 이름</label>
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
						class="form-control" style="height: 60%" name="price" id="price"
						value="${petsitterVO.price }">
				</div>
			</div>

			<br> *가능한 펫 종류 <br> <input type="radio" name="petType"
				value="dog">멍뭉이 <input type="radio" name="petType"
				value="cat">야옹이<br> <br> *원하는 펫 크기 <br> <input
				type="radio" name="petSize" value="small"> 아기팻 <input
				type="radio" name="petSize" value="middle"> 보통 <input
				type="radio" name="petSize" value="big"> 커더란 팻!<br> <br>
			*돌봄 가능한 팻 <br> <input type="radio" name="petNumber" value="1">한마리
			<input type="radio" name="petNumber" value="2">두마리 <input
				type="radio" name="petNumber" value="3">세마리<br> <br>
			*제공 가능한 서비스 <br> <input type="radio" name="service" value="목욕">목욕
			<input type="radio" name="service" value="산책">산책 <input
				type="radio" name="service" value="픽업">픽업<br> <br>

			<div style="margin: 0 auto; width: 500px; height: 500px;"
				align="center">
				<img id="UploadedImg" style="border: 3px solid #DFDFDF;"
					src="${petsitterVO.houseImg}"
					class="center-block img-circle img-responsive" width="90%"
					height="90%"> *집 사진 <input id="house_img" name="file[0]"
					type="file" onchange="readURL(this)">
			</div>
			<br> <br>

			<div style="margin: 0 auto; width: 500px; height: 500px;"
				align="center">
				<img id="UploadedImg2" style="border: 3px solid #DFDFDF;"
					src="${petsitterVO.petsitterImg}"
					class="center-block img-circle img-responsive" width="90%"
					height="90%"> *돌보미 사진 <input id="petsitter_img"
					name="file[1]" type="file" onchange="readURL2(this)">
			</div>


			<hr>


			*공지사항 확인하셨나요? <br> <input type="radio" name="checkedAll">네
			확인했습니다! <br> <br> <input type="hidden" name="petsitterNo"
				value="${petsitterVO.petsitterNo}"> <input type="hidden"
				name="orgHouseImg" value="${petsitterVO.houseImg}"> <input
				type="hidden" name="orgPetsitterImg"
				value="${petsitterVO.petsitterImg}"> <input type="submit"
				class="active btn btn-block btn-default" value="수정하기"> <br>
			<br>
		</div>
	</form>
</div>
