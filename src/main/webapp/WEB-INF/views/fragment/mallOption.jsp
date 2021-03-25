<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags------------------------------------------------------------------------------------- -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS ----------------------------------------------------------------------------------------- -->
<link
 href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0-beta1/dist/css/bootstrap.min.css"
 rel="stylesheet"
 integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
 crossorigin="anonymous">
<!-- icon cdn----------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<!-- animation --------------------------------------------------------------------------------------------- -->
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<%-- jQuery============================================================================ --%>
<script type='text/javascript'
 src='http://code.jquery.com/jquery-1.9.1.min.js'></script>

<!-- css連結------------------------------------------------------------------------------------------------ -->
<link rel="stylesheet"
 href="<c:url value='/_00_util/allUtil/css/utilLayout.css'></c:url>">

<link rel="stylesheet"
 href="<c:url value='/_00_util/allUtil/css/utilFont.css'></c:url>">

<link rel="stylesheet"
 href="<c:url value='/_00_util/allUtil/css/utilColor.css'></c:url>">


<link rel="stylesheet"
 href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallLayout.css'></c:url>">

<link rel="stylesheet"
 href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallColor.css'></c:url>">

<link rel="stylesheet"
 href="<c:url value='/_00_util/shoppingMallUtil/css/shoppingMallFont.css'></c:url>">

<!-- --------------------------------------------------------------------------------------------------------->
<style >
/*購物車側欄======================================================================================= */
#imgBoard {
 background: #ddd;
 width: 300px;
 padding: 20px 40px;
 position: fixed;
 left: -300px;
 z-index: 50;
 text-align: center;
 height: 80%;
 overflow-y: auto;
}

#imgBoard img {
 width: 100%
}

#sessionCart {
 display: none;
}


#imgBoard .fa-times {
 float: right;
}

#imgBoard .fa-times:hover {
 color: red;
 cursor: pointer;
}

.cartTite{
font-size: 1.5rem;
}

#inCart {
 font-size: 3rem;
 left: 10px;
 /* border:1px solid black; */
 position: fixed;
 z-index: 50;
}

#inCart div {
 /*    display: inline-flex;  */
 justify-content: center;
 align-items: center;
 position: absolute;
 top: 20px;
 left: 10px;
 display: block;
 text-align: center;
}

#inCart #number {
 font-size: 1rem;
 width: 1.5rem;
 height: 1.5rem;
 color: white;
 font-weight: bold;
 position: relative;
 left: 25px;
 border: 1px solid red;
 border-radius: 50%;
 text-align: center;
 display: table-cell;
 vertical-align: bottom;
 background: red;
 transform: scale(0.9);
}

.addcart {
 width: 100%;
 background-color: rgba(222, 82, 14, 0.3);
}

.addcart:hover {
 /* background: url(./download.jpg) center; */
 /* background-size: cover; */
 background-color: rgba(222, 82, 14, 0.9);
 color: white;
}
</style>

</head>
<body>
  <!-- 側邊購物車--------------------------------------------------------------------------------------- -->
  <div id="inCart">
   <i class="fa fa-shopping-cart"></i>
   <div>
      <div id="number">${ShoppingCart.size()}</div>
   </div>
  </div>
  <div id="imgBoard">
   <div class="cartTite">購物車</div>
     <!--會員--------------------------------------------------------------------------------------- -->
     <div>
      <c:forEach var="i" items="${ShoppingCart}">
       <form>
        <i class="fas fa-times"
         onclick="location.href='${pageContext.request.contextPath}/shoppingCart/deleteProduct?cartId=${i.cart_id}'"></i>
        <div class="imageFrameSide">
         <img class="img"
          src="<c:url value='/shoppingCart/getPicture/${i.product_id}' />" alt="商品照片"></img>
        </div>
        <%--       <img src="<c:url value='upload/${sessioncartList.itemPic1}'></c:url>" alt="商品照片"></img>  --%>
        <!--<img src="#" alt="商品照片"></img> -->
        <div>${i.product_title}</div>
        <div>${i.product_size} ${i.product_color} ${i.product_amount}件</div>
        <div>${i.product_price}元</div>
       </form>
      </c:forEach>
     </div>
     <div>
      <c:forEach var="sessioncartList"
       items="${sessionShoppingCartList}">
       <form name="sideform${sessioncartList.itemId}">
        <i class="fas fa-minus-circle"
         onclick="deleteItem(${sessioncartList.itemId})"></i>
        <div class="imageFrameSide">
         <img class="img" src="/upload/${sessioncartList.itemPic1}"
          alt="商品照片"></img>
        </div>
        <%--       <img src="<c:url value='upload/${sessioncartList.itemPic1}'></c:url>" alt="商品照片"></img>  --%>
        <!--<img src="#" alt="商品照片"></img> -->
        <div>${sessioncartList.itemHeader}</div>
        <div>${sessioncartList.itemPrice}元</div>

       </form>
      </c:forEach>
     </div>

   <button class="btn addcart" type="button" onclick="location.href='<c:url value="/shoppingCart/orderForm"/>'">確定購買</button>
   <!--     導向存session的controller -->

  </div>

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
$(document).ready(function() {
 //購物車伸縮==========================================
 $('#inCart , #imgBoard').mouseover(function() {
   $('#imgBoard').css({
    left: '0px',
    transition : '1s'
   });
   
   $('#inCart').css({
    cursor: pointer,
   });
  
 })
 
 $('#inCart, #imgBoard').mouseout(function() {
   $('#imgBoard').css({
    left: '-300px',
    transition : '.3s'
   });
  
 })
})
</script>
</body>
</html>