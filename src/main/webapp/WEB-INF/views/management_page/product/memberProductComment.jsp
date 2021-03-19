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
<link rel="stylesheet" href="STAR.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="GBG/css/style.css">
<title>查看自己訂單評論</title>
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
	<div class="container my-5">
		<div class="row ">
		<c:if test="${empty comments}">
			<h3>尚無評論</h3>
		</c:if>
		<c:forEach var='comment' items='${comments}'>
			<div class="col-12">
				<h3>${comment.productBean.product_title}</h3>
				<hr>
			</div>
			<div class="col-2 " style="height: 300px;">
				<img src="<c:url value='/getPicture/${product.product_id}'/>" style="max-width: 150px;">
			</div>
			<div class="col-8">
				<div>${comment.productBean.product_title}</div>

				<div class="ratings my-2">
					<div class="empty-stars"></div>
					<div class="full-stars" style="width: ${comment.comment_value/5*100}%"></div>
				</div>
				<div>
					評論時間: <span id="">${comment.comment_date}</span>
				</div>
				<div class="my-2">
					評論內容: <br>
					<span id="">${comment.comment_comment}</span>
				</div>
			</div>
<!-- 			<div class="col-2  align-self-end"> -->
<!-- 				<button type="submit" class="btn btn-outline-primary">修改評論</button> -->
<!-- 			</div> -->
			</c:forEach>
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