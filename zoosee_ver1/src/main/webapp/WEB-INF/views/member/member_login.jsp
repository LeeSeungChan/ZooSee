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
	function findIdPopup() {
		window.open(
			"${initParam.root}popup_findId.do",
			"EventFrame",
			"menubar=no,width=700,height=550,left=590,top=180,toolbar=no"
		);
	}
	function findPasswordPopup(){
		window.open(
			"${initParam.root}popup_findPassword.do",
			"EventFrame",
			"menubar=no,width=700,height=600,left=590,top=180,toolbar=no"
		);
	}
 </script>
 
<div class="WJcontainer3">
	<div style="border: 1px solid #0f0fd9; border-radius: 10px; height: 550px; width:50%;  margin-top:10%; margin-left:25%; background-color: white">
		<div class="WJLayout2" style=" text-align: left;">
			<div align="center">
				<a href="home.do"><img src="${initParam.root}resources/image/Mzoosee.png"></a>
			</div>
			<form method="post" action="loginMember.do" id="memberLoginForm">
				<div style="float:center;">
					<div class="WJform-group">
						<input class="WJform-control" id="id" name="id" placeholder="id" type="text">
					</div>
					<div class="WJform-group">
						<input class="WJform-control" id="password" name="password" placeholder="Password" type="password">
					</div><br>
					<button type="submit" class="active WJbtn btn-block btn-primary" style="margin-bottom: 5%">Submit</button>
					<div align="center">
						아직도 ZOOSEE 계정이 없으세요? <br>
						<a href="${initParam.root}member_register.do">회원가입</a><br>
						아이디가 기억나지 않으신가요?<br>
						<a href="javascript:findIdPopup()">아이디찾기</a><br>
						비밀번호가 기억나지 않으신가요?<br>
						<a href="javascript:findPasswordPopup()">비밀번호찾기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

