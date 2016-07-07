<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("input:radio[name=gender][value=" + "<sec:authentication property='principal.gender'/>" + "]").attr("checked","checked");
		$("#update").click(function() {
			if (confirm("수정하시겠습니까?")) {
			location.replace("${initParam.root}member_update.do");
			}
		});
		$("#delete").click(function() {
			if (confirm("탈퇴하시겠습니까?")) {
				location.replace("${initParam.root}m_member_delete.do");
			}
		});
	});
</script>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA" href="${initParam.root}m_member_detail.do">마이페이지</a>
	<a class="BJA" href="${initParam.root}member_update.do">회원정보수정</a>
   	<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
       <a class="BJA" href="${initParam.root}psboard_petsitterboard_registerform.do?id=<sec:authentication property="principal.id"/>"> 펫시터게시글등록</a>
       <a class="BJA" href="${initParam.root}psboard_petsitterboard_myPetsitterBoard.do">내 글 보기</a>
     </sec:authorize>
	</div>
</div>
</div>
<div class="WJcontainer5">
<!-- 사진 중간 정렬 시작-->
		<div align="center">
			<a href="home.do"><img
				src="${initParam.root}resources/image/Mzoosee.png"></a>
		</div>
		<div class="WJLayout"
		style="text-align: left;" id="member_register">
            <form>
               <div class="WJform-group">
                <label>id</label>
                <input class="WJform-control"  type="text" value="<sec:authentication property="principal.id"/>" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
               <div class="WJform-group">
                <label>Name</label>
                <input class="WJform-control" type="text" value="<sec:authentication property="principal.name"/>" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
                <div class="WJform-group">
                <label>Address</label>
                <input class="WJform-control"  value="우편번호 : <sec:authentication property="principal.addressCode"/>" disabled="disabled" style="background-color: #F4F4F4;">
                <input class="WJform-control"  value="<sec:authentication property="principal.address"/>" disabled="disabled" style="background-color: #F4F4F4;">
                <input class="WJform-control"  value="<sec:authentication property="principal.detailAddress"/>"disabled="disabled" style="background-color: #F4F4F4;">
              </div>
              <div class="WJform-group">
                <label>Email address</label>
                <input class="WJform-control" type="text" value="<sec:authentication property="principal.email"/>" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
              <div class="WJform-group" align="center">
                <div class="radio">
                  <label class="radio-inline">
                    <input type="radio" name="gender" value="man" disabled="disabled">MAN</label>
                  <label class="radio-inline">
                    <input type="radio" name="gender" value="woman" disabled="disabled">WOMAN</label>
                </div>
              </div>
              <div class="WJform-group">
                <label>Tel</label>
                <input class="WJform-control" type="text" value="<sec:authentication property="principal.tel"/>" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
               <div class="WJform-group">
                <label>Job</label>
                <input class="WJform-control" type="text" value="<sec:authentication property="principal.job"/>" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
               <div class="WJform-group">
                <label>Existence</label>
                <input class="WJform-control" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.existence}" disabled="disabled"  style="background-color: #F4F4F4;">
              </div>
              <br>
              <div class="WJform-group">
              <input type="button" class="active WJbtn btn-default" style="float:left; width:49.5%;"value="Update" id="update" > 
              <input type="button" class="active WJbtn btn-default" style="float:right; width:49.5%;"value="Delete" id="delete">
              </div>
     		  </form>       
        </div>
</div>
