<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - 내 정보 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
#myinfo{background-color: #990000; color: white; border: 1px solid lightgray;}
#myqna{color: black; border: 1px solid lightgray;}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
	<c:if test="${not empty sessionScope.userid }">
	<h2>개인 정보 관리</h2>
	<hr>
<div class="row">	
	<div class="col-md-3">
  	<ul class="nav nav-pills nav-stacked">
   	 <li><a href="<%=request.getContextPath()%>/member/myinfo.js" id="myinfo">개인정보 관리</a></li>
   	 <li><a href="<%=request.getContextPath()%>/member/myqna.js" id="myqna">프렌차이즈 문의 내역</a></li>
   	 <li><a href="<%=request.getContextPath()%>/member/myevent.js" id="myqna">나의 이벤트 내역</a></li>
 	</ul>
	</div>
	<div class="col-md-9">
		<div class="row">
    	<div class="col-md-offset-2 col-md-8">
    	    <table class="table">
  				<tr><th>ID</th><td>${membervo.userid }</td></tr>
  				<tr><th>이름</th><td>${membervo.username }</td></tr>
				<tr><th>성별</th><td>${membervo.gender }</td></tr>
				<tr><th>생년월일</th><td>${membervo.birth }</td></tr>
				<tr><th>핸드폰번호</th><td>${membervo.hp }</td></tr>
				<tr><th>메일</th><td>${membervo.mail }</td></tr>
				<tr><td colspan="3"></td></tr>
			</table>
    	</div>
    	</div>
    	<div align="center">
    	<button type="button" class="btn btn-danger" 
  	onclick="location.href='<%=request.getContextPath()%>/member/deletemyinfo.js'"> 탈퇴하기 </button>
    	<button type="button" class="btn btn-danger" 
  	onclick="location.href='<%=request.getContextPath()%>/member/myinfo2.js'"> 정보수정 </button>
  	</div>
	</div>
</div>
</c:if>
</div>
<div class="container">
<c:if test="${empty sessionScope.userid }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>회원전용 페이지 입니다. 로그인 해주세요.</h1>
<button type="button" class="btn col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/member/login.js'"> 로그인 </button>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
