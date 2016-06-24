<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<script type="text/javascript">
  	$(document).ready(function(){
  		$.ajax({
 		   type:"POST",
 		   url:"countMessage.do",
 		   data:id="id=${sessionScope.mvo.id}",
 		   dataType:"json", 
 		   success:function(result){
 		      if(result.count=="0"){
 		      $("#message").html("메세지");
 		      }else{
 		    	$("#message").html("<img src='${initParam.root}resources/image/new.png''>메세지("+result.count+")");
 		      }
 		   }
 		});
  		
  		 $(".dropdown-toggle").click(function(){
  	         if($(this).parent().attr("class")=="dropdown"){
  	            $(this).parent().attr("class","dropdown open");
  	         }else{
  	            $(this).parent().attr("class","dropdown");
  	         }   
  	      });
  	})
</script> <!-- navbar-fixed-top -->

<nav class="navbar navbar-default  " >
  <div class="container-fluid" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a  class="navbar-brand" href="${initParam.root}home.do">ZOOSEE</a>
    </div>

    <!-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
 
      <c:choose>
      <c:when test="${empty sessionScope.mvo}">
         <ul class="nav navbar-nav navbar-right">
           <li><a href="${initParam.root}member_login.do">로그인</a></li>
           <li><a href="${initParam.root}member_register.do">회원가입</a></li>
         </ul>
         </c:when>
         <c:otherwise>
               <ul class="nav navbar-nav navbar-right">
               
               <c:if test="${mvo.rank == 'petsitter' || mvo.rank== 'petmaster' || mvo.rank == 'prepetmatster'}">
               		<li><a href="${initParam.root}interceptor_petsitterboard_registerform.do?id=${sessionScope.mvo.id}">글 등록</a></li>
               </c:if>
               <c:if test="${mvo.rank == 'normal' || mvo.rank== 'petmom'}">
               		<li><a href="${initParam.root}interceptor_petsitter_register.do">돌보미신청</a></li>
               </c:if>
               
               <li><a href="${initParam.root}interceptor_petsitter_updateform.do">돌보미 정보 수정</a></li>
               <li><a href="${initParam.root}interceptor_freeBoard_list.do?">자유게시판</a></li>
               <li><a href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">회원리스트 및 승인(관리자)</a></li>
               <li><a href="${initParam.root}interceptor_message_list.do" id="message">메세지</a></li>
               
               
                    <li  class="dropdown" >
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.mvo.name} <span class="caret"></span></a>
                      <ul class="dropdown-menu" role="menu">
                         <li><a href="${initParam.root}interceptor_member_detail.do">계정관리</a></li>
                        <li><a href="${initParam.root}interceptor_pet_list.do">정보관리</a></li>
                        <li class="divider"></li>
                        <li><a href="${initParam.root}interceptor_freeBoard_list.do">게시판</a></li>
                        <li><a href="${initParam.root}interceptor_admin_qna_list.do?when=all">Q&A 목록(관리자)</a></li>
                        <li class="divider"></li>
                        <li><a href="${initParam.root}logout.do">로그아웃</a></li>
                      </ul>
                    </li>
            </ul>
            </c:otherwise>
</c:choose>
    </div>
<!--   </div> -->
</nav>
<%-- <a href="${initParam.root}home.do">홈</a>

<c:choose>
   <c:when test="${empty sessionScope.mvo}">
      <a href="${initParam.root}member_login.do">로그인</a>
      <a href="${initParam.root}member_register.do">회원가입</a>
   </c:when>
   <c:otherwise>
      ${sessionScope.mvo.name}님 환영
      <a href="${initParam.root}logout.do">로그아웃</a>
      <a href="${initParam.root}pet_register.do">펫등록</a>
      <a href="${initParam.root}pet_list.do">펫목록</a>
      <a href="${initParam.root}petsitter_register.do">돌보미신청</a>
      <a href="${initParam.root}petsitter_updateform.do?id=${sessionScope.mvo.id}">돌보미정보수정</a>
      <a href="${initParam.root}qna_board_register.do">qna 등록</a>
      <a href="${initParam.root}qna_list.do">qna 목록</a><br>
      <a href="${initParam.root}member_detail.do">회원정보</a>
      <a href="${initParam.root}petsitter_petsitterList.do?value=recog">회원관리</a><!-- //관리자 페이지 -->
      <a href="${initParam.root}admin_qna_list.do?when=all">관리자qna 목록</a><!-- //관리자 페이지 -->
      <a href="${initParam.root}freeBoard_list.do?">자유게시판</a>
      
      <c:if test="${sessionScope.mvo.rank == 'petsitter' || sessionScope.mvo.rank == 'petmaster'}">
         <a href="${initParam.root}petsitterboard_registerform.do?id=${sessionScope.mvo.id}">글 등록</a>
      </c:if>
   </c:otherwise>
</c:choose> --%>