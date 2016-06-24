<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#registerQNAForm").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			} else if ($("#question").val() == "") {
				alert("질문을 입력하세요.");
				$("#question").focus();
				return false;
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
		<div class="well well-sm">Question Write</div>
	</div>
	<div class="BJMain2Div">
		<form id="registerQNAForm" action="interceptor_registerQNA.do">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
					<table class="SBtable">
						<tr>
							<th style="width: 15%;">Title</th>
							<td style="width: 85%;"><input class="SBform-text"
								type="text" id="title" name="title"></td>
						</tr>
						<tr>
							<th>Question</th>
							<td><textarea class="SBform-textarea" id="question"
									name="question" style="height: 400px; resize: none;"></textarea></td>
					</table>
				</div>
			</div>
			<div class="SBbtn_1">
				<input type="submit" class="active SBbtn btn-default" value="질문 등록">
			</div>
		</form>

	</div>
</div>