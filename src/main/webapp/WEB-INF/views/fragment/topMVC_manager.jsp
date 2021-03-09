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
           
        }
        .side-menu{
            position: relative;
            width: 20%;
            height: 100%;
            padding: 50px 0;
            box-sizing: border-box;
            background-image:linear-gradient(0deg,#3f5494,#08c7a5);
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
        nav a{
           display: block; /*變直*/
           padding: 10px;
           color: #fff;
           text-decoration: none;
           position: relative;
        }
        nav a + a::before{
            content: '';
            position: absolute;
            border-top: 1px solid rgb(255,255,255,.4);
            left: 10px;
            right: 10px;
            top: 0;
        }
        nav a .fa{
            margin-right: -1.1em;
            transform: scale(0);
            transition: .3s;
        }
        nav a:hover .fa{
            margin-right: 0em;
            transform: scale(1);
        }




     </style>
</head>
<body>
        <input type="checkbox" name="" id="side-menu-switch">
    
    <div class="side-menu" style="float:left;margin-right:70px;">
        <form>
            <input type="search" placeholder="請輸入">
            <button><i class="fa fa-search"></i></button>
        </form>
        <nav>
            <a href="<c:url value='/ACT/Manager_ACT_list' />"><i class="fa fa-home" aria-hidden="true"></i>後臺活動管理</a>
            <a href="<c:url value='/DOS/DOS_list' />"><i class="fa fa-home" aria-hidden="true"></i>後臺場地管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>後臺帳號管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>後臺商城管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>後臺公告管理</a>
            <a href="#"><i class="fa fa-home" aria-hidden="true"></i>後臺場地管理</a>
        </nav>
        <label for="side-menu-switch">
            <i class="fa fa-angle-right"></i>
        </label>
    </div>
</body>
</html>