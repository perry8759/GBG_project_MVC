<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>導航</title>
 
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css_index/Navigation_style.css" >
</head>
<body>
    <ul>
      <li class="box1"><a href="<c:url value='/ACT/Manager_ACT_list' />">活動管理</a> </li>
      <li class="box2"><a href="<c:url value='/product/manageProducts' />">商城管理</a></li>
      <li class="box3"><a href="<c:url value='/' />">回首頁</a></li>
      <li class="box4"><a href="<c:url value='/DOS/DOS_list' />">場地管理</a></li>
      <li class="box5"><a href="<c:url value='/member/memberManager' />">帳號管理</a></li>
    </ul>
</body>
</html>