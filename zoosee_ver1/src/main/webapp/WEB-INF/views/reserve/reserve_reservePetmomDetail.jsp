<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		var recog = "${reserveVO.reserve_recog}";
		if(recog == 1){
			$("#okBtn").button({disabled:true}); 
			$("#noBtn").button({disabled:true}); 
		}
		
		$(":input[name=okBtn]").click(function(){
			/* var trTag = $("#reserveForm #okBtn").parent().parent().parent().children();
			var trIndex = trTag.index($(this).parent().parent());
			var reserve_no = trTag.eq(trIndex).children().eq(0).text();
			var id = trTag.eq(trIndex).children().eq(1).text();
			alert(trTag.eq(trIndex).children().eq(0).text()); */
			
			if(confirm("예약 승낙하시겠습니까?")){
				var str = "interceptor_reserve_reserveAccept.do?reserve_no=${reserveVO.reserve_no}&";
				str += "id=${memberVO.id}&petsitterNo=${petsitterboardVO.petsitterVO.petsitterNo}";
				
				location.replace(str);
			}
		});
		
		$(":input[name=noBtn]").click(function(){
			if(confirm("예약 거절하시겠습니까?")){
				location.replace("interceptor_reserve_reserveCancel.do?reserve_no=${reserveVO.reserve_no}");
			}
		});
		$(":input[name=backBtn]").click(function(){
			location.replace("reserve_reserveMyList.do?id=${sessionScope.mvo.id}");
		});
	});
</script>

<table border="1">
	<caption>신청자 정보</caption>
	<tbody>
		<tr>
			<th>아이디</th>
			<td>${memberVO.id}</td>
			<th>이름</th>
			<td>${memberVO.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${memberVO.address}</td>
			<th>성별</th>
			<td>${memberVO.gender}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${memberVO.tel}</td>
			<th>이메일</th>
			<td>${memberVO.email}</td>
		</tr>
		<tr>
			<th>직업</th>
			<td>${memberVO.job}</td>
			<th>경험여부</th>
			<td>${memberVO.existence}</td>
		</tr>
		<tr>
			<th>펫이름</th>
			<td>
				<a href="interceptor_reserve_reservePetDetail.do?petNo=${reserveVO.petVO.petNo}">${reserveVO.petVO.petName}</a>
			</td>
			<th>펫타입</th>
			<td>${reserveVO.petVO.petType}</td>
		</tr>
		<tr>
    		<td colspan="4">
				<input type="button" value="뒤로" id="backBtn" name="backBtn"/>
	    		<input type="button" value="승인" id="okBtn" name="okBtn"/>
				<input type="button" value="거절" id="noBtn" name="noBtn"/>
			</td>
    	</tr>
	</tbody>
</table>
