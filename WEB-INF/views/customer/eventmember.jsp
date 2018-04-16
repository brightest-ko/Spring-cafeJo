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
  <div class="row">
  <div class="col-sm-7 col-lg-7">
  <h2>이벤트 참여 회원리스트</h2>
  &nbsp; 총 이벤트 참여 수: ${realTotalNum}
  </div>
<form action="<%=request.getContextPath()%>/customer/eventmember.js" method="post" enctype="multipart/form-data">
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
  <tr style="background-color: #b03838; color: white;">
    <th>번호</th><th>아이디</th><th>이름</th><th>번호</th><th>메일</th><th>참여날짜</th><th>이벤트명<th>
  </tr>
  
  <c:forEach var="eventmemberlist" items="${eventmemberlist}">
  <tr>
    <td>${eventmemberlist.emnum}</td>
    <td>${eventmemberlist.userid}</td>
    <td>${eventmemberlist.username}</td>
    <td>${eventmemberlist.hp}</td>
    <td>${eventmemberlist.mail}</td>
    <td>${eventmemberlist.eventmemberdate}</td>
    <td onclick="location.href='<%=request.getContextPath()%>/customer/eventview.js?eventnum=${eventmemberlist.eventnum}'"
    id="titlelink" colspan="2">${eventmemberlist.eventnum}&nbsp;&nbsp;${eventmemberlist.etitle}</td>
    
    <%-- <td onclick="location.href='<%=request.getContextPath()%>/customer/eventmemberview.js?emnum=${eventmemberlist.emnum}&page=${currentPage}'"
    id="titlelink" class="hidden-sm hidden-md hidden-lg">
    <div id="title1">${eventmemberlist.eventnum}</div>
    <div style="color: gray; font: 5px;">${eventmemberlist.eventmemberdate}<div></td>
    <td class="hidden-xs">${eventmemberlist.eventnum}</td> --%>
  </tr>
  </c:forEach>
  <c:if test="${empty eventmemberlist}">
  <tr><td colspan="8" class="text-center">이벤트 참여자가 없습니다.</td></tr>
  </c:if>
  <tr><td colspan="8"></td></tr>
  </table>
  <div><p class="text-center">${pageHtml}</p>
  </div>  
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
