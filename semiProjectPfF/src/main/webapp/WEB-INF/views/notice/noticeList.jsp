<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터</title>
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
body{font-family:'Noto Sans KR', sans-serif; }
.button{background-color: white; color: black; border: 1px solid lightgrey; width:90px; height:33px; margin-bottom:4px; border-style: solid;}
.date{border: 1px solid lightgrey; height:33px;}
#dateSpan{margin-left:15px;}
#selectContent{width: 180px; height: 33px; margin-left: 15px; border: 1px solid lightgrey;}
#selectSpan{margin-left: 25px;}
#select{background-color: dimgrey; color: white; border-style: none; font-weight:bold; 
		width: 110px; height: 33px;}
.list{font-size: 18px;}
div>a{text-decoration: none !important;}
div>a:hover{text-decoration: none !important;}
.content-row {background-color: lightgray; display: flex; align-items: center;}
.tdInfor{ height: 30vh; vertical-align: middle; font-weight: bold; }
img{overflow-clip-margin: context-box; overflow:clip;}
</style>

</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>	
	<div class="container">
		<h2 style="text-align:center;">인클루드(헤더)</h2>
	</div>
	<br><br><br><br><br>
	<div class="container list">
		<h3>공지사항</h3>
		<hr style="height: 3px;"><br>
		<div class="row">	
			<div class="col-xs-12">
				<div class="btn-group" role="group" aria-label="Button Group">
				  <input type="radio" class="btn-check" name="options" id="option1" autocomplete="off">
				  <label class="btn btn-secondary button" for="option1">1주일</label>
				  <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
				  <label class="btn btn-secondary button" for="option2">1개월</label>
				  <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
				  <label class="btn btn-secondary button" for="option3">3개월</label>
				  <input type="radio" class="btn-check" name="options" id="option4" autocomplete="off">
				  <label class="btn btn-secondary button" for="option4">전체 시기</label>
				  <span id="dateSpan">
				  	<input type="date" id="startDate" class="date" name="startDate">-<input type="date" class="date" name="endDate">
				  </span>
				  <select id="selectContent" name="select">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="titleContent">제목+내용</option>
				  </select>		
				  <span id="selectSpan">
				  	<button type="button" id="select">조회</button>
				  </span>
				</div>
			</div>  
		</div>
		<table class="table table-hover mx-auto"> <!-- 게시판 목록 -->
			<thead>
			<tr>
				<th>NOTICE</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${ nlist }" var="n">
	        <tr class= "questionTr"onclick="toggleContent(this)" style="cursor:pointer">
	        	<td>${ n.noticeNo }</td>
	          	<td class="titleCell">${ n.noticeTitle }</td>
	          	<td>${ n.noticeWriter}</td>
	          	<td>${ n.noticeCreateDate }</td>
	          	<td>${ n.noticeUpdateDate }</td>
	          	<td>${ n.noticeCount }</td>
	        </tr>
	        <tr class="content-row" style="display:none;">
				<td class="tdInfor">
					<p>&lt;안내&gt;</p>
				</td>
				<td colspan="5">
					<p style="word-break:break-all;">
						${ n.noticeContent }
						<c:forEach items="" var="p">
							<c:if test="${ n.noticeNo eq p.pictureRefBoardNo }">
								<c:if test="${ fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png') }">
									<img src="${ contextPath }/resources/uploadFiles/${ p.newName }">
								</c:if>			
								<c:if test="${ !(fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png')) }">
									<img></img>
								</c:if>
							</c:if>
						</c:forEach>	
					</p>
				</td>
			</tr>	
	        </c:forEach>		
			</tbody>
		</table><br>	
		<nav aria-label="Page navigation example" style="margin-bottom: 5%;"> <!-- 페이지 넘어가는 버튼 -->
			  <ul  class="pagination" style="justify-content: center;">
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goBack">
	            		<c:param name="page" value="${ pi. currentPage - 1}"/>
	            	</c:url>
			    	<a class="page-link" href="${ goBack }" aria-label="Previous">
			        	<span style="color: black;" aria-hidden="true">&laquo;</span>
			    	</a>
			    </li>
			    
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
	            		<c:param name="page" value="${ p }"/>
	            	</c:url>
			    <li class="page-item">
			     	<a class="page-link" style="color: black;" href="${ goNum }">${ p }</a>
			    </li>
			    </c:forEach>
			    <li class="page-item">
			    	<c:url value="${ loc }" var="goNext">
	            		<c:param name="page" value="${ pi.currentPage + 1 }"/>
	            	</c:url>
			    	<a class="page-link" href="${ goNext }" aria-label="Next">
			      		<span style="color: black;" aria-hidden="true">&raquo;</span>
			    	</a>
			    </li>
			  </ul>	  
		</nav>
		</div>
		<br><br><br>
		<div class="container">
			<div class="row"  style="margin-left: 15%"> <!-- 문의 목록 선택 -->
				<c:if test="${ !empty loginUser }">
				<div class="col-sm-4">
					<a onfocus="this.blur()" style="font-weight: bold;  font-size: 25px; font-style: normal; color: dimgrey;" href="{ contextPath }/writeQA.bo">
					<i class="bi bi-patch-question"></i>&nbsp;&nbsp;1:1문의하기
					</a>
				</div>
				</c:if>
				<c:if test="${ !empty loginUser }">
				<div class="col-sm-4">	
					<a onfocus="this.blur()" style="font-size: 25px; font-weight: bold; color: dimgrey;" href="{ contextPath }/myQuestion.bo">
					<i class="bi bi-person-fill"></i>&nbsp;&nbsp;내&nbsp;&nbsp;질문
					</a>
				</div>
				</c:if>
				<c:if test="${ !empty loginUser }">
				<div class="col-sm-4">	
					<a onfocus="this.blur()" style="font-size: 25px; font-weight: bold; color: dimgrey;" href="{ contextPath }/myOrder.pr">
						<i class="bi bi-truck"></i>&nbsp;&nbsp;내&nbsp;&nbsp;주문
					</a>
				</div>
				</c:if>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br>
		<div class="container">
			<h2 style="text-align:center;">인클루드(풋터)</h2>
		</div>
		
		<script>
		function toggleContent(row) {
		    const contentRow = row.nextElementSibling;
		    if (contentRow.style.display === 'none') {
		      contentRow.style.display = 'table-row';
		    } else {
		      contentRow.style.display = 'none';
		    }
		  }
		
		// 제목이 30글자 이상 넘어가면 30글자 이상부터 ..으로 대체
		const titleCells = document.getElementsByClassName("titleCell");

		for (let i = 0; i < titleCells.length; i++) {
		  const titleCell = titleCells[i];
		  const title = titleCell.textContent;
		
		  if (title.length > 30) {
		    const shortenedTitle = title.substring(0, 30) + "..";
		    titleCell.textContent = shortenedTitle;
		  }
		}
		
		
		// 공지사항 내용
		window.onload(){
			const tds = document.querySelectorAll('.questionTr td');
			for(const td of tds){
				td.addEventListener('click', function(){
					const trTds = this.parentElement.children;
					const noticeNo = trTds[0].innerText;
					const noticeWriter = trTds[2].innerText;
					location.href='${contextPath}/selectNotice.bo?nId=' + noticeNo + '&writer=' + noticeWriter + '&page=' + ${pi.currentPage};
				});
			}
		}
		</script>	
		
</body>
</html>