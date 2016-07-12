<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {
		$("#findForm").submit(function() {
			if ($("#id").val().length < 4 || $("#id").val().length > 11) {
				alert("아이디는 4자 이상 11자 이하만 가능합니다. 정확한 아이디를 입력하세요.");
				$("#id").focus();
				return false;
			}
		});
	});
</script>

<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
	<div class="BJHeaderLayout">
		<div class="BJHeader2">
			<a class="BJA" href="${initParam.root}admin_adminList.do">직원 목록</a> 
			<a class="BJA" href="${initParam.root}admin_findById.do">관리자 권한 부여</a>
		</div>
	</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">사원 관리</h3>
			</div>
			<div class="panel-body">검색을 통해 관리자의 권한을 부여합니다.</div>
		</div>
	</div>
	<div class="BJMain2Div" align="center">
		<div class="BJWriteTableLine">
			<div class="SBHrAllLine_2">
				<form id="findForm" action="${initParam.root}admin_findInfoByValue.do">
					<div style="vertical-align: middle;">
						<table>
							<tr>
								<td width="30%">
									<div style="float: right;width: 40%;">
										<select class="WJform-control " name="how" id="how">
											<option value="id">아이디</option>
											<option value="name">이름</option>
										</select>
									</div>
								</td>
								<td width="30%"><input class="SBform-text_1" type="text" id="value" name="value"></td>
								<td width="30%"><div style="margin-right: 80%;">
								<input type="submit" value="검색" class="active SBbtn_2 btn-default"></div></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>