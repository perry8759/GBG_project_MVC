<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="2_main.css">
<script src="./JQuery/js/jquery-3.5.1.js"></script>
<script src="2_new.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>客群分類</title>
<link rel="stylesheet" href="GBG/css/style.css">
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
	<div id="main" style="margin-top: 50px;">
		<aside id="aside">
			<c:forEach var='customerCategory' items='${customerCategoryList}'>
				<ul>
					<a href='customerCategory/${customerCategory}'>${customerCategory}</a>
					<br>
				</ul>
			</c:forEach>
		</aside>
		<main-context id="main-context">
		<div style="font-size: 30px; width: 1050px; margin-left: 50px;"
			id="feedback">搜尋結果同XXX筆</div>
		<section class="container">
			<div class="row">
				<c:forEach var="product" items="${products}">
					<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
						<div class="thumbnail" style="width: 320px; height: 340px">
							<div class="caption">
								<p>
									<b style='font-size: 16px;'>${product.product_title}</b>
									<%--                             <b style='font-size: 16px;'>${product["product_title"]}</b> --%>
								</p>
								<p>價格: ${product.product_price}</p>
								<p>評分: ${product.average_score}</p>
								<p>
									<a
										href="<spring:url value='product?id=${product.product_id}' />"
										class="btn btn-primary"><span
										class="glyphicon-info-sigh glyphicon"></span>詳細資料</a>

								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>

		</main>
	</div>
</body>
</html>