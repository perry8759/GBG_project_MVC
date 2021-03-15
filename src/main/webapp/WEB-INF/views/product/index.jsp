<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<title>商城首頁</title>
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
	<!-- <section>
            <div class="jumbotron jumbotron jumbotron-bg d-flex align-items-end">
                <div class="container jumbotron-text  text-white p-4">
                    
                    
                </div>
            </div>
        </section> -->
	<!--         =====================================測試頁面======================================= -->
	<a href="queryByCategory">使用分類找商品</a>
	<br>
	<a href="manageProducts">管理商品(ing)</a>
	<br>

	<a href="addProduct">新增商品(ing)</a>
	<br>
	<a href="manageOrders">管理訂單(未完成)</a>
	<br>

	<a href="queryShoppingCart">查看購物車(未完成)</a>
	<br>
	<a href="queryFavoriteList">查看收藏清單(未完成)</a>
	<br>
	<a href="queryMemberOrders">查看會員歷史訂單(未完成)</a>
	<br>
	<a href="queryProductComment">查看會員評論(未完成)</a>
	<br>

	<!--         =====================================測試頁面======================================= -->
	<section>
		<div class="jumbotron jumbotron jumbotron-bg d-flex align-items-end">
			<div class="container jumbotron-text  text-white p-4">
				<h1 class="display-4 " style="font-weight: bold;">買到賺到！年終出清！</h1>
				<p class="lead">This is a modified jumbotron that occupies the
					entire horizontal space of its parent.</p>
			</div>
		</div>
	</section>
	<hr>
	<div class="container-fluid w-75">
		<div class="row">
			<h1 class="my-4">暢銷商品</h1>
			<hr>
			<section class="container">
				<div class="row">
					<c:forEach var="product" items="${hotPs}">
						<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
							<div class="thumbnail" style="width: 320px; height: 340px">
								<div class="caption">
									<img width="100" height="100"
										src="<c:url value='/getPicture/${product.product_id}'/>">
									<p>
										<a href="<spring:url value='product?id=${product.product_id}' />"
											class="btn btn-primary">${product.product_title}</a>
									</p>
									<p>評分: ${product.average_score}</p>
																	<a
									href="<spring:url value='comment/add?id=${product.product_id}' />">新增商品評論</a><br>
								<a
									href="<spring:url value='shoppingCart/add?id=${product.product_id}' />">加入購物車</a><br>
								<a
									href="<spring:url value='favoriteList/add?id=${product.product_id}' />">加入收藏清單</a><br>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		</div>
		<h1 class="my-4">最新上架</h1>
		<hr>
		<section class="container">
			<div class="row">
				<c:forEach var="newP" items="${newPs}">
					<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
						<div class="thumbnail" style="width: 320px; height: 340px">
							<div class="caption">
								<img width="100" height="100"
									src="<c:url value='/getPicture/${newP.product_id}'/>">
								<p>
									<a href="<spring:url value='product?id=${newP.product_id}' />"
										class="btn btn-primary">${newP.product_title}</a>
								</p>
								<p>評分: ${newP.average_score}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
		<div class="col-12">
			<table>
				<tr>
					<td>
						<div>
							<img src="../images/washDrawing/013.JPG" class="border border"
								style="max-width: 160px; margin-left: 20px;"> <img
								src="../images/washDrawing/011.JPG" class="border border"
								style="max-width: 160px; margin-left: 20px;"> <img
								src="../images/washDrawing/017.JPG" class="border border"
								style="max-width: 160px; margin-left: 20px;"> <img
								src="../images/washDrawing/021.JPG" class="border border"
								style="max-width: 160px; margin-left: 20px;"> <img
								src="../images/washDrawing/027.JPG" class="border border"
								style="max-width: 160px; margin-left: 20px;"> <img
								src="../images/washDrawing/033.JPG" class="border border"
								style="max-width: 160px; margin-left: 20px;">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<hr style="border: 1 dashed #aaa" width="100%" color=#aaa SIZE=1>
		<div class="col-3" style="text-align: center;">
			<div class="detail_t">男性系列</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4">上衣</div>
			<div class="mt-4">褲子</div>
			<div class="mt-4">鞋子</div>
			<div class="mt-4">外套</div>
			<div class="mt-4">襪子</div>
		</div>
		<div class="col-3" style="text-align: center;">

			<div class="detail_t">女性系列</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4">上衣</div>
			<div class="mt-4">褲子</div>
			<div class="mt-4">鞋子</div>
			<div class="mt-4">外套</div>
			<div class="mt-4">襪子</div>
		</div>
		<div class="col-3" style="text-align: center;">
			<div class="detail_t">兒童系列</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4">上衣</div>
			<div class="mt-4">褲子</div>
			<div class="mt-4">鞋子</div>
			<div class="mt-4">外套</div>
			<div class="mt-4">襪子</div>
		</div>
		<div class="col-3" style="text-align: center;">
			<div class="detail_t">其他系列</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4">球具</div>
			<div class="mt-4">護具</div>
			<div class="mt-4">訓練</div>
		</div>
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