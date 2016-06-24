<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script type="text/javascript">
 $(document).ready(function() {
 $("#id").focus();
 $("#memberLoginForm").submit(function(){
          if($("#id").val()==""){
            alert("아이디를 입력하세요.");
            $("#id").focus();
            return false;
         }else if($("#password").val()==""){
            alert("비밀번호를 입력하세요.");
            $("#password").focus();
            return false;
         }
   });
});
</script>
<!-- 전체 시작 -->
<div class="WJcontainer3">
	<!-- 텍스트는 왼쪽 정렬 및 삽입 중간 정렬 시작 -->
	<div style="border: 1px solid #0f0fd9; border-radius: 10px; height: 550px; width:50%;  margin-top:10%; margin-left:25%; background-color: white">
	<%-- <img src="${initParam.root}resources/image/Mmain.jpg" style="position: absolute; height:230px;  width:30%;"> --%>
	<div class="WJLayout2"
		style=" text-align: left;">
		<!-- 사진 중간 정렬 시작-->
		<div align="center">
			<a href="home.do"><img
				src="${initParam.root}resources/image/Mzoosee.png"></a>
		</div>
		<!-- 사진 중간 정렬 끝-->
		<form action="loginMember.do" id="memberLoginForm" method="post" >
		<!-- 왼쪽 시작-->
		<div style="float: center; " >
		<div class="WJform-group">
			<input class="WJform-control" id="id" name="id"
				placeholder="id" type="text">
		</div>
		<div class="WJform-group">
			<input class="WJform-control" id="password"
				name="password" placeholder="Password" type="password">
		</div>
		<br>
		<button type="submit" class="active WJbtn btn-block btn-primary" style="margin-bottom: 5%">Submit</button>
		<div align="center">
			아직도 ZOOSEE 계정이 없으세요? <br>
			<a href="${initParam.root}member_register.do">회원가입</a>
		</div>
		</div>
		
		</form>
		</div>
		<!-- 텍스트는 왼쪽 정렬 및 삽입 중간 정렬 끝-->
		</div>
</div>
<!-- 전체 끝 -->

