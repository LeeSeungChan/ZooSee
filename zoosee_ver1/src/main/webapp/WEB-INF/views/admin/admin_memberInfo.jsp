<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 멤버 정보 보기 -->

<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA"
				href="${initParam.root}interceptor_admin_memberlist.do?rank=normal">일반회원</a>
			<a class="BJA"
				href="${initParam.root}interceptor_admin_petmomList.do">펫맘</a> <a
				class="BJA"
				href="${initParam.root}interceptor_admin_petsitterList.do?value=recog">펫시터</a>
			<a class="BJA"
				href="${initParam.root}interceptor_admin_petsitterList.do?value=nonrecog">펫시터
				신청자</a>
		</div>
	</div>
</div>
<div class="BJMainDiv">
	<div class="BJMain2Div">
		<div class="BJWriteTableLine">

			<div class="WJLayout" style="text-align: left; margin-bottom: 5%;">
				<form>
					<h3>${memberVO.name }님의회원정보</h3>
					<div class="WJform-group">
						<label>id</label> <input class="WJform-control" type="text"
							value="${memberVO.id}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Name</label> <input class="WJform-control" type="text"
							value="${memberVO.name}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Address</label> <input class="WJform-control"
							value="우편번호 : ${memberVO.addressCode}" disabled="disabled">
						<input class="WJform-control" value="${memberVO.address}"
							disabled="disabled"> <input class="WJform-control"
							value="${memberVO.detailAddress}" disabled="disabled">
					</div>
					<div class="WJform-group">
						<label>Email address</label> <input class="WJform-control"
							type="text" value="${memberVO.email}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Gender</label> <input class="WJform-control" type="text"
							value="${memberVO.gender}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Tel</label> <input class="WJform-control" type="text"
							value="${memberVO.tel}" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Job</label> <input class="WJform-control" type="text"
							value="${memberVO.job }" readonly="readonly">
					</div>
					<div class="WJform-group">
						<label>Existence</label> <input class="WJform-control"
							value="${memberVO.existence}" disabled="disabled">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>