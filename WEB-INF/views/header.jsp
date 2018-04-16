<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <style>
.navbar{
	margin-bottom: 0;
	border-radius: 0;
	background: white;
}
#menudiv{
	margin-top:52px;
}
#mylogo {
	font-size:20px;
	color:black;
}
.icon-bar{
	background-color: black;
}

@media (min-width: 768px) {
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background: white;
      height: 115px;
    }
    #menudiv{
      margin-top:115px;
    }
    #mylogo {
	  font-size:20px;
	  color:black;
	  border-radius: 10px;
	  margin-top:35px;
	}
    .navbar .navbar-nav {
        display: inline-block;
        float: none;
        vertical-align: top;
    }

    .navbar .navbar-collapse {
        text-align: center;
    }
}


#myNavbar .nav li a:hover {
	color: red;
	background-color: white;
}
#si {border-left: 1px solid black;}

.colorblack{ color: black;}

@media (min-width: 979px) {
  ul.nav li.dropdown:hover > ul.dropdown-menu {
    display: block;
  }
}
.navbar-box{
	border-bottom: 2px solid lightgray;
}
</style>
<script type="text/javascript">
function onlymember(){
	if(confirm("회원전용입니다. 로그인하시겠습니까?")){
		location.href ="/heeJ/member/login.js";
	}		
}
function logout(){
	if(confirm("로그아웃 하시겠습니까?")){
		location.href ="/heeJ/member/logout.do";
	}		
}
</script>
<header>
<nav class="navbar navbar-fixed-top navbar-box">
  <div class="container">
	<c:if test="${empty sessionScope.userid }">
  	<div style="text-align:right; " class="hidden-xs">
		<strong><a href="<%=request.getContextPath()%>/member/login.js" class="colorblack">
		&nbsp;<span class="glyphicon glyphicon-log-in"></span> Login &nbsp;</a></strong>
		<strong id="si"><a href="<%=request.getContextPath()%>/member/signup.js" class="colorblack">
		&nbsp;<span class="glyphicon glyphicon-user"></span> Sign Up &nbsp;</a></strong>
	</div>
	</c:if>
	
	<c:if test="${not empty sessionScope.userid }">
	<c:if test="${sessionScope.grade == 'ADMIN' }">
   	<div style="text-align:right; " class="hidden-xs">
		<strong>${username}님 환영합니다.</strong>
		<strong id="si"><a href="<%=request.getContextPath()%>/member/memberinfo.js" class="colorblack">
		&nbsp;<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;회원정보 관리 &nbsp;</a></strong>
		<strong id="si"><a href="javascript:logout()" class="colorblack">
		&nbsp;&nbsp;로그아웃 &nbsp;</a></strong>
	</div> 	
	</c:if>
  	<c:if test="${sessionScope.grade != 'ADMIN' }">
  	<div style="text-align:right; " class="hidden-xs">
		<strong>${username}님 환영합니다.</strong>
		<strong id="si"><a href="<%=request.getContextPath()%>/member/myinfo.js" class="colorblack">
		&nbsp;<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;내 정보 확인 &nbsp;</a></strong>
		<strong id="si"><a href="javascript:logout()" class="colorblack">
		&nbsp;&nbsp;로그아웃 &nbsp;</a></strong>
	</div>
	</c:if>
	</c:if>
    <div class="navbar-header ">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand hidden-lg hidden-md hidden-sm" href="<%=request.getContextPath()%>/index.do">
		<img src="<%= request.getContextPath() %>/resources/img/cafejologo2.jpg" alt="CafeJo" style="width: 80px;"></a>
      
	  <c:if test="${empty sessionScope.userid }">
      	<a href="<%=request.getContextPath()%>/member/signup.js"
      	  class="navbar-brand hidden-lg hidden-md hidden-sm colorblack" style="float: right;">
		<!-- <span class="glyphicon glyphicon-user"></span> -->SignUp</a>
      	<a href="<%=request.getContextPath()%>/member/login.js"
      	  class="navbar-brand hidden-lg hidden-md hidden-sm colorblack" style="float: right;">
      	<!-- <span class="glyphicon glyphicon-log-in"></span> -->Login</a>
  	  </c:if>
  	  <c:if test="${not empty sessionScope.userid }">
		<a href="<%=request.getContextPath()%>/member/logout.do"
		  class="navbar-brand hidden-lg hidden-md hidden-sm colorblack" style="float: right;">
		<!-- <span class="glyphicon glyphicon-log-out"></span> -->Logout</a>
		
		<c:if test="${sessionScope.grade != 'ADMIN' }">
      	<a href="<%=request.getContextPath()%>/member/myinfo.js"
      	  class="navbar-brand hidden-lg hidden-md hidden-sm colorblack" style="float: right;">
		<!-- <span class="glyphicon glyphicon-lock"></span> -->MyInfo</a>
		</c:if>
		<c:if test="${sessionScope.grade == 'ADMIN' }">
      	<a href="<%=request.getContextPath()%>/member/memberinfo.js"
      	  class="navbar-brand hidden-lg hidden-md hidden-sm colorblack" style="float: right; font: 1px;">
		<!-- <span class="glyphicon glyphicon-lock"></span> -->MemInfo</a>
		</c:if>
	  </c:if>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">  
      <ul class="nav navbar-nav navbar-left">
      </ul>
      <ul class="nav navbar-nav">
        <!-- Brand -->
        <%-- <li><a href="<%= request.getContextPath() %>/brand.js" id="mylogo">
        &nbsp;&nbsp;&nbsp;Brand&nbsp;&nbsp;&nbsp;</a></li> --%>

        <li class="dropdown hidden-sm hidden-md hidden-lg">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="mylogo">&nbsp;&nbsp;&nbsp;Brand&nbsp;
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%= request.getContextPath() %>/brand.js">&nbsp;&nbsp;&nbsp;소개</a></li>
          <li><a href="<%= request.getContextPath() %>/brand/store.js">&nbsp;&nbsp;&nbsp;매장 찾기</a></li>
        </ul>
      	</li>
        <li class="dropdown hidden-xs">
        <a class="dropdown-toggle" href="<%=request.getContextPath()%>/brand.js" id="mylogo">&nbsp;&nbsp;&nbsp;Brand&nbsp;&nbsp;&nbsp;</a>
        <ul class="dropdown-menu">
          <li><a href="<%= request.getContextPath() %>/brand.js">&nbsp;&nbsp;&nbsp;소개</a></li>
          <li><a href="<%= request.getContextPath() %>/brand/store.js">&nbsp;&nbsp;&nbsp;매장 찾기</a></li>
        </ul>
        </li>
        <!-- Menu -->
        <li class="dropdown hidden-sm hidden-md hidden-lg">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="mylogo">&nbsp;&nbsp;&nbsp;Menu&nbsp;
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/menu/newMenu.js">&nbsp;&nbsp;&nbsp;신제품</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/coffee.js">&nbsp;&nbsp;&nbsp;커피</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/beverage.js">&nbsp;&nbsp;&nbsp;음료</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/dessert.js">&nbsp;&nbsp;&nbsp;디져트</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/delhi.js">&nbsp;&nbsp;&nbsp;델리</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/md.js">&nbsp;&nbsp;&nbsp;MD</a></li>
        </ul>
      	</li>
        <li class="dropdown hidden-xs">
        <a class="dropdown-toggle" href="<%=request.getContextPath()%>/menu/newMenu.js" id="mylogo">&nbsp;&nbsp;&nbsp;Menu&nbsp;&nbsp;&nbsp;</a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/menu/newMenu.js">&nbsp;&nbsp;&nbsp;신제품</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/coffee.js">&nbsp;&nbsp;&nbsp;커피</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/beverage.js">&nbsp;&nbsp;&nbsp;음료</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/dessert.js">&nbsp;&nbsp;&nbsp;디져트</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/delhi.js">&nbsp;&nbsp;&nbsp;델리</a></li>
          <li><a href="<%=request.getContextPath()%>/menu/md.js">&nbsp;&nbsp;&nbsp;MD</a></li>
        </ul>
        </li>
        <!-- Logo -->
        <li class="hidden-xs"><a href="<%=request.getContextPath()%>/index.do">
        	<img src="<%= request.getContextPath() %>/resources/img/cafejologo2.jpg" alt="CafeJo"></a></li>
        <!-- Customer -->
        <li class="dropdown hidden-sm hidden-md hidden-lg">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="mylogo">&nbsp;&nbsp;&nbsp;Customer&nbsp;
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/customer/notice.js">&nbsp;&nbsp;&nbsp;공지 & 홍보자료</a></li>
          <li><a href="<%=request.getContextPath()%>/customer/event.js">&nbsp;&nbsp;&nbsp;이벤트</a></li>
          <c:if test="${sessionScope.grade == 'ADMIN'}">
          <li><a href="<%=request.getContextPath()%>/customer/eventmember.js">&nbsp;&nbsp;&nbsp;이벤트 참여 관리</a></li>
          </c:if>
        </ul>
      	</li>
        <li class="dropdown hidden-xs">
        <a class="dropdown-toggle" href="<%=request.getContextPath()%>/customer/notice.js" id="mylogo">&nbsp;&nbsp;&nbsp;Customer&nbsp;&nbsp;&nbsp;</a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/customer/notice.js">&nbsp;&nbsp;&nbsp;공지 & 홍보자료</a></li>
          <li><a href="<%=request.getContextPath()%>/customer/event.js">&nbsp;&nbsp;&nbsp;이벤트</a></li>
          <c:if test="${sessionScope.grade == 'ADMIN'}">
          <li><a href="<%=request.getContextPath()%>/customer/eventmember.js">&nbsp;&nbsp;&nbsp;이벤트 참여 관리</a></li>
          </c:if>
        </ul>
        </li>
        <!-- Franchise -->
        <li class="dropdown hidden-sm hidden-md hidden-lg">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="mylogo">&nbsp;&nbsp;&nbsp;Franchise&nbsp;
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/franchise/info.js">&nbsp;&nbsp;&nbsp;창업안내 및 절차</a></li>
          <c:if test="${empty sessionScope.userid }">
          <li><a href="javascript:onlymember()">&nbsp;&nbsp;&nbsp;창업문의</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.userid }">
          <li><a href="<%=request.getContextPath()%>/franchise/addqna.js">&nbsp;&nbsp;&nbsp;창업문의</a></li>
          </c:if>
          <c:if test="${sessionScope.grade == 'ADMIN'}">
          <li><a href="<%=request.getContextPath()%>/franchise/qna.js">&nbsp;&nbsp;&nbsp;창업 문의 관리</a></li>
          </c:if>
          <li><a href="<%=request.getContextPath()%>/franchise/faq.js">&nbsp;&nbsp;&nbsp;FAQ</a></li>
        </ul>
      	</li>
        <li class="dropdown hidden-xs">
        <a class="dropdown-toggle" href="<%=request.getContextPath()%>/franchise/info.js" id="mylogo">&nbsp;&nbsp;&nbsp;Franchise&nbsp;&nbsp;&nbsp;</a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/franchise/info.js">&nbsp;&nbsp;&nbsp;창업안내 및 절차</a></li>
          <c:if test="${empty sessionScope.userid }">
          <li><a href="javascript:onlymember()">&nbsp;&nbsp;&nbsp;창업문의</a></li>
          </c:if>
          <c:if test="${not empty sessionScope.userid }">
          <li><a href="<%=request.getContextPath()%>/franchise/addqna.js">&nbsp;&nbsp;&nbsp;창업문의</a></li>
          </c:if>
          <c:if test="${sessionScope.grade == 'ADMIN'}">
          <li><a href="<%=request.getContextPath()%>/franchise/qna.js">&nbsp;&nbsp;&nbsp;창업 문의 관리</a></li>
          </c:if>
          <li><a href="<%=request.getContextPath()%>/franchise/faq.js">&nbsp;&nbsp;&nbsp;FAQ</a></li>
        </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</header>
<div id="menudiv"></div>


