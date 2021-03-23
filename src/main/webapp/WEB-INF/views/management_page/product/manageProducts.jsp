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
<script src="https://kit.fontawesome.com/82fbc43281.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="GBG/css/style.css">
<title>管理商品</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------- -->
	<div class="container-fluid w-75">
		<div class="row">
			<div class="col-12 m-4 ">
				<a href="manageOrders">訂單管理</a> | <a>商品管理</a>
			</div>
<!-- 			<div class="col-4 ml-4"> -->
<!-- 				<div class="input-group mb-1"> -->
<!-- 					<div class="input-group-prepend"> -->
<!-- 						<button class="btn btn-outline-secondary dropdown-toggle" -->
<!-- 							type="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 							aria-expanded="false">搜尋範圍</button> -->
<!-- 						<div class="dropdown-menu"> -->
<!-- 							<a class="dropdown-item" id="">全部</a> <a class="dropdown-item" -->
<!-- 								id="">商品編號</a> <a class="dropdown-item" id="">商品名稱</a> <a -->
<!-- 								class="dropdown-item" id="">貨號</a> <a class="dropdown-item" -->
<!-- 								id="">商品價格</a> <a class="dropdown-item" id="">商品類型</a> -->
<!-- 							<div role="separator" class="dropdown-divider"></div> -->

<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<input type="text" class="form-control w-50" -->
<!-- 						aria-label="Text input with dropdown button"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<div class="col-4 ml-4">
			<form:form action="/GBG_project_mvc/product/productFilterCondition" method="POST">
				<div class="col-6">
					<!-- 篩選商品狀態 -->
					<select id="statusId" name="statusId"
						class="custom-select custom-select-lg ml-4"
						style="width: 150px; height: 45px;">
						<option value="-1" label="全部商品"></option>
						<c:forEach var='status' items='${productStatus}'>
							<option value="${status.product_stid}">${status.product_st_name}</option>
						</c:forEach>
					</select>
					<!-- 篩選客群商品 -->
					<select name="customerCategoryId"class="custom-select custom-select-lg ml-4"style="width: 150px; height: 45px;">
						<option value="-1" label="全部分類"></option>
						<c:forEach var='customerCategory' items='${customerCategories}'>
							<option value="${customerCategory.customer_category_id}">${customerCategory.customer_category_name}</option>
						</c:forEach>
					</select>
					<!-- 以價格排序 -->
					<select name="sortValue"
						class="custom-select custom-select-lg ml-4"
						style="width: 150px; height: 45px;">
						<option value="-1" label="排序方式"></option>
						<option value="1">以價格由高到低</option>
						<option value="2">以價格由低到高</option>
					</select>
					<input class="btn btn-secondary" type="submit" value="搜尋">
				</div>
				<div class="col-1 ml-4 d-flex justify-content-end">
<!-- 					<input class="btn btn-secondary mr-2" type="reset" value="清除條件"> -->
				</div>
			</form:form>
			</div>
			<!-- ===================商品表單=================== -->
			<form:form action="/GBG_project_mvc/product/updateProductsStatus" method="POST">
			<div class="col-12 mt-2">
				<table class="">
					<tr>
						<td style="width: 2%;"></td>
						<td class="border border-secondary" style="width: 9%;">商品名稱</td>
						<!-- 						<td class="border border-secondary" style="width: 9%;">商品編號</td> -->
						<td class="border border-secondary" style="width: 9%;">貨號</td>
						<td class="border border-secondary" style="width: 5%;">價格</td>
						<!-- 						<td class="border border-secondary" style="width: 9%;">商品介紹</td> -->
						<td class="border border-secondary" style="width: 9%;">商品客群</td>
						<td class="border border-secondary" style="width: 9%;">商品類型</td>
						<td class="border border-secondary" style="width: 5%;">商品圖片數</td>
						<td class="border border-secondary" style="width: 9%;">顏色</td>
						<td class="border border-secondary" style="width: 9%;">尺寸</td>
						<td class="border border-secondary" style="width: 6%;">庫存量</td>
						<td class="border border-secondary" style="width: 9%;">商品狀態</td>
						<td class="border border-secondary" style="width: 12%;">編輯</td>
					</tr>
					<c:forEach var='product' items='${products}'>
						<tr>
							<td>
							<input type="checkbox" name="productId" value="${product.product_id}" /></td>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">
								<a href="<spring:url value='/manageProductInfo?pId=${product.product_id}' />">${product.product_title}</a></td>
							<!-- 							<td class="border border-secondary" -->
							<%-- 								style="width: 9%; height: 50px;">${product.product_id}</td> --%>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">${product.productNo}</td>
							<td class="border border-secondary"
								style="width: 5%; height: 50px;">${product.product_price}</td>
							<!-- 							<td class="border border-secondary" -->
							<%-- 								style="width: 9%; height: 50px;">${product.product_textdetails}</td> --%>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">${product.customerCategoryBean.customer_category_name}</td>
							<td class="border border-secondary"
								style="width: 5%; height: 50px;">${product.productCategoryBean.category_name}</td>
							<td class="border border-secondary"
								style="width: 5%; height: 50px;"><c:forEach var='pic'
									items='${product.productPicBean}' varStatus="loop">
									<p style="display: none;">
										${pic.product_pic_img}<br>
									</p>
										總共:${loop.count}
								</c:forEach></td>
							<td class="border border-secondary" align="center"
								style="width: 5%; height: 50px;"><c:forEach
									var='productDetail' items='${product.productDetailBean}'>
									<a href="/GBG_project_mvc/updateProDetail?dId=${productDetail.product_detail_id}">
										${productDetail.product_color}
									</a>
								<br>
								</c:forEach></td>
							<td class="border border-secondary" align="center"
								style="width: 5%; height: 50px;"><c:forEach
									var='productDetail' items='${product.productDetailBean}'>
								${productDetail.product_size}<br>
								</c:forEach></td>
							<td class="border border-secondary" align="center"
								style="width: 6%; height: 50px;"><c:forEach
									var='productDetail' items='${product.productDetailBean}'>
								${productDetail.product_stock}<br>
								</c:forEach></td>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">${product.productStausBean.product_st_name}</td>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">
								<!-- 								<a href="aaa">zero</a> --> 
								<a href="/GBG_project_mvc/product/product_update?pId=${product.product_id}">編輯商品</a><br>
								<a href="/GBG_project_mvc/addProductDetails?pId=${product.product_id}">編輯商品細項</a><br>
								<a href="addtProductPic?pId=${product.product_id}">新增商品照片</a><br>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- ----------------------底下按鈕 -->
			<div class="col-6 mt-5 ml-4">
<%-- 				<form:input class="btn btn-primary" style="width: 25%; height: 50px;" --%>
<%-- 					type="button" value="1" path="productStatusId" itemlabel="上架勾選商品"></form:input> --%>
<!-- 				<button class="btn btn-primary" style="width: 25%; height: 50px;" -->
<!-- 					type="menu" value="">下架勾選商品</button> -->
					<select id="statusId" name="statusId" class="custom-select custom-select-lg ml-4"
							style="width: 150px; height: 45px;">
						<option value="-1" label="選擇商品狀態"></option>
						<c:forEach var='status' items='${productStatus}'>
							<option value="${status.product_stid}">${status.product_st_name}</option>
						</c:forEach>
					</select> 
					<input type="submit" value="將勾選商品修改狀態">
			</div>
				</form:form>
			<div class="col-5 d-flex justify-content-end mt-5">
				<button class="btn btn-primary" style="width: 25%;" type="menu"
					value="" onclick="location.href='addProduct'">
					<!-- 					<a href="add"> -->
					新增商品
				</button>
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