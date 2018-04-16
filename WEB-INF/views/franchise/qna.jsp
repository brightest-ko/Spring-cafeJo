<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>(Admin)CafeJo - 프렌차지즈 문의 관리</title>
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
<jsp:include page="/WEB-INF/views/franchise/franchiseheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
  <!-- <h1 class="text-center">FRANCHISE</h1> -->
<%--  
  <br>
  <div style="border-bottom: 2px solid lightgray;">
  <ul class="nav nav-pills nav-justified nav-danger">
    <li class="pills-active"><a href="#" id="colorwhite">공지 & 홍보자료</a></li>
    <li><a href="<%=request.getContextPath()%>/franchise/event.js" style="border-right: 1px solid lightgray;">이벤트</a></li>
  </ul>
  </div>   <br>--%>
  <div class="row">
  <div class="col-sm-7 col-lg-7">
  <h2>창업 문의 관리</h2>
  &nbsp; 총 문의 글 수: ${realTotalNum}
  </div>
<form action="<%=request.getContextPath()%>/franchise/qna.js">
	<div class="col-sm-5 col-lg-5">
		<br>
        <div class="input-group my-group"> 
            <select id="lunch" class="selectpicker form-control form-control1" data-live-search="true" name="type">
                <option value="userid">아이디</option>
                <option value="username">이름</option>
                <option value="hp">휴대폰 뒷 번호</option>
                <option value="qtitle">제목</option>
                <option value="qcontent">내용</option>
                <option value="qreply">답변여부(y/n)</option>
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
  <tr style="background-color: #b03838; color: white;" class="hidden-xs">
    <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>문의 현황</th>
  </tr>
  <tr style="background-color: #b03838; color: white;" class="hidden-sm hidden-md hidden-lg">
    <th>번호</th><th>제목</th><th>문의 현황</th>
  </tr>
  
  <c:forEach var="qnalist" items="${qnalist}">
  <tr>
    <td>${qnalist.qnum}</td>
    <td onclick="location.href='<%=request.getContextPath()%>/franchise/qnaview.js?qnum=${qnalist.qnum}&page=${currentPage}'"
    id="titlelink" class="hidden-xs">
  	<c:if test="${qnalist.qreply == 'thisreply'}">    
    &nbsp;&nbsp;└&nbsp;&nbsp;${qnalist.qtitle}
	</c:if>
  	<c:if test="${qnalist.qreply != 'thisreply'}">
    ${qnalist.qtitle}
    </c:if>
    </td>
    
    
    <td onclick="location.href='<%=request.getContextPath()%>/franchise/qnaview.js?qnum=${qnalist.qnum}&page=${currentPage}'"
    id="titlelink" class="hidden-sm hidden-md hidden-lg">
  	<c:if test="${qnalist.qreply == 'thisreply'}">    
    <div id="title1">&nbsp;&nbsp;└&nbsp;&nbsp;${qnalist.qtitle}</div>
	</c:if>
  	<c:if test="${qnalist.qreply != 'thisreply'}">
    <div id="title1">${qnalist.qtitle}</div><div>-${qnalist.userid}<div>
    </c:if>
    <div style="color: gray; font: 5px;">${qnalist.qnadate}</div>
    </td>
    
    <td class="hidden-xs">${qnalist.userid}</td>
	<td class="hidden-xs">${qnalist.qnadate}</td>
  	<c:if test="${qnalist.qreply == 'noreply'}">    
    <td style="color: #b03838;"> 접수 중 </td>
    </c:if>
  	<c:if test="${qnalist.qreply == 'yesreply'}">    
    <td style="color: black;"> 답변 완료 </td>
	</c:if>
  	<c:if test="${qnalist.qreply == 'thisreply'}">    
    <td style="color: black;"> </td>
	</c:if>
  </tr>
  </c:forEach>
  <c:if test="${empty qnalist}">
  <tr><td colspan="4" class="text-center">창업 문의가 없습니다.</td></tr>
  </c:if>
  </table>
  <div><p class="text-center">${pageHtml}</p>
  </div>  
</c:if>
<c:if test="${sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>관리자 페이지 입니다.</h1>
<br>
<button type="button" class="btn col-md-offset-4 col-md-3"
  	onclick="location.href='<%=request.getContextPath()%>/franchise/info.js'"> 창업안내 및 절차 </button>
</c:if>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
