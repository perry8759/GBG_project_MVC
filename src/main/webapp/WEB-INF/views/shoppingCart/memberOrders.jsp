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
<link rel="stylesheet" href="GBG/css/style.css">
<link rel="stylesheet" href="noob.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<title>訂單明細</title>
<style>
.height {
	height: 500px;
}

.width {
	width: 200px;
}
</style>
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
	<div class="container ">
		<div class="row">
			<div class="col-12 mt-4 ">
				<h1>你的訂單明細:</h1>
				<div>
					<div class="d-flex justify-content-between">
						<!-- 				先有再求負數搜尋條件                -->
						<div class="ml-3">
							<form action="memberqueryByOrderStatus" method="POST">
								<select id="statusId" name="statusId"
									class="custom-select custom-select-lg ml-4"
									style="width: 150px; height: 45px;">
									<option value="-1" label="全部訂單"></option>
									<c:forEach var='status' items='${orderStatus}'>
										<option value="${status.order_st_id}">${status.order_stname}</option>
									</c:forEach>
								</select> <input type="submit" value="查詢">
							</form>
						</div>
						<!-- ===================下訂單後會寄信再來寫訂單編號搜尋=================== -->
						<!-- 						<div> -->
						<!-- 							<button class="btn btn-link">三個月內的訂單</button> -->
						<!-- 							<span>|</span> -->
						<!-- 							<button class="btn btn-link">未發貨訂單</button> -->
						<!-- 							<span>| 年份 </span> <input type="number" min="2020" style="width: 150px;"> -->
						<!-- 						</div> -->
						<!-- 						<div> -->
						<!-- 							<span class="input ">訂單編號:</span> <input type="text" aria-label="Last name" style="width: 150px;"> -->
						<!-- 							<button class="btn btn-primary " style="width: 100px; height: 35px;">搜尋</button> -->
						<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
		<c:forEach var='order' items='${orders}'>
			<div class="row justify-content-between mt-5">
				<div class="col-4 ">
					<h4>
						<span>訂單編號:</span><span>${order.order_id}</span>
					</h4>
				</div>
				<div class="col-5 ">
					<h4>
						<span>訂購日期:${order.order_date}</span>
					</h4>
				</div>
				<div class="col-3 ">
					<h4>
						<span>訂單狀態:${order.orderSatusBean.order_stname}</span>
					</h4>
				</div>
			</div>
			<div class="row justify-content-between p-2 border">

				<div class="col-8 mb-3">
					<h4>
						<span>收件人:${order.receive_men}</span>
					</h4>
				</div>

				<div class="col-3 ">
					<h4>
						<%-- 					訂購商品數量:<span>${order.order_amount}</span> --%>
						訂購商品數量:<span>未完成</span>
					</h4>
				</div>
				<div class="col-12 mb-3 ">
					<h4>
						配送地址:<span>${order.shipping_address}</span>
					</h4>
				</div>
				<div class="col-12 mb-3 ">
					<h4>
						配送方式:<span>${order.shipping_style}</span>
					</h4>
				</div>
				<div class="col-12 mb-3 ">
					<h4>
						店家出貨時間:<span>${order.shipping_date}</span>
					</h4>
				</div>
				<div class="col-9 mb-3 ">
					<h4>
						完成訂單時間:<span>${order.order_done_date}</span>
					</h4>
				</div>
				<div class="col-3 mb-3 ">
					<h4>
						訂單總金額:<span>未完成</span>
					</h4>
				</div>

			</div>
			<div class="">
				<c:forEach var='OrderDetails' items='${order.orderDetailsBean}'>
					<div>
						<div class="row mt-5 ">
							<div class="col-2">
								<img src="data2/images/980675595_P_00.jpg" style="width: 180px;">
							</div>
							<div class="col-6">
								<h3>${OrderDetails.productDetailBean.productBean.product_title}</h3>
								<h6>${OrderDetails.productDetailBean.product_size}-${OrderDetails.productDetailBean.product_color}
								</h6>
								<!-- 							<button class="btn btn-primary mr-2" style="width: 130px;" type="submit">加入購物車</button> -->
								<button class="btn btn-primary " style="width: 130px;"
									type="submit"
									onclick="location.href='comment/add?id=${OrderDetails.productDetailBean.productBean.product_id}'">為商品評分</button>
							</div>
							<div class="col-1">單價:${OrderDetails.productDetailBean.productBean.product_price}元</div>
							<div class="col-1">數量:${OrderDetails.order_amount}</div>
							<div class="col-2">小計:${OrderDetails.productDetailBean.productBean.product_price*OrderDetails.order_amount}元</div>
						</div>
						<hr>
					</div>
				</c:forEach>
			</div>
		</c:forEach>
		<div class="col-lg-12" style="text-align: right;">
			<button class="btn btn-primary" style="width: 200px;">返回會員主頁</button>
		</div>
	</div>
	<span id="shoppingcar"><a href="4購物車(左邊要調整V).html"><img
			src="cart4.svg" style="width: 80px; height: 80px;"></a></span>
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