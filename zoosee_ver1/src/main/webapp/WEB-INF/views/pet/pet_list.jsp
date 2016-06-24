<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
    $(document).ready(function(){
    	$("#delete").click(function(){
    		if(confirm("삭제하겠습니까?")){
    			location.replace("interceptor_pet_delete.do?petNo=${petVO.petNo}");
    		}else{
    			return false;
    		}
    	});
    });
</script>
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA"  href="${initParam.root}interceptor_pet_list.do">펫목록</a>
	<a class="BJA" href="${initParam.root}interceptor_pet_register.do">펫등록</a>
	</div>
</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">반려동물 목록</h3>
			</div>
			<div class="panel-body">${mvo.name }님의 등록된 반려동물을 보여 드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">${mvo.name }님이 등록하신 반려동물 목록</div>
	</div>
<div class="BJMain2Div" align="center">
<div class="BJWriteTableLine">
				<div class="SBHrAllLine_1">
<table  class="table table-striped table-hover" style="width: 100%">
	<tr class="active" >
		<th style="width: 25%"><label>Image</label></th>
		<th style="width: 15%"><label>Name</label></th>
		<th style="width: 15%"><label>Type</label></th>
		<th style="width: 15%"><label>Sex</label></th>
		<th style="width: 15%"><label>Age</label></th>
		<th style="width: 15%"><label>Detail</label></th>
	</tr>
	
	<c:forEach items="${list }" var="L">
		<tr ><td ><img src="${L.petImg}" width="70" height="70" style="    
                                                                                 border-radius: 100px;
                                                                                 -moz-border-radius: 100px;
                                                                                 -khtml-border-radius: 100px;
                                                                                 -webkit-border-radius: 100px;"></td>
			<td style="vertical-align:middle;">${L.petName }</td>
			<td style="vertical-align:middle;">${L.petType }</td>   
       		<td style="vertical-align:middle;">${L.petGender }</td>   
        	<td style="vertical-align:middle;">${L.petAge }</td> 
			<td style="vertical-align:middle;">
			<a href="${initParam.root}interceptor_pet_detail.do?petNo=${L.petNo}">상세보기</a><br>
			<a href="${initParam.root}interceptor_pet_update.do?petNo=${L.petNo}">수정하기</a><br>
			<a id="delete" href="${initParam.root}interceptor_pet_delete.do?petNo=${L.petNo}">삭제하기</a>
         </td>         
		</tr>
	</c:forEach>
</table>
</div>
</div>
<%-- <br>
<br>
<ul class="pagination pagination-sm" > 
<c:set var="pb" value="${listVO.pagingBean}"></c:set>
<c:if test="${pb.previousPageGroup}">
	<li><a href="interceptor_pet_list.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
</c:if>
<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
	end="${pb.endPageOfPageGroup}">
	<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<li><a href="interceptor_pet_list.do?pageNo=${i}">${i}</a></li>
		</c:when>
		<c:otherwise>
		<li class="active"><a >${i}</a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pb.nextPageGroup}">
	<li><a href="interceptor_pet_list.do?pageNo=${pb.endPageOfPageGroup+1}">&laquo;</a></li>
</c:if>
</ul> --%>
</div>
</div>
