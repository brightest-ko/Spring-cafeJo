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
</script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
<!--   <h1 class="text-center">FRANCHISE</h1> -->
  <div class="row">
  <div class="col-xs-6 col-sm-7 col-lg-7">
  <h2>회원 정보 관리</h2>
  &nbsp; 총 회원 수: ${realTotalNum}
  </div>
<form action="<%=request.getContextPath()%>/member/memberinfo.js">
	<div class="col-xs-6 col-sm-5 col-lg-5">
		<br>
        <div class="input-group my-group"> 
            <select id="lunch" class="selectpicker form-control form-control1" data-live-search="true" name="type">
                <option value="userid"> 아이디 </option>
                <option value="username"> 이름 </option>
                <option value="hp"> 휴대폰 뒷 번호 </option>
                <option value="grade"> 등급 </option>
                <option value="cancelmember">회원여부(회원:s/탈퇴:c)</option>
                <option value="hpget">연락처수신(y/n)</option>
                <option value="mailget">메일수신(y/n)</option>
            </select>
            <input type="search" class="form-control form-control2" name="keyword" placeholder="검색어를 입력해주세요."/> 
            <span class="input-group-btn">
            <button class="btn btn-default" type="submit">
        		<i class="glyphicon glyphicon-search"></i>
      		</button>
            </span>
        </div>
    </div>
</form>
  </div>

  <hr>
  <table class="table">
  <caption></caption>
  <tr style="background-color: #b03838; color: white;">
    <th>아이디</th><th>이름</th><th>성별</th><th>연락처</th><th>메일</th><th>가입일</th><th>등급</th><th>회원여부</th>
  </tr>
  
  <c:forEach var="memberlist" items="${memberlist}">
  <tr onclick="location.href='<%=request.getContextPath()%>/member/memberview.js?userid=${memberlist.userid}&page=${currentPage}'"
    id="titlelink">
    <td>${memberlist.userid}</td>
    <td>${memberlist.username}</td>
	<td>${memberlist.gender}</td>
	<td>${memberlist.hp}&nbsp;
	<c:if test="${memberlist.hpget=='yeshpget'}">(y)</c:if>
	<c:if test="${memberlist.hpget=='nohpget'}">(n)</c:if>
	</td>
	<td>${memberlist.mail}<c:if test="${memberlist.mail!=null}">&nbsp;
	<c:if test="${memberlist.mailget=='yesmailget'}">(y)</c:if>
	<c:if test="${memberlist.mailget=='nomailget'}">(n)</c:if>
	</c:if> </td>
	<td>${memberlist.joindate}</td>
	<td>${memberlist.grade}</td>
	<td>${memberlist.cancelmember}</td>
  </tr>
  </c:forEach>
  <c:if test="${empty memberlist}">
  <tr><td colspan="4" class="text-center">회원이 없습니다.</td></tr>
  </c:if>
  </table>
  <div><p class="text-center">${pageHtml}</p> 	
  <button type="button" class="btn btn-danger col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/member/signup.js?page=${currentPage}'"
  	style="float: right;">회원추가</button>
  </div>  
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
