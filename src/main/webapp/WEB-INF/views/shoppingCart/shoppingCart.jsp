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
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/style.css"> --%>
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
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
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
					<c:forEach items="${ShoppingCart}" var="i" varStatus="vs">
						<tr>
	                        <!-- <td><input type="checkbox" style="width: 20px;height: 15px;"></input></td> -->
	                        <td><img style="width: 200px;" src="<c:url value='getPicture/${i.product_id}' />" /></td>
	                        <td style="width: 150px;">${i.product_title}</td>
	                        <td style="width: 150px;">${i.product_price}</td>
	                        <td>
		                        <form method="POST" action="updateProductCount">
		                        	<input type="number" name="productAmount" min="0"  max="100"width: 150px;word-break: break-all; step="1" placeholder="1" value="${i.product_amount}" onchange="this.form.submit()">
		                        	<input type="hidden" name="cartId" value="${i.cart_id}">
		                        </form>
	                        </td>
	                        <td style="width: 150px;">${i.product_price * i.product_amount}</td>
	                        <td style="width: 200px;">
		                        <button type="button" style="background-color: #DE520E;outline-color: #DE520E;color: #ffffff;" class="btn mr-2">加入收藏清單</button>
		                        <button type="button" style="background-color: #DE520E;outline-color: #DE520E;color: #ffffff;" class="btn remove" onclick="location.href='deleteProduct?cartId=${i.cart_id}'">刪除</button>
	                        </td>
                    	</tr>
					</c:forEach>
                </table>
                <hr>
                <h5 style="text-align: right;">小計:${totlePrice}元</h5>
            </div>
        <!-- 右側上方金額結帳位置 -->
            <div class="col-lg-3 col-sm-12" >
               <div class="border p-3">
                    <h1  style="margin-top: 10px;width: 150px;word-break: keep-all;">小計:${totlePrice}元</h1>
					<c:if test="${!empty ShoppingCart[0]}">
						<button type="button" class="btn" value="" style="margin : 0px auto ; margin-top: 35% ;display: block; width: 40%;background-color: #DE520E;outline-color: #DE520E;color: #ffffff;" onclick="location.href='orderForm'">結帳</button>
					</c:if>
                    <c:if test="${empty ShoppingCart[0]}">
						<button type="button" class="btn" value="" style="margin : 0px auto ; margin-top: 35% ;display: block; width: 40%; background-color: #ddd">不結帳</button>
					</c:if>
                </div>
            
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/usm/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
   
</body>
</html>