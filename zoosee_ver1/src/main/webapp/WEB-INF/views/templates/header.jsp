<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
  	$(document).ready(function()
  	{
  		<sec:authorize ifAnyGranted="ROLE_MEMBER,ROLE_PETMOM,ROLE_PETSITTER,ROLE_PETMASTER,ROLE_ADMIN">
  		$.ajax({
 		    type:"POST",
 		    url:"countMessage.do",
 		    data:id="id=<sec:authentication property='principal.id'/>",
 		    dataType:"json", 
 		    success:function(result){
				if(result.count=="0"){
 		      		$("#message").html("메세지");
 		      	}else{
 		    		$("#message").html("<img src='${initParam.root}resources/image/new.png''>메세지("+result.count+")");
 		      	}
 		   	}
 		});
  		</sec:authorize>
  		$(".dropdown-toggle").click(function(){
  	    	if($(this).parent().attr("class")=="dropdown"){
  	    		$(this).parent().attr("class","dropdown open");
  	    	}else{
  	    		$(this).parent().attr("class","dropdown");
  	    	}   
  	    });
  		
  		$("#logout").click(function(){
  			if(!confirm("로그아웃 하시겠습니까?")){
  				return false;
  			}
  		})
  	})
</script> <!-- navbar-fixed-top -->

<nav class="navbar navbar-default  navbar-fixed-top " >
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${initParam.root}home.do">ZOOSEE</a>
		</div>

<!-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
		<sec:authorize ifNotGranted="ROLE_MEMBER,ROLE_PETMOM,ROLE_PETSITTER,ROLE_PETMASTER,ROLE_ADMIN">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${initParam.root}member_login.do">로그인</a></li>
				<li><a href="${initParam.root}member_register.do">회원가입</a></li>
			</ul>
		</sec:authorize>
			<ul class="nav navbar-nav navbar-right">
			 <sec:authorize ifAnyGranted="ROLE_ADMIN">
			<!-- 관리자 -->
				<li class="dropdown" >
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리자페이지
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${initParam.root}admin_petsitterList.do?value=recog">회원 관리</a></li>
						<li><a href="${initParam.root}admin_qna_list.do?when=all">Q&A 목록</a></li>
						<li><a href="${initParam.root}admin_adminList.do">직원 관리</a></li>
					</ul>
				</li>
			</sec:authorize>
			 <sec:authorize ifAnyGranted="ROLE_PETMASTER">
				<c:set value="0" var="petMasterSignal" />
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_MEMBER,ROLE_PETSITTER,ROLE_PETMOM,ROLE_PETMASTER,ROLE_ADMIN">
				<li><a href="${initParam.root}message_list.do" id="message">메세지</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><sec:authentication property="principal.name"/> 
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${initParam.root}m_member_detail.do">계정관리</a></li>
						<li><a href="${initParam.root}pet_list.do">정보관리</a></li>
						<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMOM,ROLE_PETMASTER,ROLE_ADMIN">
						<li><a href="${initParam.root}reserve_reserveMyList.do?petMasterSignal=${petMasterSignal}">예약목록</a></li>
						<li><a href="${initParam.root}tradeInfo_getTradeMyList.do?id=<sec:authentication property="principal.id"/>">거래목록</a></li>
						</sec:authorize>
						<li class="divider"></li>
						<li><a href="${initParam.root}freeBoard_list.do">게시판</a></li>
						<li class="divider"></li>
						<li><a href="${initParam.root}logout.do" id="logout">로그아웃</a></li>
					</ul>
				</li>
				</sec:authorize>
			</ul>
	</div>
<!--   </div> -->
</nav>
