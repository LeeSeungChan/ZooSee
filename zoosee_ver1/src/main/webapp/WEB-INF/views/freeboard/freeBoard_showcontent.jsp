<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <script type="text/javascript">
 	$(document).ready(function(){
 		$("#contentForm :input[name=list]").click(function(){
 			location.href="${initParam.root}interceptor_freeBoard_list.do";
 		});
 		$("#contentForm :input[name=delete]").click(function(){
 			if(confirm("삭제하시겠습니까??")){
				location.href="${initParam.root}interceptor_freeBoard_contentDelete.do?freeBoardNo=${param.freeBoardNo }";
			}
 		});
 		$("#contentForm :input[name=update]").click(function(){
 			if(confirm("수정하시겠습니까??")){
				location.href="${initParam.root}interceptor_freeBoard_updateView.do?freeBoardNo=${requestScope.freeBoardVO.freeBoardNo }";
			}
 		});
 		
 		
 
 	
 		
 		
 		$("#replyForm").submit(function(){
 			var content = $("#content").val();
 			if(content==""){
				alert("내용을 입력해주세요!")
				return false;
 			}
 		})
 		
 	});
 	
	function rereplyButton(index,grp,lvl,ref){
		var rereplyform = "";
		rereplyform+="<div style=''><form action='interceptor_freeBoard_writeReply2.do' id='rereplyForm'>"; 
		rereplyform+="<input class='BJBigButton2' type='submit' value='작성'>";
		rereplyform+="<textarea class='BJform-controlBig3 input-lg'  style='resize:none;'  name='content' id='content'> </textarea>";
		rereplyform+="<input type='hidden' name='grp' value="+grp+">";
		rereplyform+="<input type='hidden' name='lvl' value="+lvl+"><br>";
		rereplyform+="<input type='hidden' name='ref' value="+ref+">";
		rereplyform+="<input type='hidden' name='id' value='${sessionScope.mvo.id }'>";
		rereplyform+="<hr>";
		rereplyform+="</form></div>";
		$("#rereply"+index).html(rereplyform); 
	};
	
	function del_reply(grp,lvl,ref){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="${initParam.root}interceptor_freeBoard_deleteReply.do?grp="+grp+"&lvl="+lvl+"&ref="+ref;
		}
	};
	
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
<!-- 자유게시판 상세보기 메인 -->
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
  게시물
</div>
</div>

<form id="contentForm">
<div class="BJMain2Div" >
<div class="BJWriteTableLine" >
<div class="BJHrAllLine" >
<div class="BJDeleteAndUpdateBtn"  >
	<c:if  test="${sessionScope.mvo.id==requestScope.freeBoardVO.memberVO.id }">
			
			<input type="button" name="delete" value="삭제" >
			<input type="button" name="update" value="수정" >

		</c:if>
</div>
<table   class="BJFreeBoardShowContentTable ">
	<tr>
		
		<td align="right">제목 : </td>
		<td align="left" colspan=3>${requestScope.freeBoardVO.freeBoardTitle }</td>

	</tr>
	<tr>
		<td align="right">작성자 : </td>
		<td align="left">${requestScope.freeBoardVO.memberVO.name }</td>
	</tr>
	<tr>
		<td align="right">조회수 : </td>
		<td align="left">${requestScope.freeBoardVO.freeBoardHits }</td>
	</tr>
	<tr>
		<td align="right">작성일자 : </td>
		<td align="left" colspan=3>${requestScope.freeBoardVO.freeBoardTimePosted }</td>
		</tr>
	
</table>
<hr class="BJHr" >
${requestScope.freeBoardVO.freeBoardContents }

		

</div>
</div>
</div>
</form>
<div class="BJReplyAllLine">
<%--댓글리스트 --%>
<!-- 댓글리스트 div -->
<div class="BJReplyList" >
<table  style="width:100%;">
	<c:forEach items="${requestScope.replyList }" var="reply" varStatus="status">
		<tr>
			
			<c:if test="${reply.reply_no==0}">
			<td>
			<img width="10" height="15" src="${initParam.root }resources/image/r1.jpg">
			</td>
			</c:if>
			
			<td align="left" style="width:6%;">
			${reply.id } 
			</td>
			
			<td align="left" style="width:18%;">${reply.time_posted }</td>
			<td align="left">
			<c:if test="${reply.reply_no>0}">
			<input  class="BJbtn2" type="button" value="댓글" onclick="rereplyButton(${status.index},${reply.grp },${reply.lvl},${reply.ref} )">
			</c:if>
			</td>
			<c:if test="${reply.reply_no!=0}">
			<td>
				
			</td>
			</c:if>
			<td align="right">
			<c:if test="${reply.con==0}">
			<input class="BJbtn2" type="button" value="삭제" onclick="del_reply(${reply.grp },${reply.lvl},${reply.ref})">
			</c:if>
			</td>
		</tr>
		<tr >
		<c:if test="${reply.reply_no==0}">
			<td></td>
			</c:if>
		<td colspan="5" align="left">${reply.content }</td>
		</tr>
		<tr>
			<td colspan="5"><hr></td>
		</tr>
		<tr>
				<td colspan="5"><span id="rereply${status.index}"></span></td>
		</tr>
	</c:forEach>
</table>
</div >
<%--댓글작성란 --%>
<div class="BJReplyInput" >
<form action="interceptor_freeBoard_writeReply.do" id="replyForm">
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
</div>


