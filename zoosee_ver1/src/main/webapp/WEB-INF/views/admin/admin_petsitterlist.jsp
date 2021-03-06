<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 펫시터  리스트 보여주는 화면
	   
 -->
<script>
$(document).ready(function() {
	$("#petsitterlistForm :input[name=deleteBtn]").click(function() {
		if (confirm("펫시터를 추방하시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "admin_deletePetsitter.do",
				data : "id="+ $(this).parent().parent().children().eq(0).text(),
			});
			$(this).parent().parent().children().eq(4).html("삭제됨");
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
				href="${initParam.root}admin_memberlist.do?rank=normal">일반회원</a>
			<a class="BJA"
				href="${initParam.root}admin_petmomList.do">펫맘</a> <a
				class="BJA"
				href="${initParam.root}admin_petsitterList.do?recog=recog">펫시터</a>
			<a class="BJA"
				href="${initParam.root}admin_petsitterList.do?recog=nonrecog">펫시터
				신청자</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">회원 관리</h3>
			</div>
			<div class="panel-body">고객의 등급에 따라 관리하는 공간입니다.</div>
		</div>
		<div class="well well-sm">Pet Sitter List</div>
	</div>
	<div class="BJMain2Div" align="center">

		<form id="petsitterlistForm">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
					<table class="table table-striped table-hover"
						id="petsitterlistTable">
						<thead>
							<tr>
								<th style="width: 10%">Id</th>
								<th style="width: 10%">Name</th>
								<th style="width: 10%">e-Mail</th>
								<th style="width: 10%">Tel</th>
								<th style="width: 10%">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.listVO.list }" var="l">
								<tr>
									<td>${l.memberVO.id}</td>
									<td><a
										href="admin_getPetsitterVO.do?petsitterNo=${l.petsitterNo}&recog=recog">${l.memberVO.name}</a></td>
									<td>${l.memberVO.email}</td>
									<td>${l.memberVO.tel}</td>
									<td><input type="button" class="BJbtn2" name="deleteBtn" value="탈퇴"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>
		<c:if test="${! empty listVO.list}">
			<ul class="pagination_1 pagination-sm">
				<c:set var="pb" value="${listVO.pagingBean}"></c:set>
				<c:choose>
					<c:when test="${pb.previousPageGroup}">
						<li><a
							href="admin_petsitterList.do?recog=recog&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
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
								href="admin_petsitterList.do?recog=recog&pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pb.nextPageGroup}">
						<li><a
							href="admin_petsitterList.do?recog=recog&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:if>
	</div>
</div>




