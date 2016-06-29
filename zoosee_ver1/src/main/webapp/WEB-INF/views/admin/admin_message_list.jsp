<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
<!-- 더블헤더 -->
<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}interceptor_admin_MessageList.do">보낸 메세지 목록</a> 
			<a class="BJA" href="${initParam.root}interceptor_admin_message.do">메세지 보내기</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">관리자 메세지</h3>
			</div>
			<div class="panel-body">관리자 메세지는 ZOOSEE를 이용하는 모든 회원에게 보내는
				메세지입니다.</div>
		</div>
		<div class="well well-sm"> 전체회원에게 보낸 메세지 목록</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_1">

				<table class="table table-striped table-hover " style="width: 100%">
					<tr class="active">
						<th style="width: 60%">제목</th>
						<th style="width: 20%">보낸사람</th>
						<th>시간</th>
					</tr>
					<c:forEach items="${listVO.list }" var="message">
						<tr>
								<td><a
									href="interceptor_admin_message_content.do?message_no=${message.message_no }">
										${message.title}</a></td>
								<td>관리자</td>
								<td>${message.time_posted }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<ul class="pagination pagination-sm">
			<c:if test="${! empty listVO.list }">
				<c:set var="pb" value="${listVO.pagingBean}"></c:set>
				<c:choose>
					<c:when test="${pb.previousPageGroup}">
						<li><a
							href="interceptor_admin_MessageList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
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
								href="interceptor_admin_MessageList.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pb.nextPageGroup}">
						<li><a
							href="interceptor_admin_MessageList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</ul>
	</div>
</div>