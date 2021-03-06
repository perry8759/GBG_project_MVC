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
<!-- <link rel="stylesheet" href="GBG/css/style.css"> -->
<title>管理商品</title>

<style type="text/css">
.top{
    position:fixed;
    right: 10px; 
    bottom: 10px;
}
.game-list_head {
    padding: 0 12px;
    background: #131212;
    color: #fff;
    font-size: 20px;
    max-width: 100%;
}
</style>

</head>
<body style="background-color: rgb(240, 239, 236);">
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<!-- ---------------------------- -->
	<div class="container-fluid w-75" style="background-color: rgb(255, 255, 255);">
		<div class="row">
			<div class="col-12 ml-5 mt-3 mb-3">
				<a href="/GBG_project_mvc/order/manageOrders">訂單管理</a> | <a>商品管理</a>
			</div>
		</div>
		<div class="row m-3 d-flex justify-content-center">
			<form:form action="/GBG_project_mvc/product/productFilterCondition" method="POST">
				<div class="col-12">
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
					<input class="btn text-white ml-4" style="background-color:#DE520E;height: 45px;width: 100px" type="submit" value="搜尋">
				</div>
				<!-- <div class="col-1 ml-4 d-flex justify-content-end">
					<input class="btn btn-secondary mr-2" type="reset" value="清除條件">
				</div> -->
			</form:form>
		</div>
			<!-- ===================商品表單=================== -->
		<div class="col-12 mt-2">
			<form:form action="/GBG_project_mvc/product/updateProductsStatus" method="POST">
				<table id="table" class="" style="text-align: center;">
					<tr  class="game-list_head">
						<td style="width: 2%;background:#fff;"></td>
						<td class="border border-secondary" style="width: 9%;"align="center">商品名稱</td>
						<!-- 						<td class="border border-secondary" style="width: 9%;">商品編號</td> -->
						<td class="border border-secondary" style="width: 9%;"align="center">貨號</td>
						<td class="border border-secondary" style="width: 5%;"align="center">價格</td>
						<td class="border border-secondary" style="width: 5%;"align="center">熱度</td>
						<!-- 						<td class="border border-secondary" style="width: 9%;">商品介紹</td> -->
						<td class="border border-secondary" style="width: 9%;"align="center">商品客群</td>
						<td class="border border-secondary" style="width: 9%;"align="center">商品類型</td>
						<td class="border border-secondary" style="width: 5%;"align="center">圖片</td>
						<td class="border border-secondary" style="width: 9%;"align="center">顏色</td>
						<td class="border border-secondary" style="width: 9%;"align="center">尺寸</td>
						<td class="border border-secondary" style="width: 6%;"align="center">庫存量</td>
						<td class="border border-secondary" style="width: 6%;"align="center">商品狀態</td>
						<td class="border border-secondary" style="width: 6%;"align="center">編輯</td>
					</tr>
					<c:forEach var='product' items='${products}' varStatus="pn">
						<tr>
							<td>
							<input type="checkbox" name="productId" value="${product.product_id}" /></td>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">
								<a href="<spring:url value='/product/manageProductInfo?pId=${product.product_id}' />">${product.product_title}</a></td>
							<!-- 							<td class="border border-secondary" -->
							<%-- 								style="width: 9%; height: 50px;">${product.product_id}</td> --%>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">${product.productNo}</td>
							<td class="border border-secondary"
								style="width: 5%; height: 50px;">${product.product_price}</td>
							<td id="purchase${pn.index}" class="purchase border border-secondary"
								style="width: 5%; height: 50px;">${product.product_purchases}</td>
							<!-- 							<td class="border border-secondary" -->
							<%-- 								style="width: 9%; height: 50px;">${product.product_textdetails}</td> --%>
							<td class="border border-secondary"
								style="width: 9%; height: 50px;">${product.customerCategoryBean.customer_category_name}</td>
							<td class="border border-secondary"
								style="width: 5%; height: 50px; text-align: center;">${product.productCategoryBean.category_name}</td>
							<td class="border border-secondary"
								style="width: 5%; height: 50px;">
								 <img style="max-width:50px"
										src="<c:url value='/product/getCoverPicture?pId=${product.product_id}'/>">
<%-- 								<c:forEach var='pic' items='${product.productPicBean}' varStatus="loop"> --%>
<!-- 									<p style="display: none;"> -->
<%-- 										${pic.product_pic_img}<br> --%>
<!-- 									</p> -->
<%-- 										總共:${loop.count} --%>
<%-- 								</c:forEach></td> --%>
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
								style="width: 6%; height: 50px;">${product.productStausBean.product_st_name}</td>
							<td class="border border-secondary" style="width: 6%; height: 50px;">
<%-- 							<spring:url value='/product/manageProductInfo?pId=${product.product_id}' /> --%>
								<a href="/GBG_project_mvc/product/manageProductInfo?pId=${product.product_id}">編輯商品</a><br>
<%-- 								<a href="/GBG_project_mvc/product/addProductDetails?pId=${product.product_id}">編輯商品細項</a><br> --%>
<%-- 								<a href="/GBG_project_mvc/product/addProductPic?pId=${product.product_id}">新增單張商品照片</a><br> --%>
<%-- 								<a href="/GBG_project_mvc/product/addtProductPictures?pId=${product.product_id}">新增多張商品照片</a><br> --%>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- ----------------------底下按鈕 -->
			<div class="row justify-content-between">
<!-- 			<div class="row"> -->
				<div class="col-5 d-flex justify-content-start ml-5 mt-4 mb-5">
					<select id="statusId" name="statusId" class="custom-select custom-select-lg"
							style="width: 200px; height: 45px;">
						<option value="-1" label="選擇商品狀態"></option>
						<c:forEach var='status' items='${productStatus}'>
							<option value="${status.product_stid}">${status.product_st_name}</option>
						</c:forEach>
					</select> 
					<input class="btn text-white" style="background-color:#DE520E;" type="submit" value="將勾選商品修改狀態">
<!-- 					<div class="btn d-flex btn-primary" style="width: 10%; margin-right:0px"> -->
<!-- 					新增商品 -->
				</div>
				</form:form>
				<div class="col-3 d-flex justify-content-end mt-4 mb-5 mr-3">
					<button class="btn d-flex btn-primary" style="width: 100px;height: 45px;" type="menu"
						value="" onclick="location.href='addProduct'">
						新增商品
					</button>
				</div>
			</div>
			</div>
<!-- 		</div> -->
 <p><a href="#" class="top"> <img style="width: 50px" alt="" src="${pageContext.request.contextPath}/images_product/arrow-up-circle.svg"></a></p>
<!-- 	</div> -->

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
    
    
    <script>
   $(document).ready(function(){
              $('.top').click(function(){
                  $('html,body').animate({
                      srcollTop: 0
                  },'slow');
              })
   });
	
// 	$('.purchase:gt(50)').css({"color":"red",});
//               if(parseInt(a) >50){
            		  
//             	  $('.purchase').css({
//             		  color:"red",
//             	  })
//               }

   
   function doFirst(){
  
	   var purchased=document.querySelectorAll(".purchase");
	   
	   for(i=0; i< purchased.length;i++){
		   
		   purchase = document.getElementById("purchase"+i);
		   
		   if(parseInt(purchase.innerText)>50){
			   purchase.setAttribute("style","color:red");
		   }
	   }
	   
   }
   window.addEventListener('load',doFirst);
  
</script>
</body>
</html>
