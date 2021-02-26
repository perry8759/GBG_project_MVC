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
       <form:form  method="POST" modelAttribute="actBean" >
       <h3>場地名稱:<c:out value="${actBean.dos_id.DOS_NAME}"/></h3>
       
     <div class="form-group row">
	
	<div class="right col-xs-6 text-left">
	    <div class="input-group">
	    <form:hidden path="dos_id.DOS_ID"  class="form-control"  />
	           活動標題: <form:input path="ACT_TITLE"  class="form-control"  />
	           活動簡章: <form:input path="ACT_DESC"  class="form-control"  />
	           活動最大人數: <form:input path="ACT_MAX_PNUM"  class="form-control"  />
	           報名費用:<form:input path="ACT_PAY"  class="form-control"  />
		
		 
		 <form:select path="dos_sport.DOS_SPORT_ID" items="${dos_sport}" itemLabel="DOS_SPORT_NAME" itemValue="DOS_SPORT_ID">
		</form:select>
		 <form:select path="act_status.ACT_STATUS_ID" items="${act_status}" itemLabel="ACT_STATUS_NAME" itemValue="ACT_STATUS_ID">
		</form:select>
		<form:select path="act_rule.ACT_RULE_ID" items="${act_rule}" itemLabel="ACT_RULE_NAME" itemValue="ACT_RULE_ID">
		</form:select>
		 <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
		 <input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
		 
	    </div>
	</div>
</div>
</form:form>
</body>


 
</script>
</html>