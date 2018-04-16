<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - 회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.signfrm{
	padding:10px;
	border: 1px solid lightgray;
}
</style>

</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
  <h2 class="text-center">ID 찾기</h2>
  <div class="col-md-6 col-md-offset-3">
    <div class="signfrm text-center">
    	<img src="<%= request.getContextPath() %>/resources/img/join.png" alt="회원가입 이미지">
		<p class="text-center">회원님의 명의로 가입된 아이디는 아래와 같습니다.</p>
		<hr>
		<c:if test="${not empty userid}">
		${userid}
		<br>
		<br>
		<button class="btn btn-danger"
		onclick="location.href='<%= request.getContextPath() %>/member/login.js?rememberid=${userid}'">로그인</button>
		<button class="btn btn-danger"
		onclick="location.href='<%= request.getContextPath() %>/member/findpw.js?userid=${userid}'">비밀번호 찾기</button>
		</c:if>
		<c:if test="${empty userid}">
		가입된 아이디가 없습니다. <br>회원가입 하시겠습니까?
		<br>
		<br>
		<button class="btn btn-danger"
		onclick="location.href='<%= request.getContextPath() %>/member/signup.js'">회원가입</button>
		</c:if>
    </div>
  </div>
</div>

  <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
