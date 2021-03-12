<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>帳號管理</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> 
	<script src="./js/jquery.js"></script>
	<script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/member_css/BK_style.css">
	<script>
	    $(function() {
	      $("#tabs").tabs();
	    } );
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<div class="row">             
        <div class="container"> 
            <ul class="breadcrumb">
                <li><a href="#">活動管理</a></li>
                <li><a href="#">商城管理</a></li>
                <li><a href="#">公告管理</a></li>
                <li><a href="#">場地管理</a></li>
                <li><a href="#">帳號管理</a></li>
            </ul>    
            <h3 class="text-center">帳號管理</h3>
            
            <form class="form">
                搜尋:
                    <input type="text" placeholder="">
                <button>送出</button>
            </form>
                <hr>                  
                <br>
                <div id="tabs">
                    <ul>
                        <li><a href="#1">凍結中</a></li>
                        <li><a href="#2">正常使用中</a></li>
                    </ul>
                </div>
                <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">帳號流水號</th>
                        <th scope="col">帳號名稱</th>
                        <th scope="col">帳號狀態</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>123123</td>
                        <td>武鬥家</td> 
                        <td><a href="">凍結中</a></td>                                                                            
                    </tr>         
                    <tr>
                        <td>987654</td>
                        <td>音樂家</td>     
                        <td><a href="">正常使用中</a></td>                                                                             
                    </tr>                     
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="4"> 
                            <a href="#" class="item" >上一頁</a>
                            <a href="#" class="item" >下一頁</a>
                        </th>
                    </tr>
                </tfoot>
  
                </table>
        </div>
    </div>
</body>
</html>