<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>예약 신청 목록</h1>

<c:if test="${sessionScope.mvo.rank == 'petmaster'}">
	<a href="reserve_reserveMyList.do?petMasterSignal=0">예약 받은 목록</a> | 예약 신청 목록 
</c:if>

<table border="1">
	<thead>
		<tr>
			<th>예약번호</th>
			<th>펫시터</th>
			<th>이름</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.reserveList}" var="reserveVO">
			<c:if test="${reserveVO.reserve_recog != '2'}">
				<tr>
					<td>${reserveVO.reserve_no}</td>
					<td>${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}</td>
					<td>
						<a href="reserve_showPesitterDetail.do?reserve_no=${reserveVO.reserve_no}&id=${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}">
							${reserveVO.petsitterboardVO.petsitterVO.memberVO.name}
						</a>
					</td>
					<c:choose>
						<c:when test="${reserveVO.reserve_recog == '0'}">
							<td>예약신청</td>
						</c:when>
						<c:when test="${reserveVO.reserve_recog == '1'}">
							<td>예약완료</td>
						</c:when>
						<c:when test="${reserveVO.reserve_recog == '2'}">
							<td>거래중</td>
						</c:when>
					</c:choose>
				</tr>
			</c:if>
			
		</c:forEach>
	</tbody>
</table>
