<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}interceptor_pet_list.do">더블헤더미적용1</a>
			<a class="BJA" href="${initParam.root}interceptor_pet_register.do">더블헤더
				미적용2</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">거래내역 목록</h3>
			</div>
			<div class="panel-body">님이 거래하신 내역을 보여 드리기 위한 공간입니다.</div>
		</div>
		<div class="well well-sm">님의 거래내역 목록</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_1">
				<table class="table table-striped table-hover" style="width: 100%">
					<tr class="active">
						<th style="width: 10%"><label>거래번호</label></th>
						<c:if test="${mvo.rank == 'petmom'}">
							<th style="width: 7.5%"><label>펫맘</label></th>
							<th style="width: 7.5%"><label>펫시터</label></th>
						</c:if>
						<c:if test="${mvo.rank == 'petsitter' || mvo.rank == 'petmaster'}">
							<th style="width: 7.5%"><label>펫맘</label></th>
							<th style="width: 7.5%"><label>펫시터</label></th>
						</c:if>
						<th style="width: 25%"><label>보드제목</label></th>
						<th style="width: 10%"><label>거래가격</label></th>
						<th style="width: 15%"><label>시작일</label></th>
						<th style="width: 15%"><label>마감일</label></th>
						<th style="width: 10%"><label>상태</label></th>
					</tr>
					<c:forEach items="${tradeInfoList}" var="tradeInfoVO">
						<tr>
							<td style="vertical-align: middle;">${tradeInfoVO.tradeinfo_no}</td>
							<c:choose>
								<c:when test="${mvo.rank == 'petmom'}">
									<td style="vertical-align: middle;"><a
										href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.petsitterVO.memberVO.id}">
											${tradeInfoVO.petsitterVO.memberVO.name} </a></td>
									<td style="vertical-align: middle;">${tradeInfoVO.memberVO.name}</td>
								</c:when>
								<c:when test="${mvo.rank == 'petsitter'}">
									<td style="vertical-align: middle;"><a
										href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.memberVO.id}">
											${tradeInfoVO.memberVO.name}</a></td>
									<td style="vertical-align: middle;">${tradeInfoVO.petsitterVO.memberVO.name}</td>
								</c:when>
								<c:when test="${mvo.rank == 'petmaster'}">
									<c:choose>
										<c:when test="${tradeInfoVO.memberVO.name == mvo.name}">
											<td style="vertical-align: middle;">${tradeInfoVO.memberVO.name}</td>
											<td style="vertical-align: middle;"><a
												href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.petsitterVO.memberVO.id}">
													${tradeInfoVO.petsitterVO.memberVO.name}</a></td>
										</c:when>
										<c:otherwise>
											<td style="vertical-align: middle;"><a
												href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.memberVO.id}">
													${tradeInfoVO.memberVO.name}</a></td>
											<td style="vertical-align: middle;">${tradeInfoVO.petsitterVO.memberVO.name}</td>
										</c:otherwise>
									</c:choose>
								</c:when>
							</c:choose>
							<td style="vertical-align: middle;"><a
								href="petsitterboardDetail.do?petsitterboard_no=${tradeInfoVO.petsitterboardVO.petsitterboard_no}">
									${tradeInfoVO.petsitterboardVO.petsitterboard_title} </a></td>
							<td style="vertical-align: middle;">${tradeInfoVO.tradePrice}</td>
							<td style="vertical-align: middle;">${tradeInfoVO.tradeSdate}</td>
							<td style="vertical-align: middle;">${tradeInfoVO.tradeEdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<%-- 
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
</table> --%>