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
  <script type="text/javascript">
	function deleteevent(eventnum, currentPage){
		if(confirm("이 이벤트를 삭제하시겠습니까?")){
			location.href ="deleteevent.do?eventnum="+eventnum+"&page="+currentPage;
		}		
	}
	
window.onload = function() {	
	$("#eventbutton").click(function(){
		$.ajax({
			type: 'post' , 
			url: "../customer/event.do" , 
			data:{
    			"eventnum":$('#eventnum').val()
    		}, 
			success: function(data){
    			if($.trim(data)=='success'){
    				alert("참여 완료");
    			}else if($.trim(data)=='fail'){
    				alert("참여 실패");
    			}else if($.trim(data)=='noid'){
    				alert("회원만 이벤트에 참여가 가능합니다.로그인을 해주세요.");
    			}else if($.trim(data)=='already'){
    				alert("이미 참여하신 이벤트 입니다.");
    			}else if($.trim(data)=='finishevent'){
    				alert("선착순이 마감되었습니다.");
    			}
    		}
		});	
	})
}
function onlymember(){
	if(confirm("회원전용입니다. 로그인하시겠습니까?")){
		location.href ="/heeJ/member/login.js";
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
    <li><a href="<%=request.getContextPath()%>/customer/notice.js">공지 & 홍보자료</a></li>
    <li class="pills-active"><a href="<%=request.getContextPath()%>/customer/event.js" id="colorwhite" style="border-right: 1px solid lightgray;">이벤트</a></li>
  </ul>
  </div>
  <br>
  <h2> 이벤트 </h2>
  <hr>

  <table class="table">
  <caption></caption>
  <tr class="active"><th colspan="6">${eventvo.etitle}</th></tr>
  <tr><td>작성일</td><td>${eventvo.eventdate}</td>
  <td>조회수</td><td>${eventvo.ehit}</td>
  </tr>
  <tr>
    <td colspan="6">
    <h3>${eventvo.etitle}
    <c:if test="${not empty sessionScope.userid }">
    <button type="button" class="btn btn-danger" id="eventbutton">
  	&nbsp;&nbsp;참여하기&nbsp;&nbsp;</button>
  	</c:if>
    <c:if test="${empty sessionScope.userid }">
    <button type="button" class="btn btn-danger" onclick="onlymember()">
  	&nbsp;&nbsp;참여하기&nbsp;&nbsp;</button>
  	</c:if>
  	</h3>
    <input type="hidden" id="eventnum" value="${eventvo.eventnum}">
    <br><br>
    ${eventvo.econtent}
    <img class="img-responsive" src='<%=request.getContextPath() + "/resources/upload/event"%>/${eventvo.filename}'
  	alt="${eventvo.filename} 이미지" style="width: 80%;">
  <br><br>
    </td>
  </tr>
  </table>
<hr>  	
<div>
<c:if test="${sessionScope.grade == 'ADMIN' }">
	<button type="button" class="btn btn-danger btn-float"
      onclick="deleteevent(${eventvo.eventnum},${param.page})">&nbsp;삭제&nbsp;</button>
    <!-- 삭제시 정말 삭제하겠니? 한번 더 물어보기 -->
	<button type="button" class="btn btn-danger btn-float"
	  onclick="location.href='<%=request.getContextPath()%>/customer/updateevent.js?eventnum=${eventvo.eventnum}&page=${param.page}'">&nbsp;수정&nbsp;</button>
</c:if>  
<button type="button" class="btn btn-float"
  	onclick="location.href='<%=request.getContextPath()%>/customer/event.js?page=${param.page}'">&nbsp;목록&nbsp;</button>
</div>
</div>  

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
