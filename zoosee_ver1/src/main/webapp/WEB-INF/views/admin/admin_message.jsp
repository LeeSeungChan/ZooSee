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
			} else if ($("#content").val() == "") {
				alert("내용을 입력하세요.");
				$("#content").focus();
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
			<a class="BJA"
				href="${initParam.root}admin_MessageList.do">보낸 메세지 목록</a>
		 <a class="BJA" href="${initParam.root}admin_message.do">메세지 보내기</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">관리자 메세지</h3>
			</div>
			<div class="panel-body">관리자 메세지는 ZOOSEE를 이용하는 모든 회원에게 보내는
				메세지입니다.</div>
		</div>
		<div class="well well-sm">메세지 작성</div>
	</div>
	<div class="BJMain2Div">
		<form id="registerQNAForm" action="admin_sendMessage.do">
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
					<table class="SBtable">
						<tr>
							<th style="width: 15%;">Title</th>
							<td style="width: 85%;"><input class="SBform-text"
								type="text" id="title" name="title"></td>
						</tr>
						<tr>
							<th>Content</th>
							<td><textarea class="SBform-textarea" id="content"
									name="content" style="height: 400px; resize: none;"></textarea></td>
					</table>
				</div>
			</div>
			<div class="SBbtn_1">
				<input type="submit" class="active SBbtn btn-default" value="메세지 전송">
			</div>
		</form>

	</div>
</div>