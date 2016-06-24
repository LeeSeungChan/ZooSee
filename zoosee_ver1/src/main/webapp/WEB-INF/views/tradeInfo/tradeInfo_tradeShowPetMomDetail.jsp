<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1">
	<caption>펫맘 정보</caption>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${petVO.memberVO.id}</td>
				<th>이름</th>
				<td>${petVO.memberVO.name}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${petVO.memberVO.address}</td>
				<th>성별</th>
				<td>${petVO.memberVO.gender}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${petVO.memberVO.tel}</td>
				<th>이메일</th>
				<td>${petVO.memberVO.email}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${petVO.memberVO.job}</td>
				<th>경험여부</th>
				<td>${petVO.memberVO.existence}</td>
			</tr>
			<tr>
				<th>펫이름</th>
				<td>
					<a href="interceptor_reserve_reservePetDetail.do?petNo=${petVO.petNo}">${petVO.petName}</a>
				</td>
				<th>펫타입</th>
				<td>${petVO.petType}</td>
			</tr>
			<tr>
				<td><input type="button" value="뒤로" onclick="history.go(-1)"/></td>
			</tr>
		</tbody>
</table>
