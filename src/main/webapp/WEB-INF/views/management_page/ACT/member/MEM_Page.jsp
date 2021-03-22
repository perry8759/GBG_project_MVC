<!-- 管理活動頁面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />

	<jsp:include page="/WEB-INF/views/fragment/topMVC_member.jsp" />
	
	<ul>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${LoginOK.member_perm_id.member_perm_id==1}"> --%>
				<li >
				<a href="<c:url value='/ACT/ListActByMemR' />">已報名活動</a>
				</li>
				<li>
				<a href="<c:url value='/ACT/listQesByMem' />">曾發表問答紀錄</a>
				</li>
<%-- 			</c:when> --%>
<%-- 			<c:when test="${LoginOK.member_perm_id.member_perm_id==2}"> --%>
				<li>
				<a href="<c:url value='/ACT/ListActByMem' />">主辦的活動</a>
				</li>
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>
	</ul>
</html>