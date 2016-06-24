<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function backPetmomDetail(){
		// 어디로 갈지 정해야 한다.
		//location.replace("reserve_reserveMyList.do");
		//location.replace("reserve_showPetmomDetail.do");
		history.go(-1);
	}
</script>

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
</table>