<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="${initParam.root}resources/css/bootstrap.css">
<script type="text/javascript">

	$(document).ready(function(){
		$("#reviewForm").submit(function(){
			if(confirm("입력하시겠습니까?")){
				window.close();
			}else{
				return false;
			}
		});
		
		
		   $( ".star_rating a" ).click(function() {
		          $(this).parent().children("a").removeClass("on");
		          $(this).addClass("on").prevAll("a").addClass("on");
		          var index = $('.on').length;
		          alert(index);
		          $("#star_rate").val(index);
		       
		   
		   });
	});
</script>
</head>
<body>
${param.id}님에 대한 후기를 작성해주세요~!
<form method="post", id="reviewForm"action="interceptor_tradeInfo_inputReview.do">
	<input type="hidden" name="ref_id" value="${param.id}">
	<input type="hidden" name="id" value="${SessionScope.mvo.id}">
	<textarea   style="resize:none;" name="content" rows="10" ></textarea>
	<input type="submit" value="입력">
	      <p class="star_rating">
             <a href="#" class="on">★</a>
                <a href="#" class="on">★</a>
                <a href="#" class="on">★</a>
                <a href="#" class="on">★</a>
                <a href="#" class="on">★</a>
            </p>
            <input type="hidden" name="star_rate" id="star_rate" value=5>
	<input type="button" value="취소" >
</form>
</body>
</html>