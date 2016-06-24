<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
		<a  class="BJA" href="${initParam.root}interceptor_message_list.do"> 전체 메세지 목록</a>
		<a class="BJA"  href="${initParam.root}interceptor_message_uncheckedlist.do">안 읽은 메세지 목록</a>
		</div>
	</div>
</div>

<div class="BJMainDiv">
	<c:choose>
		<c:when test="${empty listVO.list }">
			<!-- 읽지않은 메세지가 없을때!! -->
			<div class="BJPanel" style="width: 80%; margin-left: 10%;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">MESSAGE</h3>
					</div>
					<div class="panel-body">
						${sessionScope.mvo.name } 님의 읽지 않은 메세지가 없습니다.
						<div style="text-align: right;">
							<a href="${initParam.root}interceptor_message_list.do">메세지
								전체보기</a>
						</div>
					</div>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<!-- 읽지않은 메세지가 잇을때!! -->

			<div class="BJPanel" style="width: 80%; margin-left: 10%;">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">MESSAGE</h3>
					</div>
					<div class="panel-body">
						${sessionScope.mvo.name } 님의 읽지 않은 메세지 목록입니다.
						<div style="text-align: right;">
							<a href="interceptor_message_updateCheckedAll.do?id=${sessionScope.mvo.id }">메세지
								모두 읽기</a> 
						</div>
					</div>
				</div>
			</div>

			<div class="BJMain2Div">
				<div class="BJWriteTableLine">
					<div class="SBHrAllLine">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th style="width: 10%">읽음 표시</th>
									<th style="width: 60%">제목</th>
									<th style="width: 10%">보낸사람</th>
									<th>시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.listVO.list }" var="message">
									<tr>
										<td><c:if test="${message.checked==0}">읽지않음</c:if> <c:if
												test="${message.checked==1}">읽음</c:if></td>
										<td><a
											href="interceptor_message_content.do?message_no=${message.message_no }">
												${message.title}</a></td>
										<td>관리자</td>
										<td>${message.time_posted }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- 메세지 페이징 -->
			<div class="BJFreeBoardListPagingDiv" style="text-align: center;">
				<ul class="pagination pagination-sm">
					<c:set var="pb" value="${requestScope.listVO.pagingBean}"></c:set>
					<c:choose>
						<c:when test="${pb.previousPageGroup}">
							<li><a
								href="${initParam.root}interceptor_message_uncheckedlist.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
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
									href="${initParam.root}interceptor_message_uncheckedlist.do?pageNo=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a>${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pb.nextPageGroup}">
							<li><a
								href="${initParam.root}interceptor_message_list.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a>&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
</div>












<br>
<br>
<br>
<br>