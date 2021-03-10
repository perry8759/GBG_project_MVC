<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>留言</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form:form method="POST" modelAttribute="QesBean" >
					<caption>
						<h2>留言</h2>
					</caption>

					<fieldset class="form-group">
						<label>輸入內文</label> 
<%-- 						<form:textarea path="ACT_QES_COM" class="form-control"/> --%>
						<textarea class="form-control" cols="80" rows="14" name="comment" required="required"></textarea>
					</fieldset>
					<input type="hidden" value="${ActBean.ACT_ID}" name="Actid">
				 <input
						type="submit" class="btn btn-success" value="送出留言">
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>