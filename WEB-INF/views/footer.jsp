 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
footer {
	background-color: #404040;
	padding: 25px;
	color: lightgray;
}
</style>
<br><br>
<footer>
<div class="container">
	<div style="border-bottom: 1px solid lightgray; padding-bottom: 5px;">
	<a href="<%=request.getContextPath()%>/brand.js" style="color: lightgray">회사소개</a>
	&nbsp;&nbsp;
	<a href="<%=request.getContextPath()%>/franchise/info.js" style="color: lightgray">프렌차이즈</a>
	</div>
	<div style="padding-top:10px;">
	<div class="hidden-xs" style="vertical-align: top; display: inline-block;"><img src="<%= request.getContextPath() %>/resources/img/cafejologo2.jpg" alt="CafeJo" width="80px;"></div>
	&nbsp;
	<div style="display: inline-block; /* text-align: center; */">
		<div>서울특별시 강남구 역삼동 649-14 대호빌딩 | 대표 : 고희조 | Tel.010-9458-9584</div>
		<div>COPYRIGHT &copy; 2017 CafeJo. ALL RIGHTS RESERVED</div>
	</div>
	</div>
</div>

</footer>