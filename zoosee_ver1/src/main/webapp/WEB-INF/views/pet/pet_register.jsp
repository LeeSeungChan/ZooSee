<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">

		/*사진 바로 업로드 미리보기*/
		function readURL(input) {
		if (input.files && input.files[0]) {
  			  var reader = new FileReader();
   			 reader.onload = function (e) {
   		     $('#UploadedImg').attr('src', e.target.result);
  		  }
  		  reader.readAsDataURL(input.files[0]);
			}
		}
		function aaa(input){

			alert("click");
			readURL(input);
		}
     $(document).ready(function(){
    	$("#regForm").submit(function(){ 
    		if($("#petName").val()==""){
    			alert("펫의 이름을 입력하세요!");
    			$("#petName").focus();
    			return false;
    		}else if($("#petAge").val()==""){
    			alert("펫의 나이를 입력하세요!");
    			$("#petAge").focus();
    			return false;
    		}else if(isNaN($("#petAge").val())){
    			alert("펫의 나이는 숫자로 입력하세요!");
    			$("#petAge").focus();
    			return false;
    		}else if($("#petType").val()==""){
    			alert("펫의 종류를 입력하세요!");
    			$("#petType").focus();
    			return false;
    		}else if($("input:radio[name=petGender]:checked").length==0){
    			alert("펫의 성별을 입력하세요!");
    			return false;
    		}else if($("input:radio[name=petNeutral]:checked").length==0){
    			alert("펫의 중성화 여부를 입력하세요!");
    			return false;
    		}else if($("#petImg2").val()==""){
    			alert("펫의 이미지를 입력하세요!");
    			return false;
    		}else if($("#petSize").val()==""){
    			alert("펫의 크기를 입력하세요!");
    			return false;
    		}else if($("#petEtc").val()==""){
    			alert("펫의 특이사항을 입력하세요!");
    			$("#petEtc").focus();
    			return false;
    		}else{
    			$("#regForm").submit();
    		}
    	}); 
    }); 	 
</script>
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
				<h3 class="panel-title">반려동물 등록</h3>
			</div>
			<div class="panel-body">${mvo.name }님의 소중한 반려동물을 등록하기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">${mvo.name }님의 소중한 반려동물의 등록</div>
	</div>
<!-- 전체 시작 -->
<div class="WJcontainer7">
<form method="post" action="interceptor_registerPet.do" id="regForm" enctype="multipart/form-data">
		<!-- 왼쪽 시작-->
		<div style="float:left; width:50%;">
		<br>
		<div style=" margin:0 auto; width:400px; height:400px;">
			<img id="UploadedImg" style="border: 1px solid black;"
				src="${initParam.root}resources/image/Pzoosee.png"
				class="center-block img-circle img-responsive" width="90%" height="90%">
				<div align="center" >
			<input id="petImg2" name="petImg2" type="file" onchange="readURL(this)">
				</div>
		</div>
		</div><!-- 왼쪽 끝 -->
		<!-- 오른쪽 시작 -->
		<div style=" float:right; width:50%;">
		<label>Pet Name</label> 
			<input class="WJform-control" id="petName" name="petName" placeholder="Pet Name" type="text">
	  	<label>Pet Age</label>
           <input class="WJform-control" id="petAge" name="petAge" placeholder="Pet Age" type="text">
        <label>Pet Type</label>
             <select class="WJform-control"  id="petType" name="petType">
               <option value="">-Select-</option>
               <option value="강아지">강아지</option>
               <option value="고양이">고양이</option>
               <option value="새">새</option>
               <option value="파충류">파충류</option>
             </select>
        <label>Pet Gender</label>
      	<div class="radio" align="center">
           <label class="radio-inline">
                <input type="radio" name="petGender" value="man">MAN</label>
                <label class="radio-inline">
                 <input type="radio" name="petGender" value="woman">WOMAN</label>
        </div>
        <label>Pet Neutral</label>
      	<div class="radio" align="center">
           <label class="radio-inline">
                <input type="radio" name="petNeutral" value="yes">Yes</label>
                <label class="radio-inline">
                 <input type="radio" name="petNeutral" value="no">No</label>
         </div>
         <label>Pet Size</label>
             <select class="WJform-control"  id="petSize" name="petSize">
               <option value="">-Select-</option>
               <option value="Small">Small</option>
               <option value="Medium">Medium</option>
               <option value="Large">Large</option>
             </select>
         <label>Etc</label>
         <br>
          <textarea class="WJform-control2" id="petEtc" name="etc"  placeholder="Pet Etc" rows="4" style="width:100%; resize:none;"></textarea>
          <br>
          <button type="submit" class="active WJbtn btn-block btn-default">Submit</button> 
          
        </div> <!-- 오른쪽 끝 -->
        </form>
        </div>
</div><!-- 전체 끝 -->