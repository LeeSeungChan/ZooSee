<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#updateForm").submit(function(){ 
    		if($("#updateForm :input[name=freeBoardTitle]").val()==""){
    			alert("제목을 입력하세요!");
    			$("#updateForm :input[name=freeBoardTitle]").focus();
    			return false;
    		}
    		if($("#updateForm :input[name=freeBoardContents]").val()==""){
    			alert("본문을 입력하세요!");
    			$("#updateForm :input[name=freeBoardContents]").focus();
    			return false;
    		}
    	});
    	

    });	
</script>
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}interceptor_freeBoard_list.do">자유게시판</a> 
			<a class="BJA" href="${initParam.root}interceptor_freeBoard_write.do" >자유게시판 글등록</a>
			<a class="BJA" href="${initParam.root}interceptor_qna_list.do">Q&A게시판</a> 
			<a class="BJA" href="${initParam.root}interceptor_qna_board_register.do">Q&A 등록</a>
		</div>
	</div>
</div>
<!-- 자유게시판 업데이트 메인 -->
<div class="BJMainDiv" >
<div class="BJPanel" style="width:80%;	 margin-left:10%;">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">자유게시판</h3>
  </div>
  <div class="panel-body">
    자유게시판은 펫맘들과 펫시터들의 소통을 위한 공간입니다.
  </div>
</div>
<div class="well well-sm">
  게시물 수정
</div>
</div>
<div class="BJMain2Div" >
	<div class="BJWriteTableLine">
				<div class="SBHrAllLine">
<form method="post" id="updateForm" action="${initParam.root}interceptor_freeBoard_updateFreeBoard.do?freeBoardNo=${requestScope.freeBoardVO.freeBoardNo }">
<div class="form-group" >
	<table  class="BJFreeBoardWriteTableDiv">
	<tr>
		<td>제목</td>
		<td>
		      <input class="BJform-control2" id="focusedInput" type="text" name="freeBoardTitle" value="${requestScope.freeBoardVO.freeBoardTitle }" >
		  </td>
		 
		  
	</tr>
	<tr >
		<td>이름</td>
		<td style="float: left; margin-left: 3%; ">${sessionScope.mvo.name }</td>
	</tr>
	 

	<tr>
		<td>내용</td>
		
		<td  align="center" colspan="2"> <textarea  style="resize:none;" class="BJform-controlBig input-lg" name="freeBoardContents" id="inputLarge" class="BJform-controlBig input-lg" rows="10"  >${freeBoardVO.freeBoardContents }</textarea></td>
	</tr>
	<tr>
		<td></td>
		<td 	style="margin-left:40%; " colspan="2">
	
			<input class="BJbtn btn-default" type="submit" value="수정" >
		</td>
		
	</tr>
</table>
</div>
</form> 
</div>	
</div>
</div>	
</div>