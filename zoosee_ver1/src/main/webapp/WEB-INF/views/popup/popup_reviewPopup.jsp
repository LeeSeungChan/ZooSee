<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	$(document).ready(function(){
		$("#reviewBtn").click(function(){
	 		if($("#textConent").val()==""){
	 			alert("후기를 입력하세요!");
	 			$("#textConent").focus();
	 			return false;
	 		}
	 		
	 		if(confirm("등록하시겠습니까?")){
	 			var id="${mvo.id}";
	 			var url="${initParam.root}interceptor_tradeInfo_inputReview.do?ref_id=${param.id}&id="+id+"&star_rate="+$('#star_rate').val()+"&content="+$('#textConent').val();
	 			opener.parent.location=url;
	 			window.close();
	 		}
		
	 	});
	 	
		
		$("#cBtn").click(function(){
			window.close();
		});
		
		   $( ".star_rating a" ).click(function() {
		          $(this).parent().children("a").removeClass("on");
		          $(this).addClass("on").prevAll("a").addClass("on");
		          var index = $('.on').length;
		          $("#star_rate").val(index);
		       
		   
		   });
	});
</script>
</head>
<body>

<form  id="reviewForm"action="interceptor_tradeInfo_inputReview.do">
	<input type="hidden" name="ref_id" value="${param.id}">
	<input type="hidden" name="id" value="${SessionScope.mvo.id}">
	
<%--댓글작성란 --%>
<div class="BJReplyInput" >
<h2 style="margin-left: 13%;">${param.id}님에 대한 후기를 작성해주세요~!</h2>
<hr>
<p class="star_rating" style="margin-left: 13%;">
             <a href="#" class="on">★</a>
                <a href="#" class="on">★</a>
                <a href="#" class="on">★</a>
                <a href="#" >★</a>
                <a href="#" >★</a>
            </p>
            <input type="hidden" name="star_rate" id="star_rate" value=3>
	<table>
	 
		<tr>
			<td><textarea id="textConent" style="resize:none;margin-left: 17%;" class="BJform-controlBig2 input-lg" name="content" rows="3" cols="60"  ></textarea></td>
			<td align="center"><input class="BJBigButton"  id="reviewBtn"	type="button" value="댓글쓰기"></td>
		</tr>
	</table>
	
	<hr>
	<div style="margin-left: 45%;"><input type="button" class="BJbtn2" id="cBtn" value="취소" ></div>
</div>	
	
	
	     
</form>
</body>
</html>