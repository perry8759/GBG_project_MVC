<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="GBG/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="jQuery/js/jquery-3.5.1.min.js"></script>
    <title>填寫訂單資料</title>
    <script>
       $(document).ready(function(){
        $('#same').click(function(){
              let customer = $('#customer').val();
              let phone = $('#phone').val();

              $('#feedbackcustomer').attr('value',customer);
              $('#feedbackphone').attr('value',phone);
              
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
    <div class="container-fluid w-75 " style="margin-left: 10%;">
      <div class="row">
        <div class="col-lg-12 ">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
          <li class="breadcrumb-item text-primary">購物車明細</li>
          <li class="breadcrumb-item  active" aria-current="page" >配送與付款</li>
         
      </ol>
    </nav>
    </div>
  </div>
  </div>
   <div class="container" >
        <div class="row">
          <div class="col-12 col-sm-12">
          <h1>訂購人資訊</h1>
              <hr>
              <div class="form-group" style="font-size: 20px;">
                <label >名稱:</label><br>
                <p style="text-indent: 2em;font-size: 20px">
	                ${LoginOK.member_real_name}
                </p>
              </div>
              <div class="form-group" style="font-size: 20px;">
                <label >電話:</label>
                <p style="text-indent: 2em;font-size: 20px">
	                ${LoginOK.member_mobile_phone}
                </p>
              </div>
              <div class="form-group" style="font-size: 20px;">
                <label >信箱:</label>
                <p style="text-indent: 2em;">
	                ${LoginOK.member_email}
                </p>
              </div>
          </div>
          <form method="POST" action="orderForm" style="width: 100%;">
          <div class="col-12 col-sm-12">
              <h1>收件人資訊</h1>
              <hr>
              <label >名稱</label>
              <div class="form-group d-flex justify-content-between">
	              <input type="text" class="form-control " name="memberName" id="feedbackcustomer" aria-describedby="emailHelp" placeholder="" value="${memberName}" style="width: 80%;">
	              <button type="button" class="btn btn-outline-primary  "type="button" style="width: 200px;"id="same" onclick="location.href='withOrderMen'">同訂購人資訊</button>
              </div>
              <label >電話</label>
              <div class="form-group d-flex justify-content-between">
              	  <input type="text" class="form-control" name="memberPhone" id="feedbackphone" aria-describedby="emailHelp"  value="${memberPhone}" placeholder="09XXXXXXXX" style="width: 80%;">
              </div>
          </div>
          <div class="col-12 col-sm-12">
              <div class="form-group">
                <label >郵遞區號</label>
                <input type="text" class="form-control" name="postalCode" id="exampleInputPassword1" placeholder="100" style="width: 80%;">
              </div>
              <div class="form-group">
                <label >配送地址</label>
                <input type="text" class="form-control" name="memberAddress" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" style="width: 80%;" value="${memberAddress}">
              </div>
          </div>
          <div>
            <div class="col-10 d-flex justify-content-end">
              <button class="btn btn-primary" type="button" style="margin-right: 20px;" onclick="location.href='shoppingCart'">上一步</button>
              <button class="btn btn-primary" type="submit" style="margin-right: 20px;" onclick="this.form.submit()">下一步</button>
            </div>
          </div>
         </form>
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