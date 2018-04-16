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
	function deleteqna(qnum, currentPage){
		if(confirm("이 문의를 삭제하시겠습니까?")){
			location.href ="deleteqna.do?qnum="+qnum+"&page="+currentPage;
		}		
	}
	function deleteyesreply(){
		alert("답변이 있는 문의는 삭제가 불가능합니다. 고객센터로 문의해주세요.");
	}
  </script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/franchise/franchiseheader.jsp"/>

<div class="container">
  <!-- <h1 class="text-center">Franchise</h1> -->
<%--   <br>
  
  <div style="border-bottom: 2px solid lightgray;">
  <ul class="nav nav-pills nav-justified nav-danger">
    <li class="pills-active"><a href="#" id="colorwhite">공지 & 홍보자료</a></li>
    <li><a href="<%=request.getContextPath()%>/franchise/event.js" style="border-right: 1px solid lightgray;">이벤트</a></li>
  </ul>
  </div>   <br>--%>
  <h2>창업 문의</h2>
  <hr>
  
<c:if test="${qnavo.qrefid == sessionScope.userid || sessionScope.grade == 'ADMIN' }"> 
  <table class="table">
  <caption></caption>
  <tr class="active"><th colspan="6">${qnavo.qtitle}</th></tr>
  <tr><td>작성일</td><td>${qnavo.qnadate}</td>
  </tr>
  <tr>
    <td colspan="6">${qnavo.qcontent}</td>
  </tr>
  </table>
<hr>  	
<div>
	<c:if test="${qnavo.qreply =='yesreply'&&sessionScope.grade != 'ADMIN'}">
	<button type="button" class="btn btn-danger btn-float"
      onclick="deleteyesreply()">&nbsp;삭제&nbsp;</button>
    </c:if>
	<c:if test="${qnavo.qreply !='yesreply'||sessionScope.grade == 'ADMIN'}">
	<button type="button" class="btn btn-danger btn-float"
      onclick="deleteqna(${qnavo.qnum},${param.page})">&nbsp;삭제&nbsp;</button>
    </c:if>
    <button type="button" class="btn btn-danger btn-float"
	  onclick="location.href='<%=request.getContextPath()%>/franchise/updateqna.js?qnum=${qnavo.qnum}&page=${param.page}'">&nbsp;수정&nbsp;</button>
  	
  	<!-- 답변일때만 재문의 뜨게 하고싶구나 -->
  	<c:if test="${qnavo.qrefid == sessionScope.userid && sessionScope.grade != 'ADMIN'}">
  	<c:if test="${qnavo.qreply =='thisreply'}">
	<button type="button" class="btn btn-warning btn-float"
  	  onclick="location.href='<%=request.getContextPath()%>/franchise/addqna.js?page=${param.page}'">&nbsp;재 문의&nbsp;</button>
  	</c:if>
  	<button type="button" class="btn btn-float"
  	  onclick="location.href='<%=request.getContextPath()%>/member/myqna.js?page=${param.page}'">&nbsp;목록&nbsp;</button>	
  	</c:if>
  	
  	<c:if test="${sessionScope.grade == 'ADMIN'}">
  	<c:if test="${qnavo.qreply !='thisreply'}">
	<button type="button" class="btn btn-danger btn-float"
  	  onclick="location.href='<%=request.getContextPath()%>/franchise/addadminqna.js?qref=${qnavo.qnum}&page=${param.page}'">&nbsp;답 글&nbsp;</button>
  	</c:if>
  	<button type="button" class="btn btn-float"
  	  onclick="location.href='<%=request.getContextPath()%>/franchise/qna.js?page=${param.page}'">&nbsp;목록&nbsp;</button>	
	</c:if>
</div>
</c:if>

<c:if test="${qnavo.qrefid != sessionScope.userid && sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span> 비밀 글 입니다.</h1>
<br>
<button type="button" class="btn col-md-offset-4 col-md-3"
  	onclick="location.href='<%=request.getContextPath()%>/franchise/info.js'">창업 안내 및 절차로 바로가기</button>
</c:if>
</div>
  

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
