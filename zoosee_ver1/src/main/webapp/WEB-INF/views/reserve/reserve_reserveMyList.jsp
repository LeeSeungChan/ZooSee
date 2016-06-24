<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">

			<c:if test="${sessionScope.mvo.rank == 'petmaster'}"> 예약 받은 목록 | 
			<a class="BJA"
					href="${initParam.root}reserve_reserveMyList.do?petMasterSignal=1">예약
					신청 목록</a>
			</c:if>
			<%-- 	<a class="BJA"
				href="${initParam.root}interceptor_member_memberlist.do?rank=normal">예약받은
				목록</a> <a class="BJA"
				href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">예약신청
				목록</a> --%>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">예약 목록</h3>
			</div>
			<div class="panel-body">예약에 관련된 목록을 제공하는 공간입니다.</div>
		</div>
		<div class="well well-sm">${mvo.name }님의예약을 받은 목록입니다.</div>
	</div>
	<div class="BJMain2Div" align="center">

		<form id="petsitterlistForm">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
					<table class="table table-striped table-hover"
						id="petsitterlistTable">
						<tr>
							<td style="width: 10%">예약번호</td>
							<td style="width: 10%">신청자</td>
							<td style="width: 10%">이름</td>
							<td style="width: 10%">상태</td>
						</tr>
						<c:forEach items="${requestScope.reserveList}" var="reserveVO">
							<c:choose>
								<c:when test="${reserveVO.reserve_recog != '2'}">
									<tr>
										<td>${reserveVO.reserve_no}</td>
										<td>${reserveVO.memberVO.id}</td>
										<td><a
											href="reserve_showPetmomDetail.do?reserve_no=${reserveVO.reserve_no}&id=${reserveVO.memberVO.id}&reserve_recog=${reserveVO.reserve_recog}">
												${reserveVO.memberVO.name} </a></td>
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
					</table>
				</div>
			</div>
		</form>
	</div>
</div>



<%-- 
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
 --%>