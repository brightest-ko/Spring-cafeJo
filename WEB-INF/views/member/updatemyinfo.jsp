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

<script type='text/javascript'>
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
	<c:if test="${not empty sessionScope.userid }">
	<h2>개인 정보 수정</h2>
	<hr>
<div class="row">	
	<div class="col-md-3">
  	<ul class="nav nav-pills nav-stacked">
   	 <li><a href="<%=request.getContextPath()%>/member/myinfo.js" id="myinfo">개인정보 관리</a></li>
   	 <li><a href="<%=request.getContextPath()%>/member/myqna.js" id="myqna">프렌차이즈 문의 내역</a></li>
   	 <li><a href="<%=request.getContextPath()%>/member/myevent.js" id="myinfo">나의 이벤트 내역</a></li>
 	</ul>
	</div>
	<div class="col-md-9">
		 <form class="form-horizontal" action="<%= request.getContextPath() %>/member/updatemyinfo.do" method="post" enctype="multipart/form-data"
  name="mainForm" id="mainForm">
		<div class="row">
    	<div class="col-md-offset-2 col-md-8">
    	    <input id="userid" name="userid" type="hidden" value="${membervo.userid }">
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
    	</div>
    	</div>
		<div class="row">
    	<div class="col-md-offset-5 col-md-4">
    	<button type="submit" class="btn btn-danger"> 정보수정 </button>
    	</div>
    	</div>
    	</form>
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
