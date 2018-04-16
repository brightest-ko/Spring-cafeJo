<%@page import="com.cafeJo.heeJ.menu.MenuVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  .thumb_bottom{
  	padding-top:5px;
  	border-bottom: 1px dotted lightgray;
  }
  </style>
  <script type="text/javascript">
	function deletedelhi(num, currentPage){
		if(confirm("선택하신 제품을 삭제하시겠습니까?")){
			location.href ="deletemenu.do?num="+num+"&pagekind=delhi&page="+currentPage;
		}		
	}
  </script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="hidden-xs">
<jsp:include page="/WEB-INF/views/menu/menuheader.jsp"/>
</div>

<div class="container">
<!--   <h1 class="text-center">MENU</h1>
  <br> -->
  
  <div style="border-bottom: 2px solid lightgray;">
  <ul class="nav nav-pills nav-justified nav-danger hidden-xs">
    <li><a href="<%=request.getContextPath()%>/menu/newMenu.js">신제품</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/coffee.js">커피</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/beverage.js">음료</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/dessert.js">디져트</a></li>
    <li class="pills-active"><a href="#" id="colorwhite">델리</a></li>
    <li><a href="<%=request.getContextPath()%>/menu/md.js" style="border-right: 1px solid lightgray;">MD</a></li>
  </ul>
  </div>
  <br>
  <div class="row">
  <div class=" col-sm-7 col-lg-9">
  <h2>커피</h2>
  &nbsp;총 커피 종류: ${realTotalNum}
  </div>
<form action="<%=request.getContextPath()%>/menu/delhi.js" method="post" enctype="multipart/form-data">
  <div class=" col-xs-5 col-lg-3">
  <br>
  <div class="input-group">
    <input type="search" class="form-control" name="keyword"  placeholder="제품 이름을 입력하세요.">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>  
  </div>
  </div>
  </form>
  <c:if test="${sessionScope.grade == 'ADMIN' }"> 
  <div align="right"> 	
  <button type="button" class="btn btn-danger col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/menu/addmenu.js?pagekind=coffee&page=${currentPage}'"
  	style="float: right;">상품추가</button>
  </div>
  </c:if>
  </div>
  
  <hr>
  <div class="row">
  <%int i=0; %>
  <c:forEach var="delhilist" items="${delhilist}">
  <!-- Trigger the modal with a button -->
  <div class="col-lg-3 col-md-6 thumb thumb_bottom">
  <%i=i+1; %>
  <a class="thumbnail" href="#" data-toggle="modal" data-target="#<%=i%>">
  <img class="img-responsive" src='<%=request.getContextPath() + "/resources/upload/menu"%>/${delhilist.filename}'
  alt="${delhilist.filename} 이미지" style="width: 200px; height: 200px;"></a>
  <p class="text-center">${delhilist.menuname}</p>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="<%=i%>" role="dialog">
    <div class="modal-dialog modal-lg">
    <!-- Modal content-->
      <div class="modal-content">
      	<div class="modal-header">
      		<button type="button" class="close" data-dismiss="modal">&times;</button>
      	</div>
      	<div class="modal-body">
      		<div class="row">
      		<div class="col-sm-4" align="center">
      		<img class="img-responsive" src='<%=request.getContextPath() + "/resources/upload/menu"%>/${delhilist.filename}'
  alt="${delhilist.filename} 이미지">
      		</div>
      		<div class="col-sm-8">
      		<h3 style="padding-bottom:5px; border-bottom: 1px dotted #990000;">${delhilist.menuname}</h3>
			<p>${delhilist.description}</p>
			<table class="table">
			<tr><th>구분</th><th>열량(kcal)</th><th>당류(g)</th><th>단백질(g)</th><th>카페인(mg)</th><th>포화지방(g)</th><th>나트륨(mg)</th></tr>
			<tr><td>${delhilist.hotncold}</td><td>${delhilist.calory}</td><td>${delhilist.saccharide}</td>
			<td>${delhilist.protein}</td><td>${delhilist.caffeine}</td><td>${delhilist.fat}</td><td>${delhilist.sodium}</td>
			</tr>
			</table>
			</div>
			</div>
      	</div>  
    	<div class="modal-footer">
    	  <c:if test="${sessionScope.grade == 'ADMIN' }">
    	  	<button type="button" class="btn btn-warning" data-dismiss="modal"
    	  		onclick="location.href='<%=request.getContextPath()%>/menu/updatemenu.js?num=${delhilist.num}&pagekind=delhi&page=${currentPage}'">상품수정</button>
    	  	<button type="button" class="btn btn-warning" data-dismiss="modal"
    	  		onclick="deletedelhi(${delhilist.num},${currentPage})">상품삭제</button>
    	  		<!-- 삭제시 정말 삭제하겠니? 한번 더 물어보기 -->  
    	  </c:if>
      		<button data-toggle="modal" data-target="#<%=i-1 %>" class="btn btn-danger btn-logged" data-dismiss="modal">Prev</button>
      		<button data-toggle="modal" data-target="#<%=i+1 %>" class="btn btn-danger btn-logged" data-dismiss="modal">Next</button>
      		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	</div>
      </div>
    </div>
  </div>
  </c:forEach>
  </div>
  <div>
  <div class="text-center">${pageHtml}</div>
  <c:if test="${sessionScope.grade == 'ADMIN' }">  	
  <button type="button" class="btn btn-danger col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/menu/addmenu.js?pagekind=delhi&page=${currentPage}'"
  	style="float: right;">상품추가</button>
  </c:if>
  </div>  
</div>
 

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
