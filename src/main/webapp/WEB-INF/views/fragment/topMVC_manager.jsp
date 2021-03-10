<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>收合側邊</title>
<style>
        @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css");

         @import url("https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap");

        *{
            margin: 0;
            padding: 0;
            list-style: none;
            font-family: 'Noto Sans TC', sans-serif;
        }
        html,body{
            height: 100%;
        }
        body{
            background-color: #fff;
        }
        .side-menu{
            position: relative;
           
            width: 20%;
            height: 100%;
            padding: 100px 0;
            box-sizing: border-box;
            /* background-image:linear-gradient(0deg,#3f5494,#08c7a5); */
            
            background-color: rgba(55, 59, 66, 0.836);
            display: flex;
            flex-direction: column;
            box-shadow: 5px 0px 10px hsla(240, 40%, 15%, .6);
            transform: translateX(-100%);
            transition: .3s;
        }
        .side-menu form{
            display: flex;
            margin: 0 10px 50px;
            border-radius: 100px;
            border: 1px solid rgb(255,255,255,.4);
        }
        .side-menu form input,.side-menu form button{
            border: none;
            background-color: transparent;
            color: #fff;
            padding: 5px 10px;
           
        }
        .side-menu form input{
            width: 230px;
        }
        .side-menu form button{
             width: 50px;
        }
        .side-menu form input:focus,.side-menu form button:focus{
            outline: none;
        }
        .side-menu label{
            position: absolute;
            width: 40px;
            height: 80px;
            background-color: #000;
            color: #fff;
            right: -40px;
            top: 0;
            bottom: 0;
            margin: auto;
            line-height: 80px;
            text-align: center;
            font-size: 30px;
            border-radius: 0 10px 10px 0;
        }
        #side-menu-switch{
            position: absolute;
            opacity: 0;
            z-index: -1;
        }
        #side-menu-switch:checked + .side-menu{
            transform: translateX(0);
        }
        #side-menu-switch:checked + .side-menu label .fa{
            transform: scaleX(-1);

        }
        .nav a{
           display: block; /*變直*/
           padding: 20px;
           color: #fff;
           text-decoration: none;
           width:100%;
           text-align: center;
        }
        .nav a + a::before{
            content: '';
            border-top: 1px solid rgb(255,255,255,.4);        
            left: 10px;
            right: 10px;
            top: 0;
        }
        .nav a .fa{
            margin-right: -1.1em;
            transform: scale(0);
            transition: .3s;
      
        }
        .nav a:hover .fa{
            margin-right: 0em;
            transform: scale(1);
        }

        @media screen and (max-width: 600px){
            .side-menu{
                width: 150px;
            }
        }

        @media screen and (max-height: 700px){
            .side-menu{
                padding: 0px 0px;
            }

        }




     </style>
</head>
<body>


        <input type="checkbox" name="" id="side-menu-switch">
    
<div class="side-menu" style="float:left;margin-right:70px;">

    <nav class="nav">
        <a href="#"><i class="fa fa-home" aria-hidden="true" ></i>回首頁</a>
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>會員主頁</a>
        <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>修改資料</a>
        <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>更改密碼</a>
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>比賽管理</a>
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>推播管理</a>
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>訂單查詢</a>
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>收藏清單</a>
        <a href="#"><i class="fa fa-home" aria-hidden="true"></i>管理商品評論</a>
    </nav>
    <label for="side-menu-switch">
        <i class="fa fa-angle-right"></i>
    </label>

</div>
</body>
</html>