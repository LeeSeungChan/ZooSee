<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		if ("${result}=='ok'") {
			alert("질문이 수정되었습니다.");
		} else {
			alert("질문 수정에 실패하셨습니다.");
		}
		location.replace("${initParam.root}interceptor_qna_list.do");
	});
</script>