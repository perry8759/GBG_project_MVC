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
<link rel="stylesheet" href="GBG/css/style.css">
<link rel="stylesheet" href="noob.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<title>訂單明細</title>
<style>
.height {
	height: 500px;
}

.width {
	width: 200px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------- -->
	<div class="container ">
		<div class="row justify-content-between mt-5">
			<div class="col-4 ">
				<h4>
					<span>訂單編號:</span><span>${order.order_id}</span>
				</h4>
			</div>
			<div class="col-5 ">
				<h4>
					<span>訂購日期:${order.order_date}</span>
				</h4>
			</div>
			<div class="col-3 ">
				<h4>
					<span>訂單狀態:${order.orderSatusBean.order_stname}</span>
					<c:if test="${order.orderSatusBean.order_st_id!=3}">
					<form action="updateOrderStatus" method="POST">
						<input type="hidden" name="oseqId" value="${order.oseq_id}">
						<select name="statusId" class="custom-select custom-select-lg ml-4" style="width: 150px; height: 45px;">
							<option value="-1" label="${order.orderSatusBean.order_stname}"></option>
							<c:forEach var='status' items='${orderStatus}'>
								<option value="${status.order_st_id}">${status.order_stname}</option>
							</c:forEach>
						</select> 
						<input type="submit" value="修改訂單狀態">
					</form>
					</c:if>
				</h4>
			</div>
		</div>
		<div class="row justify-content-between p-2 border">

			<div class="col-8 mb-3">
				<h4>
					<span>收件人:${order.receive_men}</span>
				</h4>
			</div>

			<div class="col-3 ">
				<h4>
					訂購商品數量:<span>未完成</span>
				</h4>
			</div>
			<div class="col-12 mb-3 ">
				<h4>
					配送地址:<span>${order.shipping_address}</span>
				</h4>
			</div>
			<div class="col-12 mb-3 ">
				<h4>
					配送方式:<span>${order.shipping_style}</span>
				</h4>
			</div>
			<div class="col-12 mb-3 ">
				<h4>
					店家出貨時間:<span>${order.shipping_date}</span>
				</h4>
			</div>
			<div class="col-9 mb-3 ">
				<h4>
					完成訂單時間:<span>${order.order_done_date}</span>
				</h4>
			</div>
			<div class="col-3 mb-3 ">
				<h4>
					訂單總金額:<span>未完成</span>
				</h4>
			</div>

		</div>
		<div class="">
			<c:forEach var='OrderDetails' items='${order.orderDetailsBean}'>
				<div>
					<div class="row mt-5 ">
						<div class="col-2">
							<img src="<c:url value='/product/getCoverPicture?pId=${OrderDetails.productDetailBean.productBean.product_id}'/>" style="width: 180px;">
						</div>
						<div class="col-6">
							<h3>${OrderDetails.productDetailBean.productBean.product_title}</h3>
							<h6>${OrderDetails.productDetailBean.product_size}-${OrderDetails.productDetailBean.product_color}
							</h6>
						</div>
						<div class="col-1">單價:${OrderDetails.productDetailBean.productBean.product_price}元</div>
						<div class="col-1">數量:${OrderDetails.order_amount}</div>
						<div class="col-2">小計:${OrderDetails.productDetailBean.productBean.product_price*OrderDetails.order_amount}元</div>
					</div>
					<hr>
				</div>
			</c:forEach>
			<div class="col-lg-12" style="text-align: right;">
				<button class="btn btn-primary" style="width: 200px;"
					onclick="location.href='/GBG_project_mvc/order/manageOrders'">返回</button>
			</div>
		</div>

	</div>
	<span id="shoppingcar"><a href="4購物車(左邊要調整V).html"><img
			src="cart4.svg" style="width: 80px; height: 80px;"></a></span>
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