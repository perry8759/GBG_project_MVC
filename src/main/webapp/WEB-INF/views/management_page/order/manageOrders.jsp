<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
</head>
<body>
	<input type="checkbox" name="" id="menu_control">
	<div class="header">
		<a href="#" class="logo"><img src="GBG/image/logo-1.png"
			width="180" alt="logo"></a> <label for="menu_control"
			class="menu_btn"> <span>選單</span>
		</label>
		<nav class="menu">
			<ul class="menu_ul">
				<div class="search">
					<input type="text" class="search-bar" id="search"
						placeholder="Search">
					<button class="search-btn">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<li class="active"><a href="#">首頁</a></li>
				<li><a href="#">賽事</a></li>
				<li><a href="#">商城</a></li>
				<li><a href="#">論壇</a></li>
				<li><a href="#">會員</a></li>
				<div class="user">
					<a href="#" class="user-btn"><img src="GBG/image/user.png"
						alt="user" class="user-btn-img"> <span>登入</span> </a>
				</div>
			</ul>
		</nav>
	</div>
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------- -->
	<div class="container-fluid w-75 border"
		style="background-color: rgb(240, 239, 236);">
		<div class="row">
			<div class="col-12 m-4 ">
				<a>訂單管理</a> | <a href="manageProducts">管理商品</a>
			</div>
			<!-- ---------------------- -->
			<div class="col-11 d-flex justify-content-between">
				<div class="ml-3">
					<form name="queryByOrderStatus" action="queryByOrderStatus" method="POST">
						<select id="statusId" name="statusId" class="custom-select custom-select-lg ml-4"
							style="width: 150px; height: 45px;">
							<option value="-1" label="全部訂單"></option>
							<c:forEach var='status' items='${orderStatus}'>
								<option value="${status.order_st_id}">${status.order_stname}</option>
							</c:forEach>
						</select> <input type="submit" value="查詢">
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
					<tr>
						<td style="width: 3%;"></td>
						<td class="border border-secondary" style="width: 150px;">流水號</td>
						<td class="border border-secondary" style="width: 150px;">訂單編號</td>
						<td class="border border-secondary" style="width: 150px;">訂單金額</td>
						<td class="border border-secondary" style="width: 150px;">會員編號</td>
						<td class="border border-secondary" style="width: 150px;">訂購日期</td>
						<td class="border border-secondary" style="width: 150px;">配送日期</td>
						<td class="border border-secondary" style="width: 150px;">完成日期</td>
						<td class="border border-secondary" style="width: 150px;">訂單狀態</td>
						<td style="width: 11%;"></td>
					</tr>
					<c:forEach var='order' items='${orders}'>
						<tr>
							<td style="width: 2%; text-align: center;">
							<c:if test="${order.orderSatusBean.order_st_id==2}">
							<input type="checkbox" name="oseqId" value="${order.oseq_id}">
							</c:if>
							</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.oseq_id}</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id=""><a href="qureyOrder?osId=${order.oseq_id}">${order.order_id}</a> </td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.aggregate_amount}</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.memberBean.member_id}</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.order_date}</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.shipping_date}</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.order_done_date}</td>
							<td class="border border-secondary"
								style="width: 150px; height: 40px;" id="">${order.orderSatusBean.order_stname}</td>
							<td style="width: 11%;">
							<div class="btn btn-secondary">
							<a href="qureyOrder?osId=${order.oseq_id}">查看</a>
<%-- 							<button type="menu"	class="btn btn-secondary" onclick="location.href='qureyOrder?osId=${order.oseq_id}'" >查看</button> --%>
							</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-11 d-flex justify-content-end my-5">
				<button type="submit" class="btn btn-primary">勾選的訂單完成配送</button>
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