<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#findForm").submit(function() {
			if ($("#id").val().length < 4 || $("#id").val().length > 11) {
				alert("아이디는 4자 이상 11자 이하만 가능합니다. 정확한 아이디를 입력하세요.");
				$("#id").focus();
				return false;
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
		<div class="well well-sm">고객 ID를 통해 1:1 Question 검색</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_2" >
				<form id="findForm"
					action="${initParam.root}interceptor_admin_qna_find_view.do">
					<div style="vertical-align: middle;">
						<div style="float: left; width: 55%;">
							<div style="margin-left: 50%; float: right;">
								<input class="SBform-text_1" type="text" id="id" name="id">
							</div>
						</div>
						<div style="float: right; width: 45%;">
							<div style="float:left; margin-right: 50%;">
								<input type="submit" value="검색"
									class="active SBbtn_2 btn-default">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>