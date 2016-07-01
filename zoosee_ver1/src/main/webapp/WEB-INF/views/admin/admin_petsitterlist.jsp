<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 펫시터  리스트 보여주는 화면
	   
 -->
<script>
	$(document).ready(function() {
		$("#petsitterlistForm :input[name=deleteBtn]").click(function() {
			//alert($(this).parent().parent().children().eq(6).html("승인됨"));
			if (confirm("펫시터를 추방하시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "interceptor_admin_deletePetsitter.do",
					data : "petsitterNo="+ $(this).parent().parent().children().eq(0).text(),
				});
				$(this).parent().parent().children().eq(5).html("삭제됨")
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
			<a class="BJA" href="${initParam.root}interceptor_admin_memberlist.do?rank=normal">일반회원</a>
			<a class="BJA" href="${initParam.root}interceptor_admin_petmomList.do">펫맘</a>
			<a class="BJA" href="${initParam.root}interceptor_admin_petsitterList.do?value=recog">펫시터</a>
			<a class="BJA" href="${initParam.root}interceptor_admin_petsitterList.do?value=nonrecog">펫시터
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
		<div class="well well-sm">Pet Sitter List</div>
	</div>
	<div class="BJMain2Div" align="center">

		<form id="petsitterlistForm">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
					<table class="table table-striped table-hover"
						id="petsitterlistTable">
						<tr>
							<th style="width: 10%">Pet Sitter No</th>
							<th style="width: 10%">Id</th>
							<th style="width: 10%">Name</th>
							<th style="width: 10%">e-Mail</th>
							<th style="width: 10%">Tel</th>
							<th style="width: 10%">관리</th>
						</tr>
						<c:forEach items="${requestScope.listVO.list }" var="l">
							<tr>
								<td>${l.petsitterNo}</td>
								<td>${l.memberVO.id}</td>
								<td><a
									href="interceptor_admin_getPetsitterVO.do?petsitterNo=${l.petsitterNo}&value=recog">${l.memberVO.name}</a></td>
								<td>${l.memberVO.email}</td>
								<td>${l.memberVO.tel}</td>
								<td><input type="button" name="deleteBtn" value="탈퇴"></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</form>
		<c:if test="${! empty listVO.list}">
			<ul class="pagination pagination-sm">
				<c:set var="pb" value="${listVO.pagingBean}"></c:set>
				<c:choose>
					<c:when test="${pb.previousPageGroup}">
						<li><a
							href="interceptor_admin_petsitterList.do?value=recog&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
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
								href="interceptor_admin_petsitterList.do?value=recog&pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pb.nextPageGroup}">
						<li><a
							href="interceptor_admin_petsitterList.do?value=recog&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:if>
	</div>
</div>




