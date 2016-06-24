<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>예약 받은 목록</h1>

<c:if test="${sessionScope.mvo.rank == 'petmaster'}">
	예약 받은 목록 | <a href="${initParam.root}reserve_reserveMyList.do?petMasterSignal=1">예약 신청 목록</a>
</c:if>

<table border="1">
	<thead>
		<tr>
			<th>예약번호</th>
			<th>신청자</th>
			<th>이름</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.reserveList}" var="reserveVO">
			<c:choose>
				<c:when test="${reserveVO.reserve_recog != '2'}">
					<tr>
					<td>${reserveVO.reserve_no}</td>
					<td>${reserveVO.memberVO.id}</td>
					<td>
					<a href="reserve_showPetmomDetail.do?reserve_no=${reserveVO.reserve_no}&id=${reserveVO.memberVO.id}&reserve_recog=${reserveVO.reserve_recog}">
						${reserveVO.memberVO.name}
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
							<td>거래완료</td>
						</c:when>
					</c:choose>
					</tr>
				</c:when>
			</c:choose>
		</c:forEach>
	</tbody>
</table>
