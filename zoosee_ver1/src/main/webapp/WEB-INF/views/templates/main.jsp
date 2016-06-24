<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    $(document).ready(function(){
        var $body = $(document.body), //자주 사용하기에 캐시되게 변수에 넣어준다
            $top = '';

        $top=$('<div>') //div 를 만들고 
                .addClass('top') //top className을 주고
                .hide() //처음에는 숨겨둔다
                .click(function(){  // 클릭이 이벤트 할당
                    $body.animate({ scrollTop: 0 }); //animation효과로 scollTop=0으로 이동
                })
                .appendTo($body); // body에 top을 넣는다

        //윈도우의 스크롤위치로 위로가기 버튼을 보여줘야기에 핸들러 작성
        $(window).scroll(function(){

            var y = $(this).scrollTop();

            if(y >= 100){
                $top.fadeIn();
            }
            else {
                $top.fadeOut();
            }
        });
    });
</script>
<div class="BJMainKING">
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
</div>	