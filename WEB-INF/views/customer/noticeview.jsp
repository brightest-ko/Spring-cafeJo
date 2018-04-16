<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - Notice</title>
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
  <script type="text/javascript">
	function deletenotice(nnum, currentPage){
		if(confirm("이 공지를 삭제하시겠습니까?")){
			location.href ="deletenotice.do?nnum="+nnum+"&page="+currentPage;
		}		
	}
  </script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/customer/customerheader.jsp"/>

<div class="container">
  <h1 class="text-center">Cusomer</h1>
  <br>
  
  <div style="border-bottom: 2px solid lightgray;">
  <ul class="nav nav-pills nav-justified nav-danger">
    <li class="pills-active"><a href="#" id="colorwhite">공지 & 홍보자료</a></li>
    <li><a href="<%=request.getContextPath()%>/customer/event.js" style="border-right: 1px solid lightgray;">이벤트</a></li>
  </ul>
  </div>
  <br>
  <h2>공지 & 홍보자료</h2>
  <hr>

  <table class="table">
  <caption></caption>
  <tr class="active"><th colspan="6">${noticevo.ntitle}</th></tr>
  <tr><td>작성일</td><td>${noticevo.noticedate}</td>
  <td>조회수</td><td>${noticevo.nhit}</td>
  </tr>
  <tr>
    <td colspan="6">${noticevo.ncontent}</td>
  </tr>
  </table>
<hr>  	
<div>
<c:if test="${sessionScope.grade == 'ADMIN' }">
	<button type="button" class="btn btn-danger btn-float"
      onclick="deletenotice(${noticevo.nnum},${param.page})">&nbsp;삭제&nbsp;</button>
    <!-- 삭제시 정말 삭제하겠니? 한번 더 물어보기 -->
	<button type="button" class="btn btn-danger btn-float"
	  onclick="location.href='<%=request.getContextPath()%>/customer/updatenotice.js?nnum=${noticevo.nnum}&page=${param.page}'">&nbsp;수정&nbsp;</button>
</c:if>  
<button type="button" class="btn btn-float"
  	onclick="location.href='<%=request.getContextPath()%>/customer/notice.js?page=${param.page}'">&nbsp;목록&nbsp;</button>
</div>
</div>  

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
