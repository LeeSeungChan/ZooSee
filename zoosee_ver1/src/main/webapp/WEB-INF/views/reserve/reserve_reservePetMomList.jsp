<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<sec:authorize ifAnyGranted="ROLE_PETMASTER">
				<a class="BJA"
					href="reserve_reserveMyList.do?petMasterSignal=0">
					예약받은 목록</a>
				<a class="BJA"
					href="${initParam.root}reserve_reserveMyList.do?petMasterSignal=1">
					예약신청 목록 </a>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_PETMOM">
				<a class="BJA"
					href="${initParam.root}reserve_reserveMyList.do?petMasterSignal=1">
					예약신청 목록 </a>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_PETSITTER">
				<a class="BJA"
					href="reserve_reserveMyList.do?petMasterSignal=0">
					예약받은 목록</a>
			</sec:authorize>
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
		<div class="well well-sm"><sec:authentication property="principal.name"/>님의예약 신청 목록입니다.</div>
	</div>
	<div class="BJMain2Div" align="center">
		<form id="petsitterlistForm">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
					<c:choose>
						<c:when test="${empty reserveList }">
							<div style="margin-bottom: 3%">예약하신 내역이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped table-hover"
								id="petsitterlistTable">
								<tr>
									<th style="width: 10%">예약번호</th>
									<th style="width: 10%">펫시터</th>
									<th style="width: 10%">이름</th>
									<th style="width: 10%">상태</th>
								</tr>
								<tbody>
									<c:forEach items="${requestScope.reserveList}" var="reserveVO">
										<c:if test="${reserveVO.reserve_recog != '2'}">
											<tr>
												<td>${reserveVO.reserve_no}</td>
												<td>${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}</td>
												<c:choose>
													<c:when test="${reserveVO.reserve_recog == '0'}">
														<td>
															<a href="reserve_showPesitterDetail.do?reserve_no=${reserveVO.reserve_no}&id=${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}">
																${reserveVO.petsitterboardVO.petsitterVO.memberVO.name} </a>
														</td>
														<td>예약신청</td>
													</c:when>
													<c:when test="${reserveVO.reserve_recog == '1'}">
														<td>
															<a href="reserve_showPesitterDetail.do?reserve_no=${reserveVO.reserve_no}&id=${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}">
																${reserveVO.petsitterboardVO.petsitterVO.memberVO.name} </a>
														</td>
														<td>예약완료</td>
													</c:when>
													<c:when test="${reserveVO.reserve_recog == '3'}">
														<td>
															${reserveVO.petsitterboardVO.petsitterVO.memberVO.name}
														</td>
														<td>예약 불가</td>
													</c:when>
												</c:choose>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>
	</div>
</div>
