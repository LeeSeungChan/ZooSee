<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script type="text/javascript">
   $(document).ready(function() {
	  $("#id").focus();
      $("#id").keyup(function() {
         var id=$("#id").val();
         $("#idView").empty();
         if (id.length < 4 || id.length > 11) {
            $("#idView").html("아이디는 4자 이상 11자 이하만 가능").css("background","pink");
         } else {
            $("#idView").html("사용가능").css("background","yellow");
            $.ajax({
               type : "post",
               url : "memberIdCheck.do",
               data : "id="+id,
               success : function(jsonData) {
                  if(jsonData=="1"){
                     $("#idView").html("중복된 아이디로 사용불가").css("background","red");
                  }else {
                     $("#idView").html("사용가능").css("background","yellow");
                  }
               }
            });
         }
      });
      $("#password").keyup(function(){
         $("#passCheckView").empty();
         $("#passView").empty();
         if($("#password").val().length<6){
            $("#passView").html("비밀번호는 6자 이상 가능").css("background","red");
         } else{
            $("#passView").html("비밀번호 사용 가능").css("background","yellow");
            if($("#passwordCheck").val()==""){
               $("#passCheckView").html("비밀번호를 재확인하세요.").css("background","red");
            }else{
               if($("#passwordCheck").val()==$("#password").val()){
                  $("#passCheckView").html("비밀번호 일치").css("background","yellow");
               }else{
                  $("#passCheckView").html("비밀번호 불일치").css("background","red");
               }
            }
         }
      });
      $("#passwordCheck").keyup(function(){
         $("#passCheckView").empty();
         if($("#passwordCheck").val()==$("#password").val()){
            $("#passCheckView").html("비밀번호 일치").css("background","yellow");
         }else{
            $("#passCheckView").html("비밀번호 불일치").css("background","red");
         }
      });
      $("#memberRegisterForm").submit(function(){
          if($("#id").val()==""){
            alert("아이디를 입력하세요.");
            $("#id").focus();
            return false;
         }else if($("#password").val()==""){
            alert("비밀번호를 입력하세요.");
            $("#password").focus();
            return false;
         }else if($("#passwordCheck").val()==""){
            alert("비밀번호확인란을 입력하세요.");
            $("#passwordCheck").focus();
            return false;
         }else if($("#name").val()==""){
            alert("이름을 입력하세요.");
            $("#name").focus();
            return false;
         }else if($("#address").val()==""){
             alert("주소를 입력하세요.");
             return false;
          }else if($("#detailAddress").val()==""){
            alert("상세 주소를 입력하세요.");
            $("#detailAddress").focus();
            return false;
         }else if($("#email").val()==""){
            alert("메일을 입력하세요.");
            $("#email").focus();
            return false;
         }else if($("input:radio[name=gender]:checked").length==0){
            alert("성별을 선택하세요.");
            return false;
         }else if($("#tel").val()==""){
            alert("전화번호를 입력하세요.");
            $("#tel").focus();
            return false;
         }else if($("#job").val()==""){
            alert("직업을 입력하세요.");
            $("#job").focus();
            return false; 
         }else if($("#idView").html()!="사용가능"){
            alert("사용가능한 아이디를 입력하세요.");
            $("#id").focus();
            return false;
         }else if($("#passView").html()!="비밀번호 사용 가능"){
            alert("사용가능한 비밀번호를 입력하세요.");
            $("#password").focus();
            return false;
         }else if($("#passCheckView").html()!="비밀번호 일치"){
            alert("비밀번호를 일치하세요.");
            $("#passwordCheck").focus();
            return false;
         }else if($("#existence").val()==""){
            alert("펫 양육 경험을 선택하세요.");
            $("#existence").focus();
            return false;
         }
      });
   });
</script>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
   <script>
   var daumPostcode;
   daum.postcode.load(function(){
         daumPostcode = new daum.Postcode({
               oncomplete: function(data) {
                  $("#dong_addr").val(data.sido + " " + data.sigungu + " " + data.bname);
         document.getElementById('addressCode').value = data.postcode || data.zonecode;
         document.getElementById('address').value = data.address;
         document.getElementById('detailAddress').focus();
               }
         });
   });
         function openDaumPostcode() {
             daumPostcode.open();
         }

   </script>
<!-- 전체 시작 -->
<div class="WJcontainer4">
	<!-- 텍스트는 왼쪽 정렬 및 삽입 중간 정렬 -->
	<div class="WJLayout"
		style="text-align: left;">
		<form action="registerMember.do" method="post" id="memberRegisterForm">
		<!-- 사진 중간 정렬 시작-->
		<div align="center">
			<a href="home.do"><img
				src="${initParam.root}resources/image/Mzoosee.png"></a>
		</div>
		<!-- 사진 중간 정렬 끝-->
		<div class="WJform-group">
		<label>id</label> 
		<input class="WJform-control" id="id" name="id"
			placeholder="id" type="text"><span id="idView"></span>
		</div>
		
		<div class="WJform-group">
		<label>Password</label>
		<input class="WJform-control" id="password" name="password"
			placeholder="Password" type="password"><span id="passView"></span>
		</div>
		
		<div class="WJform-group">
		<label>PasswordCheck</label> 
		<input class="WJform-control"
			id="passwordCheck" name="passwordCheck" placeholder="PasswordCheck"
			type="password"><span id="passCheckView"></span>
		</div>
		
		<div class="WJform-group">
		<label>Name</label>
            <input class="WJform-control" id="name" name="name" placeholder="Name" type="text">
        </div>
        
        <div class="WJform-group">
        <label>Address</label>
        <div>
        	<input class="WJform-control2" style="float: left; width: 49.5%;" type="text" id="addressCode" name="addressCode" value="" readonly="readonly">
			<a href="javascript:openDaumPostcode()"> 
			<input class="active WJbtn btn-default" style="float: right; width: 49.5%;" type="button" value="Zip Code">
			</a> 
        <div class="WJform-group">
            <input class="WJform-control " type="text" name="address" id="address" value="" readonly="readonly">
             <input class="WJform-control " type="text" value="" name="detailAddress" id="detailAddress" placeholder="Enter Address">
             <input type="hidden" name="dong_addr" id="dong_addr" value="">
        </div>
		</div>
        </div>
		<div class="WJform-group">
                <label>Email address</label>
                <input class="WJform-control" type="email" name="email" placeholder="email" >
        </div>
		<div class="WJform-group">
            <div class="radio" align="center">
                  <label class="radio-inline">
                    <input type="radio" name="gender" value="man">MAN</label>
                  <label class="radio-inline">
                    <input type="radio" name="gender" value="woman">WOMAN</label>
             </div>
        </div>
        <div class="WJform-group">
              <label>Tel</label>
            <input class="WJform-control" id="tel" name="tel" placeholder="tel" type="text">
        </div>
        <div class="WJform-group">
              <label>Job</label>
            <input class="WJform-control" id="job" name="job" placeholder="job" type="text">
        </div>
        <div class="WJform-group">
          <label>Existence</label>
             <select class="WJform-control"  id="existence" name="existence">
                      <option value="">-Select-</option>
                    <option value="키워본 경험이 없다.">키워본 경험이 없다.</option>
               <option value="키워본 경험이 있다.">키워본 경험이 있다.</option>
               <option value="현재 키우고 있다.">현재 키우고 있다. </option>
             </select>
        </div>
		<br>
        <button type="submit" class="active WJbtn btn-block btn-default">Submit</button>
        </form>
	</div>
</div>
<!-- 전체 끝 -->
