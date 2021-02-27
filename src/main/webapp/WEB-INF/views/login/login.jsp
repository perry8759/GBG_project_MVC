<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
     <c:set var="funcName" value="LOG" scope="session"/>
      <form:form method="POST" modelAttribute="memberBean" action="login.do">

            帳號:<form:input  path="member_account" size="10" />
             密碼:<form:input  type="password" path="member_pw"  />
             <input type="submit" value="登入" />
      </form:form>
</body>
</html>