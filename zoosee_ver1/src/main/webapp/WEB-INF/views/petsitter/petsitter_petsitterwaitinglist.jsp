<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 펫시터 승인 대기 리스트 보여주는 화면
	   승인 버튼을 누르면 petsitter_recognitionPetsitter.do로 petsitterNo 넘김
	   petsitterNo로 해당 펫시터 찾아서 recog -> "승인"으로 update
	 
	 펫시터 대기 리스트에서 각 이름을 클릭시 그 사람의 펫시터 신청서를 볼 수 있어야함
 -->
<script>
	$(document)
			.ready(
					function() {
						;
						$("#recogForm :input[name=recogBtn]")
								.click(
										function() {
											//alert($(this).parent().parent().children().eq(6).html("승인됨"));
											if (confirm("승인하시겠습니까?")) {
												$
														.ajax({
															type : "post",
															url : "interceptor_petsitter_recognitionPetsitter.do",
															data : "petsitterNo="
																	+ $(this)
																			.parent()
																			.parent()
																			.children()
																			.eq(
																					0)
																			.text(),
														});
												$(this).parent().parent()
														.children().eq(3).html(
																"승인됨")
											}

										});

					});
</script>
<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA"
				href="${initParam.root}interceptor_member_memberlist.do?rank=normal">일반회원</a>
			<a class="BJA"
				href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">펫시터</a>
			<a class="BJA"
				href="${initParam.root}interceptor_petsitter_petsitterList.do?value=nonrecog">펫시터
				신청자</a>


		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">회원 관리</h3>
			</div>
			<div class="panel-body">고객의 등급에 따라 관리한다.</div>
		</div>
		<div class="well well-sm">Pre Pet Sitter List</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_1">
				<form id="recogForm">
					<table class="table table-striped table-hover" id="recogTable">
						<tr>
							<th style="width: 10%">Pet Sitter No</th>
							<th style="width: 10%">Id</th>
							<th style="width: 10%">Name</th>
							<th style="width: 10%">관리</th>
						</tr>
						<c:forEach items="${requestScope.listVO.list }" var="l">
							<tr>
								<td>${l.petsitterNo}</td>
								<td>${l.memberVO.id}</td>
								<td><a
									href="interceptor_petsitter_getPetsitterVO.do?petsitterNo=${l.petsitterNo}&value=nonrecog">${l.memberVO.name}</a></td>
								<td><input type="button" name="recogBtn" value="승인"></td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
		<c:if test="${! empty listVO.list}">
			<ul class="pagination pagination-sm">
				<c:set var="pb" value="${listVO.pagingBean}"></c:set>
				<c:choose>
					<c:when test="${pb.previousPageGroup}">
						<li><a
							href="interceptor_petsitter_petsitterList.do?value=nonrecog&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a
								href="interceptor_petsitter_petsitterList.do?value=nonrecog&pageNo=${i}">${i}</a>
							<li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pb.nextPageGroup}">
						<li><a
							href="interceptor_petsitter_petsitterList.do?value=nonrecog&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:if>
	</div>
</div>