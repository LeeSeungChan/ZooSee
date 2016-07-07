<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- 멤버  리스트 보여주는 화면 -->
<script>
	 $(document).ready(function() {
				;
				$("#memberlistForm :input[name=deleteBtn]").click(
						function() {
							if (confirm("계정을 삭제 하시겠습니까?")) {
								$.ajax({
									type : "post",
									url : "admin_resign.do",
									data : "id="
											+ $(this).parent().parent()
													.children().eq(0).text(),
									succes : function(data){
										if(data=="ok"){
											alert("계정이 삭제되었습니다.");
										}else{
											alert("계정 삭제에 실패하셨습니다. 다시 시도하세요.");
										}
									}
								});
								$(this).parent().parent().children().eq(4)
										.html("삭제됨")
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
			<a class="BJA" href="${initParam.root}admin_adminList.do">직원 목록</a>
			<a class="BJA" href="${initParam.root}admin_findById.do">관리자 권한 부여</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">사원 관리</h3>
			</div>
			<div class="panel-body">사원의 목록을 열람 , 관리할 수 있습니다.</div>
		</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_1">
				<form id="memberlistForm">
					<table class="table table-striped table-hover" id="memberlistTable">
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
									<td>${l.id}</td>
									<td>${l.name}</td>
									<td>${l.email}</td>
									<td>${l.tel}</td>
									<td><input type="button" name="deleteBtn" value="퇴사"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<c:if test="${! empty listVO.list}">
			<ul class="pagination_1 pagination-sm">
				<c:set var="pb" value="${listVO.pagingBean}"></c:set>
				<c:choose>
					<c:when test="${pb.previousPageGroup}">
						<li><a
							href="i${initParam.root}admin_memberlist.do?rank=normal&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
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
								href="${initParam.root}admin_memberlist.do?rank=normal&pageNo=${i}">${i}</a>
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
							href="${initParam.root}admin_memberlist.do?rank=normal&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:if>
	</div>
</div>
