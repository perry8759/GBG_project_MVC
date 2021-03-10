<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />
	<c:forEach var="sport" items="${sports}">
		<a href="<c:url value='/ACT/ACT_Main?sportid=${sport.DOS_SPORT_ID}' />">
			${sport.DOS_SPORT_NAME}</a>
	</c:forEach>


</body>
</html>