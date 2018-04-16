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
#titlelink:hover{
	cursor: pointer;
	color: red;
}
</style>
<script>
if ( $.browser.webkit ) {
    $(".my-group-button").css("height","+=1px");
}

function reallymemberdelete(userid,page) {
	if(confirm("정말 회원정보를 삭제하시겠습니까? 삭제시 회원복구가 불가능합니다.")){
		location.href =<%=request.getContextPath()%>+"/member/deleteinfo.do?userid="+userid+"&page="+page;
	}
}
</script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
<br>
<table class="table">
  	<tr><th>ID</th><td>${membervo.userid }</td></tr>
  	<tr><th>이름</th><td>${membervo.username }</td></tr>
	<tr><th>성별</th><td>${membervo.gender }</td></tr>
	<tr><th>생년월일</th><td>${membervo.birth }</td></tr>
	<tr><th>연락처</th><td>${membervo.hp }&nbsp;(${membervo.hpget })</td></tr>
	<tr><th>메일</th><td>${membervo.mail }
	<c:if test='${membervo.mail !=null}'>(${membervo.mailget })</c:if></td></tr>
	<tr><th>회원 가입 날짜</th><td>${membervo.joindate}</td></tr>
	<tr><th>회원여부</th><td>${membervo.cancelmember }</td></tr>
	<tr onclick="location.href='<%=request.getContextPath()%>/franchise/qna.js?type=userid&keyword=${membervo.userid }'" id="titlelink"><th>창업문의</th><td>
	${qnacount}건</td></tr>
	<tr><td colspan="3"></td></tr>
</table>
    	<c:if test="${membervo.cancelmember == 'signup' }">
    	<button type="button" class="btn btn-danger"
  	onclick="location.href='<%=request.getContextPath()%>/member/memberupdate.js?userid=${membervo.userid}&page=${param.page}'"> 정보수정 </button>
    	<button type="button" class="btn btn-danger"
  	onclick="location.href='<%=request.getContextPath()%>/member/deletemember.do?userid=${membervo.userid}&page=${param.page}'"> 탈퇴하기 </button>
    	</c:if>
    	<c:if test="${membervo.cancelmember != 'signup' }">
    	<button type="button" class="btn btn-danger"
  	onclick="location.href='<%=request.getContextPath()%>/member/addmemberagain.do?userid=${membervo.userid}&page=${param.page}'"> 재가입하기 </button>
    	</c:if>
    
    	<button type="button" class="btn btn-danger"
  	onclick="reallymemberdelete(${membervo.userid},${param.page})"> 영구삭제 </button>
    	<button type="button" class="btn"
  	onclick="location.href='<%=request.getContextPath()%>/member/memberinfo.js?page=${param.page}'"> 회원목록 </button>
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
