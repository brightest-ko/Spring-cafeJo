<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - 회원가입</title>
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
window.onload = function() {
    var frm = document.getElementById('mainForm');
    
    var nowDate        = new Date();
    var nowYear        = nowDate.getFullYear();
    var nowMonth    = eval(nowDate.getMonth()) +1;
    var nowDay        = eval(nowDate.getDate());
    
    /* 년 세팅*/
     var startYear    = nowYear;
     for( var i=0; i<100; i++ ) {
         frm['dateYear'].options[i] = new Option(startYear-i, startYear-i);
     }
     /* 월 세팅*/
     for (var i=0; i<12; i++) {
        frm['dateMonth'].options[i] = new Option(i+1, i+1);
    }
    /***************************************
     * 먼저 현재 년과 월을 셋팅
     * 윤년계산과 월의 마지막 일자를 구하기 위해
     ***************************************/
    frm['dateYear'].value        = nowYear;
    frm['dateMonth'].value    = nowMonth;
    setDay();
    /********************************************
     * 일(day)의 select를 생성하고 현재 일자로 초기화
     ********************************************/
    frm['dateDay'].value        = nowDay;
}

/******************
 * 일(day) 셋팅
 ******************/
function setDay() {
    var frm = document.getElementById('mainForm');
    
    var year            = frm['dateYear'].value;
    var month            = frm['dateMonth'].value;
    var day                = frm['dateDay'].value;    
    var dateDay        = frm['dateDay'];
    
    var arrayMonth    = [31,28,31,30,31,30,31,31,30,31,30,31];

    /*******************************************
     * 윤달 체크 부분
     * 윤달이면 2월 마지막 일자를 29일로 변경
     *******************************************/
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }

    /**************************************
     * 기존 일(day) select를 모두 삭제한다.
     **************************************/
    for( var i=dateDay.length; i>0; i--) {
        dateDay.remove(dateDay.selectedIndex);
    }
        
    /*********************************
     * 일(day) select 옵션 생성
     *********************************/
    for (var i=1; i<=arrayMonth[month-1]; i++) {
        dateDay.options[i-1] = new Option(i, i);
    }

    /*********************************************
     * 기존에 선택된 일값 유지
     * 기존 일값보다 현재 최대일값이 작을 경우
     * 현재 선택 최대일값으로 세팅
     ********************************************/
    if( day != null || day != "" ) {
        if( day > arrayMonth[month-1] ) {
            dateDay.options.selectedIndex = arrayMonth[month-1]-1;
        } else {
            dateDay.options.selectedIndex = day-1;
        }
    }
}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
  <form class="form-horizontal" action="<%= request.getContextPath() %>/member/findpw.do" method="post" enctype="multipart/form-data"
  name="mainForm" id="mainForm">
  <h2 class="text-center">PW 찾기</h2>
  <div class="col-md-6 col-md-offset-3">
    <div class="signfrm text-center">
    	<img src="<%= request.getContextPath() %>/resources/img/join.png" alt="회원가입 이미지">
		<p class="text-center">회원님의 소중한 개인정보 보호를 위하여 본인확인이 필요합니다.</p>
    </div>
    <div class="signfrm">
      <h4>※ ID</h4>
      <div>
        <input class="form-control" id="userid" name="userid" type="text" placeholder="ID를 입력하세요." value="${param.userid }"
         required="required" maxlength="18">
         <div id="idchk"></div>
      </div>
    </div>
    <div class="signfrm">
      <h4>※이름</h4>
        <input class="form-control" id="username" name="username" type="text" placeholder="이름을 입력하세요." required="required">
    </div>
    <div class="signfrm">
      		<h4>※ 생년월일</h4>
      		<div class="form-inline">
    		<select class="form-control date" name='dateYear' onChange='setDay()'></select>&nbsp;년&nbsp;
    		<select class="form-control date" name='dateMonth' onChange='setDay()'></select>&nbsp;월&nbsp;
    		<select class="form-control date" name='dateDay'></select>&nbsp;일
    		</div>
    </div>
    <div class="signfrm signfrm-bottom">
      <h4>※ 휴대폰</h4>
      <div>
        <input class="form-control" id="hp" name="hp" type="tel" placeholder="-빼고 입력해주세요" required="required" maxlength="11">
      </div>
    </div>
    <br>
    <div class="row">
    	<div class="col-xs-1"></div>
    	<button type="submit" class="btn btn-danger col-xs-4">확인</button>
    	<div class="col-xs-2"></div>
    	<button type="button" class="btn col-xs-4"
    	onclick="location.href='<%= request.getContextPath() %>/member/login.js'"onclick="">취소</button>
    	<div class="col-xs-1"></div>
    </div>
  </div>
  </form>
</div>

  <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
