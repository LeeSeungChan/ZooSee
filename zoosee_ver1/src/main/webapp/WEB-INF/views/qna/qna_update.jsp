<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateForm").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 공란으로 수정할 수 없습니다.");
				$("#title").focus();
				return false;
			} else if ($("#question").val() == "") {
				alert("질문을 공란으로 수정할 수 없습니다.");
				$("#question").focus();
				return false;
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
		<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA" href="${initParam.root}interceptor_qna_list.do">Q&A 목록</a>	
	<a class="BJA"  href="${initParam.root}interceptor_qna_board_register.do">Q&A 등록</a>
	</div>
</div>
</div>
<div class="BJMainDiv"
	style=" margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">1:1 Q&A 게시판</h3>
			</div>
			<div class="panel-body">1:1 Q&A 게시판은 고객님의 궁금증을 풀어드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">Question Update</div>
	</div>
	<div class="BJMain2Div">
		<c:choose>
			<c:when test="${empty qnaBoardVO.answer}">
				<form id="updateForm" action="interceptor_qna_update_result.do">
					<input type="hidden" name="boardNo" value="${qnaBoardVO.boardNo}">
					<div class="BJWriteTableLine">
						<div class="SBHrAllLine_1">
							<table class="SBtable">
								<tr>
									<td style="width: 15%;"><label>Title</label></td>
									<td style="width: 85%;"><input class="SBform-text"
										type="text" id="title" name="title"
										value="${qnaBoardVO.title}"></td>
								</tr>
								<tr>
									<td><label>Question</label></td>
									<td><textarea class="SBform-textarea" id="question"
											name="question" style="height: 400px; resize: none;">${qnaBoardVO.question}</textarea></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="SBbtn_1">
						<input type="submit" class="active SBbtn btn-default" value="수정하기">
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					alert("답변이 등록된 질문은 수정이 불가 합니다. 새로 질문을 등록하세요.");
					location.href = "${initParam.root}interceptor_qna_list.do";
				</script>
			</c:otherwise>
		</c:choose>
	</div>
</div>