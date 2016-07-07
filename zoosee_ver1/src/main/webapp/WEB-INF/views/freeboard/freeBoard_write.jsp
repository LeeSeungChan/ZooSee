<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#wirteForm :input[name=freeBoardTitle]").focus();

		$("#wirteForm").submit(function() {
			if ($("#wirteForm :input[name=freeBoardTitle]").val() == "") {
				alert("제목을 입력하세요!!");
				$("#wirteForm :input[name=freeBoardTitle]").focus();
				return false;
			}
			if ($("#wirteForm :input[name=freeBoardContents]").val() == "") {
				alert("내용을 입력하세요!!");
				$("#wirteForm :input[name=freeBoardContents]").focus();
				return false;
			}
		});

		$("#cancelBtn").click(function() {
			location.href = "${initParam.root}freeBoard_list.do";
		});
	});
</script>

<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}freeBoard_list.do">자유게시판</a>
			<a class="BJA" href="${initParam.root}freeBoard_write.do">자유게시판
				글등록</a> <a class="BJA" href="${initParam.root}qna_list.do">Q&A게시판</a>
			<a class="BJA"
				href="${initParam.root}qna_board_register.do">Q&A 등록</a>
		</div>
	</div>
</div>

<!-- 자유게시판 글쓰기 메인 -->
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">자유게시판</h3>
			</div>
			<div class="panel-body">자유게시판은 펫맘들과 펫시터들의 소통을 위한 공간입니다.</div>
		</div>
		<div class="well well-sm">글쓰기</div>
	</div>
	<div class="BJMain2Div">
		<form method="post"
			action="${initParam.root}freeBoard_contentWrite.do"
			id="wirteForm">
			<div class="form-group">
				<div class="BJWriteTableLine">
					<div class="SBHrAllLine">
						<table class="BJFreeBoardWriteTableDiv">
							<tr>
								<th>Title</th>
								<td><input class="BJform-control2" id="focusedInput"
									type="text" name="freeBoardTitle"></td>
							</tr>
							<tr>
								<th>Writer</th>
								<td style="float: left; margin-left: 3%;">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}</td>
							</tr>
							<tr>
								<th>Content</th>
								<td align="center" colspan="2"><textarea
										style="resize: none;" name="freeBoardContents" id="inputLarge"
										class="BJform-controlBig input-lg" rows="15"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="SBbtn_1">
					<input class="active SBbtn btn-default" type="submit" value="등록">
				</div>
			</div>
		</form>
	</div>
</div>
