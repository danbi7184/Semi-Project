<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의목록</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--  부트스트랩 아이콘 이용  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

<style>
body{font-family:'Noto Sans KR', sans-serif; font-size: 18px}
.button{background-color: white; color: black; border: 1px solid lightgrey; width:90px; height:33px; margin-bottom:4px; border-style: solid;}
.date{border: 1px solid lightgrey; height:33px;}
#dateSpan{margin-left:15px;}
#selectContent{width: 180px; height: 33px; margin-left: 15px; border: 1px solid lightgrey;}
#selectSpan{margin-left: 25px;}
#select{background-color: dimgrey; color: white; border-style: none; font-weight:bold; 
		width: 110px; height: 33px;}
#question{width: 100px; height: 35px; background-color: royalblue; color: white; border-style: none; font-weight: bold; margin-left: 20px; border-radius: 5px;}	
.content-row {background-color: lightgray; display: flex; align-items: center;}
.tdInfor{ height: 30vh; vertical-align: middle; font-weight:bold; width:16.5%}	 
td>span{margin-left:20px;} 		  
</style>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath"/>
	<div class="container">
		<jsp:include page="../common/navbar.jsp"></jsp:include>
	</div>
	<div class="container" style="max-width: 1200px; margin-top: 50px; margin-bottom: 50px;">
		<h3 style="display: inline;">1:1 문의</h3>
		<button type="button" id="question" onclick="location.href='${ contextPath }/writeQA.qa'">문의하기</button>
		<table class="table table-hover mx-auto" style="margin-top: 30px; text-align: center;"> <!-- 게시판 목록 -->
			<thead>
			<tr>
				<th width="10%">문의유형</th>
				<th width="40%">제목</th>
				<th width="20%">주문번호</th>
				<th width="20%">작성일</th>
				<th width="10%">처리 상태</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td style="cursor:pointer">교환/취소</td>
				<td class="titleCell"style="cursor:pointer">환불처리부탁드립니다</td>
				<td style="cursor:pointer">123223333222</td>
				<td style="cursor:pointer">2023-04-30</td>
				<td>답변 완료</td>
			</tr>
			</tbody>
		</table>
		
		<br/>
	
		<nav aria-label="Page navigation example" style="margin-bottom: 5%;"> <!-- 페이지 넘어가는 버튼 -->
			  <ul  class="pagination" style="justify-content: center;">
			    <li class="page-item">
			    	<a class="page-link" href="#" aria-label="Previous">
			        	<span style="color: black;" aria-hidden="true">&laquo;</span>
			    	</a>
			    </li>
			    <li class="page-item">
			     	<a class="page-link" style="color: black;" href="#">1</a>
			    </li>
			    <li class="page-item">
			    	<a class="page-link" style="color: black;" href="#">2</a>
			    </li>
			    <li class="page-item">
			    	<a class="page-link" style="color: black;" href="#">3</a>
			    </li>
			    <li class="page-item">
			    	<a class="page-link" style="color: black;" href="#">4</a>
			    </li>
			    <li class="page-item">
			    	<a class="page-link" style="color: black;" href="#">5</a>
			    </li>
			    <li class="page-item">
			    	<a class="page-link" href="#" aria-label="Next">
			      		<span style="color: black;" aria-hidden="true">&raquo;</span>
			    	</a>
			    </li>
			  </ul>	  
		</nav>		
		
		</div>
		<div class="container">
			<h2 style="text-align:center;"><jsp:include page="../common/footer.jsp"></jsp:include></h2>
		</div>
		<script>
		
		// 제목이 40글자 넘어가면 40글자부터 ..으로 대체
		const titleCells = document.getElementsByClassName("titleCell");

		for (let i = 0; i < titleCells.length; i++) {
		  const titleCell = titleCells[i];
		  const title = titleCell.textContent;
		
		  if (title.length > 40) {
		    const shortenedTitle = title.substring(0, 40) + "..";
		    titleCell.textContent = shortenedTitle;
		  }
		}
	</script>
</body>
</html>