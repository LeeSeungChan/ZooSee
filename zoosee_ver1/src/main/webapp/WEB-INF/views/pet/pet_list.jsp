<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#delete").click(function() {
			if (confirm("삭제하겠습니까?")) {
				location.replace("pet_delete.do?petNo=${petVO.petNo}");
			} else {
				return false;
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">

<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}pet_list.do">펫목록</a>
			<a class="BJA" href="${initParam.root}pet_register.do">펫등록</a>
				<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
					<a class="BJA" href="${initParam.root}ps_petsitter_updateform.do">펫시터 정보 수정</a>
					<a class="BJA" href="${initParam.root}ps_petsitter_info.do?id=<sec:authentication property="principal.id"/>">펫시터 정보 보기</a>
				</sec:authorize>
				<c:choose>
					<c:when test="${'pre_petsitter' eq sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.rank || 'pre_petsmater' eq sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.rank}">
					<a class="BJA" href="${initParam.root}ps_petsitter_updateform.do">펫시터 정보 수정</a>
					</c:when>
					<c:otherwise>
						<sec:authorize ifAnyGranted="ROLE_MEMBER,ROLE_PETMOM">
							<a class="BJA" href="${initParam.root}petsitter_register.do">펫시터신청</a>
						</sec:authorize>
					</c:otherwise>
				</c:choose>
				<%-- <sec:authorize ifAnyGranted="ROLE_PRE_PETSITTER,ROLE_PRE_PETMASTER">
					<a class="BJA" href="${initParam.root}ps_petsitter_updateform.do">펫시터 정보 수정</a>
				</sec:authorize> --%>
				
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">반려동물 목록</h3>
			</div>
			<div class="panel-body"><sec:authentication property="principal.name"/>님의등록된 반려동물을 보여 드리기 위한 공간입니다.</div>
		</div>
		<div class="well well-sm"><sec:authentication property="principal.name"/>님이등록하신 반려동물 목록</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_1">
				<c:choose>
					<c:when test="${empty list }">
						<div style="margin-bottom: 3%">등록하신 반려동물이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<table class="table table-striped table-hover" style="width: 100%">
							<tr class="active">
								<th style="width: 25%"><label>Image</label></th>
								<th style="width: 15%"><label>Name</label></th>
								<th style="width: 15%"><label>Type</label></th>
								<th style="width: 15%"><label>Sex</label></th>
								<th style="width: 15%"><label>Age</label></th>
								<th style="width: 15%"><label>Detail</label></th>
							</tr>
							<c:forEach items="${list }" var="L">
								<tr>
									<td>
										<img src="${L.petImg}" width="70" height="70" style="border-radius: 100px; 
											-moz-border-radius: 100px; -khtml-border-radius: 100px; -webkit-border-radius: 100px;">
									</td>
									<td style="vertical-align: middle;">${L.petName }</td>
									<td style="vertical-align: middle;">${L.petType }</td>
									<td style="vertical-align: middle;">${L.petGender }</td>
									<td style="vertical-align: middle;">${L.petAge }</td>
									<td style="vertical-align: middle;">
										<a href="${initParam.root}pet_detail.do?petNo=${L.petNo}">상세보기</a><br>
										<a href="${initParam.root}pet_update.do?petNo=${L.petNo}">수정하기</a><br>
										<a id="delete" href="${initParam.root}pet_delete.do?petNo=${L.petNo}">삭제하기</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
