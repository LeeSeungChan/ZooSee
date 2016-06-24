<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#update")
								.click(
										function() {
											var answer = $("#answer").val();
											if ("${qnaBoardVO.answer}" != answer) {
												if ("${qnaBoardVO.answer}" == "") {
													if (confirm("답변을 등록하시겠습니까?")) {
														location
																.replace("${initParam.root}interceptor_admin_update_answer.do?memberVO.id=${qnaBoardVO.memberVO.id}&boardNo=${qnaBoardVO.boardNo}&answer="
																		+ answer);
													}
												} else {
													if (answer != "") {
														if (confirm("답변을 수정하시겠습니까?")) {
															location
																	.replace("${initParam.root}interceptor_admin_update_answer.do?memberVO.id=${qnaBoardVO.memberVO.id}&boardNo=${qnaBoardVO.boardNo}&answer="
																			+ answer);
														}
													} else {
														alert("답변을 공란으로 입력할 수 없습니다.");
														$("#answer").focus();
													}
												}
											} else {
												if ("${qnaBoardVO.answer}" == "") {
													alert("답변을 공란으로 입력할 수 없습니다.");
													$("#answer").focus();
												} else {
													alert("수정되지 않은 답변입니다. 확인하세요.");
													$("#answer").focus();
												}
											}
										});
						$("#check")
								.click(
										function() {
											location
													.replace("${initParam.root}interceptor_admin_qna_list.do?when=all");
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
				href="${initParam.root}interceptor_admin_qna_list.do?when=all">모든
				Q&A 목록</a> <a class="BJA"
				href="${initParam.root}interceptor_admin_qna_list.do?when=nonAnswer">답변
				미등록 Q&A 목록</a> <a class="BJA"
				href="${initParam.root}interceptor_admin_qna_findbyid.do">아이디로
				Q&A 검색</a>


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
		<div class="well well-sm">Question View & Answer update</div>
	</div>
	<form>
		<div class="BJMain2Div">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine">
					<table class="SBtable">
						<tr>
							<th style="width: 10%"><label style="font-weight: bold;">Title</label></th>
							<th style="width: 45%">${qnaBoardVO.title}</th>
							<th style="width: 20%"><label style="font-weight: bold;">Writer</label></th>
							<th style="width: 25%">${qnaBoardVO.memberVO.name}(${qnaBoardVO.memberVO.id})</th>
						</tr>
						<tr>
							<th colspan="2">Question</th>
							<th><label style="font-weight: bold;">Posted Time</label></th>
							<th>${qnaBoardVO.timePosted}</th>
						</tr>
						<tr>
							<th colspan="4"><textarea class="SBform-textarea"
									style="height: 200px; resize: none;" readonly="readonly">${qnaBoardVO.question}</textarea></th>
						</tr>
						<c:choose>
							<c:when test="${empty qnaBoardVO.answer}">
								<tr>
									<th colspan="4"><label style="font-weight: bold;">Answer</label></th>
								</tr>
								<tr>
									<th colspan="4"><textarea class="SBform-textarea"
											style="height: 200px; resize: none;" id="answer"></textarea></th>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th colspan="2"><label style="font-weight: bold;">Answer</label></th>
									<th><label style="font-weight: bold;">Answered
											Time</label></th>
									<th>${qnaBoardVO.timeAnswered}</th>
								</tr>
								<tr>
									<th colspan="4"><textarea class="SBform-textarea"
											style="height: 200px; resize: none;" id="answer">${qnaBoardVO.answer}</textarea></th>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="SBbtn_1">
				<input type="button" id="update" value="답변등록"
					class="active SBbtn btn-default">
			</div>
		</div>
	</form>
</div>