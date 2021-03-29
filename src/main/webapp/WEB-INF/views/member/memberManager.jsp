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
	<script src="${pageContext.request.contextPath}/js_member/jquery.js"></script>
	<script src="https://kit.fontawesome.com/82fbc43281.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/BK_style.css">
	<script>
	(function(document) {
		  'use strict';

		  // 建立 LightTableFilter
		  var LightTableFilter = (function(Arr) {

		    var _input;

		    // 資料輸入事件處理函數
		    function _onInputEvent(e) {
		      _input = e.target;
		      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
		      Arr.forEach.call(tables, function(table) {
		        Arr.forEach.call(table.tBodies, function(tbody) {
		          Arr.forEach.call(tbody.rows, _filter);
		        });
		      });
		    }

		    // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
		    function _filter(row) {
		      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
		      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		    }

		    return {
		      // 初始化函數
		      init: function() {
		        var inputs = document.getElementsByClassName('light-table-filter');
		        Arr.forEach.call(inputs, function(input) {
		          input.oninput = _onInputEvent;
		        });
		      }
		    };
		  })(Array.prototype);

		  // 網頁載入完成後，啟動 LightTableFilter
		  document.addEventListener('readystatechange', function() {
		    if (document.readyState === 'complete') {
		      LightTableFilter.init();
		    }
		  });

		})(document);
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
<%-- 	<jsp:include page="/WEB-INF/views/fragment/topMVC_manager.jsp" /> --%>
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
                    <input type="search" name="memberSearch" class="light-table-filter" placeholder="請輸入關鍵字" data-table="table-bordered">
            </form>
                <hr>                  
                <br>
                <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">帳號流水號</th>
                        <th scope="col">帳號名稱</th>
                        <th scope="col">會員權限</th>
                        <th scope="col">帳號狀態</th>
                    </tr>
                </thead>
                <tbody>
               
                <c:forEach varStatus="vs" var="i" items="${memberList}">
					<tr>
						<td>${i.member_id}</td>
						<td>${i.member_account}</td>
						<td>${i.member_perm_id.member_perm_name}</td>
						<td>
							<form method="POST">
								<select name="managerStatusId" onchange="this.form.submit()">
							 		<option value="1" label="開放" <c:if test="${i.manage_status_id.manage_status_id == 1}">selected</c:if>/>
							 		<option value="2" label="封鎖" <c:if test="${i.manage_status_id.manage_status_id == 2}">selected</c:if>/>
							 		<option value="3" label="未驗證" <c:if test="${i.manage_status_id.manage_status_id == 3}">selected</c:if>/>
							 	</select>
							 	<input type="hidden" name="memberId" value="${i.member_id}">
							 </form>
						 </td>
					</tr>
				</c:forEach>
                </tbody>
<!--                 <tfoot> -->
<!--                     <tr> -->
<!--                         <th colspan="4">  -->
<!--                             <a href="#" class="item" >上一頁</a> -->
<!--                             <a href="#" class="item" >下一頁</a> -->
<!--                         </th> -->
<!--                     </tr> -->
<!--                 </tfoot> -->
  
                </table>
        </div>
    </div>
</body>
</html>