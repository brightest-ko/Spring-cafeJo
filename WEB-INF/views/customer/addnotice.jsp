<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>(Admin)CafeJo - Notice</title>
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
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/customer/customerheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
  <h2 class="text-center">공지사항 추가</h2>
  <form class="form-horizontal" action="<%= request.getContextPath() %>/customer/addnotice.do" method="post" enctype="multipart/form-data">
  <table class="table">
  <caption>모든 사항은 필수입력입니다.</caption>
  <tr><th>제목</th>
  <td><input class="form-control" id="ntitle" name="ntitle" type="text" placeholder="제목을 입력하세요." required="required"></td></tr>
  <tr><th>내용</th>
    <td><textarea class="form-control" style="resize:none" cols="50" rows="20" name="ncontent" placeholder="내용을 입력하세요." required="required"></textarea></td></tr>
  <tr>
  		<td colspan="2">
  		<button type="submit" class="btn btn-danger col-md-offset-4 col-xs-2">추가하기</button>
  		<button type="button" class="btn col-md-offset-1 col-xs-2"
  	onclick="location.href='<%=request.getContextPath()%>/customer/notice.js?page=${parma.page}'">목록</button>
  		</td>
  </tr>
  </table>
  </form>
</c:if>
<c:if test="${sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>관리자 페이지 입니다.</h1>
<button type="button" class="btn col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/customer/notice.js?page=${parma.page}'">목록</button>
</c:if>  
</div>  

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
