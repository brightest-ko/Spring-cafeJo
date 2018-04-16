<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .nav-pills a {
  	border: 1px solid lightgray;
  	border-right:0px;
  	color: black;
  }
  #colorwhite{
    background-color: #990000;
  	color: white;
  }
  </style>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/menu/menuheader.jsp"/>

<div class="container">
<!--   <h1 class="text-center">MENU</h1> 
  <br>-->
  
  <div style="border-bottom: 2px solid lightgray;">
  <ul class="nav nav-pills nav-justified nav-danger hidden-xs">
    <li class="pills-active"><a href="#" id="colorwhite">신제품</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/coffee.js">커피</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/beverage.js">음료</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/dessert.js">디져트</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/delhi.js">델리</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/md.js" style="border-right: 1px solid lightgray;">MD</a></li>
  </ul>
  </div>
  <br>
  <h2>신메뉴</h2>
  <hr>
  <div style="padding-left: 15%;padding-right: 15%; width: 100%">
  <img alt="" src="<%= request.getContextPath() %>/resources/img/newmenu2m.jpg" style="width: 80%">
  </div>  
</div> 

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
