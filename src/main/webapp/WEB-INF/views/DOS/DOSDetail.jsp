<!-- 詳細場地資訊 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style type="text/css">
*{
  box-sizing:border-box;
}

#MainMenu{
   margin:0px 0px 15px;
   border-bottom: solid 1px #DDDDDD;
}
#fun{
   float: right;
   position: relative;
   padding: 4px 0px;
}
#MainTitle{
   width: calc( 100% - 200px );
   font-size: 35px;
}
@media (max-width:500px) {
.MainContnet{
   width:calc( 100% -120px ); 
}
}
a.booking{
    display: block;
    padding: 5px 10px 1px;
    background-color: rgb(255, 146, 7);
    line-height: 18px;
    text-align: center;
}
.SubTitle{
   float: left;
   font-size: 25px;
   color: #009582;
}
.MainTitleTxt {
    width: 100%;
}
.MainItem{
    margin-top: 20px;
    padding-top: 20px;
    width: calc( 100%  );
    border-top: solid 1px #DDDDDD;
    height: 100%;
    
}
.Tr{
    display: table-row;
}
.Tr .Td.Title{
    width: 150px;
    font-size: 20px;
    vertical-align: top;
}
.Tr .Td{
    display: table-cell;
    padding: 10px 10px 0px 0px;
    font-size: 17px;
    line-height: 26px;
}
.Content{
    margin-bottom: 10px;
    color: #555555;
    font-size: 17px;
      
}
.CTitle{
    float:left;
    width:200px;
    line-height:23px;
}
.CContent{
    float:left;
    width:calc(100%-200px);
    color:#777777;
}
.allPhoto{
   float:none;
   clear: both;
}
.img-fluid{
    float: left;
    margin: 0px 5px 10px 5px;
    width: calc( 100% / 5  -20px);
    height: 130px;
    border:1px solid red;
    text-align: center;
}


</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragment/topMVC.jsp" />    
<div  id="MainMenu">

      <!-- <div id="fun"><a href="../ACT/ACT_Index?DOSID=<c:out value="${DOSID.DOS_ID}"/>" class="booking" >租用場地</a></div>-->
<div id="fun"><a href="../ACT/ACT_Main_new?DOSID=<c:out value="${DOSID.DOS_ID}"/>" class="booking" >租用場地</a></div>


<h1 id="MainTitle" style="margin-top:0px">
      <div class="MainTitleTxt"><c:out value="${DOSID.DOS_NAME}"/></div>
</h1>
</div>
<div class="MainContent"  style="margin-top:20px">
       <div class="MainItem">
           <div class="Tr">
              <h2 class="Td Title">聯絡方式</h2>
              <div class="Td">
                        <div class="Content">
                            <div class="CTitle">場地管理人</div>
                            <div class="CContent">${DOSID.DOS_AD}</div>
                        </div>
                        <div class="Content">
                            <div class="CTitle">租借聯絡人</div>
                            <div class="CContent">${DOSID.DOS_OFFICER}</div>
                        </div>
                        <div class="Content">
                            <div class="CTitle">租借連絡電話</div>
                            <div class="CContent">${DOSID.DOS_PHONE}</div>
                        </div>
              </div>
           </div>
       </div>
       <div class="MainItem">
             <div class="Tr">
              <h2 class="Td Title">交通方式</h2>
                   <div class="Td">
                       <div class="Content" style="white-space: pre-wrap;word-break: normal;">
                               <p>${DOSID.DOS_TRANS}
                           
                       </div>
                   </div>
              </div>
       </div>
       <div class="MainItem">
             <div class="Tr">
              <h2 class="Td Title">備註</h2>
              <br>
                  <div class="Content" style="white-space: pre-wrap;word-break: normal;">
                                 <p>${DOSID.DOS_PS}<p>                             
                  </div>
              </div>
       </div>
       <div class="MainItem" style="width:100%">
          <div class="Tr">
            <h2 class="SubTitle">圖像集</h2>
            <div class="allPhoto">
            <c:forEach var="name" items="${DOSPICID}">
              
                <img src="data:image/jpg;base64,${name}" class="img-fluid"/>
              
            </c:forEach>
            </div>
            </div>
       </div>
       <div class="MainItem" style="width:100%">
          <div class="Tr">
            <h2 class="SubTitle">場館地圖</h2>
            
       </div>
       </div>
</div>


</body>
</html>