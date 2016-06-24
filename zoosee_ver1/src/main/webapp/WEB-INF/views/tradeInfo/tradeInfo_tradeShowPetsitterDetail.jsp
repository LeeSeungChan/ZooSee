<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<table border="1">
		<caption>펫시터 정보</caption>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${petsitterVO.memberVO.id}</td>
				<th>이름</th>
				<td>${petsitterVO.memberVO.name}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${petsitterVO.memberVO.address}</td>
				<th>성별</th>
				<td>${petsitterVO.memberVO.gender}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${petsitterVO.memberVO.tel}</td>
				<th>이메일</th>
				<td>${petsitterVO.memberVO.email}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${petsitterVO.memberVO.job}</td>
				<th>경험여부</th>
				<td>${petsitterVO.memberVO.existence}</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<img src="${initParam.root}${petsitterVO.petsitterImg}" />
				</td>
			</tr>
			<tr>
				<td><input type="button" value="뒤로" onclick="history.go(-1)"/></td>
			</tr>
	</tbody>
</table>

