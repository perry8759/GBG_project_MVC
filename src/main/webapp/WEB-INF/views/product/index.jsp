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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css_product/noob.css">
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/images_product/"> --%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/js_product/"> --%>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="GBG/css/style.css">
<title>商城首頁</title>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/fragment/topMVC_final.jsp" /> --%>
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
<!-- ---------------------------------------------------------------- -->
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
	<a href="/GBG_project_mvc/product/getAllProducts">商品分類頁面 缺排版 getPicture</a>
	<br>
	<a href="/GBG_project_mvc/product/manageProducts">搜尋範圍、商品圖片總數not yet、圖片尚未完成</a>
	<br>
	<a href="/GBG_project_mvc/order/manageOrders">管理訂單(剩搜尋訂單編號)前後端整合</a>
	<br>
	<a href="${pageContext.request.contextPath}/shoppingCart/shoppingCart">查看購物車(未完成)</a>
	<br>
	<a href="/GBG_project_mvc/order/qureyOrder?osId=3">會查看訂單seqid=3，未處理:訂單總金額、訂單總數量、商品照片</a>
	<br>
	<a href="/GBG_project_mvc/order/queryMemberOrders">查看會員歷史訂單(ing)</a> => 
	<a href="/GBG_project_mvc/order/queryMemberOrders?mId=1">查看會員歷史訂單id=1，未處理:訂單總金額、訂單總數量、商品照片</a>
	<br>
	<a href="/GBG_project_mvc/queryFavoriteList">查看收藏清單(未完成)</a>
	<br>
	<a href="/GBG_project_mvc/product/memberProductComment">查看會員評論(需排版)</a> => 
	<a href="/GBG_project_mvc/product/memberProductComment?mId=1">查看會員評論id=1(缺圖片 調整版面)</a>
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
										src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>">
									<p>
										<a
											href="<spring:url value='product?id=${product.product_id}' />"
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
									src="<c:url value='/product/getCoverPicture?pId=${newP.product_id}'/>">
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
			<div class="detail_t">
			<a href="customerProductCategory?ccId=1&pcId=-1">
			男性系列
			</a>
			</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4">
				<a href='customerProductCategory?ccId=1&pcId=1'>
					上衣
				</a>
			</div>
			<div class="mt-4">
				<a href='customerProductCategory?ccId=1&pcId=2'>褲子</a>
			</div>
			<div class="mt-4">
				<a href='customerProductCategory?ccId=1&pcId=3'>鞋子</a>
			</div>
			<div class="mt-4">
				<a href='customerProductCategory?ccId=1&pcId=4'>外套</a>
			</div>
			<div class="mt-4">
				<a href='customerProductCategory?ccId=1&pcId=5'>襪子</a>
			</div>
		</div>
		<div class="col-3" style="text-align: center;">

			<div class="detail_t">
			<a href="customerProductCategory?ccId=2&pcId=-1">女性系列</a></div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4"><a href='customerProductCategory?ccId=2&pcId=1'>上衣</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=2&pcId=1'>褲子</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=2&pcId=1'>鞋子</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=2&pcId=1'>外套</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=2&pcId=1'>襪子</a></div>
		</div>
		<div class="col-3" style="text-align: center;">
			<div class="detail_t">
			<a href="customerProductCategory?ccId=3&pcId=-1">兒童系列</a>
			</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4"><a href='customerProductCategory?ccId=3&pcId=1'>上衣</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=3&pcId=2'>褲子</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=3&pcId=3'>鞋子</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=3&pcId=4'>外套</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=3&pcId=5'>襪子</a></div>
		</div>
		<div class="col-3" style="text-align: center;">
			<div class="detail_t">
			<a href="customerProductCategory?ccId=4&pcId=-1">其他系列</a>
			</div>
			<span><img src="../images/washDrawing/033.JPG"
				style="max-width: 200px;"></span>
			<div class="mt-4"><a href='customerProductCategory?ccId=4&pcId=6'>球具</a></div>
			<div class="mt-4"><a href='customerProductCategory?ccId=4&pcId=7'>護具</a></div>

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
