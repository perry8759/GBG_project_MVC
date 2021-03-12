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
<title>管理商品明細</title>
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

			<!-- ------------- ProductBean --------------- -->
			<form:form method='POST' modelAttribute="product">
				<fieldset>
					<div class="col-12 my-2">
						<div class="form-group d-flex ">
							<span style="width: 80px; padding: 5px;">商品名稱:</span>
							<form:input type="text" class="form-control w-75"
								id="product_title" path="" aria-describedby="" placeholder="" />
						</div>
					</div>
					<div class="col-6 my-2">
						<span style="width: 80px; padding: 5px;"> 商品客群:</span>
						<form:select path="customerCategoryBean.customer_category_id">
							<form:option value="-1" label="">客群類型</form:option>
							<form:options items="${customerCategoryList}"
								itmeLabel="customer_category_name"
								itmeValue="customer_category_id" />
						</form:select>
						<%-- 						<form:errors path="customer_category_id"/> --%>
						<!-- 						<button class="btn btn-outline-secondary dropdown-toggle w-50" -->
						<!-- 							type="button" id="dropdownMenuButton2" data-toggle="dropdown"> -->
						<!-- 							客群類型</button> -->
						<!-- 						<div class="dropdown-menu dropdown-menu-left" -->
						<!-- 							aria-labelledby="dropdownMenuButton2"> -->
						<!-- 							<a class="dropdown-item" href="#">男生</a> <a class="dropdown-item" -->
						<!-- 								href="#">女生</a> <a class="dropdown-item" href="#">兒童</a> <a -->
						<!-- 								class="dropdown-item" href="#">其他</a> -->

						<!-- 						</div> -->
					</div>
					<div class="col-6 my-2">
						<span style="width: 80px; padding: 5px;"> 商品類型:</span>
						<form:select path="productCategoryBean.category_id">
							<form:option value="-1" label="">客群類型</form:option>
							<form:options items="${productCategoryList}"
								itmeLabel="category_name" itmeValue="category_id" />
						</form:select>

						<%-- 						<form:errors path="category_id"/> --%>
						<!-- 						<button class="btn btn-outline-secondary dropdown-toggle w-50" -->
						<!-- 							type="button" id="dropdownMenuButton2" data-toggle="dropdown"> -->
						<!-- 							商品類型</button> -->
						<!-- 						<div class="dropdown-menu dropdown-menu-left" -->
						<!-- 							aria-labelledby="dropdownMenuButton2"> -->
						<!-- 							<a class="dropdown-item" href="#">衣服</a> <a class="dropdown-item" -->
						<!-- 								href="#">褲子</a> <a class="dropdown-item" href="#">鞋子</a> <a -->
						<!-- 								class="dropdown-item" href="#">外套</a> <a class="dropdown-item" -->
						<!-- 								href="#">襪子</a> <a class="dropdown-item" href="#">球具</a> <a -->
						<!-- 								class="dropdown-item" href="#">護具</a> <a class="dropdown-item" -->
						<!-- 								href="#">訓練</a> -->
						<!-- 						</div> -->
					</div>
					<div class="col-6 my-2">
						<div class="form-group d-flex ">
							<span style="width: 80px; padding: 5px;">貨號:</span>
							<form:input type="text" class="form-control w-50" id="productNo"
								path="productNo" aria-describedby="" placeholder="" />
						</div>
					</div>
					<div class="col-6 my-2">
						<div class="form-group d-flex ">
							<span style="width: 80px; padding: 5px;">商品價格:</span>
							<form:input type="text" class="form-control w-50" id="productNo"
								path="product_price" aria-describedby="" placeholder="" />
						</div>
					</div>
					<div class="col-12">
						<form>
							<div>商品介紹</div>
							<form:textarea path="product_textdetails" name="" id=""
								cols="128" rows="5" />
						</form>
						<hr>
						<div class="col-12">
							<div class="dropdown "></div>
						</div>
					</div>
				</fieldset>
			</form:form>
		</div>
		<!-- ------------- ProductDetailsBean --------------- -->
		<form:form method='POST' modelAttribute="productDetail">
			商品顏色:
<!-- 			<button class="btn btn-outline-primary" id="dLabel" type="button" -->
			<!-- 				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
			<!-- 				顏色</button> -->
			<div class="dropdown-menu" aria-labelledby="dLabel">
				<form:input type="text" class="form-control w-50" id="productNo"
					path="product_color" aria-describedby="" placeholder="" />
			</div>

			<div class="col-12 d-flex my-2">
				<div class="dropdown">
					商品尺寸:
					<form:input type="text" class="form-control w-50" id="productNo"
						path="product_size" aria-describedby="" placeholder="" />
				</div>

				<div class="ml-4">
					<span>商品數量</span>
					<form:input type="text" class="form-control w-50" id="productNo"
						path="product_stock" aria-describedby="" placeholder="" />
				</div>
			</div>
		</form:form>
	</div>
		<!-- + 希望能動態新增不同樣的尺寸及輸入數量 
	<div>
		<img src="" alt="">++++
	</div>-->
	<!-- 下面圖片區 -->
	<!-- ------------- ProductPicBean --------------- -->
	<form:form method='POST' modelAttribute="productPic">
		<div class="row">
			<div class="col-12">
				<table>
					<tr>
						<td>
							<p>
								<img id="" style="width: 180px; height: 150px;">
							</p> <form:input type="file" path="product_pic_img" accept=".png"
								id="theFile" style="width: 80px;" />
							<button>刪除圖片</button>
						</td>
						<!-- 					<td> -->
						<!-- 					<td> -->
						<!-- 						<p> -->
						<!-- 							<img id="" style="width: 180px; height: 150px;"> -->
						<!-- 						</p> <input type="file" id="theFile" style="width: 80px;"> -->
						<!-- 						<button>刪除圖片</button> -->
						<!-- 					</td> -->
						<!-- 					<td> -->
						<!-- 					<td> -->
						<!-- 						<p> -->
						<!-- 							<img id="" style="width: 180px; height: 150px;"> -->
						<!-- 						</p> <input type="file" id="theFile" style="width: 80px;"> -->
						<!-- 						<button>刪除圖片</button> -->
						<!-- 					</td> -->
						<!-- 					<td> -->
						<!-- 					<td> -->
						<!-- 						<p> -->
						<!-- 							<img id="" style="width: 180px; height: 150px;"> -->
						<!-- 						</p> <input type="file" id="theFile" style="width: 80px;"> -->
						<!-- 						<button>刪除圖片</button> -->
						<!-- 					</td> -->
						<!-- 					<td> -->
						<!-- 					<td> -->
						<!-- 						<p> -->
						<!-- 							<img id="" style="width: 180px; height: 150px;"> -->
						<!-- 						</p> <input type="file" id="theFile" style="width: 80px;"> -->
						<!-- 						<button>刪除圖片</button> -->
						<!-- 					</td> -->
						<td>
						<td>
							<p>
								<img id="" style="width: 180px; height: 150px;">
							</p> <input type="file" id="theFile" style="width: 80px;">
							<button>刪除圖片</button>
						</td>
					</tr>
				</table>
				<hr>
				<div class="col-12 d-flex justify-content-end">
					<button class="btn btn-outline-primary" style="width: 150px;">取消</button>
					<button class="btn btn-outline-primary" style="width: 150px;">儲存商品並下架</button>
					<button class="btn btn-outline-primary" style="width: 150px;">儲存商品並上架</button>
				</div>
			</div>
		</div>
	</form:form>
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