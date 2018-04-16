<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
  <title>CafeJo - 프렌차이즈 FAQ</title>
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
	function onlymember(){
		if(confirm("회원전용입니다. 로그인하시겠습니까?")){
			location.href ="/heeJ/member/login.js";
		}		
	}
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/franchise/franchiseheader.jsp"/>

<div class="container">

<div class="container">
<c:if test="${empty sessionScope.userid }">
<div align="right">
<button type="button" class="btn col-md-offset-1 col-xs-2 col-md-offset-4" onclick="onlymember()">창업 문의</button>
</div>
</c:if>
<c:if test="${not empty sessionScope.userid }">
<div align="right">
<button type="button" class="btn col-md-offset-1 col-xs-2 col-md-offset-4"
  	onclick="location.href='<%=request.getContextPath()%>/franchise/addqna.js'">창업 문의</button>
</div>
</c:if>
</div>
					<!-- /.tabMenu03 -->
					<!-- .cont01 -->
					<div class="cont01">
						<h2>커피전문점 창업 시 다음의 몇가지 항목에 대하여 신중하게 검토하는 것이 필요합니다.</h2>
						<div class="box">
							<ul>
								<li>가맹 본사가 운영 노하우와 매뉴얼을 바탕으로 탄탄한 시스템을 갖추고 있는지?</li>
								<li>매장운영에 대한 상권 보호정책을 기본적으로 수립하고 있는지?</li>
								<li>본사 위주로 무리하게 강요하거나 매장 개설 후 방치하고 있지 않은지?</li>
								<li>개점은 물론 운영관리가 용이하고 또한 운영 수익율이 만족 스러운지?</li>
								<li>주메뉴인 커피에 맛과 경쟁력이 있고 그외 고객들에게 서비스 할 수 있는 차별적인 서브메뉴를 가지고 있는지?</li>
							</ul>
							<p><strong>이 모든 조건들을 고려 했을 때 CafeJo 커피는 창업하는 모든 분들에게 큰만족을 드릴 수 있는 최고의 선택이 될 것입니다.</strong></p>
						</div>
						<!-- .bbsList01 -->
						<div class="bbsList01">
							<table>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row"><p>가맹점 개설 가능 지역 및 상권 개설 가능 조건 <span></span>점포 임대차 계약 시 체크사항</p></th>
										<td>
											<ul>
												<li>역세권, 오피스 상권, 대학가 상권, 시가지 핵심 상권</li>
												<li>대로변 지상 1층-2층 전용 면적 99㎡ 이상, 테라스 면적 미포함, 제1종 근린생활 시설 (휴게음식점)</li>
												<li>전기용량 : 55~60kw</li>
												<li>수도시설 : 급 배수</li>
												<li>건물용도 : 휴게음식점 용도 설정 가능</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /.bbsList01 -->
						<p class="notice">※ 상기 내용은 상권의 주변 여건에 따라 달라 질 수 있습니다.</p>
					</div>
					<!-- /.cont01 -->
					<!-- .cont02 -->
					<div class="cont02">
						<h2 class="section_title02">CafeJo 예상 투자금액</h2>
						<table class="table">
						<tr><th width="13.15%">구분</th><th width="22.17%">금액 (부가세별도)</th><th width="*">내용</th></tr>
						<tr><th scope="row"><p>가맹금</p></th>
							<td class="price"><p>10,000,000원</p></td>
							<td>소멸성 (영업표시의 사용 및 영업관리 및 지도의 대가)</td>
						</tr>
						<tr><th scope="row"><p>보증금</p></th>
							<td class="price"><p>10,000,000원</p></td>
							<td><ul><li>계약이행 보증금으로써 가맹 계약해지 시 반환</li></ul></td>
						</tr>
						<tr><th scope="row"><p>인테리어 (시설비)</p></th>
							<td class="price"><p>60,000,000원<br>(평당 200만원/전용면적 30평 기준)</p></td>
							<td>
								<ul>
									<li>내외부 사인물, 의탁자, 냉난방시설, 테라스 공사, 외부공사 별도</li>
									<li>내외부 사인물(간판) : 별도 협의</li>
									<li>의탁자, 냉난방시설, 테라스 공사, 외부 공사 : 별도 협의</li>
								</ul>
							</td>
						</tr>
						
									<tr>
										<th scope="row"><p>기자재</p></th>
										<td class="price"><p>60,780,670원</p></td>
										<td>
											<ul>
												<li>커피머신, 오븐기, 냉장고, POS, 쇼케이스 등</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row"><p>초도물품비품</p></th>
										<td class="price"><p>11,678,545원</p></td>
										<td>
											<ul>
												<li>원두, 생지, 머그컵, 냅킨, 파우더, 소스 등</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row"><p>로열티</p></th>
										<td class="price"><p>800,000원</p></td>
										<td>
											<ul>
												<li>매출과 관계없이 매월 800,000원 (부가세는 별도입니다.)</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /.bbsList01 -->
					<!-- /.cont02 -->
					<!-- .cont03 -->
					<div class="cont03">
						<h2 class="section_title02">CafeJo 창업점주</h2>
						<!-- .storekeeperList -->
						<div class="storekeeperList">
							<ul>
																					<li>
									<p class="thum"><a href="franchise_storyView.php?vIDX=10&amp;"><img src="/upload//0.54667200_1456391043.jpg" alt=""></a></p>
									<dl>
										<dt><a href="franchise_storyView.php?vIDX=10&amp;">A 클래스의 비결, 서비스에서 찾았다!</a></dt>
										<dd class="name">동교삼거리점 황가히 점주</dd>
										<dd class="txt"> 
(2015년 8월 31일 월요일) CafeJo는 커피전문점의 맛과 서비스를 위한 노력으로 2015년부터 분기별로 ‘매장 콘테스트’를 시행 중이다. 가맹점 기준 2분기 84개의 A클래스 매장에서 3분기 120개로 약 140%이상 증가하며 매장 콘테스트의 순기...</dd>
									</dl>
								</li>
															<li>
									<p class="thum"><a href="franchise_storyView.php?vIDX=9&amp;"><img src="/upload//0.61073200_1456390839.jpg" alt=""></a></p>
									<dl>
										<dt><a href="franchise_storyView.php?vIDX=9&amp;">베테랑 점주가 말하는 CafeJo 운영 노하우!</a></dt>
										<dd class="name">신천역점 문태언 점주</dd>
										<dd class="txt"> 
(2015년 6월 1일 월요일) CafeJo는 고객서비스 강화 및 매장 운영의 효율성을 증대시키기 위해 매장 콘테스트를 시행 중이다. 고객서비스만족도와 매장청결도 등 다면 서비스를 바탕으로 점수를 매겨 평가하는 매장 콘테스트에 CafeJo 신천역점은 1분기에 이어 2...</dd>
									</dl>
								</li>
															<li>
									<p class="thum"><a href="franchise_storyView.php?vIDX=8&amp;"><img src="/upload//0.33780200_1456390505.jpg" alt=""></a></p>
									<dl>
										<dt><a href="franchise_storyView.php?vIDX=8&amp;">A클래스의 비결, 수퍼바이저와의 소통!</a></dt>
										<dd class="name">분당차병원점 김필재 점주</dd>
										<dd class="txt"> 
(2015년 3월 31일 화요일) 지난 1월 CafeJo는 고객 서비스를 강화하고 매장 운영의 효율성을 증대시키기 위해 매장 콘테스트를 시행한 바 있다. 고객서비스만족도, 매장청결도 등 다면 서비스 평가 기준을 바탕으로 점수를 매겨 높은 점수를 획득한 55개 매장...</dd>
									</dl>
								</li>
															<li>
									<p class="thum"><a href="franchise_storyView.php?vIDX=7&amp;"><img src="/upload//0.92570100_1456390185.jpg" alt=""></a></p>
									<dl>
										<dt><a href="franchise_storyView.php?vIDX=7&amp;">투잡 창업, 아이템·시스템·입지 마련되면 절반은 성공</a></dt>
										<dd class="name">서초타워점 정승일 점주</dd>
										<dd class="txt"> 
(2014년 5월 7일 수요일) 보다 안정적인 생활을 마련하기 위한 ‘투잡족’이 증가하고 있다. 지난 2월 취업포털 커리어가 직장인을 대상으로 실시한 설문조사 결과 직장인의 12.3%가 창업, 아르바이트를 포함한 부업을 가지고 있으며, 67.3%가 투잡...</dd>
									</dl>
								</li>
															<li>
									<p class="thum"><a href="franchise_storyView.php?vIDX=6&amp;"><img src="/upload//0.34192000_1456388995.jpg" alt=""></a></p>
									<dl>
										<dt><a href="franchise_storyView.php?vIDX=6&amp;">직장인 창업, 경험 살려 꼼꼼 체크하면 승산 있다</a></dt>
										<dd class="name">가로수길점·방이점 이연숙·이성호 점주</dd>
										<dd class="txt"> 
(2013년 6월 11일 화요일) 대한민국 직장인들의 로망, 커피전문점 창업. 상상 속에서 몇 번이고 꿈 꾸는 일이지만, 한창 커리어를 쌓을 시기에 과감하게 창업에 도전하는 일은 현실에서는 고민부터 앞선다.

CafeJo 방이점·가로수길점을 운영 중인 이연숙·...</dd>
									</dl>
								</li>
															<li>
									<p class="thum"><a href="franchise_storyView.php?vIDX=5&amp;"><img src="/upload//0.49802700_1456388856.jpg" alt=""></a></p>
									<dl>
										<dt><a href="franchise_storyView.php?vIDX=5&amp;">천안 명물 호두과자? 아니죠 커피와 프레즐이죠!</a></dt>
										<dd class="name">천안에비뉴점 홍윤정 점주</dd>
										<dd class="txt"> 
(2013년 3월 25일 월요일) 홍윤정(38•사진)씨는 천안에만 3개의 CafeJo 매장을 운영하고 있는 커피전문점 가맹점주다. 전업주부였던 홍 씨는 천안에 커피전문점이 전무하던 지난 2008년 첫 매장인 천안신부점을 성공시킨 이후 2번째 매장인 천안두정점까...</dd>
									</dl>
								</li>
														</ul>
						</div>
						<!-- /.storekeeperList -->
						<div class="btn_r"><a href="franchise_storyList.php" class="btnWhite01">성공창업 스토리 바로가기<img src="/html/images/common/icon_arrow_r01.gif" alt=""></a></div>
					</div>
					<!-- /.cont03 -->
</div>
<br>
<div class="container">
<c:if test="${empty sessionScope.userid }">
<div align="center">
<button type="button" class="btn col-md-offset-1 col-xs-2 col-md-offset-4" onclick="onlymember()">창업 문의</button>
</div>
</c:if>
<c:if test="${not empty sessionScope.userid }">
<div align="center">
<button type="button" class="btn col-md-offset-1 col-xs-2 col-md-offset-4"
  	onclick="location.href='<%=request.getContextPath()%>/franchise/addqna.js'">창업 문의</button>
</div>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>