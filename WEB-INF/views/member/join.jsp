<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script type='text/javascript'>
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

    $('#userid').blur(function(){
    	$.ajax({
    		type:"POST",
    		url:"../member/idcheck.do",
    		data:{
    			"userid":$('#userid').val()
    		},
    		success:function(data){
    			if($.trim(data)=='havethisid'){
    				//alert("사용가능");
    				$('#idchk').html('<br><font color=red size=3px> 중복된 아이디가 있습니다. </font>')
    			}else if($.trim(data)=='noid'){
    				$('#idchk').html('<br><font color=red size=3px> 아이디를 입력하세요. </font>')
    			}else if($.trim(data)=='wrongid'){
    				$('#idchk').html('<br><font color=red size=3px> 영문(대소문자 구분 없음), 숫자로만 입력하세요. </font>')
    			}else if($.trim(data)=='shortid'){
    				$('#idchk').html('<br><font color=red size=3px> 6자리 미만입니다. 6~16자리로 입력해주세요. </font>')
    			}else if($.trim(data)=='longid'){
    				$('#idchk').html('<br><font color=red size=3px> 16자리 초과입니다. 6~16자리로 입력해주세요. </font>')
    			}else{
    				//alert("사용가능");
    				$('#idchk').html('<br><font color=green size=3px> 이용가능한 아이디 입니다. </font>')	
    			}
    		}
    	});
    });
}

function passwdcheck() {
	var passwd = document.getElementById("passwd").value;
	var passcheck = document.getElementById("passwd2").value;
	if(passcheck==""){
		document.getElementById("passchecktext").innerHTML="";
	}
	else if(passwd != passcheck){
		document.getElementById("passchecktext").innerHTML=
			"<br><font color=red size=3px> 비밀번호가 다릅니다.</font>";
	}
	else{
		document.getElementById("passchecktext").innerHTML=
			"<br><font color=green size=3px> 비밀번호가 일치합니다.</font>";
	}
}

$(document).ready(function(){  
    $("#mainform").submit(function(e) {
    	var passwd = $("#passwd").val();
    	var passwd2 = $("#passwd2").val();
    	if(passwd != passwd2){
    		return false;
    	}
       /* length = $("#username").val().length;
       if((length > 2 && length < 5)) {
           $("#output").html("correct, logging in");
       } else {
           $("#output").html("incorrect, must have 3 or 4 chars");
       }
       return (length > 2 && length < 5); */
    });
});
</script>

</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/memberheader.jsp"/>

<div class="container">
  <form class="form-horizontal" action="<%= request.getContextPath() %>/member/signup.do" method="post" enctype="multipart/form-data"
  name="mainForm" id="mainForm">
  <h2 class="text-center">회원가입</h2>
  <div class="col-md-6 col-md-offset-3">
    <div class="signfrm text-center">
    	<img src="<%= request.getContextPath() %>/resources/img/join.png" alt="회원가입 이미지">
		<p class="text-center">회원정보를 입력해주세요.(※)는 필수입력입니다.</p>
    </div>
    <div class="signfrm">
      <h4>※ ID</h4>
      <div>
        <input class="form-control" id="userid" name="userid" type="text" placeholder="영문(대소문자 구분 없음), 숫자로 6~16자리만 입력하세요."
         required="required" maxlength="18">
         <div id="idchk"></div>
      </div>
    </div>
    <div class="signfrm">
      <h4>※ 비밀번호</h4>
      <div>
        <input class="form-control" id="passwd" name="passwd" type="password" placeholder="비밀번호를 입력하세요." required="required">
      </div>
    </div>
    <div class="signfrm">
      <h4>※ 비밀번호 확인</h4>
      <div>
        <input class="form-control" id="passwd2" name="passwd2" onkeyup="passwdcheck()"
         type="password" placeholder="비밀번호 확인을 위해 입력하세요." required="required">
        <div id="passchecktext"></div>
      </div>
    </div>
    <c:if test="${sessionScope.grade == 'ADMIN' }">
    <div class="signfrm">
      	<h4>※ 권한</h4>
      	<select class="form-control"name='grade'>
      		<option selected="selected" value="USER">사용자</option>
      		<option value="ADMIN">관리자</option>
      	</select>
    </div>
    </c:if>
    <c:if test="${sessionScope.grade != 'ADMIN' }">
    <input id="grade" name="grade" type="hidden" value="USER">
  	</c:if>
    <div class="signfrm">
      <h4>※이름</h4>
      <input class="form-control" id="username" name="username" type="text" placeholder="이름을 입력하세요." required="required" maxlength="10">
    </div>
    <div class="signfrm">
      	<h4>※ 성별</h4>
    	<div class="row">
      		<div class="radio col-sm-2 col-xs-6">
  				<label><input type="radio" name="gender" value="남" checked="checked">남</label>
	 		</div>
	  		<div class="radio col-sm-2 col-xs-6">
  				<label><input type="radio" name="gender" value="여">여</label>
	  		</div>
	  	</div>
	</div>
    <div class="signfrm">
      		<h4>※ 생년월일</h4>
      		<div class="form-inline">
    		<select class="form-control date" name='dateYear' onChange='setDay()'></select>&nbsp;년&nbsp;
    		<select class="form-control date" name='dateMonth' onChange='setDay()'></select>&nbsp;월&nbsp;
    		<select class="form-control date" name='dateDay'></select>&nbsp;일
    		</div>
    </div>
    <div class="signfrm">
      <h4>※ 휴대폰</h4>
      <div>
        <input class="form-control" id="hp" name="hp" type="tel" placeholder="-빼고 입력해주세요" required="required" maxlength="11">
      </div>
      <br>
      <div>이벤트, 신규 매장 소식 등 프로모션 알림 정보를 수신</div>
      <div class="row">
      <div class="radio col-xs-6">
  		<label><input type="radio" name="hpget" checked="checked" value="yeshpget">수신동의</label>
	  </div>
	  <div class="radio col-xs-6">
  		<label><input type="radio" name="hpget" value="nohpget">수신거부</label>
	  </div>
      </div>
    </div>
    <div class="signfrm signfrm-bottom">
      <h4>메일 (선택)</h4>
      <div>
        <input class="form-control" id="mail" name="mail" type="email" placeholder="메일을 입력하세요.">
      </div>
      <br>
      <div>이벤트, 신규 매장 소식 등 프로모션 알림 정보를 수신</div>
      <div class="row">
      <div class="radio col-xs-6">
  		<label><input type="radio" name="mailget" checked="checked" value="yesmailget">수신동의</label>
	  </div>
	  <div class="radio col-xs-6">
  		<label><input type="radio" name="mailget" value="nomailget">수신거부</label>
	  </div>
      </div>
    </div>
    <br>
    <div class="row">
    	<div class="col-xs-1"></div>
    	<button type="submit" class="btn btn-danger col-xs-10">가입하기</button>
    	<div class="col-xs-1"></div>
    </div>
  </div>
  </form>
</div>

  <jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>
