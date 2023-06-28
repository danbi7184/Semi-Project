<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 메인</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
*{font-family:'Noto Sans KR', sans-serif; font-size: 12px;}
ul{font-size: 18px;}
a{color: black; font-size: 18px; text-decoration: none !important;}
.title{background-color: lightgrey; width: 50%; height: 6vh; text-align: center; margin-bottom: 7%;
	   display: flex; align-items: center; font-size: 22px; justify-content: center; font-weight: bold; }
.title>a:hover{color:black;}	   
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/navbar.jsp"/>
	</div>
	<div class="container" style="margin-left: 21%; margin-top: 10%;">
		 <div class="row" style="margin-bottom: 10%">
		      <div class="col-sm-6">
		        <div class=title>
		        	회원관리
		        </div>
		        <ul>
 				  <li><a href="${contextPath}/memberSelectUpdate.me">회원 목록 조회 및 수정</a></li>
		          <li><a href="${contextPath}/memberSales.me">회원 매출</a></li>	  
		        </ul>
		      </div>
		      <div class="col-sm-6">
		        <div class=title>
		        	주문관리
		        </div>
		        <ul>
		          <li><a href="${contextPath}/checkPayment.ad">전체 주문 조회</a></li>
		        </ul>
		      </div>
    	</div>		
    	<div class="row">
		      <div class="col-sm-6">
		        <div class=title>
		        	통계
		        </div>
		        <ul>
		          <li><a href="${contextPath}/statistics.ad">통계</a></li>
		        </ul>
		      </div>
		      <div class="col-sm-6">
		        <div class=title>
		        	고객지원 관리
		        </div>
		        <ul>
		          <li><a href="${contextPath}/faqManagement.bo">FAQ 관리</a></li>
		          <li><a href="${contextPath}/noticeUpdate.bo">공지사항 및 수정</a></li>
		        </ul>
		      </div>
    	</div>
	</div><br><br><br><br><br><br>
	<div class="container">
		<jsp:include page="../common/footer.jsp"/>
	</div>
</body>
</html>