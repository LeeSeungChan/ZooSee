<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	if("${result}"=="ok"){
		alert("성공적으로 등록되었습니다.");
		location.replace("${initParam.root}interceptor_qna_list.do");
	}else{
		alert("게시글 등록에 실패하셨습니다. 다시 시도하세요.");
		location.replace("${initParam.root}interceptor_qna_board_register.do")
	}
});
</script>
