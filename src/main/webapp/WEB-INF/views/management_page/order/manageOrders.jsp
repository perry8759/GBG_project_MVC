<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="GBG/css/style.css">
<title>管理訂單</title>
<style type="text/css">
.game-list_head {
    padding: 0 12px;
    background: #131212;
    color: #fff;
    font-size: 20px;
    max-width: 100%;
}
/* table { */
/*     border-collapse: collapse; */
/* } */
</style>
</head>
<body  style="background-color: rgb(240, 239, 236);">
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------- -->
	<div class="container-fluid w-75 border"style="background-color: rgb(255, 255, 255);">
		<div class="row">
			<div class="col-12 ml-5 mt-3 mb-3">
				<a>訂單管理</a> | <a href="/GBG_project_mvc/product/manageProducts">管理商品</a>
			</div>
			<!-- ---------------------- -->
			<div class="col-11 d-flex justify-content-between mt-3">
				<div class="ml-3">
					<form name="queryByOrderStatus" action="queryByOrderStatus" method="POST">
						<select id="statusId" name="statusId" class="custom-select custom-select-lg ml-4"
							style="width: 150px; height: 45px;">
							<option value="-1" label="全部訂單"></option>
							<c:forEach var='status' items='${orderStatus}'>
								<option value="${status.order_st_id}">${status.order_stname}</option>
							</c:forEach>
						</select> <input type="submit" class="btn text-white" style="background-color:#DE520E;width: 130px; height: 45px" value="查詢">
					</form>
				</div>
<!-- 				<div> -->
<!-- 					<div class=""> -->
<!-- 						<input type="text" class="" id="" placeholder="輸入訂單編號"> -->
<!-- 						<button class="btn btn-outline-dark mr-4">搜尋</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
			<!-- ---------表格------------- -->
			<form:form action="checkOrdersDone" method="POST">
			<div class="col-12">
				<table class="mt-5">
					<tr  class="game-list_head">
						<td style="width: 3%;background:#fff;"></td>
						<td class="border border-secondary" style="width: 6%;"align="center">流水號</td>
						<td class="border border-secondary" style="width: 200px;"align="center">訂單編號</td>
						<td class="border border-secondary" style="width: 150px;"align="center">訂單金額</td>
						<td class="border border-secondary" style="width: 9%;"align="center">會員編號</td>
						<td class="border border-secondary" style="width: 150px;"align="center">收件人</td>
						<td class="border border-secondary" style="width: 150px;"align="center">訂購日期</td>
						<td class="border border-secondary" style="width: 150px;"align="center">配送日期</td>
						<td class="border border-secondary" style="width: 150px;"align="center">完成日期</td>
						<td class="border border-secondary" style="width: 150px;"align="center">訂單狀態</td>
<!-- 						<td style="width: 11%;"></td> -->
						<td style="width: 5%;background:#fff;"></td>
					</tr>
					<c:forEach var='order' items='${orders}'>
						<tr>
							<td style="width: 2%; text-align: center;">
							<c:if test="${order.orderSatusBean.order_st_id==2}">
							<input type="checkbox" name="oseqId" value="${order.oseq_id}">
							</c:if>
							</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${order.oseq_id}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center"><a href="qureyOrder?osId=${order.oseq_id}">${order.order_id}</a> </td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${order.aggregate_amount}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${order.memberBean.member_id}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${fn:substring((order.receive_men), 0, 1)}O${fn:substring((order.receive_men), 2, 3)}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${fn:substring((order.order_date), 0, 10)}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${fn:substring((order.shipping_date), 0, 10)}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${fn:substring((order.order_done_date), 0, 10)}</td>
							<td class="border border-secondary"
								style="height: 40px;" id=""align="center">${order.orderSatusBean.order_stname}</td>
							<td >
							<div class="btn text-white ml-1" style="background-color:#DE520E;">
							<a style="color: white" href="qureyOrder?osId=${order.oseq_id}">查看</a>
<%-- 							<button type="menu"	class="btn btn-secondary" onclick="location.href='qureyOrder?osId=${order.oseq_id}'" >查看</button> --%>
							</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-12 d-flex justify-content-end my-5">
				<button type="submit" class="btn btn-primary mr-5" style="height: 45px;">勾選的訂單完成配送</button>
<!-- 				<button class="btn btn-primary mx-4">儲存並離開</button> -->
			</div>
				</form:form>
			<!-- --------------地下按鈕-------- -->
		</div>
	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
</body>
</html>