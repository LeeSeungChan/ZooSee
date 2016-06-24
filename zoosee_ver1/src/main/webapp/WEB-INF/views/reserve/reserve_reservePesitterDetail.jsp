<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		var recog = "${reserveVO.reserve_recog}";
		if(recog == 0){
			$("#okBtn").button({disabled:true}); 
		}
		
		$(":input[name=okBtn]").click(function(){
			/* var trTag = $("#reserveForm #okBtn").parent().parent().parent().children();
			var trIndex = trTag.index($(this).parent().parent());
			var reserve_no = trTag.eq(trIndex).children().eq(0).text();
			var id = trTag.eq(trIndex).children().eq(1).text();
			alert(trTag.eq(trIndex).children().eq(0).text()); */
			
			// !!!! +거래완료로 바뀌어야 한다.
			if(confirm("거래 하시겠습니까?")){
				var str = "interceptor_reserve_reserveDealAccept.do?reserve_no=${reserveVO.reserve_no}&";
				str += "petsitterId=${petsitterboardVO.petsitterVO.memberVO.id}&petsitterNo=${petsitterboardVO.petsitterVO.petsitterNo}";
				
				location.href = str;
			}
		});
		
		$(":input[name=noBtn]").click(function(){
			if(confirm("예약을 취소하시겠습니까?")){
				location.replace("interceptor_reserve_reserveCancel.do?reserve_no=${reserveVO.reserve_no}");
			}
		});
	});
</script>

<table border="1">
	<caption>펫시터 정보</caption>
	<tbody>
		<tr>
			<th>아이디</th>
			<td>${petsitterboardVO.petsitterVO.memberVO.id}</td>
			<th>이름</th>
			<td>${petsitterboardVO.petsitterVO.memberVO.name}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${petsitterboardVO.petsitterVO.memberVO.address}</td>
			<th>이메일</th>
			<td>${petsitterboardVO.petsitterVO.memberVO.email}</td>
		</tr>
		<tr>
			<th>직업</th>
			<td>${petsitterboardVO.petsitterVO.memberVO.job}</td>
			<th>경험여부</th>
			<td>${petsitterboardVO.petsitterVO.memberVO.existence}</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<img src="${initParam.root}${petsitterboardVO.petsitterVO.petsitterImg}" />
			</td>
		</tr>
		<tr>
    		<td colspan="4">
	    		<input type="button" value="거래하기" id="okBtn" name="okBtn"/>
				<input type="button" value="취소하기" id="noBtn" name="noBtn"/>
			</td>
    	</tr>
	</tbody>
</table>
