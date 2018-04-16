<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>CafeJo - 로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">

@media (min-width: 979px) {
  	.loginpage{
  	border-left: px solid lightgray;
  	/* padding-bottom: 10%; */
  	}
}
@media (max-width: 978px) {
  	.loginpage3{
  	border-top: 1px solid lightgray;
  	padding-top: 5px;
  	}
}  	
  	.welcome{
  	font: 15px;
  	}
  	.loginpage2{
  	border: 1px solid lightgray;
  	padding:20px;
  	}
  </style>
  
<c:if test="${param.result<0 }">
<script type="text/javascript">
alert("아이디를 다시 확인해주세요.");
</script>
</c:if>
<c:if test="${param.result==2 }">
<script type="text/javascript">
alert("비밀번호를 다시 확인해주세요.");
</script>
</c:if>
<script>
/* $(document).ready(function(){  
    $("#loginform").submit(function(e) {
       length = $("#username").val().length;
       if((length > 2 && length < 5)) {
           $("#output").html("correct, logging in");
       } else {
           $("#output").html("incorrect, must have 3 or 4 chars");
       }
       return (length > 2 && length < 5);
    });
}); */
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">  
  <h1 class="text-center">로그인</h1>
  <br>
  <div class="row loginpage2">
  
  <div class="col-md-6">  
  <p class="text-center">CafeJo에 오신걸 환영합니다.</p>
  <br>
  <form action="<%= request.getContextPath() %>/member/login.do" method="post" enctype="multipart/form-data" id="loginform">
   <div class="form-horizontal col-sm-9">
    <div class="form-group">
        <input type="text" class="form-control" id="userid" name="userid"
        placeholder="아이디를 입력하세요." value="${param.rememberid}" required="required">
    </div>
    <div class="form-group">
        <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요." required="required">
    </div>
  </div>
  <div class="col-sm-3">
    <div class="form-group">        
      <button type="submit" class="btn btn-danger btn-lg">로그인</button>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="rememberid" value="yesremember" checked="checked"> 아이디 저장 </label>
    </div>
  </div>

  </form>
  </div>
  
  <div class="col-md-6 loginpage">
    <div class="row loginpage3">
    <div class="col-md-3">
      <img src="<%= request.getContextPath() %>/resources/img/join.png" alt="회원가입 이미지">
    </div>
    <div class="col-md-1">
    </div>
    <div class="col-md-8">
      <p style="font: 20px bold;">아직 CafeJo 회원이 아니신가요?</p>
      <div> 지금 가입하세요.<br><br></div>
      <button type="button" class="btn btn-warning"
      onclick="location.href='<%= request.getContextPath() %>/member/signup.js'">회원가입</button>
    </div>
    </div>
    <br>    
    <div class="row loginpage3">
    <div class="col-md-3">
      <img src="<%= request.getContextPath() %>/resources/img/find.jpg" alt="좌물쇠 이미지" title="아이디/비밀번호 찾기 이미지">
    </div>
    <div class="col-md-1">
    </div>
    <div class="col-md-8">
      <p style="font: 20px bold;">아이디/비밀번호를 잊으셨나요?</p>
      <div> 본인 인증 후 회원님의 아이디/비밀번호를 찾아 드립니다.<br><br></div>
      <button type="button" class="btn btn-warning"
      onclick="location.href='<%= request.getContextPath() %>/member/findid.js'">아이디 찾기</button>&nbsp;
      <button type="button" class="btn btn-warning"
      onclick="location.href='<%= request.getContextPath() %>/member/findpw.js'">비밀번호 찾기</button>
    </div>
    </div>
  </div>
  
  </div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
