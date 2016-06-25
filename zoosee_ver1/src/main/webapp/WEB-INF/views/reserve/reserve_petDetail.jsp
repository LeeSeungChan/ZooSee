<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
$(document).ready(function() {
			$("input:radio[name=petGender][value="+ '<c:out value="${ petVO.petGender }"/>'+ "]").attr("checked", "checked");
			$("input:radio[name=petNeutral][value="+ '<c:out value="${ petVO.petNeutral }"/>'+ "]").attr("checked", "checked");
});
	 function backPetmomDetail(){
		// 어디로 갈지 정해야 한다.
		//location.replace("reserve_reserveMyList.do");
		//location.replace("reserve_showPetmomDetail.do");
		history.go(-1);
	} 
</script>
<div class="BJMainKING">

<div class="BJMainDiv" style="margin-bottom: 10%; margin-top: 5%">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">신청자의 반려동물 상세보기</h3>
			</div>
			<div class="panel-body">신청자의 소중한 반려동물 "${petVO.petName}"의 상세정보를 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">신청자의 소중한 ${petVO.petType}(${petVO.petName})의 상세정보</div>
	</div>
<div class="WJcontainer7">
	<!-- 왼쪽 시작-->
	<div style="float: left; width: 50%;">
		<br>
		<div style="margin-top: 11%; width: 400px; height: 400px;">
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
		<br>
		<input type="button" class="active WJbtn btn-block btn-info" value="확인" onclick="backPetmomDetail()">
	</div>
	</div>
</div>
</div>

<%-- 
<table border="1">
	<caption>펫 정보</caption>
	<thead>
		<tr>
			<th>펫이름</th>
			<td>${petVO.petName}</td>
			<th>펫나이</th>
			<td>${petVO.petAge}</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>펫타입</th>
			<td>${petVO.petType}</td>
			<th>펫성별</th>
			<td>${petVO.petGender}</td>
		</tr>
		<tr>
			<th>펫중성화</th>
			<td>${petVO.petNeutral}</td>
			<th>펫사이즈</th>
			<td>${petVO.petSize}</td>
		</tr>
		<tr>
			<th>펫이미지</th>
			<td><img src="${initParam.root}${petVO.petImg}" alt="사진"/></td>
		</tr>
		<tr>
			<th>특이사항</th>
			<td>${petVO.etc}</td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="backPetmomDetail()"/></td>
		</tr>
	</tbody>
</table> --%>