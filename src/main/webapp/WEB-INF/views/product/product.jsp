<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="STAR.css">
<title>商品</title>
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
	<div class="container-fluid w-75">
		<div class="row">
			<div class="col-1 ">
				<img id="imgm1" src="images/14.png" style="max-width: 100px;">
				<img id="imgm2" src="images/14.png" style="max-width: 100px;">
				<img id="imgm3" src="images/14.png" style="max-width: 100px;">
				<img id="imgm4" src="images/14.png" style="max-width: 100px;">
				<img id="imgm5" src="images/14.png" style="max-width: 100px;">
			</div>
			<div class="col-5">
				<img src="images/14.png">
			</div>
			<div class="col-6">
				<div class="row"
					style="background-color: red; width: 600px; height: 170px; word-break: break-all; font-size: 3rem;">${product.product_title}</div>
				<div class="row"
					style="background-color: green; width: 600px; height: 100px;">
					<div class="col-12">
						<div class="ratings">
							<div class="empty-stars"></div>
							<div class="full-stars" style="width: 80%">${product.average_score}</div>
						</div>
					</div>
				</div>
				<div class="col-12" style="font-size: 2rem;">優惠價:${product.product_price}</div>
				<div class="row justify-content-between"
					style="background-color: lightblue; width: 600px; height: 50px;">
					<h4>寄送方式</h4>
					<h4>客樂得貨到付款</h4>
					<h4>滿千免運</h4>
				</div>
				<div class="row"
					style="background-color: rgb(212, 192, 79); width: 600px; height: 50px;">
					<h4>
						顏色
						<c:forEach var='color'
							items='${product.productDetailBean.product_color}'>
							<button type="button" class="btn btn-link btn-outline-dark ml-2"
								value="">${color}</button>
						</c:forEach>
						<!-- 						<button style="margin-left: 150px;" type="button" -->
						<!-- 							class="btn btn-link btn-outline-dark">紅色</button> -->

					</h4>
				</div>
				<div class="row" style="width: 600px; height: 70px;">
					<h4>
						尺寸
						<c:forEach var='size'
							items='${productDetailSize}'>
							<button type="button" class="btn btn-link btn-outline-dark ml-2"
								value="">${size}</button>
						</c:forEach>
					</h4>
				</div>
				<div class="row">
					<h4>
						數量 <input type="number" min="1"
							style="width: 50px; margin-left: 150px;">
					</h4>
					<span class="ml-3">剩餘數量XXX件</span>
				</div>
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-8"></div>
			<div class="col-4">
				<button type="button" class="btn btn-primary btn-lg">加入購物車</button>
				<button type="button" class="btn btn-primary btn-lg ml-3">立即結帳</button>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-10">
				<table>
					<h1>商品規格</h1>
					<ul style="list-style: none;" id="">
						<li>國際尺寸</li>
						<li>一般版型</li>
						<li>棉</li>

					</ul>
					<h1>詳細內容</h1>
					<div></div>
				</table>
				<table>
					<tr style="height: 150px;">
						<td style="width: 300px;"><img src="images/16.png"
							style="width: 200px;"></td>
						<td style="width: 700px;">
							<div>帳號:abc12345</div>
							<div class="ratings">
								<div class="empty-stars"></div>
								<div class="full-stars" style="width: 70%"></div>
							</div>
							<div class="mt-2">
								評論時間: <span id="">${product.productCommentBean.comment_date}</span>
							</div>
							<div class="mt-2" style="word-break: break-all;">
								評論內容: <span id="">${product.productCommentBean.comment_comment}評論內容</span>
							</div>
						</td>
						<td>
							<button style="width: 100px;">濫用檢舉</button>
						</td>

					</tr>
				</table>
			</div>
			<div class="col-2">
				<h1>推薦商品</h1>
				<table style="margin-top: 20px;">
					<div class="col-12  d-flex">
						<img src="../images/washDrawing/013.JPG" style="max-width: 250px;">
						<div>
							<div style="word-break: keep-all; font-size: 24px;">商品名稱</div>
							<div>
								<div class="ratings">
									<div class="empty-stars"></div>
									<div class="full-stars" style="width: 70%"></div>
								</div>
								<div style="margin-top: 60px;">價格750元</div>
							</div>
				</table>
				<table style="margin-top: 20px;">
					<div class="col-12  d-flex">
						<img src="../images/washDrawing/013.JPG" style="max-width: 250px;">
						<div>
							<div style="word-break: keep-all; font-size: 24px;">商品名稱</div>
							<div>
								<div class="ratings">
									<div class="empty-stars"></div>
									<div class="full-stars" style="width: 70%"></div>
								</div>
								<div style="margin-top: 60px;">價格750元</div>
							</div>
				</table>
				<table style="margin-top: 20px;">
					<div class="col-12  d-flex">
						<img src="../images/washDrawing/013.JPG" style="max-width: 250px;">
						<div>
							<div style="word-break: keep-all; font-size: 24px;">商品名稱</div>
							<div>
								<div class="ratings">
									<div class="empty-stars"></div>
									<div class="full-stars" style="width: 70%"></div>
								</div>
								<div style="margin-top: 60px;">價格750元</div>
							</div>
				</table>
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