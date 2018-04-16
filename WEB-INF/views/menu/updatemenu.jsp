<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>(Admin)CafeJo - 메뉴수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.signfrm{
	padding:10px;
	border: 1px solid lightgray;
	border-bottom: 0px;
}
.signfrm-bottom{
	border-bottom: 1px solid lightgray;
}
	</style>
	<script type="text/javascript">
	function addmenuFormCheck() {
		if($("#kind").val() == null || $("#kind").val() == ""){
			alert("종류을 입력해 주세요!");
			$("#kind").focus();
			return false;
		}
		if($("#menuname").val() == null || $("#menuname").val() == ""){
			alert("상품명을 입력해 주세요!");
			$("#menuname").focus();
			return false;
		}
		if($("#description").val() == null || $("#description").val() == ""){
			alert("상품 설명을 입력해 주세요!");
			$("#description").focus();
			return false;
		}
		if($("#calory").val() == null || $("#calory").val() == ""){
			alert("칼로리를 입력해 주세요!");
			$("#calory").focus();
			return false;
		}
		if($("#saccharide").val() == null || $("#saccharide").val() == ""){
			alert("당 양을 입력해 주세요!");
			$("#saccharide").focus();
			return false;
		}
		if($("#protein").val() == null || $("#protein").val() == ""){
			alert("단백질 양을 입력해 주세요!");
			$("#protein").focus();
			return false;
		}
		if($("#caffeine").val() == null || $("#caffeine").val() == ""){
			alert("카페인 양을 입력해 주세요!");
			$("#caffeine").focus();
			return false;
		}
		if($("#fat").val() == null || $("#fat").val() == ""){
			alert("포화지방 양을 입력해 주세요!");
			$("#fat").focus();
			return false;
		}
		if($("#sodium").val() == null || $("#sodium").val() == ""){
			alert("단백질 양을 입력해 주세요!");
			$("#sodium").focus();
			return false;
		}
		else{
			return true;
		}
	}
	</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/menu/menuheader.jsp"/>

<c:if test="${sessionScope.grade == 'ADMIN' }">
<div class="container">
  <form class="form-horizontal" action="<%= request.getContextPath() %>/menu/updatemenu.do"
  method="post" enctype="multipart/form-data" onsubmit="return addmenuFormCheck()">
  <h2 class="text-center">상품수정</h2>
  <input name="page" type="hidden" value="${param.page}">
  <input name="num" type="hidden" value="${menuvo.num}">
  <input id="pagekind" name="pagekind" type="hidden" value="${param.pagekind}">
  <table class="table">
  	<caption>모든 사항은 필수입력입니다.</caption>
  	<tr>
  		<th>종류</th>
  		<td>
  			<div class="form-group">
  			<select class="form-control" id="kind" name="kind">
    			<option value="coffee" selected="selected">커피</option>
    			<option value="beverage">음료</option>
    			<option value="dessert">디져트</option>
    			<option value="delhi">델리</option>
    			<option value="md">MD</option>
  			</select>
  			</div>
  		</td>
  	</tr>
  	<tr>
  		<th>상품 명</th>
  		<td><input class="form-control" id="menuname" name="menuname" type="text" value="${menuvo.menuname}" required="required"></td>
  	</tr>
  	<tr>
  		<th>구분</th>
  		<td>
    <label class="radio-inline"><input type="radio" name="hotncold" value="HOT" checked="checked">HOT</label>
    <label class="radio-inline"><input type="radio" name="hotncold" value="COLD">COLD</label>
  		</td>
  	</tr>
  	<tr>
  		<th>제품 설명</th>
  		<td><textarea class="form-control" style="resize:none" cols="50" rows="5" id="description" name="description" required="required">${menuvo.description}</textarea>
  		</td>
  	</tr>
  	<tr>
  		<th>열량(kcal)</th>
  		<td><input class="form-control" id="calory" name="calory" type="text" value="${menuvo.calory}" required="required"></td>
  	</tr>
  	<tr>
  		<th>당류(g)</th>
  		<td><input class="form-control" id="saccharide" name="saccharide" type="text" value="${menuvo.saccharide}" required="required"></td>
  	</tr>
  	<tr>
  		<th>단백질(g)</th>
  		<td><input class="form-control" id="protein" name="protein" type="text" value="${menuvo.protein}" required="required"></td>
  	</tr>
  	<tr>
  		<th>카페인(mg)</th>
  		<td><input class="form-control" id="caffeine" name="caffeine" type="text" value="${menuvo.caffeine}" required="required"></td>
  	</tr>
  	<tr>
  		<th>포화지방(g)</th>
  		<td><input class="form-control" id="fat" name="fat" type="text" value="${menuvo.fat}" required="required"></td>
  	</tr>
  	<tr>
  		<th>나트륨(mg)</th>
  		<td><input class="form-control" id="sodium" name="sodium" type="text" value="${menuvo.sodium}" required="required"></td>
  	</tr>
  	<tr>
  		<th>이미지</th>
  		<td>
  			<input class="form-control"  type="file" id="file" name="file" accept="image/*"/><p>업로드된 파일:
			<%-- <a href="fileDownload.do?idx=${board.idx}&of=${menuvo.filename}&page=${param.page}"> --%>${menuvo.filename}<!-- </a> --></p>
			<input type="hidden" id="beforefile" name="beforefile" value="${menuvo.filename}" />
  		</td>
  	</tr>
  	<tr>
  		<td colspan="2">
  		<button type="submit" class="btn btn-danger col-md-offset-3 col-xs-2">수정하기</button>
  		<button type="button" class="btn col-md-offset-1 col-xs-2 col-md-offset-4"
  	onclick="location.href='<%=request.getContextPath()%>/menu/${param.pagekind}.js?page=${param.page}'">목록</button>
  		</td>
  	</tr>
  </table>
  </form>
</div>
</c:if>
<c:if test="${sessionScope.grade != 'ADMIN' }">
<h1 class="text-center"><span class="glyphicon glyphicon-ban-circle"></span>관리자 페이지 입니다.</h1>
<button type="button" class="btn col-md-offset-10 col-md-1"
  	onclick="location.href='<%=request.getContextPath()%>/menu/${param.pagekind}.js?page=${param.page}'">목록</button>
</c:if>

  <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
