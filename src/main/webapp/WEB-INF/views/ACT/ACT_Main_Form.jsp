<!-- 建立活動表單 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/fragment/topMVC.jsp" />

       <form:form  method="POST" modelAttribute="actBean" >
       <h3>場地名稱:<c:out value="${actBean.dos_id.DOS_NAME}"/></h3>
       
     
	    <form:hidden path="dos_id.DOS_ID"  class="form-control"  />
	           活動標題: <form:input path="ACT_TITLE"  class="form-control"  />
	           活動簡章: <form:input path="ACT_DESC"  class="form-control"  />
	           活動最大人數: <form:input path="ACT_MAX_PNUM"  class="form-control"  />
	           報名費用:<form:input path="ACT_PAY"  class="form-control"  />
		
		 
		  <div class="form-group">
    <div class="input-group">
        <form:input path="ACT_SIGN_O" class="form-control form_datetime" id="time" name="time"  data-date-format="yyyy-mm-dd hh:ii:00" autocomplete="off"/>
        <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    </div>
</div>
		   
		   <div class="form-group">
    <div class="input-group">
		   <form:input path="ACT_SIGN_C" class="form-control form_datetime1" id="time1" name="time1"  data-date-format="yyyy-mm-dd hh:ii:00" autocomplete="off"/>
		 <span class="input-group-addon">
            <span class="glyphicon glyphicon-calendar"></span>
        </span>
    </div>
</div>
		 
		 <form:select path="dos_sport.DOS_SPORT_ID" items="${dos_sport}" itemLabel="DOS_SPORT_NAME" itemValue="DOS_SPORT_ID">
		</form:select>
		 
		<form:select path="act_rule.ACT_RULE_ID" items="${act_rule}" itemLabel="ACT_RULE_NAME" itemValue="ACT_RULE_ID">
		</form:select>
		
		 <input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />	   
</form:form>

</body>
<script>

$(function(){
	$('.form_datetime').datetimepicker({	
		
		format: 'Y-m-d h:i:00',
		todayBtn:  1,
		autoclose: 1,
		step:15,
		minView:0,  //0表示可以選擇小時、分鐘   1只可以選擇小時
		minuteStep:10,//分鐘間隔10分鐘	
	});
	
	
});
$(function(){
	$('.form_datetime1').datetimepicker({	
		
		format: 'Y-m-d h:i:00',
		todayBtn:  1,
		autoclose: 1,
		step:15,
		minView:0,  //0表示可以選擇小時、分鐘   1只可以選擇小時
		minuteStep:1,//分鐘間隔10分鐘	
	});
});

</script>
</html>