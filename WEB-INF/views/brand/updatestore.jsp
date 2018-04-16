<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>(Admin)CafeJo - Store</title>
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
<jsp:include page="/WEB-INF/views/brand/brandheader.jsp"/>

<div class="container">
<c:if test="${sessionScope.grade == 'ADMIN' }">
  <h2 class="text-center">매장 추가</h2>
  <form class="form-horizontal" action="<%= request.getContextPath() %>/brand/updatestore.do" method="post" enctype="multipart/form-data">
   <input name="page" type="hidden" value="${param.page}">
  <input name="storenum" type="hidden" value="${storevo.storenum}">
  <table class="table">
  <caption>(*)는 필수입력입니다.</caption>
  <tr><th>*매장명</th>
  <td><input class="form-control" value="${storevo.storename }" id="storename" name="storename" type="text" placeholder="매장명을 입력하세요. ex)강남역점" required="required"></td></tr>
  <tr><th>*전화번호</th>
  <td><input class="form-control" value="${storevo.storecall }" id="storecall" name="storecall" type="tel" placeholder="매장번호를 입력하세요." maxlength="13" required="required"></td></tr>
  <tr><th>번지 주소</th>
  <td><input class="form-control" value="${storevo.oldadress }" id="oldadress" name="oldadress" type="text" placeholder="번지 주소를 입력하세요."></td></tr>
  <tr><th>*도로명 주소</th>
  <td><input class="form-control" value="${storevo.newadress }" id="newadress" name="newadress" type="text" placeholder="도로명 주소를 입력하세요." required="required"></td></tr>
  <tr><th>*영업시간</th>
  <td><input class="form-control" value="${storevo.storetime }" id="storetime" name="storetime" type="text" placeholder="영업시간를 입력하세요." required="required"></td></tr>
  <tr><th>*주차</th>
  <td><input class="form-control" value="${storevo.carok }" id="carok" name="carok" type="text" placeholder="가능/불가능" required="required"></td></tr>
  <tr><th>기타</th>
    <td><textarea class="form-control" style="resize:none" cols="50" rows="5" name="storemore" placeholder="기타를 입력하세요.">${storevo.storemore }</textarea></td></tr>
  <tr>
  		<td colspan="2">
  		<button type="submit" class="btn btn-danger col-md-offset-4 col-xs-2">수정하기</button>
  		<button type="button" class="btn col-md-offset-1 col-xs-2"
  	onclick="location.href='<%=request.getContextPath()%>/brand/store.js?page=${parma.page}'">목록</button>
  		</td>
  </tr>
  </table>
  </form>
</c:if>
<c:if test="${sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>관리자 페이지 입니다.</h1>
<button type="button" class="btn col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/brand/store.js?page=${parma.page}'">목록</button>
</c:if>  
</div>  

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
