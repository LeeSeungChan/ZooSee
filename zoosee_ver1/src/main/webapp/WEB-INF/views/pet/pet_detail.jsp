<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(
								"input:radio[name=petGender][value="
										+ '<c:out value="${ petVO.petGender }"/>'
										+ "]").attr("checked", "checked");
						$(
								"input:radio[name=petNeutral][value="
										+ '<c:out value="${ petVO.petNeutral }"/>'
										+ "]").attr("checked", "checked");
						$("#update")
								.click(
										function() {
											if (confirm("${petVO.petName}의 정보를 수정하시겠습니까?")) {
												location
														.replace("interceptor_pet_update.do?petNo=${petVO.petNo}");
											}
										});
						$("#delete")
								.click(
										function() {
											if (confirm("${petVO.petName}을(를) 삭제하겠습니까?")) {
												location
														.replace("interceptor_pet_delete.do?petNo=${petVO.petNo}");
											}
										});
						$("#list").click(function() {
							if (confirm("펫 목록으로 돌아 가시겠습니까?")) {
								location.replace("interceptor_pet_list.do");
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
				<h3 class="panel-title">반려동물 상세보기</h3>
			</div>
			<div class="panel-body">${mvo.name }님의 소중한 반려동물 "${petVO.petName}"의 상세정보를 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">${mvo.name }님의 소중한 ${petVO.petType}(${petVO.petName})의 상세정보</div>
	</div>
	
<!-- 전체 시작 -->
<div class="WJcontainer7">
	<!-- 왼쪽 시작-->
	<div style="float: left; width: 50%;">
		<br>
		<div style="margin: 0 auto; width: 400px; height: 400px;">
			<img style="border: 1px solid black;"
				src="${initParam.root}${petVO.petImg}"
				class="center-block img-circle img-responsive" width="90%"
				height="90%">
				</div>
	</div>
	<!-- 왼쪽 끝 -->
	<!-- 오른쪽 시작 -->
	<div style="float: right; width: 50%;">
		<label>Pet Name</label> <input class="WJform-control" id="petName"
			name="petName" type="text" value="${petVO.petName}"
			readonly="readonly" style="background-color: #F4F4F4;"> <label>Pet
			Age</label> <input class="WJform-control" id="petAge" name="petAge"
			type="text" value="${petVO.petAge}" readonly="readonly"
			style="background-color: #F4F4F4"> <label>Pet Type</label> <input
			class="WJform-control" id="petType" name="petType" type="text"
			value="${petVO.petType}" readonly="readonly"
			style="background-color: #F4F4F4"> <label>Pet Gender</label>
		<div class="radio" align="center">
			<label class="radio-inline"> <input type="radio"
				name="petGender" value="man" disabled="disabled">MAN
			</label> <label class="radio-inline"> <input type="radio"
				name="petGender" value="woman" disabled="disabled">WOMAN
			</label>
		</div>
		<label>Pet Neutral</label>
		<div class="radio" align="center">
			<label class="radio-inline"> <input type="radio"
				name="petNeutral" value="yes" disabled="disabled">Yes
			</label> <label class="radio-inline"> <input type="radio"
				name="petNeutral" value="no" disabled="disabled">No
			</label>
		</div>
		<label>Pet Size</label> <input class="WJform-control" id="petSize"
			name="petSize" type="text" value="${petVO.petSize}"
			readonly="readonly" style="background-color: #F4F4F4"> <label>Etc</label>
		<textarea class="WJform-control2" id="petEtc" name="etc" rows="3"
			style="width: 100%; resize: none; background-color: #F4F4F4"
			readonly="readonly">${petVO.etc}</textarea>
		<br> <input type="button" id="update" value="수정"
			class="active WJbtn btn-default" style="float: left; width: 49.5%;">
		<input type="button" id="delete" value="삭제"
			class="active WJbtn btn-default"
			style="float: right; width: 49.5%; margin-bottom: 2%"> 
	</div>
	</div>
</div>