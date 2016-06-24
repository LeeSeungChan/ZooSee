<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
	/*사진 바로 업로드 미리보기*/

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(document)
			.ready(
					function() {
						$("#petName").focus();
						$(
								"input:radio[name=petGender][value="
										+ '<c:out value="${ pvo.petGender }"/>'
										+ "]").attr("checked", "checked");
						$(
								"input:radio[name=petNeutral][value="
										+ '<c:out value="${ pvo.petNeutral }"/>'
										+ "]").attr("checked", "checked");
						$("#petSize option[value=" + "'${pvo.petSize}'" + "]")
								.attr("selected", "selected");
						$("#petType option[value=" + "'${pvo.petType}'" + "]")
								.attr("selected", "selected");
						$("#update")
								.click(
										function() {
											if (confirm("정보를 수정하셨습니까?")) {
												location
														.replace("interceptor_pet_update.do?petNo=${petVO.petNo}");
											} else {
												return false;
											}
										});
					});
</script>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}interceptor_pet_list.do">펫목록</a>
			<a class="BJA" href="${initParam.root}interceptor_pet_register.do">펫등록</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">반려동물 정보수정</h3>
			</div>
			<div class="panel-body">${mvo.name }님의 소중한 반려동물 "${pvo.petName}"의 정보수정을 입력하기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">${mvo.name }님의 소중한 ${pvo.petType}(${pvo.petName})의 상세정보</div>
	</div>
<!-- 전체 시작 -->
<div class="WJcontainer7">
	<!-- 왼쪽 시작-->
	<form action="interceptor_pet_update_result.do"
		enctype="multipart/form-data" method="post">
		<input type="hidden" name="petNo" value="${pvo.petNo}">
		<div style="float: left; width: 50%;">
			<br>
			<div style="margin: 0 auto; width: 400px; height: 400px;">
				<img id="UploadedImg" style="border: 1px solid black;"
					src="${initParam.root}${pvo.petImg}"
					class="center-block img-circle img-responsive" width="90%"
					height="90%"> <input id="petImg3" name="petImg3" type="file"
					onchange="readURL(this)">
			</div>
		</div>
		<!-- 왼쪽 끝 -->
		<!-- 오른쪽 시작 -->
		<div style="float: right; width: 50%;">
			<label>Pet Name</label> <input class="WJform-control" id="petName"
				name="petName" type="text" value="${pvo.petName}"> <label>Pet
				Age</label> <input class="WJform-control" id="petAge" name="petAge"
				type="text" value="${pvo.petAge}"> <label>Pet Type</label>
			<select class="WJform-control" id="petType" name="petType">
				<option value="" selected>-Select-</option>
				<option value="강아지">강아지</option>
				<option value="고양이">고양이</option>
				<option value="새">새</option>
				<option value="파충류">파충류</option>
			</select> <label>Pet Gender</label>
			<div class="radio" align="center">
				<label class="radio-inline"> <input type="radio"
					name="petGender" value="man">MAN
				</label> <label class="radio-inline"> <input type="radio"
					name="petGender" value="woman">WOMAN
				</label>
			</div>
			<label>Pet Neutral</label>
			<div class="radio" align="center">
				<label class="radio-inline"> <input type="radio"
					name="petNeutral" value="yes">Yes
				</label> <label class="radio-inline"> <input type="radio"
					name="petNeutral" value="no">No
				</label>
			</div>
			<label>Pet Size</label> <select class="WJform-control" id="petSize"
				name="petSize">
				<option value="" selected>-Select-</option>
				<option value="Small">Small</option>
				<option value="Medium">Medium</option>
				<option value="Large">Large</option>
			</select> <label>Etc</label>
			<textarea class="WJform-control2" id="petEtc" name="etc" rows="3"
				style="width: 100%; resize: none;">${pvo.etc}</textarea>
			<br> <input type="submit" id="update" value="수정"
				class="active WJbtn btn-block btn-default">
		</div>
	</form>
	</div>
</div>

