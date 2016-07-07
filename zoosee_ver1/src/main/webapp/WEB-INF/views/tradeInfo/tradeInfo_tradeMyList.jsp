<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!-- 더블헤더 -->
<script type="text/javascript">
	function openPopup(id){
		var content=null;
		window.open("${initParam.root}popup_reviewPopup.do?id="+id,"","width=700 height=400 left=150 top=100 ");
	}
</script>
<div class="BJMainKING">
<div class="BJMainKING">
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">거래내역 목록</h3>
			</div>
			<div class="panel-body"><sec:authentication property="principal.name"/>님이 거래하신 내역을 보여 드리기 위한 공간입니다.</div>
		</div>
		<div class="well well-sm"><sec:authentication property="principal.name"/>님의 거래내역 목록</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_1">
					<c:if test="${empty tradeInfoList }">
						<div style="margin-bottom: 3%">거래하신 내역이 없습니다.</div>
					</c:if>
				<table class="table table-striped table-hover" style="width: 100%">
					<tr class="active">
						<th style="width: 10%"><label>거래번호</label></th>
						<sec:authorize ifAnyGranted="ROLE_PETMOM">
							<th style="width: 7.5%"><label>펫시터</label></th>
							<th style="width: 7.5%"><label>펫맘</label></th>
						</sec:authorize>
						<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
							<th style="width: 7.5%"><label>펫맘</label></th>
							<th style="width: 7.5%"><label>펫시터</label></th>
						</sec:authorize>
						<th style="width: 25%"><label>보드제목</label></th>
						<th style="width: 10%"><label>거래가격</label></th>
						<th style="width: 15%"><label>시작일</label></th>
						<th style="width: 15%"><label>마감일</label></th>
						<th style="width: 10%"><label>상태</label></th>
					</tr>
					<c:forEach items="${tradeInfoList}" var="tradeInfoVO">
						<tr>
							<td style="vertical-align: middle;">${tradeInfoVO.tradeinfo_no}</td>
								<sec:authorize ifAnyGranted="ROLE_PETMOM">
									<td style="vertical-align: middle;">
										<a href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.petsitterVO.memberVO.id}">
											${tradeInfoVO.petsitterVO.memberVO.name} </a></td>
									<td style="vertical-align: middle;">${tradeInfoVO.memberVO.name}</td>
								</sec:authorize>
								<sec:authorize ifAnyGranted="ROLE_PETSITTER">
									<td style="vertical-align: middle;"><a
										href="tradeInfo_tradeInfoCheck.do?id=${tradeInfoVO.memberVO.id}">
											${tradeInfoVO.memberVO.name}</a></td>
									<td style="vertical-align: middle;">${tradeInfoVO.petsitterVO.memberVO.name}</td>
								</sec:authorize>
								<sec:authorize ifAnyGranted="ROLE_PETMASTER">
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
								</sec:authorize>
							<td style="vertical-align: middle;"><a
								href="petsitterboardDetail.do?petsitterboard_no=${tradeInfoVO.petsitterboardVO.petsitterboard_no}">
									${tradeInfoVO.petsitterboardVO.petsitterboard_title} </a></td>
							<td style="vertical-align: middle;">${tradeInfoVO.tradePrice}</td>
							<td style="vertical-align: middle;">${tradeInfoVO.tradeSdate}</td>
							<td style="vertical-align: middle;">${tradeInfoVO.tradeEdate}</td>
							<c:choose>
                        		<c:when test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id != tradeInfoVO.petsitterVO.memberVO.id}">
                          			<td style="vertical-align: middle;">
                                    	<input type="button" class="BJbtn2" value="리뷰" onclick="openPopup('${tradeInfoVO.petsitterVO.memberVO.id}')">
                                 	</td>
	                        	</c:when>
		                        <c:otherwise>
		                        	<td style="vertical-align: middle;"></td>
		                        </c:otherwise>
                     		</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</div>