<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript">
		var a = new Array();
		var receiveData = new Array();
		
		// Controller로부터 예약된 날짜 리스트를 받아와서 JS Array object로 변환
		function dateFormatChange(){
			var data = "${calendarList}";
			data = data.substring(1, data.length-1);
			a = data.split(",");
			receiveData = [];
			
			for(var i = 0; i < a.length; i++){
				a[i] = a[i].trim();
				receiveData[i] = a[i];
			}
		}
		
		$(document).ready(function(){
			dateFormatChange();
			
			var startDay = "${petsitterboardVO.startDay}";
			var endDay = "${petsitterboardVO.endDay}";
			
			$("#sdate").datepicker({
				closeText: '닫기',
			    prevText: '이전달',
			    nextText: '다음달',
			    currentText: '오늘',
			    monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			      			 '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    weekHeader: 'Wk',
			    dateFormat: 'yy-mm-dd',
			    firstDay: 0,
			    isRTL: false,
			    showMonthAfterYear: true,
			    yearSuffix: '',
			    showOn: 'focus',
			    //buttonText: "달력",
			    //buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
			    //buttonImageOnly: true,
			    changeMonth: true,
			    changeYear: true,
			    showButtonPanel: true,
			   	yearRange: ':c+10',
			   	beforeShowDay: function(date){
			   		var day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			   		
					//for (var i = 0; i < disabledDays.length; i++) {
					if($.inArray(day, receiveData) > -1) {
						return [false];
					}else{
						return [true];
					}
			   	},
			   	minDate: new Date(),
				maxDate: endDay,
				onSelect:function(selectedDate){
					$("#edate").datepicker("option", "minDate", selectedDate );
				}
			   	
			});
			
			var reserve_price;
			var interval;
			var price = new Number("${petsitterboardVO.petsitterVO.price}");
			
			$("#edate").datepicker({
				closeText: '닫기',
			    prevText: '이전달',
			    nextText: '다음달',
			    currentText: '오늘',
			    monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			      			 '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    weekHeader: 'Wk',
			    dateFormat: 'yy-mm-dd',
			    firstDay: 0,
			    isRTL: false,
			    showMonthAfterYear: true,
			    yearSuffix: '',
			    showOn: 'focus',
			    //buttonText: "달력",
			    //buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
			    //buttonImageOnly: false,
			    changeMonth: true,
			    changeYear: true,
			    showButtonPanel: true,
			   	yearRange: ':c+10',
			   	beforeShowDay: function(date){
			   		var day = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			   		
					if($.inArray(day, receiveData) > -1) {
						return [false];
					}else{
						return [true];
					}
			   	},
			   	minDate: startDay,
				maxDate: endDay,
				onSelect: function(selectedDate){
					if($("#sdate").val() == ""){
						alert("시작일을 먼저 입력하세요");
					}else{
						var sdate = new Date($("#sdate").datepicker("getDate"));
						var edate = new Date($("#edate").datepicker("getDate"));
				
					    if((edate.getMonth() - sdate.getMonth()) > 1){
					    	alert("두 달 이내로 선택하세요");
					    }else if(edate.getMonth() == sdate.getMonth()){
							interval = edate.getDate() - sdate.getDate();
							
							if(interval == 0){
								interval = 1;
								price = price/2;
							}
							//alert(edate.getDate() - sdate.getDate() + 1 + "일");
						}else{
							var month  = sdate.getMonth()+1;
							var sday;
							var eday = edate.getDate();
							
							switch(month){
								case 1: case 3: case 5: case 7: case 8: case 10: case 12:{
									sday = 31 - sdate.getDate();
									break;
								}
								case 4: case 6: case 9: case 11: {
									sday = 30 - sdate.getDate();
									break;
								}
								case 2:{
									sday = 28 - sdate.getDate();
									break;
								}
							}
							var tday = (eday + sday + 1);
							
							//alert((tday - 1) + "박" + tday + "일");
							interval = new Number(eday + sday + 1);
						}
					 	
					    reserve_price = interval*price*1.1;
					    //alert(reserve_price + "토탈 가격");
					    $("#reserveRegForm :input[name=reserve_price]").val(reserve_price);
					    $(".days").text(interval + "박");
					    $(".totalPrice").text(interval*price + "원");
					    var totalPrice = new Number(interval*price);
					    $(".tax").text(totalPrice*0.1 + "원");
					    $(".totalPricePlusTax").text(reserve_price + "원");
					}
				}
			});
			/*$.datepicker.setDefaults($.datepicker.regional['ko']); 
			$.datepicker.regional['ko'] = {
			};*/

			$("#petCheckNumber").change(function(){
				var petCheckNumber = new Number($("#petCheckNumber").val());
				reserve_price = interval*price*(petCheckNumber+1);
				
				$("#reserveRegForm :input[name=reserve_price]").val(reserve_price);
			});
			
			$("#reserveRegForm").submit(function(){
				var rank = "${sessionScope.mvo.rank}";
				var id = "${sessionScope.mvo.id}";
				var boardId = "${petsitterboardVO.petsitterVO.memberVO.id}";
				
				if($("#sdate").val() == ""){
					alert("시작일을 선택해 주세요.");
					return false;
				}else if($("#edate").val() == ""){
					alert("종료일을 선택해 주세요.");
					return false;
				}

				if(confirm("예약 요청하시겠습니까?")){
					if(id == boardId){
						alert("본인한테 예약 불가합니다.");
						this.reset();
						return false;
					}else if(id == null || id == ""){
						alert("로그인 후 예약 가능합니다.");
						location.href="${initParam.root}member_login.do";
						return false;
					}else if(rank == 'normal' || rank == 'petsitter'){
						alert("펫등록 후 예약 가능합니다.");
						location.href="${initParam.root}pet_register.do";
						return false;
					}
				}else{
					return false;
				}
			});
	    });
	</script>


<div class="BJMainDiv" style="margin-bottom: 10%;">
   <div class="BJPanel" style="width: 80%; margin-left: 10%;">
      <div class="panel panel-primary">
         <div class="panel-heading">
            <h3 class="panel-title">돌보미 게시판</h3>
         </div>
         <div class="panel-body">고객님의 소중한 반려견을 위해 임시보호를 지원하는 돌보미 게시판입니다.
         </div>
      </div>
      <div class="well well-sm">돌보미 정보 확인 및 예약</div>
   </div>
   <c:set var="petsitterVO" value="${petsitterboardVO.petsitterVO }"></c:set>
   <c:set var="memberVO" value="${petsitterboardVO.petsitterVO.memberVO}"></c:set>
   <div class="BJMain2Div">
   <form method="post" action="interceptor_reserveRegister.do" id="reserveRegForm">
      <input type="hidden" name="petsitterboard_no" value="${petsitterboardVO.petsitterboard_no}" />
	  <input type="hidden" name="id" value="${sessionScope.mvo.id}" />
	  <input type="hidden" name="petsitterId" value="${petsitterboardVO.petsitterVO.memberVO.id}"/>
	  <input type="hidden" name="petCheckNumber" value="0"/>
	  <input type="hidden" name="reserve_price" />
      <!-- 리모콘 -->
      <div style="float: right; width: 30%;">
         <div class="SBremote">
            <div class="SBremote_main">
               <div class="SBremote_Img_form">
                  <img src="${initParam.root}${petsitterVO.petsitterImg}" class="SBImg">
               </div>
               <div class="SBremote_name">
                  <h4 style="font-weight: bold; color: gray;">${memberVO.name}</h4>
                  <h6 style="font-size: 11px;">${memberVO.address}</h6>
               </div>
            </div>
            <br>
            <div class="SBremote_main2" >
               <div style="float: left; width: 50%;">
                  <input type="text" placeholder="Start Date" class="datepicker" readonly="readonly"
                    id="sdate" name="startDay" style="width: 95%; margin-right: 5%">
               </div>
               <div style="float: right; width: 50%;">
                  <input type="text" placeholder="End Date" class="datepicker" readonly="readonly"
                  	id="edate" name="endDay" style="width: 95%; margin-left: 5%">
               </div>
            </div>
            <div class="SBremote_main3">
               <div align="center">
                  <span class="SBrenote_price">${petsitterVO.price}원</span> / 1박
               </div>
               <table class="table"
                  style="margin-top: 5%; border-bottom: 1px solid #DDDDDD;">
                  <tr>
                     <td><label class="days" style="float: left;">0박</label></td>
                     <td><label class="totalPrice" style="float: right;">${petsitterVO.price}원</label></td>
                  </tr>
                  <tr>
                     <td><label style="float: left;">부가세</label></td>
                     <td><label class="tax" style="float: right;">원</label></td>
                  </tr>
                  <tr>
                     <td><label style="float: left;">총합계</label></td>
                     <td>
                     	<label class="totalPricePlusTax" style="float: right;">원</label>
                     </td>
                  </tr>
               </table>
            </div>
            <div class="SBremote_main4">
               <input type="submit" class="active WJbtn btn-block btn-default "
                  id="reserveBtn" value="예약요청하기">
            </div>
         </div>
      </div>
      </form>
      
      <!-- 페이지화면 -->
      <div class="SBmainDivLeft">
         <div class="SBmainDivImg">
            <div class="SBremote_Img_form2">
               <img src="${initParam.root}${petsitterVO.houseImg}" class="SBImg2">
            </div>
         </div>
         <div class="SBmainDivImg2">
            <div style="float: left;" class="SBdiv">
               <img src="resources//image//SBdogImg.png"
                  class="SBremote_Img_form3">
               <div class="SBtextDiv">
                  <img src="resources//image//mmm.png" style="width: 15px;">
                  희망 동물 종류 : ${petsitterVO.petType } <br> <img
                     src="resources//image//mmm.png" style="width: 15px;"> 희망 동물
                  크기 : ${petsitterVO.petSize } <br> <img
                     src="resources//image//mmm.png" style="width: 15px;"> 가능한
                  서비스 : ${petsitterVO.service }
               </div>
            </div>
            <div style="float: right;" class="SBdiv">
               <img src="resources//image//c.png" class="SBremote_Img_form3">
               <div class="SBtextDiv2">
                  <img src="resources//image//mmm.png" style="width: 15px;">
                  체크인&체크 아웃:<br> 09:00 AM ~ 09:00PM
               </div>
            </div>
         </div>
         <div class="SBmainDivImg2" style="border-top: 1px solid #AFAFAF;">
            <div class="SBtextDiv3">
            <div class="SBtextDiv3_tiltle">${memberVO.name}돌보미소개</div>
            <br>
            <div class="SBtextDiv3_content">${petsitterboardVO.petsitterVO.memberVO.existence}</div>
            </div>
         </div>
         <div class="SBmainDivImg2" style="border-top: 1px solid #AFAFAF;">
            <div class="SBtextDiv3">
               <div class="SBtextDiv3_tiltle">
                  ${petsitterboardVO.petsitterboard_title }</div>
               <br>
               <div class="SBtextDiv3_content">
                  ${petsitterboardVO.petsitterboard_contents }</div>
            </div>
         </div>
      </div>
   </div>
</div>