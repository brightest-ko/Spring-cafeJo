<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - Store</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

  </style>
  <script type="text/javascript">
	function deletestore(storenum, currentPage){
		if(confirm("이 매장 정보를 삭제하시겠습니까?")){
			location.href ="deletestore.do?storenum="+storenum+"&page="+currentPage;
		}		
	}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/brand/brandheader.jsp"/>
<br>
<div class="container">
  <h2>매장 상세 위치</h2>
  <hr>

<h4>${storevo.storename }</h4>
  <table class="table">
  <caption></caption>
  <tr><td class="active">전화번호</td><td>${storevo.storecall }</td></tr>
  <tr><td class="active">번지 주소</td><td>
  <a href="http://map.daum.net/link/search/${storevo.oldadress }" style="color: black;">${storevo.oldadress }</a></td></tr>
  <tr><td class="active">도로명 주소</td><td>
  <a href="http://map.daum.net/link/search/${storevo.newadress }" style="color: black;">${storevo.newadress }</a></td></tr>
  <tr><td class="active">전화번호</td><td>${storevo.storetime }</td></tr>
  <tr><td class="active">주차</td><td>${storevo.carok }</td></tr>
  <tr><td class="active">기타</td><td>${storevo.storemore }</td></tr>
  <tr><td class="active">오시는 길</td><td>
  <br>
  <p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
 </p>
  <div id="map" style="width:100%;height:300px;"></div>
  </td>
  </tr>
  </table>
<hr>  	
<input type="hidden" id="newadress" value="${storevo.newadress}">


<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d46d9d18c34368fe0dd1142f50dd59c0&libraries=services"></script>
<script>
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord($('#newadress').val(), function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {
    	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	    mapOption = {
    	        center: new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng), // 지도의 중심좌표
    	        level: 3 // 지도의 확대 레벨
    	    };  

    	// 지도를 생성합니다    
    	var map = new daum.maps.Map(mapContainer, mapOption); 

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<c:if test="${sessionScope.grade == 'ADMIN' }">
	<button type="button" class="btn btn-danger btn-float"
      onclick="deletestore(${storevo.storenum},${param.page})">&nbsp;삭제&nbsp;</button>
    <!-- 삭제시 정말 삭제하겠니? 한번 더 물어보기 -->
	<button type="button" class="btn btn-danger btn-float"
	  onclick="location.href='<%=request.getContextPath()%>/brand/updatestore.js?storenum=${storevo.storenum}&page=${param.page}'">&nbsp;수정&nbsp;</button>
</c:if>  
<button type="button" class="btn btn-float"
  	onclick="location.href='<%=request.getContextPath()%>/brand/store.js?page=${param.page}'">&nbsp;목록&nbsp;</button>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
