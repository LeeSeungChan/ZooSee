<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="findPasswordMail.do" id="findPasswordFrom">
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
</form>