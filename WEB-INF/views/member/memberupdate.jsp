<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>(Admin)CafeJo - 회원 정보 관리</title>
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
  
<style>
.my-group .form-control1{
    width:30%;
}
.my-group .form-control2{
    width:70%;
}
#titlelink:hover{
	cursor: pointer;
	color: red;
}
</style>
<script>
if ( $.browser.webkit ) {
    $(".my-group-button").css("height","+=1px");
}
function passwdcheck() {
	var passwd = document.getElementById("passwd").value;
	var passcheck = document.getElementById("passwd2").value;
	if(passcheck==""){
		document.getElementById("passchecktext").innerHTML="";
	}
	else if(passwd != passcheck){
		document.getElementById("passchecktext").innerHTML=
			"<font color=red size=3px> 비밀번호가 다릅니다.</font>";
	}
	else{
		document.getElementById("passchecktext").innerHTML=
			"<font color=green size=3px> 비밀번호가 일치합니다.</font>";
	}
}
</script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
<form class="form-horizontal" action="<%= request.getContextPath() %>/member/memberupdate.do" method="post" enctype="multipart/form-data"
  name="mainForm" id="mainForm">
		
<br>
    <input id="userid" name="userid" type="hidden" value="${membervo.userid }">
    <input id="page" name="page" type="hidden" value="${param.page }">
    	    <table class="table">
    	    <caption>(※)는 필수입력입니다.</caption>
  				<tr><th>ID</th>
  				<td>${membervo.userid }</td></tr>
  				<tr><th>이름</th>
				<td>${membervo.username }</td></tr>
  				<tr><th>성별</th><td>${membervo.gender }</td></tr>
				<tr><th>생년월일</th><td>${membervo.birth }</td></tr>
				<tr><th>※비밀번호</th>
				<td><input class="form-control" id="passwd" name="passwd" type="password" placeholder="비밀번호를 입력하세요." required="required"></td></tr>
  				<tr><th>※비밀번호 확인</th>
				<td><input class="form-control" id="passwd2" name="passwd2" onkeyup="passwdcheck()"
         type="password" placeholder="비밀번호 확인을 위해 입력하세요." required="required">
				<div id="passchecktext"></div></td></tr>
  				<tr><th>※핸드폰번호</th><td><input class="form-control" id="hp" name="hp" type="tel" value="${membervo.hp }" required="required" maxlength="11">
				<div> -를 빼고 입력해주세요. </div>
      			<div class="row">
      				<div class="radio col-xs-6">
  					<label><input type="radio" name="hpget" checked="checked" value="yeshpget">수신동의</label>
	 	 			</div>
	  				<div class="radio col-xs-6">
  					<label><input type="radio" name="hpget" value="nohpget">수신거부</label>
	  				</div>
	  			</div>
				</td></tr>
				<tr><th>메일</th><td>
				<c:if test="${not empty membervo.mail }">
				<input class="form-control" id="mail" name="mail" type="email" value="${membervo.mail }">
				</c:if>
				<c:if test="${empty membervo.mail }">
				<input class="form-control" id="mail" name="mail" type="email" placeholder="메일을 입력하세요.">
				</c:if>
				<br>
      			<div>이벤트, 신규 매장 소식 등 프로모션 알림 정보를 수신</div>
      			<div class="row">
      				<div class="radio col-xs-6">
  					<label><input type="radio" name="mailget" checked="checked" value="yesmailget">수신동의</label>
	 	 			</div>
	  				<div class="radio col-xs-6">
  					<label><input type="radio" name="mailget" value="nomailget">수신거부</label>
	  				</div>
	  			</div>
				</td></tr>
				<tr><td colspan="3"></td></tr>
			</table>
    	<button type="submit" class="btn btn-danger"> 정보수정 </button>
</form>
</c:if>
<c:if test="${sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>관리자 페이지 입니다. 로그인 해주세요.</h1>
<br>
<button type="button" class="btn col-md-offset-4 col-md-3"
  	onclick="location.href='<%=request.getContextPath()%>/member/login.js'"> 로그인 </button>
</c:if>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
