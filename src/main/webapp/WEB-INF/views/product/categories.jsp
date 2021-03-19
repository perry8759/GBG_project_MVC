<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="2_main.css">
<script src="jQuery/js/jquery-3.5.1.min.js"></script>
<script src="2_new.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>商品分類</title>
<link rel="stylesheet" href="GBG/css/style.css">
<link rel="stylesheet" href="noob.css">
<script>
	$(document)
			.ready(
					function() {
						$('.mainmenu1')
								.on(
										'click',
										function() {
											$('.set').remove();
											$(this).append(
															"<li class='set'><a href='customerProductCategory?ccId=1&pcId=1'>上衣系列</a></li>");
											$(this).append(
															"<li class='set'><a href='customerProductCategory?ccId=1&pcId=2'>褲子系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=1&pcId=3'>鞋子系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=1&pcId=4'>外套系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=1&pcId=5'>襪子系列</a></li>");
										});
						$('.mainmenu2')
								.click(
										function() {
											$('.set').remove();
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=2&pcId=1'>上衣系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=2&pcId=1'>褲子系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=2&pcId=1'>鞋子系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=2&pcId=1'>外套系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=2&pcId=1'>襪子系列</a></li>");
										});
						$('.mainmenu3')
								.click(
										function() {
											$('.set').remove();
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=3&pcId=1'>上衣系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=3&pcId=2'>褲子系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=3&pcId=3'>鞋子系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=3&pcId=4'>外套系列</a></li>");
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=3&pcId=5'>襪子系列</a></li>");
										});
						$('.mainmenu4')
								.click(
										function() {
											$('.set').remove();
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=4&pcId=6'>球具系列</a></li>")
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=4&pcId=7'>護具系列</a></li>")
											//    $(this).append("<li class='set'><a href=''>訓練系列</a></li>")
										})
						$('.mainmenuall').click(function() {
							$('.set').remove();
						});

					});
</script>
</head>

<body>
	<!-- header -->
<!-- 	<input type="checkbox" name="" id="menu_control"> -->
<!-- 	<div class="header"> -->
<!-- 		<a href="#" class="logo"><img src="GBG/image/logo-1.png" -->
<!-- 			width="180" alt="logo"></a> <label for="menu_control" -->
<!-- 			class="menu_btn"> <span>選單</span> -->
<!-- 		</label> -->
<!-- 		<nav class="menu"> -->
<!-- 			<ul class="menu_ul"> -->
<!-- 				<div class="search"> -->
<!-- 					<input type="text" class="search-bar" id="search" -->
<!-- 						placeholder="Search"> -->
<!-- 					<button class="search-btn"> -->
<!-- 						<i class="fas fa-search"></i> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<li class="active"><a href="#">首頁</a></li> -->
<!-- 				<li><a href="#">賽事</a></li> -->
<!-- 				<li><a href="#">商城</a></li> -->
<!-- 				<li><a href="#">論壇</a></li> -->
<!-- 				<li><a href="#">會員</a></li> -->
<!-- 				<div class="user"> -->
<!-- 					<a href="#" class="user-btn"><img src="GBG/image/user.png" -->
<!-- 						alt="user" class="user-btn-img"> <span>登入</span> </a> -->
<!-- 				</div> -->
<!-- 			</ul> -->
<!-- 		</nav> -->
<!-- 	</div> -->
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<div id="main" style="margin-top: 50px;">
			<div class="d-flex justify-content-center">
<!-- 				<ul style="font-size: 3rem;" class="mainmenuall">全部商品 -->
<!-- 				</ul> -->
				<form action="/GBG_project_mvc/product/search_products" class="search-box">
					<input type="text" name="searchText" placeholder="找商品">
					<select	name=productCategory>
						<option value="-1" label="商品類型"></option>
						<c:forEach var='productCategory' items='${productCategories}'>
							<option value="${productCategory.category_id}">${productCategory.category_name}</option>
						</c:forEach>
					</select>
					<select	name=productStatus>
<!-- 						<option value="-1" label="商品上下架"></option> -->
						<option value="-1" label="商品狀態"></option>
						<c:forEach var='status' items='${productStatus}'>
							<option value="${status.product_stid}">${status.product_st_name}</option>
						</c:forEach>
					</select>
					<button>Search</button>
				</form>
			</div>
		<!-- 左側分類器------------------------------------------------- -->
		<aside id="aside" style="width:20%">
			<ul style="font-size: 2rem;" class="mainmenu1">
				<a href="customerCategory?ccId=1">男性系列</a>
				<li class="set"><a href='customerProductCategory?ccId=1&pcId=1'>上衣系列</a></li>
				<li class="set"><a href="customerProductCategory?ccId=1&pcId=2">褲子系列</a></li>
				<li class="set"><a href="customerProductCategory?ccId=1&pcId=3">鞋子系列</a></li>
				<li class="set"><a href="customerProductCategory?ccId=1&pcId=4">外套系列</a></li>
				<li class="set"><a href="customerProductCategory?ccId=1&pcId=5">襪子系列</a></li>
			</ul>
			<ul style="font-size: 2rem;" class="mainmenu2">
				<a href="customerCategory?ccId=2">女性系列</a>
				<!-- <li>上衣系列</li>
            <li>褲子系列</li>
            <li>鞋子系列</li>
            <li>外套系列</li>
            <li>襪子系列</li> -->
			</ul>
			<ul style="font-size: 2rem;" class="mainmenu3">
				<a href="customerCategory?ccId=3">兒童系列</a>
				<!-- <li>上衣系列</li>
            <li>褲子系列</li>
            <li>鞋子系列</li>
            <li>外套系列</li>
            <li>襪子系列</li> -->
			</ul>
			<ul style="font-size: 2rem;" class="mainmenu4">
				<a href="customerCategory?ccId=4">其他系列</a>
				<!-- <li>球具系列</li>
            <li>護具系列</li>
            <li>訓練系列</li> -->
			</ul>
		</aside>
		<!-- 右側商品顯示位置 -->
		<main-context id="main-context">
		<div style="font-size: 30px; width: 1050px; margin-left: 30px;"
			id="feedback">搜尋結果同XXX筆</div>
		<div class="row">
			<h3>${emptyMessage}</h3>
			<c:if test="${empty products}">
				<h3>if判斷無商品，熱銷商品即將上市1</h3>
			</c:if>
			<c:forEach var="product" items="${products}">
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<div class="thumbnail" style="width: 320px; height: 340px">
						<div class="caption">
							<img width="100" height="100"
								src="<c:url value='/getPicture/${product.product_id}'/>">
							<p>
								<a
									href="<spring:url value='product?id=${product.product_id}' />"
									class="btn btn-primary">${product.product_title}</a>
							</p>
							<p>評分: ${product.average_score}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="prodect">
			<img src="data2/images/img1.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img2.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img20.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img21.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img22.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img23.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img24.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img25.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="images/14.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img26.png">
			<div id="items">商品名稱</div>
		</div>
		<div class="prodect">
			<img src="data2/images/img27.png">
			<div id="items">商品名稱</div>
		</div>

		</main>
	</div>
	<span id="shoppingcar"><a href="4購物車(RWD需要調整).html"><img
			src="cart4.svg" style="width: 80px; height: 80px;"></a></span>
</body>

</html>