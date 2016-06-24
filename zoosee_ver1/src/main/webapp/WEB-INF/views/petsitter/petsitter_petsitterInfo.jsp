<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- 펫시터 정보 보기 -->
<script>
   $(document)
         .ready(
               function() {
                  ;
                  $("#petsitterInfoForm :input[name=backBtn]")
                        .click(
                              function() {
                                 location.href = "${initParam.root}interceptor_petsitter_petsitterList.do?value=${param.value}";

                              });

               });
</script>
<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
   <div class="BJHeaderLayout">
      <div class="BJHeader2">
         <a class="BJA" href="${initParam.root}interceptor_pet_list.do">펫목록</a>
         <a class="BJA" href="${initParam.root}interceptor_pet_register.do">펫등록</a>
      </div>
   </div>
</div>


<div class="BJMainDiv" style="margin-bottom: 10%;">
   <div class="BJPanel" style="width: 80%; margin-left: 10%;">
      <div class="panel panel-info">
         <div class="panel-heading">
            <h3 class="panel-title">돌보미 상세보기</h3>
         </div>
         <div class="panel-body">돌보미 ${mvo.name }님의 상세정보를 보여 드리기 위한
            공간입니다.</div>
      </div>
      <div class="well well-sm">돌보미 ${mvo.name }님의 상세정보</div>
   </div>
<div
   style="margin-left: 10%; width: 80%; height: 600px;">
         <!-- 왼쪽 -->
         <div style="width: 50%; float: left;">
            <div align="center">
               <img style="border: 1px solid black;"class="img-responsive img-rounded"
                  src="${initParam.root}${requestScope.pvo.petsitterImg}"
                  width="90%" height="335px;">
               <div align="center">
                  <label>회원사진</label>
               </div>
               <img style="border: 1px solid black;" class="img-responsive img-rounded"
                  src="${initParam.root}${requestScope.pvo.houseImg}" width="90%"
                  height="335px;">
               <div align="center">
                  <label>집사진</label>
               </div>
            </div>
         </div>
         <!-- 왼쪽 끝  -->
         <!-- 오른쪽 -->
         <form id="petsitterInfoForm">
            <div
               style="width: 50%; float: right; text-align: left;">
               <div style="margin-left: 5%; width: 90%;">
                  <label>아이디</label> <input class="WJform-control" type="text"
                     value="${requestScope.pvo.memberVO.id }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>이름</label> <input
                     class="WJform-control" type="text"
                     value="${requestScope.pvo.memberVO.name }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>성별</label> <input
                     class="WJform-control" type="text"
                     value="${requestScope.pvo.memberVO.gender }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>직업</label> <input
                     class="WJform-control" type="text"
                     value="${requestScope.pvo.memberVO.job }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>전화번호</label> <input
                     class="WJform-control" type="text"
                     value="${requestScope.pvo.memberVO.tel }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>주소</label> <input
                     class="WJform-control" type="text"
                     value="${requestScope.pvo.memberVO.address }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>돌봄이
                     가능한 펫 마릿수</label> <input class="WJform-control" type="text"
                     value="${requestScope.pvo.petNumber }" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>서비스</label> <input
                     class="WJform-control" type="text"
                     value="${requestScope.pvo.service}" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>가격</label> <input
                     class="WJform-control" type="text"
                     value=" ${requestScope.pvo.price}" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>사이즈</label> <input
                     class="WJform-control" type="text"
                     value=" ${requestScope.pvo.petSize}" readonly="readonly"
                     style="background-color: #F4F4F4;"> <label>종류</label> <input
                     class="WJform-control" type="text"
                     value=" ${requestScope.pvo.petType}" readonly="readonly"
                     style="background-color: #F4F4F4;"><br> <input
                     type="button" name="backBtn" value="확인"
                     class="active WJbtn btn-block btn-default">
               </div>
            </div>
         </form>
      </div>
   </div>









<%-- 
 <form id="petsitterInfoForm">
    <h3>${requestScope.pvo.memberVO.name }님의 펫시터 신청서</h3>
    <table border=1  id="petsitterTable">
      <tr>
         <td colspan="1">집사진</td> 
         <td colspan="3"><img src="${initParam.root }${requestScope.pvo.houseImg}"/></td> 
      </tr>
       <tr>
         <td colspan="1">회원사진</td> 
         <td colspan="3"><img src="${initParam.root }${requestScope.pvo.petsitterImg}"/></td> 
      </tr>
      <tr >
         <td >아이디</td> 
         <td>${requestScope.pvo.memberVO.id }</td>
         <td>이름</td> 
         <td>${requestScope.pvo.memberVO.name }</td> 
      </tr>
      <tr>
         <td>성별</td> 
         <td>${requestScope.pvo.memberVO.gender}</td>
         <td>직업</td> 
         <td>${requestScope.pvo.memberVO.job }</td> 
      </tr>
      <tr>
         <td colspan="1">전화번호</td> 
         <td colspan="3">${requestScope.pvo.memberVO.tel}</td>
      </tr>
      <tr>
         <td colspan="1">주소</td> 
         <td colspan="3">${requestScope.pvo.memberVO.address }</td>
      </tr>
      <tr>
         <td>돌봄 가능 마리수</td> 
         <td colspan="3" align="center">${requestScope.pvo.petNumber }</td> 
      </tr>
      <tr>
         <td>제공서비스</td> 
         <td>${requestScope.pvo.service}</td>
         <td>가격</td> 
         <td>${requestScope.pvo.price}</td>
      </tr>
      <tr>
         <td>펫사이즈</td> 
         <td>${requestScope.pvo.petSize}</td> 
         <td>펫종류</td> 
         <td>${requestScope.pvo.petType}</td> 
      </tr>
   <tr>
      <td colspan="4" align="center">
         <input type="button" name="backBtn" value="확인">
      </td>
   </tr>
   </table>
 </form> --%>