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


#imgBoard .fa-minus-circle {
 float: right;
}

#imgBoard .fa-minus-circle:hover {
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

#inCart #number2{
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
 background-color: rgba(177, 112, 82, 0.3);
}

.addcart:hover {
 /* background: url(./download.jpg) center; */
 /* background-size: cover; */
 background-color: rgba(177, 112, 82, 0.9);
 color: white;
}
</style>

</head>
<body>
  <!-- 側邊購物車--------------------------------------------------------------------------------------- -->
  <div id="inCart">
   <i class="fas fa-shopping-bag"></i>
   <div>
    <c:choose>
     <c:when test="${mPid==2||mPid==1}">
      <div id="number2">${membercartlist.size()}</div>
     </c:when>
     <c:otherwise>
      <div id="number"></div>
     </c:otherwise>
    </c:choose>
   </div>
  </div>

  <div id="imgBoard">
   <div class="cartTite">購物車</div>
   <!--判斷購物車內是否有相同商品:未顯示----------------------------------------------------------->
   <div id="sessionCart">
    <!--      map取值:OO.key/OO.value -->
    <c:forEach var="sessioncart" items="${sessionShoppingCart}">
      ${sessioncart.key},
     </c:forEach>
   </div>
   <!------------------------------------------------------------------------------------>
   <c:choose>
    <c:when test="${mPid==2||mPid==1}">
     <!--會員--------------------------------------------------------------------------------------- -->
     <div>
      <c:forEach var="membercartlist" items="${membercartlist}">
       <form>
        <i class="fas fa-minus-circle"
         onclick="location.href='shoppingCart/delete/Id=${membercartlist.sc_Id}'"></i>
        <div class="imageFrameSide">
         <img class="img"
          src="/upload/${membercartlist.itemBean.itemPic1}" alt="商品照片"></img>
        </div>
        <%--       <img src="<c:url value='upload/${sessioncartList.itemPic1}'></c:url>" alt="商品照片"></img>  --%>
        <!--<img src="#" alt="商品照片"></img> -->
        <div>${membercartlist.itemBean.itemHeader}</div>
        <div>${membercartlist.itemBean.itemPrice}元</div>
       </form>
      </c:forEach>
     </div>

    </c:when>
    <c:otherwise>
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
    </c:otherwise>
   </c:choose>

   <button class="btn addcart" type="button"
    onclick="location.href='<c:url value="/shoppingCart/sessionCartSave"/>'">確定購買</button>
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
<script>
function doFirst(){
//購物車數量
 sessioncart=document.getElementById("sessionCart").innerText;
 list=sessioncart.substr(0, sessioncart.length-1).split(",");
  if(list != null){
  document.getElementById("number").innerText = list.length-1;
  }
}
//檢查session是否有相同商品===========================================================================
function chackcartitem(itemId) {
 // alert(itemId);
 sessioncart=document.getElementById("sessionCart").innerText;//字串
//  alert(sessioncart);
 list=sessioncart.substr(0, sessioncart.length-1).split(",");
//  alert(list.length);
 for(i=0;i<list.length;i++){
  // alert(typeof parseInt(list[i])) //string
//   alert(typeof itemId);
//   alert("session內"+list[i]+"點選的商品id"+itemId);
  console.log(itemId==parseInt(list[i]));//false
  if(itemId==parseInt(list[i])){
   hasTheSame = true;
   break;
  }else{
   hasTheSame = false;
   }
 }
 if(hasTheSame == true){
  alert("購物車內已有相同的商品!");
 }else{ 
 alert("已加入購物車");
 let name="form"+itemId;
 var thisForm = document.forms[name];
 thisForm.action="${pageContext.request.contextPath}/shoppingCart/visitor/add?itemId="+itemId;
 thisForm.method="post";
 // alert(name);
//  console.info(thisForm);
 thisForm.submit();
 }
// alert(list[0]);
}
function deleteItem(itemId){
//  alert(itemId);
 name="sideform"+itemId;
 var thisForm = document.forms[name];
 thisForm.action="${pageContext.request.contextPath}/shoppingCart/visitor/del?itemId="+itemId;
 thisForm.method="post";
 thisForm.submit();
// var temp = document.createElement("Form");
// temp.action = "${pageContext.request.contextPath}/shoppingCart/visitor/del?itemId="+itemId;
// temp.method = "post";
// temp.style.display = "none";
// temp.submit();
// alert(typeof temp);
}
window.addEventListener('load',doFirst);
</script>

</body>
</html>