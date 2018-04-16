<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - Event</title>
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
  .btn-float{
  
  }
  </style>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/customer/customerheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
  <h2 class="text-center">공지사항 수정</h2>
  <form class="form-horizontal" action="<%= request.getContextPath() %>/customer/updateevent.do" method="post" enctype="multipart/form-data">
  <input name="page" type="hidden" value="${param.page}">
  <input name="eventnum" type="hidden" value="${eventvo.eventnum}">
  <table class="table">
  <caption></caption>
  <tr><th>제목</th>
  <td><input class="form-control" id="etitle" name="etitle" type="text" value="${eventvo.etitle}" required="required"></td></tr>
  <tr><th>내용</th>
    <td><textarea class="form-control" style="resize:none" cols="50" rows="20" name="econtent" required="required">${eventvo.econtent}</textarea></td></tr>
  <tr><th> 선착순 인원 </th>
  <td><input class="form-control" id="eventcount" name="eventcount" type="text" placeholder="선착순인원을 입력하세요." value="${eventvo.eventcount}" required="required">명</td></tr>
  <tr>
  	<th>이미지</th>
  	<td>
  		<input class="form-control"  type="file" id="file" name="file" accept="image/*"/><p>업로드된 파일:${eventvo.filename}</p>
		<input type="hidden" id="beforefile" name="beforefile" value="${eventvo.filename}" />
  		</td>
  </tr>
  <tr>
  		<td colspan="2">
  		<button type="submit" class="btn btn-danger btn-float"> 수정하기 </button>
  		<button type="button" class="btn btn-float"
  	onclick="location.href='<%=request.getContextPath()%>/customer/eventview.js?eventnum=${eventvo.eventnum}&page=${parma.page}'"> 뒤로가기 </button>
  		<button type="button" class="btn btn-float"
  	onclick="location.href='<%=request.getContextPath()%>/customer/event.js?page=${parma.page}'"> 목록 </button>
  		</td>
  </tr>
  </table>
  </form>
</c:if>
<c:if test="${sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>관리자 페이지 입니다.</h1>
<button type="button" class="btn col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/customer/event.js?page=${parma.page}'">목록</button>
</c:if>  
</div>  

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
