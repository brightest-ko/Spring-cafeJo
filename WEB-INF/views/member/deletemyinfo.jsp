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
 	</ul>
	</div>
	<div class="col-md-9">
		<div class="row">
	    <div class="text-center">
    		<img src="<%= request.getContextPath() %>/resources/img/find.jpg" alt="회원가입 이미지">
			<p class="text-center"> 정말 탈퇴하시겠습니까? </p>
			<p class="text-center"> 회원 탈퇴 이후 한달간 같은 아이디 사용이 불가합니다. </p>
    	</div>
		<div class="row">
    	<div class="col-md-offset-3 col-md-6">
    	    <form class="form-horizontal" action="<%= request.getContextPath() %>/member/deletemyinfo.do" method="post" enctype="multipart/form-data">
  			<div class="input-group">
      			<input class="form-control" id="passwd" name="passwd" type="password" placeholder="탈퇴를 원하시면 비밀번호를 입력하세요." required="required">
      			<div class="input-group-btn">
        		<button class="btn btn-danger" type="submit"> 탈퇴 </button>
     			</div>
    		</div>
    		</form>
    	</div>
    	</div>
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
