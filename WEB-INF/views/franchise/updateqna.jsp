<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - 프렌차이즈 FAQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.signfrm{
	padding:10px;
	border: 1px solid lightgray;
	border-bottom: 0px;
}
.signfrm-bottom{
	border-bottom: 1px solid lightgray;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/franchise/franchiseheader.jsp"/>

<div class="container">  
<c:if test="${qnavo.userid == sessionScope.userid || sessionScope.grade == 'ADMIN' }">
  <h2 class="text-center">프렌차이즈 창업 문의 수정</h2>
  <form class="form-horizontal" action="<%= request.getContextPath() %>/franchise/updateqna.do" method="post" enctype="multipart/form-data">
  <input id="page" name="page" type="hidden" value="${param.page}">
  <input id="qnum" name="qnum" type="hidden" value="${param.qnum}">
  <table class="table">
  <caption>회원정보를 입력해주세요.(※)는 필수입력입니다.</caption>
  <tr><th>※아이디</th>
  <td><input class="form-control" id="userid" name="userid" type="text" value="${qnavo.userid }" required="required" readonly="readonly"></td></tr>
  <tr><th>※이름</th>
  <td><input class="form-control" id="username" name="username" type="text" value="${qnavo.username }" required="required" readonly="readonly"></td></tr>
  <tr><th>※번호</th>
  <td><input class="form-control" id="hp" name="hp" type="tel" value="${qnavo.hp }" required="required"></td></tr>
  <tr><th>메일</th>
  <td><input class="form-control" id="mail" name="mail" type="email" placeholder="메일을 입력하세요." value="${qnavo.mail }"></td></tr>
  
  <tr><th>※문의 제목</th>
  <td><input class="form-control" id="qtitle" name="qtitle" type="text" value="${qnavo.qtitle }" required="required"></td></tr>
  <tr><th>※문의 내용</th>
    <td><textarea class="form-control" style="resize:none" cols="50" rows="20" name="qcontent" required="required">${qnavo.qcontent }</textarea></td></tr>
  <tr>
  		<td colspan="2">
  		<button type="submit" class="btn btn-danger col-md-offset-5 col-xs-2">문의하기</button>
  		</td>
  </tr>
  </table>
  </form>
</c:if>
<c:if test="${qnavo.userid != sessionScope.userid && sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span> 비밀 글 입니다. </h1>
<br>
<button type="button" class="btn col-md-offset-4 col-md-3"
  	onclick="location.href='<%=request.getContextPath()%>/franchise/info.js'">창업 안내 및 절차로 바로가기</button>
</c:if>  
</div>  

<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>