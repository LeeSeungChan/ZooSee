<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").focus();
		$("#findPasswordForm").submit(function() {
			if ($("#id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			}else if ($("#email").val() == "") {
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
		});
	});
</script>
<div class="BJPanel"
	style="width: 80%; margin-left: 10%; margin-top: 5%;">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">이메일로 비밀번호 찾기</h3>
		</div>
		<div class="panel-body">등록하신 아이디와 비밀번호를 입력하세요.</div>
	</div>
</div>
<!-- 전체 시작 -->
<div style="width: 100%;">
	<div style="border: 2px solid #02749C; border-radius: 10px; height: 403px; width: 60%; margin-top: 5%; margin-left: 20%; background-color: white">
		<div style=" width: 90%; height: auto; margin-top: 5%; margin-left: 5%;">
		<div align="center">
		<img src="${initParam.root}resources/image/Mzoosee.png">
		</div>
			<form action="findPasswordMail.do" id="findidMailForm">
				<div style="float: center;">
					<input class="WJform-control"
						id="id" name="id" placeholder="id" type="text"> <br>
						<input class="WJform-control"
						id="email" name="email" placeholder="email" type="email"> <br>
					<button class="active WJbtn btn-block btn-info" type="submit">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 전체 끝 -->

<!-- <form action="findPasswordMail.do" id="findPasswordForm">
	<h1>아이디와 비밀번호를 입력하세요</h1>
	<table>
		<tr>
			<td>아이디<input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<td>email<input type="text" name="email" id="email"><br>
				<input type="submit" value="찾기">
			</td>
		</tr>
	</table>
</form> -->