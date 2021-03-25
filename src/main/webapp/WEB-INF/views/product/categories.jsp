<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<!-- ====2_main.css 套用以後分頁會被吃掉===== -->
<!-- <link rel="stylesheet" href="2_main.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css_product/2_main.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css_product/2_main.css"> --%>
<!-- ======== -->
<script src="jQuery/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<!-- ======== -->
<script src="2_new.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js_product/product/productCategories.js">
<!-- ======== -->
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/images_product/"> --%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>商品分類</title>

<script>
	$(document).ready(function() {$('.mainmenu1').on('click',function() {
											$('.set').remove();
											$(this)
													.append(
															"<li class='set'><a href='customerProductCategory?ccId=1&pcId=1'>上衣系列</a></li>");
											$(this)
													.append(
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
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<jsp:include page="/WEB-INF/views/fragment/mallOption.jsp" />
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
<!-- ------------------------搜尋欄------------------------- -->
<div class="container-fluid mt-4" style="width:43%"> 
 <div class="row">
 <div class="col-12 d-flex justify-content-end">
 
<!--   <form action="/GBG_project_mvc/product/search_products" class="search-box"> -->
  <form action="<c:url value='/product/search_products'/>" class="search-box">
  
   <input type="text" name="searchText" placeholder="找商品" style="width:130px;height:38px"> 
   <select class="custom-select " style="width:120px"
    name=productCategory>
    <option value="-1" label="商品類型"></option>
    <c:forEach var='productCategory' items='${productCategories}'>
     <option value="${productCategory.category_id}">${productCategory.category_name}</option>
    </c:forEach>
   </select> 
    <select class="custom-select "  style="width:120px" name=productStatus>
    <!--       <option value="-1" label="商品上下架"></option> -->
    <option value="-1" label="商品狀態"></option>
    <c:forEach var='status' items='${productStatus}'>
     <option value="${status.product_stid}">${status.product_st_name}</option>
    </c:forEach>
   </select>
   <button class="btn btn-primary">Search</button>
  </form>
 </div>
 </div>
</div>
<!-- <div class="container-fluid">  -->
	<div id="main" style="margin-top: 50px;">
		<!-- 左側分類器------------------------------------------------- -->
		<aside id="aside" >
			<!-- <ul style="font-size: 3rem;" class="mainmenuall">
				<a href="customerProductCategory?ccId=1&pcId=-1">全部商品</a>
			</ul> -->
			<ul style="font-size: 2rem;" class="mainmenu1">
				<a href="customerProductCategory?ccId=1&pcId=-1">男性系列</a>
				<c:if test="${ccId==1}">
					<li class="set"><a href='customerProductCategory?ccId=1&pcId=1'>上衣系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=1&pcId=2">褲子系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=1&pcId=3">鞋子系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=1&pcId=4">外套系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=1&pcId=5">襪子系列</a></li>
				</c:if>
			</ul>
			<ul style="font-size: 2rem;" class="mainmenu2">
				<a href="customerProductCategory?ccId=2&pcId=-1">女性系列</a>
				<c:if test="${ccId==2}">
					<li class="set"><a href='customerProductCategory?ccId=2&pcId=1'>上衣系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=2&pcId=2">褲子系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=2&pcId=3">鞋子系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=2&pcId=4">外套系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=2&pcId=5">襪子系列</a></li>
				</c:if>
			</ul>
			<ul style="font-size: 2rem;" class="mainmenu3">
				<a href="customerProductCategory?ccId=3&pcId=-1">兒童系列</a>
				<c:if test="${ccId==3}">
					<li class="set"><a href='customerProductCategory?ccId=3&pcId=1'>上衣系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=3&pcId=2">褲子系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=3&pcId=3">鞋子系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=3&pcId=4">外套系列</a></li>
					<li class="set"><a href="customerProductCategory?ccId=3&pcId=5">襪子系列</a></li>
				</c:if>
			</ul>
			<ul style="font-size: 2rem;" class="mainmenu4">
				<a href="customerProductCategory?ccId=4&pcId=-1">其他系列</a>
				<c:if test="${ccId==4}">
					<li class='set'><a href='customerProductCategory?ccId=4&pcId=6'>球具系列</a></li>
					<li class='set'><a href='customerProductCategory?ccId=4&pcId=7'>護具系列</a></li>
				</c:if>
			</ul>
		</aside>
<!-- 		</div> -->
		<!-- ======================右側商品顯示位置================ -->
<!-- 		<main-context id="main-context"> -->
	<div class="container">
		<div class="row">
		<main-content id="main-context">
		<!-- ======================getAllProducts================ -->
		<!-- 		<div style="font-size: 30px; width: 1050px; margin-left: 30px;" -->
		<!-- 			id="feedback">搜尋結果同XXX筆</div> --> <!-- 		<div class="row"> -->
		<div class="col-12 text-center">
			<c:if test="${empty categoriesProducts}">
				<c:if test="${empty productsSearch}">
					<c:if test="${empty productsAll}">
						<h3>~~熱銷商品即將上市~~</h3>
					</c:if>
				</c:if>
			</c:if>
		</div>
		<c:if test="${! empty productsAll}">
		<section class="container">
				<div class="row">
			<c:forEach var="product" items="${productsAll}">
				<div class="col-sm-6 col-lg-3" >
					<div class="thumbnail ml-2" >
						<div class="caption prodect">
							<a
								href="<spring:url value='product?id=${product.product_id}' />"><img 
								src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>">
							</a>
							<p>
								${product.product_title}
							</p>
							<p>評分: ${product.average_score}</p>
						</div>
					</div>
				</div>
			</c:forEach>

			<!-- 		<div class="prodect"> -->
			<!-- 			<img src="data2/images/img1.png"> -->
			<!-- 			<div id="items">商品名稱</div> -->
			<!-- 		</div> -->
						</div>
		</section>
		</main-content>
		</div>
	
			<!-- 		=============== 頁碼 =============== -->
			<div class="row mt-5 mb-5">
				<div class="col-12 text-center">
					<div class="block-27">
						<ul>
							<!-- 				<li> -->
							<a href="?start=${pre}">&lt;</a>
							<!-- 				</li> -->
							<c:forEach items="${allPages}" var="page">
								<!-- 					<li> -->
								<a href="?start=${(page-1)*8}">${page}</a>
								<!-- 					</li> -->
							</c:forEach>
							<!-- 					<li> -->
							<a href="?start=${next}">&gt;</a>
							<!-- 					</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		<!-- ======================categoriesProducts================ -->

		<c:if test="${! empty categoriesProducts}">
		<section class="container">
				<div class="row">
			<c:forEach var="product" items="${categoriesProducts}">
				<div class="col-sm-6 col-lg-3" >
					<div class="thumbnail ml-2">
						<div class="caption prodect">
							<a
									href="<spring:url value='product?id=${product.product_id}' />"><img 
								src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>"></a>
							<p>
								${product.product_title}
							</p>
							<p>評分: ${product.average_score}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</section>
		
			<!-- 		=============== 頁碼 =============== -->
			<div class="container">
				
			<div class="row mt-5 mb-5">
				<div class="col-12 text-center" style="margin: auto atuo;">
					<div class="block-27">
						<ul>
<!-- 						<form action="/GBG_project_mvc/product/search_products"	class="search-box"> -->
<!-- 						http://localhost:8080/GBG_project_mvc/product/search_products?searchText=&productCategory=-1&productStatus=-1 -->
<!-- 							http://localhost:8080/GBG_project_mvc/product/customerCategory?ccId=1 -->
<!-- 							http://localhost:8080/GBG_project_mvc/product/customerProductCategory?ccId=1&pcId=1 -->
							<!-- 				<li> -->
							<a href="?start=${pre}&ccId=${ccId}&pcId=${pcId}">&lt;</a>
							<!-- 				</li> -->
							<c:forEach items="${allPages}" var="page">
								<!-- 					<li> -->
								<a href="?start=${(page-1)*8}&ccId=${ccId}&pcId=${pcId}">${page}</a>
								<!-- 					</li> -->
							</c:forEach>
							<!-- 					<li> -->
							<a href="?start=${next}&ccId=${ccId}&pcId=${pcId}">&gt;</a>
							<!-- 					</li> -->
						</ul>
					</div>
				</div>
			</div>
				
		
	</div>
		</c:if> 
		<!-- ======================searchProducts================ -->

		<c:if test="${! empty productsSearch}">
		<section class="container">
				<div class="row">
			<c:forEach var="product" items="${productsSearch}">
				<div class="col-sm-6 col-lg-3" >
					<div class="thumbnail ml-2">
						<div class="caption prodect">
							<a href="<spring:url value='product?id=${product.product_id}' />"
									><img 
								src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>"></a>
							<p>
								${product.product_title}
							</p>
							<p>評分: ${product.average_score}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</section>
			<!-- 		=============== 頁碼 =============== -->
			<div class="container">
			<div class="row mt-5 mb-5">
				<div class="col-12" style="margin: auto atuo;">
					<div class="block-27 text-center">
						<ul>
<!-- 						<form action="/GBG_project_mvc/product/search_products"	class="search-box"> -->
<!-- 						http://localhost:8080/GBG_project_mvc/product/search_products?searchText=&productCategory=-1&productStatus=-1 -->
							<!-- 				<li> -->
							<a href="?start=${pre}&searchText=${searchText}&productCategory=${productCategoryId}&productStatus=${productStatusId}">&lt;</a>
							<!-- 				</li> -->
							<c:forEach items="${allPages}" var="page">
								<!-- 					<li> -->
								<a href="?start=${(page-1)*8}&searchText=${searchText}&productCategory=${productCategoryId}&productStatus=${productStatusId}">${page}</a>
								<!-- 					</li> -->
							</c:forEach>
							<!-- 					<li> -->
							<a href="?start=${next}&searchText=${searchText}&productCategory=${productCategoryId}&productStatus=${productStatusId}">&gt;</a>
							<!-- 					</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		</c:if> 
		
		 
	</div>
	<!-- <span id="shoppingcar"><a href="4購物車(RWD需要調整).html"><img
			src="cart4.svg" style="width: 80px; height: 80px;"></a></span> -->
</body>

</html>