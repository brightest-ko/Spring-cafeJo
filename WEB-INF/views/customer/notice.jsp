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
#titlelink:hover{
	cursor: pointer;
	color: red;
}
.my-group .form-control1{
    width:30%;
}
.my-group .form-control2{
    width:70%;
}
#title1{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:200px;
display: inline-block;
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
<jsp:include page="/WEB-INF/views/customer/customerheader.jsp"/>

<div class="container">
<!--   <h1 class="text-center">CUSTOMER</h1> -->
  
  <div style="border-bottom: 2px solid lightgray;">
  <ul class="nav nav-pills nav-justified nav-danger">
    <li class="pills-active"><a href="#" id="colorwhite">공지 & 홍보자료</a></li>
    <li><a href="<%=request.getContextPath()%>/customer/event.js" style="border-right: 1px solid lightgray;">이벤트</a></li>
  </ul>
  </div>
  <br>
  <div class="row">
  <div class="col-sm-7 col-lg-7">
  <h2>공지 & 홍보자료</h2>
  &nbsp; 총 공지 글 수: ${realTotalNum}
  </div>
<form action="<%=request.getContextPath()%>/customer/notice.js">
	<div class="col-sm-5 col-lg-5">
		<br>
        <div class="input-group my-group"> 
            <select id="lunch" class="selectpicker form-control form-control1" data-live-search="true" name="type">
                <option value="ntitle">제목</option>
                <option value="ncontent">내용</option>
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
  <tr class="active">
    <th>번호</th><th class="hidden-xs">제목</th><th class="hidden-xs">작성일</th>
    <th class="hidden-sm hidden-md hidden-lg">제목(작성일)</th>
    <th class="hidden-xs">조회</th>
  </tr>
  
  <c:forEach var="noticelist" items="${noticelist}">
  <tr>
    <td>${noticelist.nnum}</td>
    <td onclick="location.href='<%=request.getContextPath()%>/customer/noticeview.js?nnum=${noticelist.nnum}&page=${currentPage}'"
    id="titlelink" class="hidden-xs">${noticelist.ntitle}</td>
    <td class="hidden-xs">${noticelist.noticedate}</td>
    <td onclick="location.href='<%=request.getContextPath()%>/customer/noticeview.js?nnum=${noticelist.nnum}&page=${currentPage}'"
    id="titlelink" class="hidden-sm hidden-md hidden-lg">
    <div id="title1">${noticelist.ntitle}</div>
    <div style="color: gray; font: 5px;">${noticelist.noticedate}<div></td>
    <td class="hidden-xs">${noticelist.nhit}</td>
  </tr>
  </c:forEach>
  <c:if test="${empty noticelist}">
  <tr><td colspan="4" class="text-center">공지사항이 없습니다.</td></tr>
  </c:if>
  <tr><td colspan="4"></td></tr>
  </table>
  <div><p class="text-center">${pageHtml}</p>
  <c:if test="${sessionScope.grade == 'ADMIN' }">  	
  <button type="button" class="btn btn-danger"
  	onclick="location.href='<%=request.getContextPath()%>/customer/addnotice.js?page=${currentPage}'"
  	style="float: right;">공지추가</button>
  </c:if>
  </div>  
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
