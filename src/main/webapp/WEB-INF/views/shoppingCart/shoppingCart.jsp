<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/STAR.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/shoppingCart.css">
	<script src="${pageContext.request.contextPath}/js_member/jquery-3.5.1.min.js"></script>
	<title>購物車</title>
    <style>
        /* .row{
             background-color: #cccccc ; 
             border: 1px solid #dddddd; 
        } */
        .float{
            float: left;
        }
        
        ul li{
            list-style-type: none;
        }
        .border{
            border: 1px;
            border-color: #666666 ;
        }
        .btn
        {
            background-color: #DE520E;
            outline-color: #DE520E;
            color: #ffffff;
            border-radius: 5px;
        }
        /* style="background: rgb(234, 252, 252); */
    </style>
    <script>
         $(document).ready(function(){




            $('.remove').click(function(){
                $(this).parent().parent().remove();
            });
        });
    </script>
</head>
<body>
	<!-- 購物車主要部分 -->
    <div class="container-fluid w-75">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active " aria-current="page">購物車明細</li>
            </ol>
        </nav>
     
    </div>
    <div class="container-fluid ">
       <div class="row ">
            <div class="col-lg-1 col-sm-0">

            </div>
           <div class="col-lg-7 col-sm-12">
               <h1 style="margin-bottom:20px;font-size: 3rem;">購物車</h1>
               <table>
					<c:forEach items="${ShoppingCart}" var="i">
						<tr>
	                        <!-- <td><input type="checkbox" style="width: 20px;height: 15px;"></input></td> -->
	                        <td><img style="width: 200px;" src="<c:url value='getPicture/${i.productDetailBean.productBean.product_id}' />" /></td>
	                        <td style="width: 150px;">${i.productDetailBean.productBean.product_title}</td>
	                        <td style="width: 150px;">${i.productDetailBean.productBean.product_price}</td>
	                        <td>
		                        <form method="POST" action="updateProductCount">
		                        	<input type="number" name="productAmount" min="0"  max="100"width: 150px;word-break: break-all; step="1" placeholder="1" value="${i.product_amount}" onchange="this.form.submit()">
		                        	<input type="hidden" name="cartId" value="${i.cart_id}">
		                        </form>
	                        </td>
	                        <td style="width: 150px;">${i.productDetailBean.productBean.product_price * i.product_amount}</td>
	                        <td style="width: 200px;">
		                        <button type="button" class="btn btn-outline-white mr-2">加入收藏清單</button>
		                        <button type="button" class="btn btn-outline-white remove" onclick="location.href='deleteProduct?cartId=${i.cart_id}'">刪除</button>
	                        </td>
                    	</tr>
					</c:forEach>
                </table>
</body>
</html>