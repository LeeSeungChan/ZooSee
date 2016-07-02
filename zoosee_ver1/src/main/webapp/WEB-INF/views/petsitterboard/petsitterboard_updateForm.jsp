<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('input:radio[name="petType"]:input[value="${petsitterboardVO.petsitterVO.petType}"]').attr("checked", true);
		$('input:radio[name="petSize"]:input[value="${petsitterboardVO.petsitterVO.petSize}"]').attr("checked", true);
		$('input:radio[name="petNumber"]:input[value="${petsitterboardVO.petsitterVO.petNumber}"]').attr("checked", true);
		$('input:radio[name="service"]:input[value="${petsitterboardVO.petsitterVO.service }"]').attr("checked", true);
		
		var flag = "${flag}";
		if(flag == "true"){
			alert("이미 등록한 회원입니다.");
			location.href="${initParam.root}interceptor_petsitterboard_myPetsitterBoard.do";
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

		$(".datepicker").datepicker(); 
		$.datepicker.regional['ko'] = {
			closeText: '닫기',
		    prevText: '이전달',
		    nextText: '다음달',
		    //currentText: '오늘',
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
		    //showOn: 'both',
		    buttonText: "달력",
		    //buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
		    //buttonImageOnly: false,
		    changeMonth: true,
		    changeYear: true,
		    showButtonPanel: true,
		   	yearRange: ':c+10',
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		    
		//$('#sdate').datepicker();
		$('#sdate').datepicker("option", "minDate", new Date());
		$('#sdate').datepicker("option", "maxDate", $("#edate").val());
		$('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#edate").datepicker( "option", "minDate", selectedDate );
		});
		 
		//$('#edate').datepicker();
		$('#edate').datepicker("option", "minDate", $("#sdate").val());
		$('#edate').datepicker("option", "onClose", function ( selectedDate ) {
			$("#sdate").datepicker( "option", "maxDate", selectedDate );
		});

		$("input:radio[name=service][value="+ "<c:out value='${petsitterVO.service}'/>"+ "]").attr("checked", "checked");
		$("input:radio[name=petSize][value="+ "<c:out value='${petsitterVO.petSize}'/>"+ "]").attr("checked", "checked");
		$("input:radio[name=petType][value="+ "<c:out value='${petsitterVO.petType}'/>"+ "]").attr("checked", "checked");
		$(":input[name=price]").val('${petsitterVO.price}');

	});
</script>
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA" href="${initParam.root}interceptor_member_detail.do">마이페이지</a>
	<a class="BJA" href="${initParam.root}interceptor_member_update.do">회원정보수정</a>
   	<c:if test="${sessionScope.mvo.rank == 'petsitter' || sessionScope.mvo.rank == 'petmaster'}">
       <a class="BJA" href="${initParam.root}interceptor_petsitterboard_registerform.do?id=${sessionScope.mvo.id}"> 돌보미게시글등록</a>
       <a class="BJA" href="${initParam.root}interceptor_petsitterboard_myPetsitterBoard.do">내 글 보기</a>
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
		<form method="post" action="interceptor_petsitterboardUpdate.do"
			id="petsitterboardregForm">
			
			<input type="hidden" name="petsitterNo" value="${requestScope.petsitterboardVO.petsitterVO.petsitterNo}" />
			<input type="hidden" name="petsitterboard_no" value="${requestScope.petsitterboardVO.petsitterboard_no }" />
			<div class="BJWriteTableLine">
				<div class="SBHrAllLine">
					<table class="SBtable">
						<tr id="trFirst">
							<th>Title</th>
							<td colspan="3">
							<input class="SBform-text" type="text" name="petsitterboard_title"  value="${requestScope.petsitterboardVO.petsitterboard_title }"placeholder="타이틀을 입력하세요!" />
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
										<td style="width: 20%;"><input type="radio"
											name="petSize" value="small" />소형</td>
										<td style="width: 10%;"><input type="radio"
											name="petSize" value="middle" />중형</td>
										<td style="width: 20%;"><input type="radio"
											name="petSize" value="large" />대형</td>
									</tr>
								</table>
							</td>
							<th style="vertical-align: middle;">Service</th>
							<td>
								<table style="width: 100%;">
									<tr>
										<td style="width: 20%;"><input type="radio"
											name="service" value="목욕" /> 목욕</td>
										<td style="width: 10%;"><input type="radio"
											name="service" value="산책" /> 산책</td>
										<td style="width: 20%;"><input type="radio"
											name="service" value="픽업" /> 픽업</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">Price</th>
							<td><input type="text" class="SBform-text" name="price" value="${requestScope.petsitterboardVO.petsitterVO.price }"style="width: 80%;">
							</td>
							<td colspan="2" style="vertical-align: middle;">
								<div style="float: left;">가격은 1박 한마리 기준으로 입력해주세요!</div>
							</td>
						</tr>
						<tr>
							<th>Content</th>
							<td colspan="3">
							<textarea id="ta"name="petsitterboard_contents" class="SBform-textarea"style="height: 400px; resize: none;"placeholder="자신의 펫 시터 활동을 홍보할 수 있는 내용을 입력하세요.">${requestScope.petsitterboardVO.petsitterboard_contents}</textarea>
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
