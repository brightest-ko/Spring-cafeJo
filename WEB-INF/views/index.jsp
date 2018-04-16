<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - Fresh Coffee</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <style>
  
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
      max-height: 440px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  #main{
  	  position:absolute;
      width: 100%; /* Set width to 100% */
      margin: auto;
      height: 440px;
      }
  #visualwrap{position:relative;width:100%;min-width:320px;max-width:1280px;margin:0 auto;box-sizing:border-box;}
.my-group .form-control1{
    width:30%;
}
.my-group .form-control2{
    width:70%;
}
.my-group .form-control3{
    width:50%;
}
.my-group .form-control4{
    width:50%;
}
#titlelink{
color: black;
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
width:90%;
display: inline-block;
}
ul{list-style: none;
padding: 0px;}

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
<style>
.col-item
{
    border: 2px solid #2323A1;
    border-radius: 5px;
    background: #FFF;
}
.col-item .photo img
{
    margin: 0 auto;
    width: 100%;
}

.col-item .info
{
    padding: 10px;
    border-radius: 0 0 5px 5px;
    margin-top: 1px;
}
.col-item:hover .info {
    background-color: rgba(215, 215, 244, 0.5); 
}
.col-item .price
{
    /*width: 50%;*/
    float: left;
    margin-top: 5px;
}

.col-item .price h5
{
    line-height: 20px;
    margin: 0;
}

.price-text-color
{
    color: #00990E;
}

.col-item .info .rating
{
    color: #003399;
}

.col-item .rating
{
    /*width: 50%;*/
    float: left;
    font-size: 17px;
    text-align: right;
    line-height: 52px;
    margin-bottom: 10px;
    height: 52px;
}

.col-item .separator
{
    border-top: 1px solid #FFCCCC;
}

.clear-left
{
    clear: left;
}

.col-item .separator p
{
    line-height: 20px;
    margin-bottom: 0;
    margin-top: 10px;
    text-align: center;
}

.col-item .separator p i
{
    margin-right: 5px;
}
.col-item .btn-add
{
    width: 50%;
    float: left;
}

.col-item .btn-add
{
    border-right: 1px solid #CC9999;
}

.col-item .btn-details
{
    width: 50%;
    float: left;
    padding-left: 10px;
}
.controls
{
    margin-top: 20px;
}
[data-slide="prev"]
{
    margin-right: 10px;
}
</style>
<style>
    .follow-us-container
    {
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .follow-us
    {
        font-size: 32px;
        color: #777;
    }

    .social-icon
    {
        padding-top: 6px;
        font-size: 16px;
        text-align: center;
        width: 32px;
        height: 32px;
        border: 2px solid #777;
        border-radius: 50%;
        color: #777;
        margin: 5px;
    }

    a.social-icon:hover, a.social-icon:active, a.social-icon:focus
    {
        text-decoration: none;
        color: #434343;
        border-color: #434343;
    }
</style>
</head>

<body>

<jsp:include page="/WEB-INF/views/header.jsp"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

   <img src="<%= request.getContextPath() %>/resources/img/main/main10.jpg" alt="시그니처 보틀 텀블러 이벤트"
      class="hidden-sm hidden-xs hidden-md" id="main">
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" id="visualwrap">
      <div class="item active">
        <a href="<%= request.getContextPath() %>/customer/eventview.js?eventnum=1&page=1">
        <img src="<%= request.getContextPath() %>/resources/img/main/main11.jpg" alt="시그니처 보틀 텀블러 이벤트"
          class="hidden-sm hidden-xs hidden-md">
        <img src="<%= request.getContextPath() %>/resources/img/main/main12.jpg" alt="시그니처 보틀 텀블러 이벤트"
          class="hidden-lg">
        </a>
        <!-- <div class="carousel-caption">
          <h3>Sell $</h3>
          <p>Money Money.</p>
        </div>  -->     
      </div>

      <div class="item">
        <img src="<%= request.getContextPath() %>/resources/img/main/event21.jpg" alt="컬쳐 프로젝트"
          class="hidden-sm hidden-xs hidden-md">
        <img src="<%= request.getContextPath() %>/resources/img/main/event22.jpg" alt="컬쳐 프로젝트"
          class="hidden-lg">      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container">    
  <div class="row">
    <div class="col-sm-6">
    <br>
      <h2>Store</h2>
      <form action="<%=request.getContextPath()%>/brand/store.js">
		<input type="hidden" name="type" id="type" value="adress2">
		<br>
        <div class="input-group my-group">
        <select name="doadress" id="doadress" title="시/도 선택" class="form-control form-control3" onchange="gooChange(this.value);">
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
	<select name="gooadress" id="gooadress" title="구/군 선택" class="form-control form-control4">
		<option value="" selected="selected">구/군</option>
	</select>
	 
            <input type="search" class="form-control" name="keyword" placeholder="매장명을 입력해주세요."/> 
            <span class="input-group-btn">
            <button class="btn btn-default btn-lg" type="submit">
        		<i class="glyphicon glyphicon-search" style="height: 46px; padding-bottom: 12px;padding-top: 12px;"></i>
      		</button>
            </span>
        </div>
	  </form>
	  
	  
    	<br>
<div class="row">
  	<div class="col-sm-8">    
      <h3>가맹안내</h3>
      <div class="row" style="border: 1px solid lightgray; margin: auto;">
      	<div class="col-xs-8">
      	<h4>당신의 창업스토리</h4>
      	<h4><font color="#990000">CafeJo</font>가 응원합니다.</h4>
      	<div style="border-radius:2px; background-color: #990000; color:white; width: 20%; padding: 5px; float:left;" align="center">본사</div>
      	<div style="width: 10%; padding: 5px; float:left;" align="center"></div>
      	<div style="border-radius:2px; background-color: #990000; color:white; width: 70%; padding: 5px; float:left;" align="center">
      	<i class="glyphicon glyphicon-earphone"></i> &nbsp;010-9458-9584</div>
      	<div style="height: 50px;"> </div>
		<a href="<%=request.getContextPath()%>/franchise/addqna.js"><font size="3px;" color="#990000" style="border-radius:2px; padding:5px; border: 1px solid lightgray;">온라인 문의하기</font></a>
      	</div>
      	
      	<div class="col-xs-4">
      		<div style="height: 50px;" align="center">
				<a href=""><i class="fa fa-facebook-square" style="font-size:48px;color:#bb0000"></i></a> </div>
      		<div style="height: 50px;" align="center">
      			<a href=""><i class="fa fa-twitter-square" style="font-size:48px;color:#bb0000"></i></a> </div>
      		<div style="height: 50px;" align="center">
				<a href=""><i class="fa fa-google-plus-square" style="font-size:48px;color:#bb0000"></i></a> </div>
      	</div>
      </div>
  </div>
  <div class="col-sm-4">
      <h3>빠른 서비스</h3>
      <div class="row" style="margin: auto;">
      	<div class="col-xs-6">
      	<a href="<%=request.getContextPath()%>/member/login.js">
      		<img alt="로그인" src="<%=request.getContextPath()%>/resources/img/quickmenu1.gif" style="width: 60px;"></a>
  		</div>
  		<div class="col-xs-6">
      	<a href="<%=request.getContextPath()%>/member/signup.js">
  			<img alt="회원가입" src="<%=request.getContextPath()%>/resources/img/quickmenu2.gif" style="width: 60px;"></a>
  		
      	</div>    
    </div>
   </div>
   </div>
	
	
	    <br>
      <div>    
      <h3>공지 및 홍보자료
      <a href="<%=request.getContextPath()%>/customer/notice.js" style="color: black;"><img alt="" src="<%=request.getContextPath()%>/resources/img/btn_more.gif" align="right"> </a></h3>
      
      </div>
  <hr>
  <ul>
  <c:forEach var="noticelist" items="${noticelist}">
  <li>
  <a href='<%=request.getContextPath()%>/customer/noticeview.js?nnum=${noticelist.nnum}&page=${currentPage}' id="titlelink"> 
  <p id="title1">&nbsp;&nbsp;&nbsp;· ${noticelist.ntitle}</p></a></li>
  </c:forEach>
  </ul>
  
	    
    </div>
    <div class="col-sm-6">
          <br>
      <h2>Menu</h2>
      <form id="searchform" action="<%=request.getContextPath()%>/index.do">
		<br>
        <div class="input-group my-group"> 
            <select id="lunch" class="selectpicker form-control form-control1" data-live-search="true" name="type">
                <option value="coffee"> 커피 </option>
                <option value="beverage"> 음료 </option>
                <option value="dessert"> 디저트 </option>
                <option value="delhi"> 델리 </option>
                <option value="md"> MD </option>
            </select>
            <input type="search" class="form-control form-control2" name="keyword" placeholder="검색어를 입력해주세요."/> 
            <span class="input-group-btn">
            <button class="btn btn-default" type="submit">
        		<i class="glyphicon glyphicon-search"></i>
      		</button>
            </span>
        </div>
	  </form>
	  
	  <br>
	  
	  
	  
	  
	    <br>
	  <h3>2월 신메뉴</h3>
	  <div style="border: 1px solid lightgray;">
      <a href="<%=request.getContextPath()%>/menu/newMenu.js">
      <img src="<%=request.getContextPath()%>/resources/img/newmenu2m.jpg" class="img-responsive" style="width:100%" alt="2월신메뉴">
      </a>
      </div>
      
    </div>
  </div>
</div>

  <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
