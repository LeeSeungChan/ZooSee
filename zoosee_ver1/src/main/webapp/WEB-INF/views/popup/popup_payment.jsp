<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#payment2").submit(function(){ 
    		if($("#card").val()==""){
    			alert("카드를 선택하세요!");
    			$("#card").focus();
    			return false;
    		}else if($("#MIP").val()==""){
    			alert("할부기간을 선택하세요!");
    			$("#MIP").focus();
    			return false;
    		}else if(isNaN($("#MIP").val())){
    			alert("할부기간은 숫자로 입력하세요!");
    			$("#MIP").focus();
    			return false;
    		}else if($("#cardNum1").val()==""||$("#cardNum2").val()==""||$("#cardNum3").val()==""||$("#cardNum4").val()==""){
    			alert("카드번호를 입력하세요");
    			return false;
    		}else if($("#valid").val()==""){
    			alert("유효기간을 선택하세요!");
    			$("#valid").focus();
    			return false;
    		}else if($("#password").val()==""){
    			alert("비밀번호를 입력하세요");
    			$("#password").focus()
    			return false;
    		}else if($("input:checkbox[name='mycheck']:checked").length==0){
    			alert("약관에 동의해주세요!");
    			return false;
    		}else{
    			var of= "${initParam.root}interceptor_reserve_reserveDealAccept.do?reserve_no=${reserveVO.reserve_no}&";
				of += "petsitterId=${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}";
				document.write("<br><br><br><br><br><br><br><br><br><br><br><h2>결제 진행중...</h2>");
				document.write("<h2>잠시만 기다려 주세요...</h2>");
				wait(3000);
				alert("결제가 완료되었습니다. \n감사합니다.^^");
				opener.parent.location=of;
				self.close();
    		}
    	}); 
		$("#check_all").click(function() {
			 if( $(this).is(":checked") ) {
	             $('#check1').prop("checked",true);
	             $('#check2').prop("checked",true);
	             $('#check3').prop("checked",true);
	         }else {
	             $('#check1').prop("checked",false);
	             $('#check2').prop("checked",false);
	             $('#check3').prop("checked",false);
	         }
		});
		
		$("#payment3").submit(function(){ 
    		if($("#name").val()==""){
    			alert("입금자명을 입력하세요!");
    			$("#name").focus();
    			return false;
    		}else if($("#date").val()==""){
    			alert("입금예정일을 입력하세요!");
    			$("#date").focus();
    			return false;
    		}else if(isNaN($("#date").val())){
    			alert("입금예정일은 숫자로 입력하세요!");
    			$("#date").focus();
    			return false;
    		}else if($("#payNum").val()==""){
    			alert("계좌번호 입력하세요!");
    			$("#payNum").focus();
    			return false;
    		}else if($("#bank").val()==""){
    			alert("입금은행을 선택하세요!");
    			$("#bank").focus();
    			return false;
    		}else{
    			var of= "${initParam.root}interceptor_reserve_reserveDealAccept.do?reserve_no=${reserveVO.reserve_no}&";
				of += "petsitterId=${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}";
				document.write("<br><br><br><br><br><br><br><br><br><br><br><h2>결제 진행중...</h2>");
				document.write("<h2>잠시만 기다려 주세요...</h2>");
				wait(3000);
				alert("결제가 완료되었습니다. \n감사합니다.^^");
				opener.parent.location=of;
				self.close();
    		}
    		
    	}); 
	/* 	$(".update").click(function(){
			var of= "${initParam.root}interceptor_reserve_reserveDealAccept.do?reserve_no=${reserveVO.reserve_no}&";
				of += "petsitterId=${reserveVO.petsitterboardVO.petsitterVO.memberVO.id}";
				document.write("진행중");
				wait(3000);
				opener.parent.location=of;
				self.close();
		}); */
	});
	function wait(msecs){
		var start = new Date().getTime();
		var cur = start;
		while(cur - start < msecs){
			cur = new Date().getTime();
		}
	}
	function change(value, id) {
		if (value == "convenience") {
			alert("죄송합니다. ZOOSEE 간편결제는 준비 중입니다.");
			document.getElementById("con1").style.display = "";
			$("#con1").show();
			$("#con3").hide();
			$("#con2").hide();
			return false;
		} else if (value == "credit") {
			alert("신용/체크카드를 선택하셨습니다.");
			document.getElementById("con2").style.display = "";
			$("#con2").show();
			$("#con1").hide();
			$("#con3").hide();
			return false;
		} else if (value == "noBankbook") {
			alert("무통장입금을 선택하셨습니다.");
			document.getElementById("con3").style.display = "";
			$("#con3").show();
			$("#con1").hide();
			$("#con2").hide();
			return false;
		}
	}
</script>
<div style="margin-left: 10%; width: 80%;">
	<form name="payment">
		<h4>결제정보</h4>
		<table class="table table-striped table-hover">
			<tr>
				<th style="text-align: right;">총 결제가격</th>
				<td>${reserveVO.reserve_price}원</td>
			</tr>
			<th style="text-align: right; vertical-align: middle;">결제 방법</th>
			<td>
				<div class="radio" align="center">
					<label class="radio-inline"> 
						<input type="radio" name="method" value="convenience" onclick="change(this.value,'convenience');"> 
							ZOOSEE 간편결제
					</label> 
					<label class="radio-inline"> 
						<input type="radio"name="method" value="credit" onclick="change(this.value,'credit');"> 
							신용/체크카드
					</label> 
					<label class="radio-inline"> 
						<input type="radio" name="method" value="noBankbook" onclick="change(this.value,'noBankbook');"> 
						무통장입금
					</label>
				</div>
			</td>
		</table>
	</form>

	<div id="con1" style="display: none; ">
		<h5>ZOOSEE 간편결제</h5>
		<div class="BJWriteTableLine" >
			<div style="margin-top:3%; margin-bottom: 3%; text-align: center;">
				ZOOSEE Pay는 준비중입니다. <br> 빠른시일내로 찾아 뵙겠습니다.
			</div>
		</div>
	</div>

	<form id="payment2" name="payment2">
	<div id="con2" style="display: none">
		<h5>신용/체크카드</h5>
		<div class="BJWriteTableLine" >
			<table style="margin-top:3%; margin-bottom: 3%;">
				<tr>
					<th style="text-align: center; vertical-align: middle; width: 45%;">카드종류</th>
					<td style="margin-left: 10%;">
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<select class="WJform-control4" id="card" name="card" >
								<option value="">-Select-</option>
								<option value="신한카드">신한카드(구:LG 카드 포함)</option>
								<option value="비씨카드">BC(비씨)카드</option>
								<option value="현대카드">현대카드</option>
								<option value="삼성카드">삼성카드</option>
								<option value="롯데카드">롯데카드</option>
								<option value="하나카드">하나카드</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">할부기간</th>
					<td>
						<select class="WJform-control4" id="MIP" name="MIP" style="margin-bottom: 1%; margin-top: 1%;">
							<option value="">-Select-</option>
							<option value="1">1개월</option>
							<option value="2">2개월</option>
							<option value="3">3개월</option>
						</select>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">카드번호</th>
					<td>
						<div align="left" style="margin-bottom: 1%; margin-top: 1%;">
							<input class="WJform-control5" type="text" id="cardNum1" name="cardNum1" style="width: 20%"> -
							<input class="WJform-control5" type="text" id="cardNum2" name="cardNum2" style="width: 20%"> -
							<input class="WJform-control5" type="text" id="cardNum3" name="cardNum3" style="width: 20%"> -
							<input class="WJform-control5" type="text" id="cardNum4" name="cardNum4" style="width: 20%">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">유효기간</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<input class="WJform-control4" type="text" id="valid" name="valid" style="width: 50%; " 
								placeholder="ex) MMYY">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">비밀번호</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<input class="WJform-control4" type="password" id="password" style="width: 50%; " name="password">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">약관동의</th>
					<td style="text-align: left;" >
					    <input type="checkbox" id="check_all"> 모두선택<br>
						<input type="checkbox" name='mycheck' id="check1"> 서비스 이용약관 동의<br>
						<input type="checkbox" name='mycheck' id="check2"> 개인정보 수집 및 이용 동의<br>
						<input type="checkbox" name='mycheck' id="check3"> 개인정보 제공 및 위탁 동의<br>
					</td>
				</tr>
			</table>
		</div>
		<input type="submit" id="update" value="결제" class="active WJbtn btn-info update" 
			style="float: left; width: 25%; margin-left:24%; margin-top: 2%; margin-bottom: 2%;">
		<input type="button" id="delete" value="취소" onclick="javascript:self.close()" class="active WJbtn btn-info"
			style="float: right; width: 25%; margin-right:24%; margin-top: 2%; margin-bottom: 2%">
	</div>
	</form>

	<form id="payment3" name="payment3">
	<div id="con3" style="display: none">
		<h5>무통장입금</h5>
			<div class="BJWriteTableLine" align="center">
			<table style="margin-top:3%; margin-bottom: 3%;">
				<tr>
					<th style="text-align: center; vertical-align: middle;">입금자명</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<input class="WJform-control4" type="text" id="name" name="name" style="width: 70%; ">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">입금예정일</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<input class="WJform-control4" type="text" id="date" name="date" style="width: 70%; " placeholder="ex)20160630">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle;">계좌번호</th>
					<td>
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<input class="WJform-control4" type="text" id="payNum" name="payNum" style="width: 100%; ">
						</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center; vertical-align: middle; width: 45%;">입금은행</th>
					<td style="margin-left: 10%;">
						<div style="margin-bottom: 1%; margin-top: 1%;">
							<select class="WJform-control4" id="bank" name="bank" >
								<option value="">-Select-</option>
								<option value="신한은행">신한은행</option>
								<option value="기업은행">기업은행</option>
								<option value="우리은행">우리은행</option>
								<option value="국민은행">국민은행</option>
								<option value="하나은행">하나은행</option>
								<option value="농협">농협</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			</div>
			<input type="submit" id="update" value="진행" class="active WJbtn btn-info update" 
				style="float: left; width: 25%; margin-left:24%; margin-top: 2%; margin-bottom: 2%;">
			<input type="button" id="delete" value="취소" onclick="javascript:self.close()" class="active WJbtn btn-info"
				style="float: right; width: 25%; margin-right:24%; margin-top: 2%; margin-bottom: 2%">
		</div>
	</form>
</div>

<!-- 
<script>
function div_OnOff(value,id){ 
	if (value == "1") {
			document.getElementById("con1").style.display = ""; 
			$("#con1").show();
			$("#con3").hide();
			$("#con2").hide();
			return false;
		} else if (value == "2") {
			document.getElementById("con2").style.display = "";
			$("#con2").show();
			$("#con1").hide();
			$("#con3").hide();
			return false;
		} else if (value == "3") {
			document.getElementById("con3").style.display = "";
			$("#con3").show();
			$("#con1").hide();
			$("#con2").hide();
			return false;
		}
	}
</script>

<input type="radio" name="method" value="1" onclick="div_OnOff(this.value,'con1');"> 회원신청 
<input type="radio" name="method" value="2" onclick="div_OnOff(this.value,'con2');"> 준회원 
<input type="radio" name="method" value="3" onclick="div_OnOff(this.value,'con3');"> 정회원 -->

<!-- 
  <html>
<head>
<title>신규주문</title>
<SCRIPT LANGUAGE="JavaScript">
	card.style.display = "none";	
	bank.style.display = "none";
function pchange( e ){//-- 결제방식 선택
var fm = document.f1;
if( fm.HOWPAY[1].checked == true ){//-- 카드
	alert("1");
card.style.display = "";
bank.style.display = "none";
}else if( fm.HOWPAY[2].checked == true ){//-- 현금
	alert("2");
card.style.display = "none";
bank.style.display = "";
}else { //-- 본사
	alert("3");
card.style.display = "none";	
bank.style.display = "none";
}	
}
//
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="20" topmargin="15" marginwidth="20" marginheight="15">
	<form name=f1>
	
	
	
		<table width="100%" border=1 bordercolordark=#EBEBEB bordercolorlight=black cellspacing="0" cellpadding="0">
			<td class="text02" bgcolor="#A6A6A6">결제 방법</td>
			<td>
				<div align="left">
					&nbsp; 
					<input type=radio name=HOWPAY value="B" onclick='pchange(this)'>본사 결제 
					<input type=radio name=HOWPAY value="C" onclick='pchange(this)'>카드 결제 
					<input type=radio name=HOWPAY value="M" onclick='pchange(this)'>현금 결제
				</div>
			</td>
			</tr>
		</table>
		
		
		
		
		<table width="100%" border=1 bordercolordark=#EBEBEB bordercolorlight=black cellspacing="0" 
		cellpadding="0" id="card" style="display: 'none';">
			<tr align="center" height="28">
				<td width="15%" class="text02" bgcolor="#A6A6A6">카드사명</td>
				<td width="25%">
				<div align="left">
						&nbsp; 
						<input name="CARDCNAME" type="text" value="">
				</div></td>
				<td width="15%" class="text02" bgcolor="#A6A6A6">카드번호</td>
				<td width="45%"><div align="left">
						&nbsp; <input name="CARDNO1" type="text" value="" size=4
							maxlength=4 onkeypress="alertisnum(this);">- <input
							name="CARDNO2" type="text" value="" size=4 maxlength=4
							onkeypress="alertisnum(this);">- <input name="CARDNO3"
							type="text" value="" size=4 maxlength=4
							onkeypress="alertisnum(this);">- <input name="CARDNO4"
							type="text" value="" size=4 maxlength=4
							onkeypress="alertisnum(this);">
					</div></td>
			</tr>
			<tr align="center" height="28">
				<td class="text02" bgcolor="#A6A6A6">유효기간</td>
				<td><div align="left">
						&nbsp; <input name="CARDVAL" type="text" value="" size=5
							maxlength=5> ex)MM/YY
					</div></td>
				<td class="text02" bgcolor="#A6A6A6">할부개월</td>
				<td><div align="left">
						&nbsp; <input name="AOLMONTH" type="text" value="0"
							onkeypress="alertisnum(this);" size=2 maxlength=2>
					</div></td>
			</tr>
		</table>
		
		
		
		<table width="100%" border=1 bordercolordark=#EBEBEB
			bordercolorlight=black cellspacing="0" cellpadding="0" id="bank"
			style="display: 'none';">
			<tr align="center" height="28">
				<td width="15%" class="text02" bgcolor="#A6A6A6">입금자명</td>
				<td width="25%"><div align="left">
						&nbsp; <input name="DEPNAME" type="text" value="">
					</div></td>
				<td width="15%" class="text02" bgcolor="#A6A6A6">입금은행</td>
				<td width="45%"><div align="left">
						&nbsp; <select name=DEPBANK>
							<option value="" selected>선택</option>
							<option value="1">신한은행- 302-05-017255</option>
							<option value="2">조흥은행 - 575-03-003454</option>
							<option value="3">농협 - 013-01-287091</option>
							<option value="4">국민은행 - 815-01-0415-088</option>
						</select>
					</div></td>
			</tr>
			<tr align="center" height="28">
				<td class="text02" bgcolor="#A6A6A6">입금예정일</td>
				<td>
					<div align="left">
						&nbsp; 
						<input name="DEPDATE" type="text" value="" size=8 maxlength=8 
						onkeypress="alertisnum(this);"> ex)20021230
					</div>
				</td>
				<td class="text02" bgcolor="#A6A6A6">금액</td>
				<td><div align="left">
						&nbsp; <input name="PAY" type="text" class="inputread" value=""
							onkeypress="alertisnum(this);" 
							style="text-align: right;">원
					</div></td>
			</tr>
		</table>
		
		
		
		
	</form>
</body>
</html>

 -->



