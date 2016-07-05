<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 멤버  리스트 보여주는 화면 -->
<script>
	$(document).ready(
			function() {
				;
				$("#memberlistForm :input[name=addAdminBtn]").click(
						function() {
							//alert($(this).parent().parent().children().eq(6).html("승인됨"));
							if (confirm("관리자 권한을 주시겠습니까?")) {
								$.ajax({
									type : "post",
									url : "interceptor_admin_addAdmin.do",
									data : "id="
											+ $(this).parent().parent()
													.children().eq(0).text(),
									success : function(jsonData) {
										if (jsonData == "ok") {
											alert("관리자로 등급이 변경되었습니다.");
										} else {
											alert("권한 부여에 실패하셨습니다.");
										}
									}
								});
								$(this).parent().parent().children().eq(4)
										.html("admin");
								$(this).parent().parent().children().eq(5)
										.html("관리자");
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
			<a class="BJA" href="${initParam.root}interceptor_admin_adminList.do">직원
				목록</a> <a class="BJA"
				href="${initParam.root}interceptor_admin_findById.do">관리자 권한 부여</a>
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
								<th style="width: 10%">Rank</th>
								<th style="width: 10%">관리자 권한</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${how=='id'}">
								<c:if test="${empty memberVO}">
									<script type="text/javascript">
										alert("해당 아이디로 검색되는 회원이 없습니다.");
										location
												.replace("${initParam.root}interceptor_admin_findById.do");
									</script>
								</c:if>
								<tbody>
									<tr>
										<td>${memberVO.id}</td>
										<td>${memberVO.name}</td>
										<td>${memberVO.email}</td>
										<td>${memberVO.tel}</td>
										<td>${memberVO.rank}</td>
										<td><c:if test="${memberVO.rank=='admin'}">관리자</c:if> <c:if
												test="${memberVO.rank!='admin'}">
												<input type="button" name="addAdminBtn" value="부여">
											</c:if></td>
									</tr>
								</tbody>
							</c:when>
							<c:when test="${how=='name'}">
								<c:if test="${empty list}">
									<script type="text/javascript">
										alert("해당 이름으로 검색된 회원이 없습니다.");
										location
												.replace("${initParam.root}interceptor_admin_findById.do");
									</script>
								</c:if>
								<tbody>
									<c:forEach items="${list}" var="m">
										<tr>
											<td>${m.id}</td>
											<td>${m.name}</td>
											<td>${m.email}</td>
											<td>${m.tel}</td>
											<td>${m.rank}</td>
											<td><c:if test="${m.rank=='admin'}">관리자</c:if> <c:if
													test="${m.rank!='admin'}">
													<input type="button" name="addAdminBtn" value="부여">
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</c:when>
						</c:choose>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
