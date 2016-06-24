<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
	 	
	       $("#updateForm").submit(function(){
	    	    var price = $("#price").val();
				var petNumber = $("input[name=petNumber].checked").val();
				var service = $("input[name=service]:checked").val();
				var petType = $("input[name=petType]:checked").val();
				var petSize = $("input[name=petSize]:checked").val();
				var house_img = $("#house_img").val();
				var petsitter_img = $("#petsitter_img").val();
				var checkedAll = $("input[name=checkedAll]:checked").val();
				
				 if(price==""){
						alert("가격을 입력해주세요!");
						return false;
					}else if(isNaN(price)){
						alert("가격을 숫자로 입력해주세요!");
						return false;
					}else if(service==undefined){
						alert("제공 가능한 서비스를 선택해주세요!")
						return false;
					}else if(petType==undefined){
						alert("팻 종류를 선택해주세요!");
						return false;
					}else if(petSize==undefined){
						alet("팻 사이즈를 선택해주세요!");
						return false;
					}else if(house_img==""){
						alert("집 사진을 등록해주세요!");
						return false;
					}else if(petsitter_img==""){
						alert("본인 사진을 등록해주세요!");
						return false;
					}else if(checkedAll==undefined){
						alert("필수사항에 체크해주세요!");
						return false;
					}
				 if (confirm("수정 하시겠습니까?")){
					 	return true;
					}else{
					 	return false;
					}
	       });//submit
	});//ready

</script>

<form name="updateForm" action="interceptor_petsitter_update.do" style="text-align: center;"
method="post" enctype="multipart/form-data" id="updateForm">

<br><br>
<h3 align="center">ZOOSEE 돌보미 정보수정</h3><br><br>
<br>
<br>

<div style="text-align: center; text-align: center; width: 30%; margin-left: 35%" >
<blockquote>
  <p>
  *수정하기전 확인해주세요!<br>
회원정보 수정시 일반등급의 회원으로 재조정되며<br> 관리자의 승인을 다시 받아야 합니다.<br><br>
*승인신청은 자동으로 되며 관리자 승인 후 돌보미게시판을 이용하실 수 있습니다!<br>
<br>
</p>
  <small>잠깐! 회원가입은 하셨나요? <cite title="Source Title"><a href="member_register.do">ZOOSEE 가입하러가기</a></cite></small>
</blockquote>
</div>
<br>


<div style="border:1px solid #DFDFDF; border-radius: 6px;  background-color:#F4F4F4;  text-align: center; width: 30%; margin-left: 35%">

<br>

<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*돌보미님 아이디</label>
  <div class="input-group">
    <span class="input-group-addon">ID</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.memberVO.id }">
  </div>
</div>

<br>

<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*돌보미님 이름</label>
  <div class="input-group">
    <span class="input-group-addon">NAME</span>
    <input type="text" class="form-control" style="height: 60%; background-color:#F4F4F4; " id="name" name="name"
    readonly="readonly" value="${petsitterVO.memberVO.name }">
  </div>
</div>

<br>

<div class="form-group" style="width:200px;  text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*원하시는 가격(1박)</label>
  <div class="input-group">
    <span class="input-group-addon">$</span>
    <input type="text" class="form-control" style="height: 60%" name="price" id="price">
  </div>
</div>

<br>

*가능한 펫 종류 <br>
<input type="radio" name="petType" value="dog">멍뭉이
<input type="radio" name="petType" value="cat">야옹이<br><br>

*원하는 펫 크기 <br>
<input type="radio" name="petSize" value="small"> 아기팻
<input type="radio" name="petSize" value="middle"> 보통
<input type="radio" name="petSize" value="big"> 커더란 팻!<br> <br>

*돌봄 가능한 팻  <br>
<input type="radio" name="petNumber" value="1">한마리
<input type="radio" name="petNumber" value="2">두마리
<input type="radio" name="petNumber" value="3">세마리<br><br>

*제공 가능한 서비스 <br>
<input type="radio" name="service" value="목욕">목욕
<input type="radio" name="service" value="산책">산책
<input type="radio" name="service" value="픽업">픽업<br><br>

<div style=" margin:0 auto; width:500px; height:500px;" align="center">
         <img id="UploadedImg" style="border: 3px solid #DFDFDF;"
            src="${petsitterVO.houseImg}"
            class="center-block img-circle img-responsive" width="90%" height="90%">
            *집 사진
         <input id="house_img" name="file[0]" type="file" onchange="readURL(this)">
  </div><br><br>

 <div style=" margin:0 auto; width:500px; height:500px;" align="center">
         <img id="UploadedImg2" style="border: 3px solid #DFDFDF;"
            src="${petsitterVO.petsitterImg}"
            class="center-block img-circle img-responsive" width="90%" height="90%">
            *돌보미 사진
         <input id="petsitter_img" name="file[1]" type="file" onchange="readURL2(this)">
  </div>
  
  
<hr>


*공지사항 확인하셨나요? <br>
<input type="radio" name="checkedAll" >네 확인했습니다! <br><br>
<input type="hidden" name="petsitterNo" value="${petsitterVO.petsitterNo}">
<input type="submit" class="active btn btn-block btn-default" value="수정하기">
<br><br>
</form>    

</div>
