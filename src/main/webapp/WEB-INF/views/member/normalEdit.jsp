<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
    <title>修改會員資料</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/SignUp_Style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
    <jsp:include page="/WEB-INF/views/fragment/sideOption.jsp" />
    <!-- -------------------------------------------------------------------------------------------------- -->
	<div class="signup">
		<form:form class="form" method="POST" modelAttribute="memberBean" enctype="multipart/form-data">
			<h2>修改會員資料</h2>
				<div class="all-group">
					<div class="group">
						帳號: ${LoginOK.member_account}<br>
						真實姓名: ${LoginOK.member_real_name}<br><br>
						暱稱: <form:input path="member_user_name" class="form-control"/>
						<form:errors path="member_user_name" cssClass="error"/><br><br>
						性別: ${LoginOK.member_sex_id.member_sex_name}<br><br>
						頭貼照片:<form:input path="productImage" type="file" accept=".png" class="form-control" style="width: 190px;"/>
						<form:errors path="productImage" cssClass="error"/><br><br>
						<img width='100' height='200' src="<c:url value='getPicture' />" /><br><br>
					</div>
					<div class="group1">
						電子信箱:<form:input path="member_email" class="form-control"/>
						<form:errors path="member_email" cssClass="error"/><br><br>
						手機號碼:<form:input path="member_mobile_phone" class="form-control"/>
						<form:errors path="member_mobile_phone" cssClass="error"/><br><br>
						市話號碼:<form:input path="member_fixed_line_telephone" class="form-control"/>
						<form:errors path="member_fixed_line_telephone" cssClass="error"/><br><br>
						出生日期: ${LoginOK.member_birthday}<br><br>
						地址:<form:input path="member_address" class="form-control"/>
						<form:errors path="member_address" cssClass="error"/><br><br>
						<input type="submit" class="btn" value="送出">
					</div>
				</div>
		</form:form>
	</div>
</body>
</html>