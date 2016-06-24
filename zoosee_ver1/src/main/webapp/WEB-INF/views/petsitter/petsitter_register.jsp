<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
 	$(document).ready(function(){
 	      var rank="${sessionScope.mvo.rank}";
 	       if(rank=="petsitter"){
 	          alert("이미 승인된 회원입니다!");
 	          $(location).attr('href',"home.do");
 	       }
 		
		$("#registerPetsitterForm").submit(function(){
			var name = $("#name").val();
			var gender = $("input[name=gender]:checked").val();
			var price = $("#price").val();
			var petNumber = $("input[name=petNumber].checked").val();
			var service = $("input[name=service]:checked").val();
			var petType = $("input[name=petType]:checked").val();
			var petSize = $("input[name=petSize]:checked").val();
			var house_img = $("#house_img").val();
			var petsitter_img = $("#petsitter_img").val();
			var checkedAll = $("input[name=checkedAll]:checked").val();

			if(name==""){
				alert("이름을 입력해 주세요!");
				return false;
			}else if(gender==undefined){
				alert("성별을 선택해 주세요!");
				return false;
			}else if(price==""){
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
		});//submit
	});

 	
    function readURL(input) {
        if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                $('#UploadedImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
           }
        }
    
    function readURL2(input) {
        if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                $('#UploadedImg2').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
           }
        }

</script>

<br><br>
<h3 align="center">ZOOSEE 돌보미 신청서</h3><br><br>
 
<div style="text-align: center; text-align: center; width: 30%; margin-left: 35%" >
<blockquote>
  <p>*지원하기전 확인해주세요!<br>
ZOOSEE 는 그 어떤 스킬이나 역량보다 "동물에 대한 진심과 사랑"을<br> 최우선으로 돌보미분을 모시고 있습니다.<br>
따라서 강아지에 대한 진심을 담아 지원서를 진정성있게 <br>작성해주시면 감사하겠습니다!<br><br>
*이런 분들은 지원이 어려워요<br>
1. 미성년자 / 2. 임산부 /  3. 열살미만의 아동과 함께 거주하시는 분 <br>	  4. 한달 20일 이상 활동이 불가능한 경우<br><br>
</p>
  <small>잠깐! 회원가입은 하셨나요? <cite title="Source Title"><a href="member_register.do">ZOOSEE 가입하러가기</a></cite></small>
</blockquote>
</div>



<br>
<br>

<div style="border:1px solid #DFDFDF; border-radius: 6px;  background-color:#F4F4F4;  text-align: center; width: 30%; margin-left: 35%">
<form action="interceptor_petsitter_registerPetsitter.do" method="post" enctype="multipart/form-data" id="registerPetsitterForm" style="text-align: center;">
<br>
<div class="form-group" style="width:200px; text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*지원자 성명</label>
  <div class="input-group">
    <span class="input-group-addon">name</span>
    <input type="text" class="form-control" style="height: 60%" id="name" name="name"
    onclick="ClearNameText">
  </div>
</div>


*지원자 성별 <br>
<input type="radio" name="gender" value="male">남성! <input type="radio" name="gender" value="female">여성! <br><br>


<div class="form-group" style="width:200px;  text-align: center; margin-left: auto; margin-right: auto;" >
  <label class="control-label">*원하시는 가격(1박)</label>
  <div class="input-group">
    <span class="input-group-addon">$</span>
    <input type="text" class="form-control" style="height: 60%" name="price" id="price">
  </div>
</div>


*가능한 펫 종류 <br>
<input type="radio" name="petType" value="dog">강아지
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
            src="${initParam.root}resources/image/Pzoosee.png"
            class="center-block img-circle img-responsive" width="90%" height="90%">
            *집 사진
         <input id="house_img" name="file[0]" type="file" onchange="readURL(this)">
  </div><br><br>
  
  
 <div style=" margin:0 auto; width:500px; height:500px;" align="center">
         <img id="UploadedImg2" style="border: 3px solid #DFDFDF;"
            src="${initParam.root}resources/image/Pzoosee.png"
            class="center-block img-circle img-responsive" width="90%" height="90%">
            *돌보미 사진
         <input id="petsitter_img" name="file[1]" type="file" onchange="readURL2(this)">
  </div>

<hr>

*돌보미는 지원자 '본인에 한해서만' 활동 가능합니다. 확인하셨나요? <br>
<input type="radio" name="checkedAll" >네 확인했습니다! <br><br>
<input type="submit" class="active btn btn-block btn-default" value="신청하기">
<br><br>
</form>


</div>