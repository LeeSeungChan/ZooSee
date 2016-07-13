<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<script type="text/javascript">
	if("${result}"=="ok"){
		alert("성공적으로 탈퇴되었습니다. ZOOSEE를 이용해 주셔서 감사합니다.");
		location.href="${initParam.root}home.do";
	}else{
		alert("회원 탈퇴에 실패하셨습니다. 다시 시도하세요.");
		location.href="${initParam.root}m_member_detail.do";
	}
</script>
