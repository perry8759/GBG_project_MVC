<!-- 改到一半 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主辦活動表單</title>
<link rel="stylesheet" type="text/css"
	href="/css/act/jquery.datetimepicker.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="/js/jquery.js"></script>
<script src="/js/act/jquery.datetimepicker.full.min.js"></script>

</head>
<body>
	<%-- 	<jsp:include page="/fragment/topMVC2.jsp" />有了header時間就會跳不出來 --%>
	<div class="container col-md-8">
		<div class="card">
			<div class="card-body">
					<form:form method="POST" modelAttribute="actBean" id="ACTform" enctype='multipart/form-data'>
					<h2>
						<c:if test="${act != null}">
                       		編輯活動表單
                       		<input type="hidden" name="ACT_ID" value="<c:out value='${act.ACT_ID}' />" />
                    	</c:if>
                    	<c:if test="${act == null}">
                       		主辦活動表單
                    	</c:if>
					</h2>
                    
					<div class="form-group">
						<label>活動標題:</label>
						<form:input path="ACT_TITLE"  class="form-control" value="<c:out value='${act.ACT_TITLE}' id="title_input" />"/>
						<div class="error" id="title_error"></div>
					</div>
					<div class="form-group">
						<label>活動簡介:</label>
						<form:input path="ACT_DESC" />
						<input type="text" class="form-control"
							name="ACT_DESC" value="<c:out value='${act.ACT_DESC}' />"><br>
					</div>
					<div class="form-group">
						主辦方名稱:${sessionScope.LoginOK.member_real_name}<br>
					</div>
					<div class="form-group">
					<c:if test="${act != null}">
                        球類類型:${act.dos_sport.DOS_SPORT_NAME}  
                        <input type="hidden" name="dos_sport" value="${act.dos_sport.DOS_SPORT_ID}">           
                    </c:if>
                    <c:if test="${act == null}">
						球類類型:<br>
						<form:select path="dos_sport.DOS_SPORT_ID" items="${SPORT}" 
										itemLabel="DOS_SPORT_NAME" itemValue="DOS_SPORT_ID"/>
					</c:if>
					</div>
					<div class="form-group">
						報名費用:<form:input path="ACT_PAY" />
						<input type="text" class="form-control" name="ACT_PAY" value="<c:out value='${act.ACT_PAY}' />">
						<br>
					</div>
					<div class="form-group">
						參加隊伍上限:<form:input path="" />
						<input type="text" class="form-control" name="ACT_MAX_TEAM" value="<c:out value='${act.ACT_MAX_TEAM}' />"><br>
					</div>
					<div class="form-group">
						總人數上限:<form:input path="ACT_MAX_PNUM" />
						<input type="text" class="form-control" name="ACT_MAX_PNUM" value="<c:out value='${act.ACT_MAX_PNUM}' />"><br>
					</div>
					<div class="form-group">
					<c:if test="${act != null}">
						場地: ${act.dos_id.DOS_NAME}
						<form:hidden path="dos_id.DOS_ID" value="${act.dos_id.DOS_ID}"/>
						<input type="hidden" value="${act.dos_id.DOS_ID}"
							name="DOS_ID"><br><!--未來想改成可修改 -->
					</c:if>
                    <c:if test="${act == null}">
                    	場地: ${DOSID.DOS_NAME}
                    	<input type="hidden" value="${DOSID.DOS_ID}"
							name="DOS_ID"><br><!--未來想改成可選 -->
                    </c:if>
					</div>
					<div class="form-group">
						比賽文件:
						<form:input path="" />
						<input type="file" class="form-control" name="ACT_RFORM" value="<c:out value='${act_forms}' />"><br>
					</div>
					<div class="input-group">
						<div class="form-group">
							比賽開放報名時間: <input type="text" class="form-control form_datetime"
								id="time" name="time" data-date-format="yyyy-mm-dd hh:ii"
								placeholder="請點選時間" value="<c:out value='${act.ACT_SIGN_O}' />"> <input type="hidden"
								name="ACT_SIGN_O" value="" id="selectedDtaeVal"> <br>
						</div>
						<div class="form-group">
							比賽報名截止時間:<input type="text" class="form-control form_datetime1"
								id="time1" name="time1" data-date-format="yyyy-mm-dd hh:ii"
								placeholder="請點選時間" value="<c:out value='${act.ACT_SIGN_C}' />"> <input type="hidden"
								name="ACT_SIGN_C" value="" id="selectedDtaeVal"><br>
						</div>
						<div class="form-group">
							比賽開始日期:<input type="text" class="form-control form_datetime2"
								id="time2" name="time2" data-date-format="yyyy-mm-dd hh:ii"
								placeholder="請點選時間" value="<c:out value='${act.ACT_RUN_O}' />"> <input type="hidden"
								name="ACT_RUN_O" value="" id="selectedDtaeVal"><br>
						</div>
						<div class="form-group">
							比賽結束日期:<input type="text" class="form-control form_datetime3"
								id="time3" name="time3" data-date-format="yyyy-mm-dd hh:ii"
								placeholder="請點選時間" value="<c:out value='${act.ACT_RUN_C}' />"> <input type="hidden"
								name="ACT_RUN_C"> <br>
						</div>
						<span class="input-group-addon" id="basic-addon2"> <span
							class="glyphicon glyphicon-time" aria-hidden="true"></span>
						</span>
					</div>
					<input onclick="fun()" type="submit" class="btn btn-success"
						value="主辦活動">
				</form:form>
			</div>
		</div>
	</div>
</body>
<script>
	function fun() {
		document.getElementById('time').value = '';
		document.getElementById('time1').value = '';
		document.getElementById('time2').value = '';
		document.getElementById('time3').value = '';
	}
	$(function() {
		$('.form_datetime').datetimepicker({
			language : 'zh-CN',
			format : 'Y-m-d H:i:00',
			todayBtn : 1,
			autoclose : 1,
			step : 15,
			minView : 0, //0表示可以選擇小時、分鐘   1只可以選擇小時
			minuteStep : 10,//分鐘間隔10分鐘	
		});
		$(".form_datetime").on("change", function() {
			var selected = $(this).val();
			$('input[name="ACT_SIGN_O"]').val(selected);
		});

	});
	$(function() {
		$('.form_datetime1').datetimepicker({
			language : 'zh-CN',
			format : 'Y-m-d H:i:00',
			todayBtn : 1,
			autoclose : 1,
			step : 15,
			minView : 0, //0表示可以選擇小時、分鐘   1只可以選擇小時
			minuteStep : 10,//分鐘間隔10分鐘	
		});
		$(".form_datetime1").on("change", function() {
			var selected = $(this).val();
			$('input[name="ACT_SIGN_C"]').val(selected);
		});

	});
	$(function() {
		$('.form_datetime2').datetimepicker({
			language : 'zh-CN',
			format : 'Y-m-d H:i:00',
			todayBtn : 1,
			autoclose : 1,
			step : 15,
			minView : 0, //0表示可以選擇小時、分鐘   1只可以選擇小時
			minuteStep : 10,//分鐘間隔10分鐘	
		});
		$(".form_datetime2").on("change", function() {
			var selected = $(this).val();
			$('input[name="ACT_RUN_O"]').val(selected);
		});
	});
	$(function() {
		$('.form_datetime3').datetimepicker({
			language : 'zh-CN',
			format : 'Y-m-d H:i:00',
			todayBtn : 1,
			autoclose : 1,
			step : 15,
			minView : 0, //0表示可以選擇小時、分鐘   1只可以選擇小時
			minuteStep : 10,//分鐘間隔10分鐘	
		});
		$(".form_datetime3").on("change", function() {
			var selected = $(this).val();
			$('input[name="ACT_RUN_C"]').val(selected);
		});
	});
	$(function() {
		var title_input = $('#title_input');
		var title_error = $('#title_error');
		title_error.hide();
		function title_validate() {
			var title = title_input.val();
			var user = {
				'ACT_MAIN_TITLE' : title
			};//Q:這是甚麼?
			if (title.trim() == "") {
				title_error.html("不能為空");
				title_error.show();
				title_input.val("").focus();
			} else {
				title_error.hide();
			}
		}
		title_input.blur(title_validate);
	});

// // 	 下面處理文件與圖片
// 	$("").change(function(){
//   readURL(this);
// 	});
// 	function readURL(input){
// 	  if(input.files && input.files[0]){
// 	    var reader = new FileReader();
// 	    reader.onload = function (e) {
// 	       $("").attr('src', e.target.result);
// 	    }
// 	    reader.readAsDataURL(input.files[0]);
// 	  }
// 	}
</script>
</html>