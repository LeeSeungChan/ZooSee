<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	alert("예약이 완료되었습니다.");
	location.replace("reserve_reserveMyList.do?petMasterSignal=1");
</script>

    <table border="1">
    	<thead>
    		<tr>
    			<th colspan="5">예약 신청 내역</th>
    		</tr>
    	</thead>
    	<tbody>
			<tr>
				<td>신청자</td>
    			<td>이름</td>
    			<td>${reserveDetail.memberVO.name}</td>
    			<td>주소</td>
    			<td>${reserveDetail.memberVO.address}</td>
    			<td>Tel.</td>
    			<td>${reserveDetail.memberVO.tel}</td>
    		</tr>
    		<tr>
				<td>펫시터</td>
    			<td>이름</td>
    			<td>${reserveDetail.petsitterboardVO.petsitterVO.memberVO.name}</td>
    			<td>주소</td>
    			<td>${reserveDetail.petsitterboardVO.petsitterVO.memberVO.address}</td>
    			<td>Tel.</td>
    			<td>${reserveDetail.petsitterboardVO.petsitterVO.memberVO.tel}</td>
    		</tr>
    		<tr>
    			<td>시작날짜</td>
    			<td>${requestScope.reserveSdate.pet_calDate}</td>
    			<td>마감날짜</td>
    			<td>${requestScope.reserveEdate.pet_calDate}</td>
    		</tr>
    		<tr>
    			<td colspan="2">총 합계</td>
    			<td colspan="5">${reserveDetail.reserve_price}</td>
    		</tr>
    	</tbody>
    </table>
    
    <input type="button" value="확인" id="CheckBtn" />
    <input type="button" value="예약취소" id="cancelBtn" />
    