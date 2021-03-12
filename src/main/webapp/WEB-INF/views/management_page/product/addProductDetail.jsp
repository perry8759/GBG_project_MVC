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
<title>新增商品明細</title>
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
	<%-- 	<c:if test="${product.productDetail.product_detail_id==null}"> --%>
	<!-- 		<h3>新增商品明細</h3> -->
	<%-- 	</c:if> --%>
	<%-- 	<c:if test="${product.productDetail.product_detail_id!=null}"> --%>
	<!-- 		<h3>編輯商品明細</h3> -->
	<%-- 	</c:if> --%>
	<!-- ------------- ProductBean --------------- -->

	<%-- 		<c:if test="${product.product_detail_id!=null}"> --%>
	<%-- 			<form:hidden path="product_id" /> --%>
	<%-- 			<form:hidden path="onSaleTime" /> --%>
	<%-- 			<form:hidden path="product_purchases" /> --%>
	<%-- 			<form:hidden path="average_score" /> --%>
	<%-- 		</c:if> --%>
	<fieldset>
		<div class="container-fluid w-75">
			<div class="row">
				<div class="col-12 my-2">
					<div class="form-group d-flex ">
						<h3>
							<span style="width: 80px; padding: 5px;">商品名稱:</span>
							${productDetail.productBean.product_title}
						</h3>
					</div>
				</div>
				<div class="col-6 my-2">
					<span style="padding: 5px;">
						商品客群:${productDetail.productBean.customerCategoryBean.customer_category_name}
					</span>
				</div>
				<div class="col-6 my-2">
					<span style="padding: 5px;">
						商品類型:${productDetail.productBean.productCategoryBean.category_name}</span>
				</div>
				<div class="col-6 my-2">
					<span style="padding: 5px;">
						商品狀態:${productDetail.productBean.productStausBean.product_st_name}</span>
				</div>
				<div class="col-6 my-2">
					<div class="form-group d-flex ">
						<span style="padding: 5px;">貨號:${productDetail.productBean.productNo}
						</span>
					</div>
				</div>
				<div class="col-6 my-2">
					<div class="form-group d-flex ">
						<span style="padding: 5px;">商品價格:${productDetail.productBean.product_price}</span>
					</div>
				</div>
				<div class="col-12">
					<form>
						<div>商品介紹:</div>
						<c:if
							test="${productDetail.productBean.product_textdetails==null}">
							無
						</c:if>
						<p>${productDetail.productBean.product_textdetails}</p>
					</form>
					<hr>
					<div class="col-12">
						<div class="dropdown "></div>
					</div>
				</div>
			</div>
			<!-- ------------- ProductDetailsBean --------------- -->
			<div class="col-12">
			<label>商品細項:</label>
					<c:forEach var='detail' items='${product.productDetailBean}'>
				<div class="dropdown ">
					商品顏色:
						<button class="btn btn-outline-primary" id="dLabel" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							${detail.product_color}</button>
							商品尺寸:
						<button class="btn btn-outline-primary" id="dLabel" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							${detail.product_size}</button>
							庫存:${detail.product_stock}<br>
				</div><button class="btn btn-outline-primary" id="dLabel" type="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="location.href='updateProDetail?dId=${detail.product_detail_id}'">
							修改</button>
					</c:forEach>

			</div>


			<!-- -------------新增 ProductDetailsBean --------------- -->
			<form:form method='POST' modelAttribute="productDetail">
			<form:hidden path="productBean.product_id"  class="form-control"  />
				<div class="col-12 d-flex my-2">
					<div class="dropdown ">
						商品顏色:
						<form:input type="text" class="form-control w-50"
							id="product_color" path="product_color" />
					</div>
					<div class="dropdown">
						商品尺寸:
						<form:input type="text" class="form-control w-50"
							id="product_size" path="product_size" />
					</div>

					<div class="dropdown">
						<span>商品數量</span>
						<form:input type="text" class="form-control w-50"
							id="product_stock" path="product_stock" />
					</div>
				</div>
			<button type="submit" class="btn btn-outline-primary"
				style="width: 150px;" onclick="location.href=''">新增商品細項</button>
			<!-- 			<button type="submit" class="btn btn-outline-primary" style="width: 150px;">新增商品照片</button> -->
			<div class="ml-4">
				<hr>
				<div class="col-12 d-flex justify-content-end">
					<button class="btn btn-outline-primary" style="width: 150px;"><a href="manageProducts">返回</a></button>
					<button type="reset" class="btn btn-outline-primary" style="width: 150px;">清除表格</button>
					<button type="submit" class="btn btn-outline-primary"
						style="width: 150px;">儲存商品細項</button>
				</div>
			</div>
			</form:form>
		</div>
	</fieldset>


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