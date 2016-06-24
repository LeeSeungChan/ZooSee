<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#update")
								.click(
										function() {
											if (confirm("수정하시겠습니까?")) {
												location
														.replace("interceptor_qna_update.do?boardNo=${qnaBoardVO.boardNo}");
											}
										});
						$("#delete")
								.click(
										function() {
											if (confirm("삭제하겠습니까?")) {
												location
														.replace("interceptor_qna_delete.do?boardNo=${qnaBoardVO.boardNo}");
											}
										});
					});
</script>
<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
	<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}interceptor_freeBoard_list.do">자유게시판</a> 
			<a class="BJA" href="${initParam.root}interceptor_freeBoard_write.do" >자유게시판 글등록</a>
			<a class="BJA" href="${initParam.root}interceptor_qna_list.do">Q&A게시판</a> 
			<a class="BJA" href="${initParam.root}interceptor_qna_board_register.do">Q&A 등록</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">1:1 Q&A 게시판</h3>
			</div>
			<div class="panel-body">1:1 Q&A 게시판은 고객님의 궁금증을 풀어드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">Question View</div>
	</div>
	<div class="BJMain2Div">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine">
				<table class="SBtable">
					<tr style="width: 100%">
						<td style="width: 10%;"><label style="font-weight: bold;">Title</label></td>
						<td style="width: 45%;">${qnaBoardVO.title}</td>
						<td style="width: 20%;"><label style="font-weight: bold;">Posted
								Time</label></td>
						<td style="width: 25%;">${qnaBoardVO.timePosted}</td>
					</tr>
					<tr style="height: auto;">
						<td><label style="font-weight: bold;">Question</label></td>
						<td colspan="3" style="width: 100%;"><textarea
								class="SBform-textarea" style="height: 200px; resize: none;"
								readonly="readonly">${qnaBoardVO.question}</textarea></td>
					</tr>
					<c:choose>
						<c:when test="${empty qnaBoardVO.answer}">
							<tr>
								<td colspan="4"><label style="font-weight: bold;">답변대기중</label></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td></td>
								<td>관리자</td>
								<td><label style="font-weight: bold;">Answered Time</label></td>
								<td>${qnaBoardVO.timeAnswered}</td>
							</tr>
							<tr>
								<td><label style="font-weight: bold;">Answer</label></td>
								<td colspan="3"><textarea class="SBform-textarea"
										style="height: 200px; resize: none;" readonly="readonly">${qnaBoardVO.answer}</textarea></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
				<div style="float: left; width: 50%;margin-top: 5%;">
					<div style="margin-right: 1%; float: right;">
						<input type="button" class="active SBbtn btn-default" id="update"
							value="수정">
					</div>
				</div>
				<div style="float: right; width: 50%; margin-top: 5%;">
					<div style="margin-right: 1%; float: left;">
						<input type="button" class="active SBbtn btn-default" id="delete"
							value="삭제">
					</div>
			</div>
		</div>
	</div>
</div>