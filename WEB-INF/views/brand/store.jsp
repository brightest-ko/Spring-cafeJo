<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - 매장찾기</title>
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
    width:50%;
}
.my-group .form-control2{
    width:50%;
}
#title1{
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
width:200px;
display: inline-block;
}

@media (min-width: 768px) {
#storeimg{padding-left: 20%;padding-right: 20%;}
}
@media (max-width: 768px) {
#storeimg{padding-bottom:5px; border-bottom: 1px solid lightgray;}
}
</style>
<script type="text/javascript">

function gooChange(optiongoo) {
	if (optiongoo == "강원") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="강릉시">강릉시</option><option value="고성군">고성군</option><option value="동해시">동해시</option><option value="삼척시">삼척시</option><option value="속초시">속초시</option><option value="양구군">양구군</option><option value="양양군">양양군</option><option value="영월군">영월군</option><option value="원주시">원주시</option><option value="인제군">인제군</option><option value="정선군">정선군</option><option value="철원군">철원군</option><option value="춘천시">춘천시</option><option value="태백시">태백시</option><option value="평창군">평창군</option><option value="홍천군">홍천군</option><option value="화천군">화천군</option><option value="횡성군">횡성군</option>');
	}else if(optiongoo == "경기") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="가평군">가평군</option><option value="고양시 덕양구">고양시 덕양구</option><option value="고양시 일산동구">고양시 일산동구</option><option value="고양시 일산서구">고양시 일산서구</option><option value="과천시">과천시</option><option value="광명시">광명시</option><option value="광주시">광주시</option><option value="구리시">구리시</option><option value="군포시">군포시</option><option value="김포시">김포시</option><option value="남양주시">남양주시</option><option value="동두천시">동두천시</option><option value="부천시 소사구">부천시 소사구</option><option value="부천시 오정구">부천시 오정구</option><option value="부천시 원미구">부천시 원미구</option><option value="성남시 분당구">성남시 분당구</option><option value="성남시 수정구">성남시 수정구</option><option value="성남시 중원구">성남시 중원구</option><option value="수원시 권선구">수원시 권선구</option><option value="수원시 영통구">수원시 영통구</option><option value="수원시 장안구">수원시 장안구</option><option value="수원시 팔달구">수원시 팔달구</option><option value="시흥시">시흥시</option><option value="안산시 단원구">안산시 단원구</option><option value="안산시 상록구">안산시 상록구</option><option value="안성시">안성시</option><option value="안양시 동안구">안양시 동안구</option><option value="안양시 만안구">안양시 만안구</option><option value="양주시">양주시</option><option value="양평군">양평군</option><option value="여주군">여주군</option><option value="연천군">연천군</option><option value="오산시">오산시</option><option value="용인시 기흥구">용인시 기흥구</option><option value="용인시 수지구">용인시 수지구</option><option value="용인시 처인구">용인시 처인구</option><option value="의왕시">의왕시</option><option value="의정부시">의정부시</option><option value="이천시">이천시</option><option value="파주시">파주시</option><option value="평택시">평택시</option><option value="포천시">포천시</option><option value="하남시">하남시</option><option value="화성시">화성시</option>');
	}else if(optiongoo == "경상남") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="거제시">거제시</option><option value="거창군">거창군</option><option value="고성군">고성군</option><option value="김해시">김해시</option><option value="남해군">남해군</option><option value="밀양시">밀양시</option><option value="사천시">사천시</option><option value="산청군">산청군</option><option value="양산시">양산시</option><option value="의령군">의령군</option><option value="진주시">진주시</option><option value="창녕군">창녕군</option><option value="창원시 마산합포구">창원시 마산합포구</option><option value="창원시 마산회원구">창원시 마산회원구</option><option value="창원시 성산구">창원시 성산구</option><option value="창원시 의창구">창원시 의창구</option><option value="창원시 진해구">창원시 진해구</option><option value="통영시">통영시</option><option value="하동군">하동군</option><option value="함안군">함안군</option><option value="함양군">함양군</option><option value="합천군">합천군</option>');
	}else if(optiongoo == "경상북") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="경산시">경산시</option><option value="경주시">경주시</option><option value="고령군">고령군</option><option value="구미시">구미시</option><option value="군위군">군위군</option><option value="김천시">김천시</option><option value="문경시">문경시</option><option value="봉화군">봉화군</option><option value="상주시">상주시</option><option value="성주군">성주군</option><option value="안동시">안동시</option><option value="영덕군">영덕군</option><option value="영양군">영양군</option><option value="영주시">영주시</option><option value="영천시">영천시</option><option value="예천군">예천군</option><option value="울릉군">울릉군</option><option value="울진군">울진군</option><option value="의성군">의성군</option><option value="청도군">청도군</option><option value="청송군">청송군</option><option value="칠곡군">칠곡군</option><option value="포항시 남구">포항시 남구</option><option value="포항시 북구">포항시 북구</option>');
	}else if(optiongoo == "광주") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="광산구">광산구</option><option value="남구">남구</option><option value="동구">동구</option><option value="북구">북구</option><option value="서구">서구</option>');
	}else if(optiongoo == "대구") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="남구">남구</option><option value="달서구">달서구</option><option value="달성군">달성군</option><option value="동구">동구</option><option value="북구">북구</option><option value="서구">서구</option><option value="수성구">수성구</option><option value="중구">중구</option>');
	}else if(optiongoo == "대전") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="대덕구">대덕구</option><option value="동구">동구</option><option value="서구">서구</option><option value="유성구">유성구</option><option value="중구">중구</option>');
	}else if(optiongoo == "부산") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="강서구">강서구</option><option value="금정구">금정구</option><option value="기장군">기장군</option><option value="남구">남구</option><option value="동구">동구</option><option value="동래구">동래구</option><option value="부산진구">부산진구</option><option value="북구">북구</option><option value="사상구">사상구</option><option value="사하구">사하구</option><option value="서구">서구</option><option value="수영구">수영구</option><option value="연제구">연제구</option><option value="영도구">영도구</option><option value="중구">중구</option><option value="해운대구">해운대구</option>');
	}else if(optiongoo == "서울") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="강남구">강남구</option><option value="강동구">강동구</option><option value="강북구">강북구</option><option value="강서구">강서구</option><option value="관악구">관악구</option><option value="광진구">광진구</option><option value="구로구">구로구</option><option value="금천구">금천구</option><option value="노원구">노원구</option><option value="도봉구">도봉구</option><option value="동대문구">동대문구</option><option value="동작구">동작구</option><option value="마포구">마포구</option><option value="서대문구">서대문구</option><option value="서초구">서초구</option><option value="성동구">성동구</option><option value="성북구">성북구</option><option value="송파구">송파구</option><option value="양천구">양천구</option><option value="영등포구">영등포구</option><option value="용산구">용산구</option><option value="은평구">은평구</option><option value="종로구">종로구</option><option value="중구">중구</option><option value="중랑구">중랑구</option>');
	}else if(optiongoo == "울산") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="남구">남구</option><option value="동구">동구</option><option value="북구">북구</option><option value="울주군">울주군</option><option value="중구">중구</option>');
	}else if(optiongoo == "인천") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="강화군">강화군</option><option value="계양구">계양구</option><option value="남구">남구</option><option value="남동구">남동구</option><option value="동구">동구</option><option value="부평구">부평구</option><option value="서구">서구</option><option value="연수구">연수구</option><option value="옹진군">옹진군</option><option value="중구">중구</option>');
	}else if(optiongoo == "전라남") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="강진군">강진군</option><option value="고흥군">고흥군</option><option value="곡성군">곡성군</option><option value="광양시">광양시</option><option value="구례군">구례군</option><option value="나주시">나주시</option><option value="담양군">담양군</option><option value="목포시">목포시</option><option value="무안군">무안군</option><option value="보성군">보성군</option><option value="순천시">순천시</option><option value="신안군">신안군</option><option value="여수시">여수시</option><option value="영광군">영광군</option><option value="영암군">영암군</option><option value="완도군">완도군</option><option value="장성군">장성군</option><option value="장흥군">장흥군</option><option value="진도군">진도군</option><option value="함평군">함평군</option><option value="해남군">해남군</option><option value="화순군">화순군</option>');
	}else if(optiongoo == "전라북") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="고창군">고창군</option><option value="군산시">군산시</option><option value="김제시">김제시</option><option value="남원시">남원시</option><option value="무주군">무주군</option><option value="부안군">부안군</option><option value="순창군">순창군</option><option value="완주군">완주군</option><option value="익산시">익산시</option><option value="임실군">임실군</option><option value="장수군">장수군</option><option value="전주시 덕진구">전주시 덕진구</option><option value="전주시 완산구">전주시 완산구</option><option value="정읍시">정읍시</option><option value="진안군">진안군</option>');
	}else if(optiongoo == "제주") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="서귀포시">서귀포시</option><option value="제주시">제주시</option>');
	}else if(optiongoo == "충청남") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="계룡시">계룡시</option><option value="공주시">공주시</option><option value="금산군">금산군</option><option value="논산시">논산시</option><option value="당진군">당진군</option><option value="보령시">보령시</option><option value="부여군">부여군</option><option value="서산시">서산시</option><option value="서천군">서천군</option><option value="아산시">아산시</option><option value="연기군">연기군</option><option value="예산군">예산군</option><option value="천안시 동남구">천안시 동남구</option><option value="천안시 서북구">천안시 서북구</option><option value="청양군">청양군</option><option value="태안군">태안군</option><option value="홍성군">홍성군</option>');
	}else if(optiongoo == "충청북") {
		$("#gooadress").empty();
		$("#gooadress").append('<option value="" selected="">구/군</option><option value="괴산군">괴산군</option><option value="단양군">단양군</option><option value="보은군">보은군</option><option value="영동군">영동군</option><option value="옥천군">옥천군</option><option value="음성군">음성군</option><option value="제천시">제천시</option><option value="증평군">증평군</option><option value="진천군">진천군</option><option value="청원군">청원군</option><option value="청주시 상당구">청주시 상당구</option><option value="청주시 흥덕구">청주시 흥덕구</option><option value="충주시">충주시</option>');
	}
};
</script>
</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/brand/brandheader.jsp"/>

<div class="container">
<!--   <h1 class="text-center">CUSTOMER</h1> -->
  <h2>매장 찾기</h2>
  <div class="row" style="border: 1px solid #990000; padding: 10px; margin: 20px;">
  <div class="col-sm-6 col-lg-6">
  
<div class="sotoreSearch" id="storeimg">
			<form name="sf" id="sf" action="<%=request.getContextPath()%>/brand/store.js">
				<input type="hidden" name="type" id="type" value="adress">
				<input type="hidden" name="keyword" id="keyword" value="">
					<div class="map"><img src="../resources/img/map/local_map02.gif" id="localMap" usemap="#store_localMap" alt="전국지도"></div>
					<map name="store_localMap" id="store_localMap">
					  <area shape="poly" coords="67,76,77,65,81,65,85,68,87,72,91,76,92,78,91,82,85,84,85,90,82,87,80,86,74,84,73,87,69,87,68,84" href="javascript:selectArea('02','서울');" alt="서울" onmouseover="Stores('02');">
					  <area shape="poly" coords="68,76,64,74,56,76,51,73,52,65,54,59,57,60,57,53,59,47,63,45,68,44,69,40,66,34,67,30,71,29,78,25,83,25,87,23,89,22,90,32,92,35,95,36,99,37,104,37,109,41,111,46,111,51,111,57,109,60,111,65,112,67,112,71,116,72,120,73,124,75,127,76,127,79,127,84,124,89,123,96,123,100,124,107,112,117,108,117,105,119,103,124,100,127,94,126,92,122,77,123,67,123,67,120,61,117,52,107,54,97,61,92,65,89,67,84,69,86,75,86,78,86,81,86,82,87,84,90,85,87,86,84,88,82,90,81,92,78,92,75,88,73,87,70,86,68,84,65,81,65,78,65" href="javascript:selectArea('031','경기도');" alt="경기도" onmouseover="Stores('031');">
					  <area shape="poly" coords="54,60,45,56,43,55,40,58,37,58,34,56,30,60,28,61,26,65,29,70,32,73,34,76,35,78,39,83,42,86,45,86,47,87,54,84,56,87,58,91,59,93,63,91,64,88,66,84,68,82,68,77,66,73,61,73,59,74,56,76,52,76,50,73,49,93,45,93,35,95,32,96,27,96,23,94,17,97,16,103,17,107,28,109,32,110,39,109,43,103,47,102,50,100,52,95,52,84,52,75,50,73,51,80,52,90" href="javascript:selectArea('032','인천광역시');" alt="인천광역시" onmouseover="Stores('032');">
					  <area shape="poly" coords="157,6,165,6,167,17,173,24,173,32,182,41,194,63,200,63,200,71,202,77,214,91,216,92,219,106,211,110,202,112,198,113,191,113,188,112,172,114,163,107,155,105,154,102,150,99,143,105,138,100,136,100,127,110,124,107,124,90,126,84,128,79,124,75,120,73,116,71,113,73,111,68,109,64,109,59,111,55,112,51,109,47,109,42,105,39,101,38,97,36,93,35,90,34,89,30,89,25,89,22,93,19,98,22,100,25,104,24,109,23,115,23,117,25,123,25,139,23,142,21,141,14,151,12,156,18,157,7" href="javascript:selectArea('033','강원도');" alt="강원도" onmouseover="Stores('033');">
					  <area shape="poly" coords="103,124,94,126,92,122,87,121,78,121,75,123,71,124,67,123,66,120,61,117,58,119,56,119,49,114,42,117,27,128,27,145,29,146,32,143,38,148,37,151,33,155,34,161,37,164,47,169,49,172,45,178,57,190,61,194,66,193,69,193,73,187,75,181,80,180,82,184,82,188,87,190,92,190,94,186,95,185,101,184,103,189,104,192,111,195,116,194,118,190,119,188,118,182,116,178,112,176,108,179,105,180,101,178,98,176,95,174,93,169,93,165,94,160,98,155,100,155,99,147,97,143,97,137,102,138,105,136,107,133" href="javascript:selectArea('041','충청남도');" alt="충청남도" onmouseover="Stores('041');">
					  <area shape="poly" coords="101,154,93,165,94,169,97,175,101,178,105,179,109,176,111,174,109,171,113,161,112,160" href="javascript:selectArea('042','대전광역시');" alt="대전광역시" onmouseover="Stores('042');">
					  <area shape="poly" coords="101,154,109,160,113,162,112,165,109,169,111,175,115,178,117,183,119,189,123,190,132,192,137,188,139,181,142,176,142,172,139,172,134,172,131,169,129,166,133,161,134,157,135,152,131,150,133,146,134,142,134,140,148,131,168,131,169,127,166,122,173,114,162,106,155,106,154,102,150,99,143,103,137,100,136,100,128,109,124,106,112,116,108,116,102,122,102,123,105,130,105,135,104,138,95,138,95,142" href="javascript:selectArea(043','충청북도');" alt="충청북도" onmouseover="Stores('043');">
					  <area shape="poly" coords="219,243,215,239,208,240,205,244,191,247,189,257,184,258,176,257,173,259,166,265,174,272,177,272,180,263,188,265,189,268,202,262,204,257,210,255,218,254,217,247" href="javascript:selectArea('051','부산광역시');" alt="부산광역시" onmouseover="Stores('051');">
					  <area shape="poly" coords="230,218,221,217,214,212,202,220,202,229,210,235,213,235,215,241,219,243,228,231,228,221" href="javascript:selectArea('052','울산광역시');" alt="울산광역시" onmouseover="Stores('052');">
					  <area shape="poly" coords="161,220,161,215,163,213,162,205,160,199,183,190,186,191,186,201,183,206,176,215,173,213,174,218,170,219" href="javascript:selectArea('053','대구광역시');" alt="대구광역시" onmouseover="Stores('053');">
					  <area shape="poly" coords="221,106,202,110,196,113,189,112,183,113,173,114,166,123,169,130,148,131,133,141,132,147,131,150,135,152,134,160,129,166,134,173,141,173,141,176,132,192,132,201,141,203,148,206,151,211,153,217,153,220,156,221,161,221,161,215,163,211,161,200,165,195,171,194,178,191,183,191,186,192,186,198,186,203,182,207,179,213,177,215,173,214,175,217,175,220,178,221,183,223,187,224,193,224,197,221,202,221,206,217,210,214,214,212,218,215,222,217,228,219,230,215,230,203,233,195,235,187,233,183,230,184,225,188,224,184,221,179,224,168,223,148,227,142,224,124,227,117" href="javascript:selectArea('054','경상북도');" alt="경상북도" onmouseover="Stores('054');">
					  <area shape="poly" coords="189,270,189,265,180,265,177,272,173,272,167,265,172,259,180,256,183,258,189,257,191,249,193,247,200,246,207,244,208,239,216,240,215,235,210,235,206,232,202,229,202,221,196,220,191,225,179,223,172,218,169,220,161,221,153,220,151,211,149,207,146,204,137,201,132,201,129,206,127,207,120,207,118,214,117,220,117,224,118,229,120,232,120,237,120,240,116,243,117,246,120,252,120,254,119,257,127,265,127,272,130,275,129,280,131,289,135,289,139,289,143,291,145,285,148,284,161,283,168,290,180,290,186,284,187,272" href="javascript:selectArea('055','경상남도');" alt="경상남도" onmouseover="Stores('055');">
					  <area shape="poly" coords="60,249,66,247,69,246,74,247,77,249,80,254,80,259,77,261,76,265,74,267,69,267,67,265,63,262,61,260,54,256,59,252" href="javascript:selectArea('062','광주광역시');" alt="광주광역시" onmouseover="Stores('062');">
					  <area shape="poly" coords="41,234,38,251,32,254,19,253,16,258,23,269,14,276,16,278,8,284,11,296,19,303,17,305,5,323,5,328,8,332,16,333,17,327,27,327,30,324,26,319,41,314,47,320,58,319,61,321,68,321,83,323,89,314,94,314,103,307,109,311,112,311,112,297,123,298,131,289,129,276,127,273,127,265,118,256,120,252,116,242,105,241,102,244,94,243,91,244,84,244,79,237,73,235,67,234,60,241,50,244,41,235,46,235,57,257,61,261,67,265,71,267,76,263,78,258,79,253,75,249,68,246,61,249,57,254,57,255" href="javascript:selectArea('061','전라남도');" alt="전라남도" onmouseover="Stores('061');">
					  <area shape="poly" coords="41,232,47,237,49,243,60,242,66,234,74,235,80,237,86,244,92,244,94,242,102,244,107,241,111,242,116,243,120,239,122,235,118,229,117,224,117,217,120,207,126,207,130,206,133,201,132,192,127,190,120,188,115,194,112,195,105,194,103,192,101,185,100,184,95,184,90,189,88,191,85,189,82,187,80,179,78,179,74,181,71,185,71,191,69,193,66,193,61,193,59,193,57,190,54,191,52,192,49,195,52,198,54,200,56,205,56,209,56,210,52,215,47,218,45,221" href="javascript:selectArea('063','전라북도');" alt="전라북도" onmouseover="Stores('063');">
					  <area shape="poly" coords="29,349,34,347,51,338,58,339,63,339,69,337,74,341,76,346,74,352,71,356,64,360,60,364,54,364,46,364,41,366,40,366,37,369,34,369,25,360,27,353" href="javascript:selectArea('064','제주시');" alt="제주시" onmouseover="Stores('064');">
					</map>
					<script type="text/javascript">
					//<![CDATA[
						var old_area = '';
						function Stores(area) { 
							if (old_area == ''){
								old_area='02';
							}
							if (old_area != area) {
								var SearchSrc01 = jQuery('#localMap').attr("src");
								jQuery('#localMap').attr("src", SearchSrc01.replace(old_area, area));
							}
							old_area=area;
						}
						
						function selectArea(area2,area1) {
							$('#keyword').val(area1);
							$('#sf').submit();
						}
					//]]>
					</script>
					<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
					<script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
					<script>
					 $(document).ready(function(e) {
						$('img[usemap]').rwdImageMaps();
						setTimeout( function() {
							if( $('#keyword2').val() != "" ) {
								$("#img").src("../resources/img/map/local_map"+$('#keyword2').val()+".gif");
							}
						}, 1000);
					});
					</script> -->
			</form>
		</div>
</div>
<form action="<%=request.getContextPath()%>/brand/store.js">
<input type="hidden" name="type" id="type" value="adress2">
	<div class="col-sm-6 col-lg-6">
		<br>
        <h3>지역검색</h3>
        <hr>
           <h4>주소 및 매장명</h4>
          <br>
    <div class="input-group my-group"> 
	<select name="doadress" id="doadress" title="시/도 선택" class="form-control form-control1" onchange="gooChange(this.value);">
		<option value="" selected="selected">시/도</option>
		<option value="강원">강원</option>
		<option value="경기">경기</option>
		<option value="경상남">경남</option>
		<option value="경상북">경북</option>
		<option value="광주">광주</option>
		<option value="대구">대구</option>
		<option value="대전">대전</option>
		<option value="부산">부산</option>
		<option value="서울">서울</option>
		<option value="울산">울산</option>
		<option value="인천">인천</option>
		<option value="전라남">전남</option>
		<option value="전라북">전북</option>
		<option value="제주">제주</option>
		<option value="충청남">충남</option>
		<option value="충청북">충북</option>
	</select>
	<select name="gooadress" id="gooadress" title="구/군 선택" class="form-control form-control2">
		<option value="" selected="selected">구/군</option>
	</select>
	<input type="search" name="keyword" id="keyword" placeholder="매장명을 입력해주세요." class="form-control">
	</div>
	<br>
	<div>
	<button class="btn btn-danger btn-lg" type="submit">
    	<i class="glyphicon glyphicon-search">검색하기</i>
    </button>
	<button class="btn btn-lg" type="button" onclick="location.href='<%=request.getContextPath()%>/brand/store.js'">
    	전체보기
    </button>
    </div>
	
	<!-- <br>
	<h4>전화번호</h4>
	<input type="hidden" name="type" id="hidSIDO" value="">
    <input type="search" name="keyword" id="keyword" placeholder="뒷번호를 입력해주세요." class="form-control"> -->
	
        
    </div>
</form>
  </div>
  <hr>
  <table class="table">
  <caption></caption>
  <tr style="background-color: #990000; color: white;">
    <th>번호</th><th>매장명</th><th>연락처</th><th align="center">상세보기</th>
  </tr>
  
  <c:forEach var="storelist" items="${storelist}">
  <tr>
    <td>${storelist.storenum}</td>
    <td>${storelist.storename}</td>
    <td>${storelist.storecall}</td>
    <td><div align="center"><button type="button" class="btn btn-danger"
  	onclick="location.href='<%=request.getContextPath()%>/brand/storeview.js?page=${currentPage}&storenum=${storelist.storenum}'">상세보기</button></div></td>
  </tr>
  </c:forEach>
  <c:if test="${empty storelist}">
  <tr><td colspan="4" class="text-center">프렌차이즈 매장이 없습니다.</td></tr>
  </c:if>
  <tr><td colspan="4"></td></tr>
  </table>
  <div><p class="text-center">${pageHtml}</p>
  <c:if test="${sessionScope.grade == 'ADMIN' }">  	
  <button type="button" class="btn btn-danger"
  	onclick="location.href='<%=request.getContextPath()%>/brand/addstore.js?page=${currentPage}'"
  	style="float: right;">매장추가</button>
  </c:if>
  </div>  
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
