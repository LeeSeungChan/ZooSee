<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".star_rating a" ).click(function() {
	    	$(this).parent().children("a").removeClass("on");
	    	$(this).addClass("on").prevAll("a").addClass("on");
   			var index = $('.on').length;
    		return false;
		});
	});
</script>

<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id == petsitterboardVO.petsitterVO.memberVO.id}">
	<div class="BJHeaderLayout0">
		<div class="BJHeaderLayout" >
			<div class="BJHeader2" >
				<a class="BJA" href="${initParam.root}m_member_detail.do">마이페이지</a>
				<a class="BJA" href="${initParam.root}m_member_update.do">회원정보수정</a>
				<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
			       <a class="BJA" href="${initParam.root}psboard_petsitterboard_registerform.do?id=<sec:authentication property="principal.id"/>"> 펫시터게시글등록</a>
			       <a class="BJA" href="${initParam.root}psboard_petsitterboard_myPetsitterBoard.do">내 글 보기</a>
			       <a class="BJA" href="${initParam.root}psboard_petsitterboard_myPetsitterBoardUpdateView.do?petsitterboard_no=${petsitterboardVO.petsitterboard_no}">내 글 수정</a>
			       <a class="BJA" id="deleteId" href="#">내 글 삭제</a>
		    	</sec:authorize>
			</div>
		</div>
	</div>
</c:if>

<div class="BJMainKING">
	<div style="width: 60%; margin-left:20%; margin-right:20%; height:auto; margin-bottom:10% ">
		<div style="height: 170px; background-color:#F5F5F5;">
			<div style="border:1px solid red; margin:0 auto; width:220px; height:220px; float: left;" >
				<img id="UploadedImg" style="border: 3px solid #DFDFDF;" src="${initParam.root}${petsitterVO.petsitterImg}"
					class="center-block img-circle img-responsive" width="90%" height="90%">
			</div>
			<div style="border: 1px solid red; margin-top: 4%; float: left;">
				<h2 style="color: #868686;">${petsitterVO.memberVO.name}
					<span>${petsitterVO.memberVO.rank}</span>
				</h2>
				<h6 style="color: #868686;">님의 페이지</h6>
			</div>
			<div style="border: 1px solid black; float: right; margin-top: 3%; margin-right: 4%;">
				<img src="${initParam.root}resources/image/recog.PNG">
			</div>
		</div><br><br><br>
		<div style="width: 40%; float:left; height: 400px; border-radius: 10px;"> 	
			<div style="width: 100%; height: 15%; border-radius: 10px; background-color: #F5F5F5;">
				<h3 style="color: #868686; margin-left: 10%;">*POTHO</h3>
			</div>
			<div style="width: 100%; height: 85%;border-radius: 10px;">
				<img src="${initParam.root}${petsitterVO.houseImg}" style="height:100%; width:100%; border-radius: 10px;">
			</div>
		</div>
		<div style="border:1px solid black; width: 50%; float:right; height: 400px; border-radius: 10px;"> 	
			<div style="width: 100%; height: 15%; border-radius: 10px; background-color: #F5F5F5; ">
				<h3 style="color: #868686; margin-left: 10%;">*DETAIL</h3>
			</div>
			<div style="margin:0 auto; width:30%; height:40%; float: left;" >
				<img id="UploadedImg" src="${initParam.root}${petsitterVO.petsitterImg}"
					class="center-block img-circle img-responsive" width="85%" height="90%">
			</div>	
			<h3 style="color: #6EB9B5; margin-left: 10%;">${petsitterboardVO.petsitterboard_title }</h3> 
			펫시터이름 :&nbsp;${petsitterVO.memberVO.name }<br>
			<img src="${initParam.root}resources/image/location.png">  주소 어쩌고저쩌고(입력) <br>
			${petsitterVO.memberVO.existence }<br>
			제공가능한 서비스:&nbsp;${petsitterVO.service }<br>
			E-MAIL : 거래승인시 관람하실 수 있습니다.<br>
			TEL : 거래승인시 관랍하실 수 있습니다.<hr>
			<p align="right">1박</p>
			<h1 align="right">${petsitterVO.price}원</h1>
			<span class="star-rating" style="margin-left: 64%" >
				<span style ="width:90%"></span>
			</span>
		</div>
		<div style="border: 1px solid; float: bottom; margin-top: 34%;"></div>
	
		<!-- 후기 -->
		<div class="BJReplyAllLine" style="width: 100%; margin-left: 0%; ">
			<h3 style="color: #868686; margin-left: 5%;">*REVIEW(${requestScope.reviewList.size() })</h3>
			<c:forEach items="${requestScope.reviewList}" varStatus="status" var="reviewList">
				<div class="BJReplyList" style=" width:90%; margin-left: 5%">
					<table style="width:100%;">
					<c:if test="${reviewList==null }">
						<tr>
	         				<td colspan="5" align="center">
	         					<h3 style="color: #6EB9B5;">등록된 후기가 없습니다!!<br> 첫번 째 고객님이 되어주세요!!</h3>
	         				</td>
	    				</tr>
					</c:if>
		      			<tr>
		         			<td align="left" >${reviewList.name}</td>
		        			<td>
		      					<span class="star-rating2" style=" margin-left:85%;" >
									<span id="star-rating${status.index}" style ="width:${reviewList.star_rate*17}%; float:left;"></span>
								</span> 
							</td>
		      			</tr>
		      			<tr>
		      				<td colspan="2" align="left">${reviewList.content}</td>
		      			</tr>
		     			<tr>
		      				<td colspan="2" align="left">${reviewList.time_posted}</td>
		  				</tr>
					</table><hr>
				</div>
			</c:forEach>
		</div>
	</div>
</div>