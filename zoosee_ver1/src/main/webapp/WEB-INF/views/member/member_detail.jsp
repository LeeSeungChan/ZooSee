<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
	$(document).ready(function() {
		$("input:radio[name=gender][value=" + '<c:out value="${ mvo.gender }"/>' + "]").attr("checked","checked");
		$("#update").click(function() {
			if (confirm("수정하시겠습니까?")) {
			location.replace("${initParam.root}member_update.do");
			}
		});
		$("#delete").click(function() {
			if (confirm("탈퇴하시겠습니까?")) {
				location.replace("${initParam.root}member_delete.do");
			}
		});
    	$("input:radio[name=existence][value=" + '<c:out value="${ mvo.existence }"/>' + "]").attr("checked","checked");
	});
</script>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA" href="${initParam.root}interceptor_member_detail.do">마이페이지</a>
	<a class="BJA" href="${initParam.root}interceptor_member_update.do">회원정보수정</a>
   	<c:if test="${sessionScope.mvo.rank == 'petsitter' || sessionScope.mvo.rank == 'petmaster'}">
       <a class="BJA" href="${initParam.root}interceptor_petsitterboard_registerform.do?id=${sessionScope.mvo.id}"> 돌보미게시글등록</a>
      </c:if>
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
                <input class="WJform-control"  type="text" value="${mvo.id}" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
               <div class="WJform-group">
                <label>Name</label>
                <input class="WJform-control" type="text" value="${mvo.name}" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
                <div class="WJform-group">
                <label>Address</label>
                <input class="WJform-control"  value="우편번호 : ${mvo.addressCode}" disabled="disabled" style="background-color: #F4F4F4;">
                <input class="WJform-control"  value="${mvo.address}" disabled="disabled" style="background-color: #F4F4F4;">
                <input class="WJform-control"  value="${mvo.detailAddress}"disabled="disabled" style="background-color: #F4F4F4;">
              </div>
              <div class="WJform-group">
                <label>Email address</label>
                <input class="WJform-control" type="text" value="${mvo.email}" readonly="readonly" style="background-color: #F4F4F4;">
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
                <input class="WJform-control" type="text" value="${mvo.tel}" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
               <div class="WJform-group">
                <label>Job</label>
                <input class="WJform-control" type="text" value="${mvo.job }" readonly="readonly" style="background-color: #F4F4F4;">
              </div>
               <div class="WJform-group">
                <label>Existence</label>
                <input class="WJform-control" value="${mvo.existence}" disabled="disabled"  style="background-color: #F4F4F4;">
              </div>
              <br>
              <div class="WJform-group">
              <input type="button" class="active WJbtn btn-default" style="float:left; width:49.5%;"value="Update" id="update" > 
              <input type="button" class="active WJbtn btn-default" style="float:right; width:49.5%;"value="Delete" id="delete">
              </div>
     		  </form>       
        </div>
</div>

<%-- 
아이디
<input type="text" name="id" value="${mvo.id }" readonly="readonly">
<br>
이름
<input type="text" name="name" value="${mvo.name }" readonly="readonly">
<br>
주소
<input type="text" name="address" value="${mvo.address }"
	readonly="readonly">
<br>
이메일
<input type="email" name="email" value="${mvo.email }"
	readonly="readonly">
<br>
연락처
<input type="text" name="tel" value="${mvo.tel }" readonly="readonly">
<br>
직업
<input type="text" name="job" value="${mvo.job }" readonly="readonly">
<br>
펫 양육 경험 <br>
<input type="radio" name="existence" value="A" disabled="disabled" > 키워본 경험이 없다<br>
<input type="radio" name="existence" value="B" disabled="disabled" > 키워본 경험이 있다<br>
<input type="radio" name="existence" value="C" disabled="disabled"> 현재 키우고 있다<br>
<input type="button" value="수정" id="update">
<input type="button" value="탈퇴" id="delete">
 --%>