<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 펫시터 정보 보기 -->
<script>
	$(document)
			.ready(
					function() {
						;
						$("#petsitterInfoForm :input[name=backBtn]")
								.click(
										function() {
											location.href = "${initParam.root}admin_petsitterList.do?recog=recog";

										});

					});
</script>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}admin_memberlist.do?rank=normal">일반회원</a>
			<a class="BJA" href="${initParam.root}admin_petmomList.do">펫맘</a> 
			<a class="BJA" href="${initParam.root}admin_petsitterList.do?recog=recog">펫시터</a>
			<a class="BJA" href="${initParam.root}admin_petsitterList.do?recog=nonrecog">펫시터 신청자</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">펫시터 상세보기</h3>
			</div>
			<div class="panel-body">펫시터 ${mvo.name }님의 상세정보를 보여 드리기 위한
				공간입니다.</div>
		</div>
		<div class="well well-sm">펫시터 ${mvo.name }님의 상세정보</div>
	</div>
	<div style="margin-left: 10%; width: 80%; height: 600px;">
		<!-- 왼쪽 -->
		<div style="width: 50%; float: left;">
			<div align="center">
				<img style="border: 1px solid black;"
					class="img-responsive img-rounded"
					src="${initParam.root}${requestScope.pvo.petsitterImg}" width="100%"
					height="335px;">
				<div align="center">
					<label>회원사진</label>
				</div>
				<img style="border: 1px solid black;"
					class="img-responsive img-rounded"
					src="${initParam.root}${requestScope.pvo.houseImg}" width="100%"
					height="335px;">
				<div align="center">
					<label>집사진</label>
				</div>
			</div>
		</div>
		<!-- 왼쪽 끝  -->
		<!-- 오른쪽 -->
		<form id="petsitterInfoForm">
			<div style="width: 50%; float: right; text-align: left;">
				<div style="margin-left: 10%; width: 90%;">
					<label>아이디</label> <input class="WJform-control" type="text"
						value="${requestScope.pvo.memberVO.id }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>이름</label> <input
						class="WJform-control" type="text"
						value="${requestScope.pvo.memberVO.name }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>성별</label> <input
						class="WJform-control" type="text"
						value="${requestScope.pvo.memberVO.gender }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>직업</label> <input
						class="WJform-control" type="text"
						value="${requestScope.pvo.memberVO.job }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>전화번호</label> <input
						class="WJform-control" type="text"
						value="${requestScope.pvo.memberVO.tel }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>주소</label> <input
						class="WJform-control" type="text"
						value="${requestScope.pvo.memberVO.address }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>돌봄이 가능한
						펫 마릿수</label> <input class="WJform-control" type="text"
						value="${requestScope.pvo.petNumber }" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>서비스</label> <input
						class="WJform-control" type="text"
						value="${requestScope.pvo.service}" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>가격</label> <input
						class="WJform-control" type="text"
						value=" ${requestScope.pvo.price}" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>사이즈</label> <input
						class="WJform-control" type="text"
						value=" ${requestScope.pvo.petSize}" readonly="readonly"
						style="background-color: #F4F4F4;"> <label>종류</label> <input
						class="WJform-control" type="text"
						value=" ${requestScope.pvo.petType}" readonly="readonly"
						style="background-color: #F4F4F4;"><br> <input
						type="button" name="backBtn" value="확인"
						class="active WJbtn btn-block btn-info">
				</div>
			</div>
		</form>
	</div>
</div>
