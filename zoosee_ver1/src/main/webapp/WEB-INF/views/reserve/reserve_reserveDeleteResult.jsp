<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:choose>
		<c:when test="${check == 1}">
			 <script type="text/javascript">
    			alert("예약 신청을 거절하셨습니다.");
    			location.replace("${initParam.root}reserve_reserveMyList.do?id=${mvo.id}");
    		</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
    			alert("잘못된 접근입니다.");
    			location.replace("${initParam.root}home.do");
    		</script>
		</c:otherwise>
	</c:choose>
