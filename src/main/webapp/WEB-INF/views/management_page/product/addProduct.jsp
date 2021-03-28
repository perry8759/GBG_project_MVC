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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script>
        $(document).ready(function(){
         $('#inputData').click(function(){
        	 $('#product_title').attr('value',"Crown Collection 護腕");
        	 $('#productNo').attr('value',"C-2063 MQ");
        	 $('#productPrice').attr('value',"100");
        	 $('#script').val("彈性舒適，LOGO為細緻電繡!");
             });
        });
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	
	<div class="banner">
		<!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
	</div>
	<!-- ---------------------------- -->
	<div class="text-center m-5">
		<c:if test="${product.product_id==null}">
			<h3 id="inputData">新增商品</h3>
		</c:if>
		<c:if test="${product.product_id!=null}">
			<h3>編輯商品</h3>
		</c:if>
	</div>
	<!-- ------------- ProductBean --------------- -->
	<form:form method='POST' modelAttribute="product">
		<c:if test="${product.product_id!=null}">
			<form:hidden path="product_id" />
			<form:hidden path="product_purchases" />
			<form:hidden path="average_score" />
		</c:if>
		<c:if test="${product.onSaleTime!=null}">
			<form:hidden path="onSaleTime" />
		</c:if>
		<fieldset>
			<div class="container-fluid w-75">
				<div class="row">
					<div class="col-12 my-2">
						<div class="form-group d-flex ">
							<span style="width: 80px; padding: 5px;">商品名稱:</span>
							<form:input type="text" class="form-control w-75"
								id="product_title" path="product_title" aria-describedby=""
								placeholder="商品名稱" />
						</div>
					</div>
					<div class="col-6 my-2">
					<!-- customerCategories以option呈現 -->
						<span style="width: 80px; padding: 5px;"> 商品客群:</span>
<%-- 						<form:select path="customerCategoryBean.customer_category_id"> --%>
<%-- 							<form:option value="-1" label="客群類型"></form:option> --%>
<%-- 							<c:forEach var='category' items='${categories}'> --%>
<%-- 							<option Label="${category.customer_category_name}" Value="${category.customer_category_id}" /> --%>
<%-- 							</c:forEach> --%>
<%-- 						</form:select> --%>
						<form:select path="customerCategoryBean.customer_category_id">
							<form:option value="-1" label="客群類型"></form:option>
							
<%-- 							<c:forEach var='customerCategory' items='${customerCategories}'> --%>
<%-- 								<option value="${customerCategory.customer_category_id}">${customerCategory.customer_category_name}</option> --%>
<%-- 							</c:forEach> --%>
							
							<form:options items="${customerCategories}"	itemLabel="customer_category_name" itemValue="customer_category_id" />
						</form:select>
<%-- 						<form:errors path="customer_category_id"/> --%>
					</div>
<!-- 					==============productCategoryBean============== -->
					<div class="col-6 my-2">
						<span style="width: 80px; padding: 5px;"> 商品類型:</span>
						<form:select path="productCategoryBean.category_id">
							<form:option value="-1" label="商品類型"></form:option>
							<form:options items="${productCategories}"
								itemLabel="category_name" itemValue="category_id" />
						</form:select>
						<%-- 						<form:errors path="category_id"/> --%>
					</div>
					<div class="col-6 my-2">
						<span style="width: 80px; padding: 5px;"> 商品狀態:</span>
						<form:select path="productStausBean.product_stid">
							<form:option value="-1" label="商品狀態"></form:option>
							<form:options items="${productStatus}" itemLabel="product_st_name"
								itemValue="product_stid" />
						</form:select>
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
							<form:input type="text" class="form-control w-50" id="productPrice"
								path="product_price" aria-describedby="" placeholder="" />
						</div>
					</div>
					<div class="col-12">
						<form>
							<div>商品介紹</div>
							<form:textarea path="product_textdetails" name="" id="script"
								cols="128" rows="5" />
						</form>
						<hr>
						<div class="col-12">
							<div class="dropdown "></div>
						</div>
					</div>
				</div>
				<!-- ------------- ProductDetailsBean --------------- -->
<!-- 				<button type="submit" class="btn btn-outline-primary" -->
<!-- 					style="width: 150px;" onclick="location.href=''">新增商品細項</button> -->
<!-- 				<button type="submit" class="btn btn-outline-primary" -->
<!-- 					style="width: 150px;">新增商品照片</button> -->
<!-- 				<div class="ml-4"> -->
<!-- 					<hr> -->
					<div class="col-12 d-flex justify-content-end">
					<a href="/GBG_project_mvc/product/manageProducts">
					<div class="btn btn-outline-primary" style="width: 150px;">
					取消
					</div>
					</a> 
						<button type="submit" class="btn btn-outline-primary"
							style="width: 150px;">儲存商品</button>
					</div>
				</div>
		</fieldset>
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