<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 멤버 정보 보기 -->

 <!-- 더블헤더 -->
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA"  href="${initParam.root}interceptor_member_memberlist.do?rank=normal">일반회원</a>
	<a class="BJA" href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">펫시터</a>
	<a class="BJA" href="${initParam.root}interceptor_petsitter_petsitterList.do?value=nonrecog">펫시터 신청자</a>


	</div>
</div>
</div>
 <div  class="BJMainDiv">
 <div class="BJMain2Div" >
 <div class="BJWriteTableLine" >
 
	<div class="WJLayout" style="text-align: left; margin-bottom:5%;" >
            <form>
            	<h3>${requestScope.mvo.name }님의 회원정보</h3>
               <div class="WJform-group">
                <label  >id</label>
                <input class="WJform-control"  type="text" value="${mvo.id}" readonly="readonly">
              </div>
               <div class="WJform-group">
                <label>Name</label>
                <input class="WJform-control" type="text" value="${mvo.name}" readonly="readonly">
              </div>
                <div class="WJform-group">
                <label>Address</label>
                <input class="WJform-control"  value="우편번호 : ${mvo.addressCode}" disabled="disabled">
                <input class="WJform-control"  value="${mvo.address}" disabled="disabled">
                <input class="WJform-control"  value="${mvo.detailAddress}"disabled="disabled">
              </div>
              <div class="WJform-group">
                <label>Email address</label>
                <input class="WJform-control" type="text" value="${mvo.email}" readonly="readonly">
              </div>
              <div class="WJform-group">
                <label>Gender</label>
                <input class="WJform-control" type="text" value="${mvo.gender}" readonly="readonly">
              </div>
              <div class="WJform-group">
                <label>Tel</label>
                <input class="WJform-control" type="text" value="${mvo.tel}" readonly="readonly">
              </div>
               <div class="WJform-group">
                <label>Job</label>
                <input class="WJform-control" type="text" value="${mvo.job }" readonly="readonly">
              </div>
               <div class="WJform-group">
                <label>Existence</label>
                <input class="WJform-control" value="${mvo.existence}" disabled="disabled">
              </div>
       
     		  </form>       
        </div>
	 

 </div>
 </div>
 </div>