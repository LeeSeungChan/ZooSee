<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script type="text/javascript">
	$(document).ready(function(){
		
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
		            		   alert("비밀번호가 확인되었습니다.");
		            		   $("#checked").css("display","block");
		            		   $("#unchecked").css("display","none");
		            	   }else{
		            		  	alert("비밀번호가 일치하지 않습니다");
		            		  	return false;
		            	   }
		               }//success
				});//ajax
			});//onclick

		
		$("#password").focus();
		$("#existence option[value="+"'${mvo.existence}'"+"]").attr('selected', 'selected');
      $("input:radio[name=gender][value=" + '<c:out value="${ mvo.gender }"/>' + "]").attr("checked","checked");
      $("#password").keyup(function(){
         $("#passCheckView").empty();
         $("#passView").empty();
         if($("#password").val().length<6){
            $("#passView").html("비밀번호는 6자 이상 가능");
         } else{
            $("#passView").html("비밀번호 사용 가능");
            if($("#passwordCheck").val()==""){
               $("#passCheckView").html("비밀번호를 재확인하세요.");
            }else{
               if($("#passwordCheck").val()==$("#password").val()){
                  $("#passCheckView").html("비밀번호 일치");
               }else{
                  $("#passCheckView").html("비밀번호 불일치");
               }
            }
         }
      });
      $("#passwordCheck").keyup(function(){
         $("#passCheckView").empty();
         if($("#passwordCheck").val()==$("#password").val()){
            $("#passCheckView").html("비밀번호 일치");
         }else{
            $("#passCheckView").html("비밀번호 불일치");
         }
      });
      $("#updateForm").submit(function(){
         if($("#name").val()==""){
            alert("이름를 입력하세요.");
            $("#name").focus();
            return false;
         }else if($("#password").val()==""){
            alert("비밀번호를 입력하세요.");
            $("#password").focus();
            return false;
         }else if($("#passwordCheck").val()==""){
            alert("비밀번호를 확인하세요.");
            $("#passwordCheck").focus();
            return false;
         }else if($("#address").val()==""){
            alert("주소를 입력하세요.");
            return false;
         }else if($("#email").val()==""){
            alert("메일을 입력하세요.");
            return false;
         }else if($("#tel").val()==""){
            alert("전화번호를 입력하세요.");
            return false;
         }else if($("#job").val()==""){
            alert("직업을 입력하세요.");
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
            return false;
         }
      });
      $("#cancle").click(function(){
         if(confirm("회원 정보 수정을 취소하시겠습니까?")){
            location.href="interceptor_member_detail.do";
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

<!-- 비밀번호 확인 폼 -->

<span id="unchecked">
<div class="WJcontainer3">
	<div style="border: 1px solid #0f0fd9; border-radius: 10px; height: 550px; width:50%;  margin-top:10%; margin-left:25%; background-color: white">
	<%-- <img src="${initParam.root}resources/image/Mmain.jpg" style="position: absolute; height:230px;  width:30%;"> --%>
	<div class="WJLayout2"
		style=" text-align: left;">
		<!-- 사진 중간 정렬 시작-->
		<div align="center">
			<a href="home.do"><img
				src="${initParam.root}resources/image/Mzoosee.png"></a>
		</div>
		<!-- 사진 중간 정렬 끝-->
		<form action="" id="memberLoginForm" method="post" >
		<!-- 왼쪽 시작-->
		<div style="float: center; " >
		정보 수정을 위해 	비밀번호를 입력해주세요.<br>
		<div class="WJform-group">
			<input type="hidden" id="id" value="${sessionScope.mvo.id}">
			<input class="WJform-control" id="password"
				name="password" placeholder="Password" type="password">
			<input type="hidden" name="checked" id="checked" value="false">
		</div>
		<br>
		<button type="button" class="active WJbtn btn-block btn-primary" style="margin-bottom: 5%" id="pass_check_btn">확인</button>
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
</span>



   
   
<span id="checked">
   <!-- 더블헤더 -->
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA" href="${initParam.root}interceptor_member_detail.do">마이페이지</a>
	<a class="BJA" href="${initParam.root}interceptor_member_update.do">회원정보수정</a>
	<c:if test="${sessionScope.mvo.rank == 'petsitter' || sessionScope.mvo.rank == 'petmaster'}">
       <a class="BJA" href="${initParam.root}interceptor_petsitterboard_registerform.do?id=${sessionScope.mvo.id}"> 돌보미게시글등록</a>
       <a class="BJA" href="${initParam.root}interceptor_petsitterboard_myPetsitterBoard.do">내 글 보기</a>
     </c:if>
	</div>
</div>
</div>
<div class="WJcontainer4" >   
<div align="center">
<a href="home.do"><img src="${initParam.root}resources/image/Mzoosee.png"></a>
</div>
        <div class="WJLayout"
		style="text-align: left;" id="member_register">
            <form action="interceptor_member_update_result.do" method="post" id="updateForm">
               <div class="WJform-group">
                <label>id</label>
                <input class="WJform-control"  type="text" name="id" value="${mvo.id}" readonly="readonly">
              </div>
              <div class="WJform-group">
                <label>Password</label>
                <input class="WJform-control" id="password" name="password"placeholder="Password" type="password">
                <span id="passView"></span>
              </div>
              <div class="WJform-group">
                <label>PasswordCheck</label>
                <input class="WJform-control" id="passwordCheck" name="passwordCheck" placeholder="PasswordCheck" type="password">
                <span id="passCheckView"></span>
              </div>
               <div class="WJform-group">
                <label>Name</label>
                <input class="WJform-control" type="text" name="name" value="${mvo.name}">
              </div>
              <div class="WJform-group">
                  <label>Address</label>
                  <div class="WJform-group">
                   <input class="WJform-control2" style=" float:left; width:49.5%;" type="text" id="addressCode" name="addressCode" value="${mvo.addressCode}" readonly="readonly">
                   <a href="javascript:openDaumPostcode()" >
                   <input class="active WJbtn btn-default" style="float:right; width:49.5%;" type="button" value="Zip Code">
                   </a>
                  </div>
              </div>
              <div class="WJform-group">
            <input class="WJform-control " type="text" name="address" id="address" value="${mvo.address}" readonly="readonly">
             <input class="WJform-control " type="text" value="${mvo.detailAddress}" name="detailAddress" id="detailAddress" placeholder="Enter Address">
             <input type="hidden" name="dong_addr" id="dong_addr" value="">
           </div>
              <div class="WJform-group">
                <label>Email address</label>
                <input class="WJform-control" type="text" name="email" value="${mvo.email}" >
              </div>
              <div class="WJform-group" align="center">
                <div class="radio">
                  <label class="radio-inline">
                    <input type="radio" name="gender" value="man" >MAN</label>
                  <label class="radio-inline">
                    <input type="radio" name="gender" value="woman" >WOMAN</label>
                </div>
              </div>
              <div class="WJform-group">
                <label>Tel</label>
                <input class="WJform-control" type="text" value="${mvo.tel}" name="tel">
              </div>
               <div class="WJform-group">
                <label>Job</label>
                <input class="WJform-control" type="text" value="${mvo.job }" name="job">
              </div>
               <div class="WJform-group">
                <label>Existence</label>
                <select class="WJform-control"  id="existence" name="existence" >
                      <option value="" selected>선택하세요.</option>
                    <option value="키워본 경험이 없다.">키워본 경험이 없다.</option>
               <option value="키워본 경험이 있다.">키워본 경험이 있다.</option>
               <option value="현재 키우고 있다.">현재 키우고 있다.</option>
                </select>
              </div>
              <br>
               <div align="center">
                 <input type="submit" class="active WJbtn btn-default" value="Confirm" style="float:left; width:49.5%;"> 
                <input type="button" class="active WJbtn btn-default" value="Cancle" id="cancle" style="float:right; width:49.5%;">
               </div>
             </form>       
          </div>
          </div>
</span> 