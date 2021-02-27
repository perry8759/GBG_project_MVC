<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- 導覽列bootstrap -->
<nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand">
            <span>GBG</span>
          </a>
          <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu">
            <span class="sr-only">導覽按鈕</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div id="navbar-menu" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<c:url value='/' />">首頁</a></li>
            <c:if test="${empty LoginOK}">
            <li><a href="<c:url value='/register/register.jsp' />">註冊</a></li>
            </c:if>
            <c:if test="${empty LoginOK}">
            <li><a href="<c:url value='/loginform/login01' />">登入</a></li> 
            </c:if>
            <c:if test="${! empty LoginOK}">  
            <li><a href="<c:url value='/loginform/logout' />">登出</a></li>
            </c:if>
            <li><a href="<c:url value='/DOS/DOS_Index' />">查詢所有場地</a></li>
            <li><a href="<c:url value='/ACT/ACT_Main' />">查詢所有活動</a></li>
            
		    <c:choose>
		          <c:when test="${LoginOK.member_perm_id.member_perm_id==2 }">
		             <li><a href="<c:url value='' />">HI主辦方! ${LoginOK.member_account }-管理活動</a></li>
		          </c:when>
		          <c:when test="${LoginOK.member_perm_id.member_perm_id==1 }">
		             <li><a href="<c:url value='/ACT/ACT_list' />">HI管理員! ${LoginOK.member_account }-管理活動</a></li>
		             <li><a href="<c:url value='/DOS/DOS_list' />">管理場地</a></li>
		          </c:when>
		          <c:when test="${LoginOK.member_perm_id.member_perm_id==3 }">
		             <li><a href="#">HI一般會員! ${LoginOK.member_account }</a></li>		         
		          </c:when>		          
		    </c:choose>
          </ul>
        </div>
      </div>
    </nav>
</body>
</html>