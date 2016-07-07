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
    
   	$(document).ready(function() {
		dateFormatChange();
      
      	$('input:radio[name="petType"]:input[value="${petsitterboardVO.petsitterVO.petType}"]').attr("checked", true);
      	$('input:radio[name="petSize"]:input[value="${petsitterboardVO.petsitterVO.petSize}"]').attr("checked", true);
      	$('input:radio[name="petNumber"]:input[value="${petsitterboardVO.petsitterVO.petNumber}"]').attr("checked", true);
      	$('input:radio[name="service"]:input[value="${petsitterboardVO.petsitterVO.service }"]').attr("checked", true); 
      
      	var flag = "${flag}";
      	if(flag == "true"){
        	alert("이미 등록한 회원입니다.");
        	location.href="${initParam.root}petsitterboard_myPetsitterBoard.do";
      	}
     
      	// 공란체크하기
      	$("#petsitterboardregForm").submit(function(){
        	if($("#petsitterboardregForm :input:radio[name=service]:checked").length == 0){
            	alert("서비스를 선택하세요.");
            	return false;
         	}else if($("#petsitterboardregForm :input[name=petsitterboard_title]").val() == ""){
            	alert("제목을 입력하세요.");
            	return false;
         	}else if($("#petsitterboardregForm #ta").val() == ""){
            	alert("내용을 입력하세요.");
            	return false;
         	}
      	});
      
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
           	// maxDate: endDay,
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
            //maxDate: endDay,
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
                   
                    reserve_price = Math.floor(interval*price*1.1);
                    //alert(reserve_price + "토탈 가격");
                    $("#reserveRegForm :input[name=reserve_price]").val(reserve_price);
                    $(".days").text(interval + "박");
                    $(".totalPrice").text(interval*price + "원");
                    var totalPrice = new Number(interval*price);
                    var tax = Math.floor(totalPrice*0.1);
                    $(".tax").text(tax + "원");
                    $(".totalPricePlusTax").text(reserve_price + "원");
            }
         }
      });
   });
</script>
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA" href="${initParam.root}member_detail.do">마이페이지</a>
	<a class="BJA" href="${initParam.root}member_update.do">회원정보수정</a>
   	<c:if test="${sessionScope.mvo.rank == 'petsitter' || sessionScope.mvo.rank == 'petmaster'}">
       <a class="BJA" href="${initParam.root}petsitterboard_registerform.do?id=${sessionScope.mvo.id}"> 펫시터게시글등록</a>
       <a class="BJA" href="${initParam.root}petsitterboard_myPetsitterBoard.do">내 글 보기</a>
      </c:if>
	</div>
</div>
</div>
<div class="BJMainKING" style="margin-top: 5%;">
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">펫시터 게시판</h3>
			</div>
			<div class="panel-body">소중한 반려동물의 임시보호를 목적으로하는 게시판입니다.</div>
		</div>
		<div class="well well-sm">펫시터 게시물 수정</div>
	</div>
	<div class="BJMain2Div">
		<form method="post" action="petsitterboardUpdate.do"id="petsitterboardregForm">
			<input type="hidden" name="petsitterNo" value="${requestScope.petsitterboardVO.petsitterVO.petsitterNo}" />
			<input type="hidden" name="petsitterboard_no" value="${requestScope.petsitterboardVO.petsitterboard_no }" />
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine">
					<table class="SBtable">
						<tr id="trFirst">
							<th>Title</th>
							<td colspan="3">
								<input class="SBform-text" type="text" name="petsitterboard_title"  value="${requestScope.petsitterboardVO.petsitterboard_title }" placeholder="타이틀을 입력하세요!" />
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle; width: 10%">StartDay</th>
							<td style="vertical-align: middle; width: 40%">
								<input type="text" class="datepicker SBform-text" id="sdate" name="startDay" value="${requestScope.petsitterboardVO.startDay }" readonly="readonly" style="width:77%;">
							</td>
							<th style="vertical-align: middle; width: 10%">EndDay</th>
							<td style="vertical-align: middle; width: 40%">
								<input type="text" class="datepicker SBform-text" id="edate" name="endDay" value="${requestScope.petsitterboardVO.endDay }" readonly="readonly" style="width:77%;"></td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">Pet Type</th>
							<td colspan="3">
								<table style="width: 100%;">
									<tr>
										<td style="width: 15%;"><input type="radio"name="petType" value="dog" />강아지</td>
										<td style="width: 10%;"><input type="radio"name="petType" value="cat" />고양이</td>
										<td style="width: 10%;"><input type="radio"name="petType" value="bird" />조류</td>
										<td style="width: 10%;"><input type="radio"name="petType" value="fish" />어류</td>
										<td style="width: 15%;"><input type="radio"name="petType" value="etc" />기타</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">Pet Size</th>
							<td style="vertical-align: middle;">
								<table style="width: 100%;">
									<tr>
										<td style="width: 20%;"><input type="radio" name="petSize" value="small" />소형</td>
										<td style="width: 10%;"><input type="radio" name="petSize" value="middle" />중형</td>
										<td style="width: 20%;"><input type="radio" name="petSize" value="large" />대형</td>
									</tr>
								</table>
							</td>
							<th style="vertical-align: middle;">Service</th>
							<td>
								<table style="width: 100%;">
									<tr>
										<td style="width: 20%;"><input type="radio" name="service" value="목욕" /> 목욕</td>
										<td style="width: 10%;"><input type="radio" name="service" value="산책" />산책</td>
										<td style="width: 20%;"><input type="radio" name="service" value="픽업" />픽업</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">Price</th>
							<td>
								<input type="text" class="SBform-text" name="price" value="${requestScope.petsitterboardVO.petsitterVO.price }"style="width: 80%;">
							</td>
							<td colspan="2" style="vertical-align: middle;">
								<div style="float: left;">가격은 1박 한마리 기준으로 입력해주세요!</div>
							</td>
						</tr>
						<tr>
							<th>Content</th>
							<td colspan="3">
								<textarea id="ta"name="petsitterboard_contents" class="SBform-textarea"style="height: 400px; resize: none;"
									placeholder="자신의 펫 시터 활동을 홍보할 수 있는 내용을 입력하세요.">
									${requestScope.petsitterboardVO.petsitterboard_contents}
								</textarea>
							</td>
					</table>
				</div>
			</div>
			<div class="SBbtn_1">
				<input type="submit" class="active SBbtn btn-default" value="게시물 등록" />
			</div>
		</form>
	</div>
</div>
</div>
