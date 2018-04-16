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
#myinfo{color: black; border: 1px solid lightgray;}
#myqna{background-color: #990000; color: white; border: 1px solid lightgray;}
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

</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
	<c:if test="${not empty sessionScope.userid }">
	<h2>개인 정보 관리</h2>
	<hr>
<div class="row">	
	<div class="col-md-3">
  	<ul class="nav nav-pills nav-stacked">
   	 <li><a href="<%=request.getContextPath()%>/member/myinfo.js" id="myinfo">개인정보 관리</a></li>
   	 <li><a href="<%=request.getContextPath()%>/member/myqna.js" id="myinfo">프렌차이즈 문의 내역</a></li>
   	 <li><a href="<%=request.getContextPath()%>/member/myevent.js" id="myqna">나의 이벤트 내역</a></li>
 	</ul>
	</div>
	<div class="col-md-9">
	&nbsp; 총 이벤트 참여 수: ${realTotalNum}
  
  <table class="table">
  <caption></caption>
  <tr style="background-color: #b03838; color: white;" class="hidden-xs">
    <th>이벤트명<th><th>참여날짜</th>
  </tr>
  <tr style="background-color: #b03838; color: white;" class="hidden-sm hidden-md hidden-lg">
    <th>제목</th><th>문의 현황</th>
  </tr>

  
  <c:forEach var="myeventlist" items="${myeventlist}">
  <tr>
    <td onclick="location.href='<%=request.getContextPath()%>/customer/eventview.js?eventnum=${myeventlist.eventnum}'"
    id="titlelink" colspan="2">${myeventlist.eventnum}&nbsp;&nbsp;${myeventlist.etitle}</td>
 	<td>${myeventlist.eventmemberdate}</td>
 	
    <%-- <td onclick="location.href='<%=request.getContextPath()%>/franchise/qnaview.js?qnum=${myeventlist.qnum}&page=${currentPage}'"
    id="titlelink" class="hidden-xs">
  	<c:if test="${myeventlist.qreply == 'thisreply'}">    
    &nbsp;&nbsp;└&nbsp;&nbsp;${myeventlist.qtitle}
	</c:if>
  	<c:if test="${myeventlist.qreply != 'thisreply'}">
    ${myeventlist.qtitle}
    </c:if></td>
    <td class="hidden-xs">${myeventlist.qnadate}</td>
    
    <td onclick="location.href='<%=request.getContextPath()%>/franchise/qnaview.js?qnum=${myeventlist.qnum}&page=${currentPage}'"
    id="titlelink" class="hidden-sm hidden-md hidden-lg">
  	<c:if test="${myeventlist.qreply == 'thisreply'}">    
    <div id="title1">&nbsp;&nbsp;└&nbsp;&nbsp;${myeventlist.qtitle}</div>
	</c:if>
  	<c:if test="${myeventlist.qreply != 'thisreply'}">
    <div id="title1">${myeventlist.qtitle}</div>
    </c:if>
    <div style="color: gray; font: 5px;">${myeventlist.qnadate}</div></td>
  	
  	<c:if test="${myeventlist.qreply == 'noreply'}">    
    <td style="color: #b03838;"> 접수 중 </td>
    </c:if>
  	<c:if test="${myeventlist.qreply == 'yesreply'}">    
    <td style="color: black;"> 답변 완료 </td>
	</c:if>
  	<c:if test="${myeventlist.qreply == 'thisreply'}">    
    <td style="color: black;"> </td> 
	</c:if>--%>
  </tr>
  </c:forEach>
  <c:if test="${empty myeventlist}">
  <tr><td colspan="4" class="text-center">나의 창업 문의 내역이 없습니다.</td></tr>
  </c:if>
  </table>
  <div><p class="text-center">${pageHtml}</p>
  </div>
  	<div class="row">
		<div class="col-xs-6 col-sm-7 col-lg-7">
		</div>
		<form action="<%=request.getContextPath()%>/member/myqna.js" method="post" enctype="multipart/form-data">
			<div class="col-xs-6 col-sm-5 col-lg-5">
			<br>
        	<div class="input-group my-group"> 
            <select id="lunch" class="selectpicker form-control form-control1" data-live-search="true" name="type">
                <option value="etitle">제목</option>
                <option value="econtent">내용</option>
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
