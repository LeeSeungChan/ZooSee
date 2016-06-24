<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#searchForm #searchBtn").click(function(){
				if($("#searchForm :input:radio[name=service]:checked").length==0){
					alert("서비스를 선택하세요");
					return false;
				}
				if($("#searchForm :input:radio[name=petSize]:checked").length==0){
					alert("펫 사이즈를 선택하세요.");
					return false;
				}
				if($("#searchForm :input:radio[name=petType]:checked").length==0){
					alert("펫 종류를 선택하세요.");
					return false;
				}
			});
		});
	</script>
<div>
	<form method="get" action="getConditionList.do" id="searchForm">
		<div>
			서비스<br/>
			<input type="radio" name="service" id="checkbox1" value="목욕"/>목욕
			<input type="radio" name="service" id="checkbox2" value="산책"/>산책
			<input type="radio" name="service" id="checkbox3" value="픽업"/>픽업
		</div><br/>
		<div>
			펫 사이즈<br/>
			<input type="radio" name="petSize" id="checkbox1" value="small"/>
			<label for="checkbox1">소형</label>
			<input type="radio" name="petSize" id="checkbox2" value="normal"/>
			<label for="checkbox2">중형</label>
			<input type="radio" name="petSize" id="checkbox3" value="large"/>
			<label for="checkbox4">대형</label><br/>
		</div><br/>
		<div>
			펫 종류 <br/>
			<input type="radio" name="petType" id="checkbox1" value="dog"/>
			<label for="checkbox1">강아지</label>
			<input type="radio" name="petType" id="checkbox2" value="cat"/>
			<label for="checkbox2">고양이</label>
			<input type="radio" name="petType" id="checkbox3" value="bird"/>
			<label for="checkbox3">새</label>
			<input type="radio" name="petType" id="checkbox4" value="bird"/>
			<label for="checkbox3">물고기</label>
			<input type="radio" name="petType" id="checkbox5" value="etc"/>
			<label for="checkbox5">기타</label><br/>
		</div><br/>
		<!-- 가격정보 추가 -->
		<div>
			<input type="submit" value="검색" id="searchBtn"/>
			<input type="reset" value="선택 초기화" id="resetBtn"/>
		</div>
	</form><br/><br/>
</div>

<div>	
	<c:choose>
	<c:when test="${requestScope.condition == 'search'}">
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>&nbsp;&nbsp;&nbsp;	
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
			<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&address=${requestScope.address }">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
		<a href="findAllPetsitterList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&address=${requestScope.address }">이전</a>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()==false}">
			-
		</c:if>
		<c:if test="${lvo.pb.isPreviousPageGroup()!=false && lvo.pb.isNextPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>&nbsp;&nbsp;&nbsp;	
			<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
		</c:if>		
		<c:if test="${lvo.pb.isPreviousPageGroup()==false && lvo.pb.isNextPageGroup()!=false}">
		<a href="getConditionList.do?pageNo=${lvo.pb.getEndPageOfPageGroup()+1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">다음</a>
			<!-- <input type="button" name="next" value="다음" id="nextBtn"> -->
		</c:if>
		<c:if test="${lvo.pb.isNextPageGroup()==false && lvo.pb.isPreviousPageGroup()!=false}">
			<a href="getConditionList.do?pageNo=${lvo.pb.getStartPageOfPageGroup()-1 }&service=${requestScope.service }&petType=${requestScope.petType}&petSize=${requestScope.petSize}">이전</a>
		</c:if>
	</c:otherwise>
	</c:choose>
	
	<table border="1">
		<tr>
			<c:forEach items="${lvo.map}" var="map" varStatus="i">
				<td><a href="petsitterboardDetail.do?petsitterboard_no=${map.value.petsitterboard_no}">${map.value}</a></td>
				<c:if test="${i.index%3 == 2 && i.index+1 != list.size()}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
		</tr>
	</table>
</div>
