<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
   <script type="text/javascript">
   alert("<c:out value='${SPRING_SECURITY_LAST_EXCEPTION.message}'/>");
   location.href="member_login.do";
   </script>
</c:if>