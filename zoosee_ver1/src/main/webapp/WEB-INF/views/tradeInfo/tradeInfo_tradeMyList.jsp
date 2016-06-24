<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table border="1">
	<caption>거래 내역</caption>
	<thead>
		<tr>
			<th>거래번호</th>
			<c:if test="${mvo.rank == 'petmom'}">
				<th>펫시터</th>
				<th>펫맘</th>
			</c:if>
			<c:if test="${mvo.rank == 'petsitter' || mvo.rank == 'petmaster'}">
				<th>펫맘</th>
				<th>펫시터</th>
			</c:if>
			<th>보드제목</th>
			<th>거래가격</th>
			<th>시작일</th>
			<th>마감일</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${tradeInfoList}" var="tradeInfoVO">
			<tr>
				<td>${tradeInfoVO.tradeinfo_no}</td>
				<c:choose>
					<c:when test="${mvo.rank == 'petmom'}">
						<td>
							<a href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.petsitterVO.memberVO.id}">
								${tradeInfoVO.petsitterVO.memberVO.name}
							</a>
						</td>
						<td>${tradeInfoVO.memberVO.name}</td>
					</c:when>
					<c:when test="${mvo.rank == 'petsitter'}">
						<td>
							<a href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.memberVO.id}">
								${tradeInfoVO.memberVO.name}</a>
						</td>
						<td>${tradeInfoVO.petsitterVO.memberVO.name}</td>
					</c:when>
					<c:when test="${mvo.rank == 'petmaster'}">
						<c:choose>
							<c:when test="${tradeInfoVO.memberVO.name == mvo.name}">
								<td>${tradeInfoVO.memberVO.name}</td>
								<td>
									<a href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.petsitterVO.memberVO.id}">
										${tradeInfoVO.petsitterVO.memberVO.name}</a></td>
							</c:when>	
							<c:otherwise>
								<td>
									<a href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.memberVO.id}">
										${tradeInfoVO.memberVO.name}</a></td>
								<td>${tradeInfoVO.petsitterVO.memberVO.name}</td>
							</c:otherwise>					
						</c:choose>
					</c:when>
				</c:choose>
				<td>
					<a href="petsitterboardDetail.do?petsitterboard_no=${tradeInfoVO.petsitterboardVO.petsitterboard_no}">
						${tradeInfoVO.petsitterboardVO.petsitterboard_title}
					</a>
				</td>
				<td>${tradeInfoVO.tradePrice}</td>
				<td>${tradeInfoVO.tradeSdate}</td>
				<td>${tradeInfoVO.tradeEdate}</td>
				<td></td>
			</tr>
		</c:forEach>
	</tbody>
</table>