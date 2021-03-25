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
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css_member/style.css"> --%>
    <title>填寫訂單資料(訂單確認)</title>
    <style>
        .height{
            height: 300px;
        }
        .width{
            width: 200px;
        }
         /* body {
            background-color: #a8a5a5;
        }
        body *{
            background-color: #ffffff;
        }  */
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragment/topMVC_Old.jsp" />
	<div class="banner">
        <!-- <img src="image/basketball-1.jpg"  alt="basketball"> -->
    </div>
    <!-- ------------------ -->
        <div class="container w-100" style="margin-left: 10%;">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item text-primary" >購物車明細</a></li>
                            <li class="breadcrumb-item text-primary">配送與付款</a></li>
                            <li class="breadcrumb-item active " aria-current="page" >訂單確認</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    <!-- ==================================================== -->
        <div class="container-fluid w-75" style="margin-top: 20px;margin-left: auto;margin-right: auto;">
            <h1 class="my-3">填寫訂單明細</h1>
            <div class="row border">
                <div class="col-7 height">
                    <h3 style="margin-bottom: 50px;">收件人資訊</h3>
                    <hr>
                    <h4 style="margin-bottom: 20px;" >收件人 <span style="margin-left: 120px;" id="feedbackName">${orderMap.memberName}</span></h4>
                    <hr>
                    <h4 style="margin-bottom: 20px;" id="feedbackAdress">地址<span style="margin-left: 150px;" id="feedbackName">${orderMap.postalCode}${orderMap.memberAddress}</span></h4>
                    <hr>
                    <h4 style="margin-bottom: 50px;" id="feedbackPhone">電話<span style="margin-left: 150px;" id="feedbackName">${orderMap.memberPhone}</span></h4>
                    
                </div>
                <div class="col-2  height">
                    <h3 style="margin-bottom: 50px;">付款資訊</h3>
                    <hr>
                    <h4>客樂得貨到付款</h4>
                    
                </div>
    
            </div>
    
            <!-- <hr width="100%"> -->
            <div class="row border my-2">
                <div class="col-12 ">
                    <table>
	                    <c:forEach items="${ShoppingCart}" var="i">
		                    <tr style="height: 150px;">
		                        <td style="width: 300px;"><img style="width: 200px;" src="<c:url value='getPicture/${i.product_id}' />" /></td>
		                        <td style="width: 700px;">${i.product_title}</td>
		                        <td style="width: 150px;">${i.product_color}</td>
		                        <td style="width: 150px;">尺寸:${i.product_size}</td>
		                        <td style="width: 150px;">${i.product_price}元</td>
		                        <td style="width: 150px;">數量:${i.product_amount}</td>
		                        <td style="width: 200px;">小計${i.product_price * i.product_amount}元</td>
		                    </tr>
	                    </c:forEach>
                    </table>
                    <hr>
                </div>
            </div>
            <!-- <hr> -->
            <!-- ========================================================= -->
            <div class="row">
                <div class="col-10">

                </div>
                <div class="">
                    <ul style="list-style: none;">
                        <li>商品總金額:${totlePrice}元</li>
                        <li>運費(+60)</li>
                        <li>消費總金額:${totlePrice + 60}元</li>
                    </ul>
                    <table style="margin-left: 30px;">
                        <tr >
                            <td ><button class="btn btn-primary" type="button" onclick="history.back()">上一步</button></td>
                            <td><button class="btn btn-primary" type="button" onclick="location.href='enterOrder'">送出訂單</button></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
</body>
</html>