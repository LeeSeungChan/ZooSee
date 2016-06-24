<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <div class="BJMainDivCenter"  >
    
    <div class="BJMainText"  align="center" >
       <h1 style="color:white; font-size:350%;">믿고 맡길 수 있는 펫시터를 찾아보세요!!</h1>
        <h3 style="color:white;">답답한 케이지가 아닌 펫시터의 집에서 당신의 강아지만 돌봐드립니다</h3> 
    </div>

 

  <div class="WJMainSection">
  
  
   <form role="search" action="findAllPetsitterList.do">
   <div class="WJMainSearchDiv">
   
   <div style="float: left; width: 70%;">
      <input type="text" class="WJform-control3" name="address" placeholder="서울/경기/인천" />
   </div>
   
   <div style="float: right; width: 29%;">   
      <button type="submit" class="active WJbtn2 btn-block btn-default">펫시터찾기</button>
   </div>
   
   
   
   </div> 
   </form>
   
     </div>
 <!-- 
   <form  class="navbar-form navbar-left" role="search" action="findAllPetsitterList.do">
        <div class="form-group"  >
          <input type="text" class="form-control"  name="address" placeholder="서울/경기/인천"> 
        </div>
          <button type="submit" class="btn btn-default">펫시터찾기</button>
   </form> -->
   
</div><!-- style="border:2px solid yellow;" -->
<div class="BJMainDIVBottom"   align="center">
   <div class="BJMainBoardDiv" >
     <div class="BJMainBoardC1">
          <a href="${initParam.root}interceptor_petsitter_register.do"><img  src="${initParam.root }resources/image/petsitterimg2V2.jpg" style="width: 100%; height:100%; max-width: 760px; vertical-align: middle" /></a>
      </div>
      <div class="BJMainBoardC2">
          <a href="${initParam.root}interceptor_qna_list.do"><img  src="${initParam.root }resources/image/zoosee3.jpg" style="width: 100%; height:100%; max-width: 760px; vertical-align: middle" /></a>
      </div>
      <div class="BJMainBoardC3">
          <a href="${initParam.root}interceptor_freeBoard_list.do"><img  src="${initParam.root }resources/image/pet5v1.jpg" style="width: 100%; height:100%; max-width: 760px; vertical-align: middle" /></a>
      </div>

   </div>
   
</div>