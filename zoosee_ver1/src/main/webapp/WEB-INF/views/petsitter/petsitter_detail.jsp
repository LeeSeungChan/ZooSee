<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">


$( document ).ready(function() {
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    var index = $('.on').length
    alert(index);
    return false;
});
});


</script>



<br>
<div class="BJMainKING">
<div style="border:1px  solid red; width: 60%; margin-left: 20%; margin-right: 20%; height: auto; margin-bottom:10% ">
<div style="border: 1px solid red; height: 170px; background-color:#F5F5F5;">
<div style="border:1px solid red; margin:0 auto; width:220px; height:220px; float: left;" >
         <img id="UploadedImg" style="border: 3px solid #DFDFDF;"
            src="${initParam.root}${petsitterVO.petsitterImg}"
            class="center-block img-circle img-responsive" width="90%" height="90%">
</div>

<span style="border: 1px solid red; margin-top: 4%; float: left;">
<h2 style="color: #868686;">${petsitterVO.memberVO.name }<h6>${petsitterVO.memberVO.rank }</h6></h1>
<h6 style="color: #868686;">님의 페이지</h6>
</span>

<div style="border: 1px solid black; float: right; margin-top: 3%; margin-right: 4%;">
	<img src="${initParam.root}resources/image/recog.PNG">
</div>



</div>
<br><br><br>

<div style="border: 1px solid black; width: 40%; float:left; height: 400px; border-radius: 10px;"> 	
<div style="border: 1px solid red; width: 100%; height: 15%; border-radius: 10px; background-color: #F5F5F5; ">
	<h3 style="color: #868686; margin-left: 10%;">*POTHO</h3>
</div>
<div style="border: 1px solid blue; width: 100%; height: 85%;border-radius: 10px;">
<img src="${initParam.root }${petsitterVO.houseImg}" style="height: 100%; width: 100%; border-radius: 10px;">
</div>

</div>


<div style="border: 1px solid black; width: 50%; float:right; height: 400px; border-radius: 10px;"> 	
<div style="border: 1px solid red; width: 100%; height: 15%; border-radius: 10px; background-color: #F5F5F5; ">
	<h3 style="color: #868686; margin-left: 10%;">*DETAIL</h3>
</div>


<div style="border:1px solid red; margin:0 auto; width:30%; height:40%; float: left;" >
         <img id="UploadedImg" style="border: 3px solid #DFDFDF;"
            src="${initParam.root}${petsitterVO.petsitterImg}"
            class="center-block img-circle img-responsive" width="85%" height="90%">
</div>	
<h3 style="color: #6EB9B5; margin-left: 10%;">${petsitterboardVO.petsitterboard_title }</h3> 

돌보미이름 :&nbsp;${petsitterVO.memberVO.name }<br>
<img src="${initParam.root}resources/image/location.png">  주소 어쩌고저쩌고(입력) <br>
${petsitterVO.memberVO.existence }<br>
제공가능한 서비스:&nbsp;${petsitterVO.service }<br>
E-MAIL : 거래승인시 관람하실 수 있습니다.<br>
TEL : 거래승인시 관랍하실 수 있습니다.<hr>



<p align="right">1박</p>
<h1 align="right">${petsitterVO.price }원</h1>
<span class="star-rating" style="border: 1px solid red; margin-left: 64%" >
<span style ="width:90%"></span>
</span>

</div>


<div style="border: 1px solid; float: bottom; margin-top: 34%;">
</div>

<div class="BJReplyAllLine" style="width: 100%; margin-left: 0%">
<%--댓글리스트 --%>
<!-- 댓글리스트 div -->
<div class="BJReplyList" >
<table  style="width:100%;">
		<tr>
			<td colspan="5" align="center"><h3 style="color: #6EB9B5;">등록된 후기가 없습니다!! 첫번 째 고객님이 되어주세요!! >_<</h3>
			</td>
		<tr>
			<td colspan="5"><hr></td>
		</tr>
</table>
</div >
<%--댓글작성란 --%>
<div class="BJReplyInput" >
<form action="interceptor_review_write.do" id="reviewForm">
	<table>
		<tr>
			<td>${sessionScope.mvo.id }</td>
			<td><textarea style="resize:none;" class="BJform-controlBig2 input-lg" name="content" id="content"  rows="3" cols="100"  ></textarea></td>
			<td align="center"><input class="BJBigButton" 	type="submit" value="댓글쓰기"></td>
		</tr>
	</table>
	<input type="hidden" name="id" value="${sessionScope.mvo.id }">
	<input type="hidden" name="ref" value="${requestScope.freeBoardVO.freeBoardNo }">
</form>	
</div>
</div>





<br><br><br>
</div>
</div>