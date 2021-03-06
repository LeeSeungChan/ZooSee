<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function() {			
		$("#pass_check_btn").click(function(){
			var id=$("#id").val();
			var password=$("#password").val();
			$.ajax({
				type : "post",
				url : "check.do",
				data : "id="+id+"&password="+password,
				dataType:"json",
				success:function(result){
					if(result.check=="ok"){
						$("#checkedpass").css("display","");
						$("#unchecked").css("display","none");
						alert("비밀번호가 확인되었습니다.");
					}else{
						alert("비밀번호가 일치하지 않습니다");
					}
				}//success
			});//ajax
		});//onclick
	
		$('input:radio[name="petType"]:input[value="${petsitterVO.petType}"]').attr("checked", true);
		$('input:radio[name="petSize"]:input[value="${petsitterVO.petSize}"]').attr("checked", true);
		$('input:radio[name="petNumber"]:input[value="${petsitterVO.petNumber}"]').attr("checked", true);
		$('input:radio[name="service"]:input[value="${petsitterVO.service }"]').attr("checked", true);
					
		$("#updateForm").submit(
		function() {
			var price = $("#price").val();
			var petNumber = $("input[name=petNumber].checked").val();
			var service = $("input[name=service]:checked").val();
			var petType = $("input[name=petType]:checked").val();
			var petSize = $("input[name=petSize]:checked").val();
			var house_img = $("#house_img").val();
			var petsitter_img = $("#petsitter_img").val();
			var checkedAll = $("input[name=checkedAll]:checked").val();
			if (price == "") {
				alert("가격을 입력해주세요!");
				return false;
			} else if (isNaN(price)) {
				alert("가격을 숫자로 입력해주세요!");
				return false;
			} else if (service == undefined) {
				alert("제공 가능한 서비스를 선택해주세요!")
				return false;
			} else if (petType == undefined) {
				alert("팻 종류를 선택해주세요!");
				return false;
			} else if (petSize == undefined) {
				alet("팻 사이즈를 선택해주세요!");
				return false;
			} else if (checkedAll == undefined) {
				alert("필수사항에 체크해주세요!");
				return false;
			}
			if (confirm("수정 하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		});//submit
	});//ready
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg2').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/sb.css">

<!-- 비밀번호 체크폼 -->
<div id="unchecked">
	<div class="BJHeaderLayout0">
		<div class="BJHeaderLayout">
			<div class="BJHeader2">
				<a class="BJA" href="${initParam.root}pet_list.do">펫목록</a>
				<a class="BJA" href="${initParam.root}pet_register.do">펫등록</a>
					<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
						<a class="BJA" href="${initParam.root}ps_petsitter_updateform.do">펫시터 정보 수정</a>
						<a class="BJA" href="${initParam.root}ps_petsitter_info.do?id=<sec:authentication property="principal.id"/>">펫시터 정보 보기</a>
					</sec:authorize>
					<sec:authorize ifAnyGranted="ROLE_PETMOM,ROLE_MEMBER">
						<a class="BJA" href="${initParam.root}petsitter_register.do">펫시터신청</a>
					</sec:authorize>
			</div>
		</div>
	</div>
	<div class="WJcontainer3">
		<div style="border: 1px solid #0f0fd9; border-radius: 10px; height: 550px; width:50%;  margin-top:10%; margin-left:25%; background-color: white">
	<%--<img src="${initParam.root}resources/image/Mmain.jpg" style="position: absolute; height:230px;  width:30%;"> --%>
			<div class="WJLayout2" style=" text-align: left;">
				<!-- 사진 중간 정렬 시작-->
				<div align="center">
					<a href="home.do"><img src="${initParam.root}resources/image/Mzoosee.png"></a>
				</div>
				<!-- 사진 중간 정렬 끝-->
				<form action="" id="memberLoginForm" method="post" >
					<!-- 왼쪽 시작-->
					<div style="float: center; " >
					정보 수정을 위해 	비밀번호를 입력해주세요.<br>
						<div class="WJform-group">
							<input type="hidden" id="id" value="<sec:authentication property="principal.id"/>">
							<input class="WJform-control" id="password"
								name="password" placeholder="Password" type="password">
							<input type="hidden" name="checked" id="checked" value="false">
						</div><br>
						<button type="button" class="active WJbtn btn-block btn-primary" 
							style="margin-bottom: 5%" id="pass_check_btn">확인</button>
						<div align="center">
							비밀번호가 기억나지 않으신가요?<br>
							<a href="javascript:findPasswordPopup()">비밀번호찾기</a>
						</div>
					</div>
				</form>
			</div>
	<!-- 텍스트는 왼쪽 정렬 및 삽입 중간 정렬 끝-->
		</div>
	</div>
</div>


<!-- 비밀번호 체크 OK -->
<div id="checkedpass" style="display: none;">
	<div class="BJHeaderLayout0">
		<div class="BJHeaderLayout">
			<div class="BJHeader2">
				<a class="BJA" href="${initParam.root}pet_list.do">펫목록</a>
				<a class="BJA" href="${initParam.root}pet_register.do">펫등록</a>
				<sec:authorize ifAnyGranted="ROLE_PETSITTER,ROLE_PETMASTER">
						<a class="BJA" href="${initParam.root}ps_petsitter_updateform.do">펫시터 정보 수정</a>
						<a class="BJA" href="${initParam.root}ps_petsitter_info.do?id=<sec:authentication property="principal.id"/>">펫시터 정보 보기</a>
					</sec:authorize>
					<sec:authorize ifAnyGranted="ROLE_PETMOM,ROLE_MEMBER">
						<a class="BJA" href="${initParam.root}petsitter_register.do">펫시터신청</a>
					</sec:authorize>
			</div>
		</div>
	</div>
	<div class="BJMainKING">
	<form name="updateForm" action="ps_petsitter_update.do" style="text-align: center;" method="post"
		enctype="multipart/form-data" id="updateForm">
		<h3 align="center">ZOOSEE 펫시터 정보수정</h3><br> <br>
		<div style="text-align: center; text-align: center; width: 30%; margin-left: 35%">
			<blockquote>
				<p>
					*수정하기전 확인해주세요!<br> 회원정보 수정시 일반등급의 회원으로 재조정되며<br> 관리자의 승인을
					다시 받아야 합니다.<br> <br> *승인신청은 자동으로 되며 관리자 승인 후 펫시터게시판을 이용하실
					수 있습니다!<br> <br>
				</p>
			</blockquote>
		</div><br>

		<div class="HGDiv">
			<br>
			<div class="form-group" style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*펫시터님 아이디</label>
				<div class="input-group">
					<span class="input-group-addon">ID</span> 
					<input type="text" class="form-control" style="height: 60%; background-color: #F4F4F4;" id="name" 
						name="name" readonly="readonly" value="${petsitterVO.memberVO.id }">
				</div>
			</div><br>
			<div class="form-group" style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*펫시터님 이름</label>
				<div class="input-group">
					<span class="input-group-addon">NAME</span> 
					<input type="text" class="form-control" style="height: 60%; background-color: #F4F4F4;" id="name"
						name="name" readonly="readonly" value="${petsitterVO.memberVO.name }">
				</div>
			</div><br>
			<div class="form-group" style="width: 200px; text-align: center; margin-left: auto; margin-right: auto;">
				<label class="control-label">*원하시는 가격(1박)</label>
				<div class="input-group">
					<span class="input-group-addon">$</span> 
					<input type="text" class="form-control" style="height: 60%" name="price" id="price" value="${petsitterVO.price }">
				</div>
			</div><br> 
			*가능한 펫 종류 <br> 
			<input type="radio" name="petType" value="dog">강아지 
			<input type="radio" name="petType" value="cat">고양이
			<input type="radio" name="petType" value="etc">기타<br> <br> 
		
			*원하는 펫 크기 <br> 
			<input type="radio" name="petSize" value="small"> 소형 
			<input type="radio" name="petSize" value="middle"> 중형 
			<input type="radio" name="petSize" value="big"> 대형 <br><br>
		
			*돌봄 가능한 팻 <br> 
			<input type="radio" name="petNumber" value="1">한마리
			<input type="radio" name="petNumber" value="2">두마리 
			<input type="radio" name="petNumber" value="3">세마리 <br><br>
			
			*제공 가능한 서비스 <br> 
			<input type="radio" name="service" value="목욕">목욕
			<input type="radio" name="service" value="산책">산책 
			<input type="radio" name="service" value="픽업">픽업<br> <br>
		
			<div style="margin: 0 auto; width: 500px; height: 500px;" align="center">
				<img id="UploadedImg" style="border: 3px solid #DFDFDF;" src="${petsitterVO.houseImg}" class="center-block img-circle img-responsive" width="90%"
					height="90%"> *집 사진 
				<input id="house_img" name="file[0]" type="file" onchange="readURL(this)">
			</div><br> <br>
		
			<div style="margin: 0 auto; width: 500px; height: 500px;" align="center">
				<img id="UploadedImg2" style="border: 3px solid #DFDFDF;" src="${petsitterVO.petsitterImg}"
					class="center-block img-circle img-responsive" width="90%" height="90%"> *펫시터 사진 <input id="petsitter_img"
					name="file[1]" type="file" onchange="readURL2(this)">
			</div>
			<hr>
		
			*공지사항 확인하셨나요? <br> 
			<input type="radio" name="checkedAll">네 확인했습니다! <br> <br> 
			<input type="hidden" name="petsitterNo" value="${petsitterVO.petsitterNo}"> 
			<input type="hidden" name="orgHouseImg" value="${petsitterVO.houseImg}"> 
			<input type="hidden" name="orgPetsitterImg" value="${petsitterVO.petsitterImg}"> 
			<input type="submit" class="active btn btn-block btn-default" value="수정하기"> <br><br>
		</div>
	</form>
</div>
</div>