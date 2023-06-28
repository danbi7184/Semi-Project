<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<title>Document</title>
	<style>
		* {
			font-family: 'Noto Sans KR', sans-serif;
			font-size: 14px;
		}
		
		caption {
			font-size: 20px;
			margin-top: 40px;
			margin-bottom: 20px;
		}
		
		button {
			border: 1px solid black;
			padding: 5px 7px;
		}
		
		select {
			padding: 5px;
		}
		
		input {
			padding: 5px;
		}
		
		#searchOption td:first-child {
			border-right: 1px solid lightgray;
		}
		
		#searchOption td:last-child {
		    padding-left: 25px;
		}
		
		#search, #clear {
			height: 40px;
			width: 100px;
		}
		
		#searchResult th, #searchResult td {
			border: 1px solid black;
		}
		
		#orderInquiry {
			margin-right: 100px;
		}
		
		#orderInquiry > section {
			margin-left: 100px;
		}
		
		.pagingArea {
			text-align: center;
		}
		
		.page {
			color: #696969;
			margin-left: 1px;
			margin-right: 1px;
			padding: 2px 7px; 
			border-radius: 20%;
		}
		
		.page:hover {
			text-decoration: underline;
		}
		
		.currentPage {
			color: black;
			background-color: lightgray;
		}
		
		a {
			color: black;
			text-decoration: none;
		}
		
		.previousPage::before {
			content: "◀";
		    font-size: 14px;
			margin-right: 5px; 
			vertical-align: baseline;
		}
		
		.previousPage::after {
			content: "|";
			margin-left: 10px;
			color: gray;
			font-size: 14px;
    		vertical-align: text-bottom;
		}
		
		.nextPage::before {
			content: "|";
			margin-right: 10px;
			color: gray;
			font-size: 14px;
    		vertical-align: text-bottom;
		}
		
		.nextPage::after {
			content: "▶";
		    font-size: 14px;
			margin-left: 5px;
			vertical-align: baseline;
		}
		
		@media screen and (max-width: 1400px) {
			#orderInquiry {
				margin-right: 50px;
			}
			
			#orderInquiry > section {
				margin-left: 50px;
			}
		}
 	</style>
</head>
<body>
	<script>
		const loginUser = '${loginUser}';
		if(loginUser == ''){
			  location.href='${ contextPath }';
		} else if('${loginUser.admin}' === 'N'){
			  location.href='${ contextPath }';
		}
	</script>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
	<section id="orderInquiry" class="d-flex flex-nowrap" style="min-height: 100vh;">
		<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">
			<a href="${ contextPath }" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
				<span class="fs-4">메인으로</span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto">
				<li class="nav-item">
					<a href="${contextPath}/mng_member.ad" class="nav-link text-white fs-5" aria-current="page">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#home"></use></svg>
						회원 관리
					</a>
				</li>
				<li>
					<a href="${contextPath}/checkPayment.ad" class="nav-link active text-white fs-5">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#speedometer2"></use></svg>
						주문 조회
					</a>
				</li>
				<li>
					<a href="${contextPath}/statistics.ad" class="nav-link text-white fs-5">
						<svg class="bi pe-none me-2" width="16" height="32"><use xlink:href="#table"></use></svg>
						통계
					</a>
				</li>
			</ul>
		</div>
		<section style="width: 100%; margin-bottom: 50px;">
			<table id="searchOption" class="table caption-top" style="height: fit-content;">
				<caption>주문 조회</caption>
				<thead>
					<tr>
						<th scope="col" colspan="2" class="bg-dark-subtle" style="height: 30px;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="100px" class="align-middle text-center">상품명</td>
						<td>
							<input type="search" id="productName" value="${ name }"/>
						</td>
					</tr>
					<tr>
						<td class="align-middle text-center">배송지</td>
						<td>
							<input type="search" id="address" value="${ address }"/>
						</td>
					</tr>
					<tr>
						<td class="align-middle text-center">주문일</td>
						<td>
							<button type="button" class="orderDate btn btn-light" name="date" value="0">오늘</button>
							<button type="button" class="orderDate btn btn-light" name="date" value="1">어제</button>
							<button type="button" class="orderDate btn btn-light" name="date" value="3">3일</button>
							<button type="button" class="orderDate btn btn-light" name="date" value="7">7일</button>
							<button type="button" class="orderDate btn btn-light" name="date" value="15">15일</button>
							<button type="button" class="orderDate btn btn-light" name="month" value="1">1개월</button>
							<button type="button" class="orderDate btn btn-light" name="month" value="3">3개월</button>
							<button type="button" class="orderDate btn btn-light" name="month" value="6">6개월</button>
							<br/>
							<input type="date" id="startDate" style="margin-top: 5px;" value="${ startDate }"/>&nbsp;-&nbsp;<input type="date" id="endDate" value="${ endDate }"/>
						</td>
					</tr>
					<tr>
						<td class="align-middle text-center">결제 수단</td>
						<td>
							<select name="payOption" id="payMethod">
								<option value="" <c:if test="${ empty payMethod }">selected</c:if>>모두</option>
								<option value="KG이니시스" <c:if test="${ payMethod == 'KG이니시스' }">selected</c:if>>KG이니시스</option>
								<option value="카카오페이" <c:if test="${ payMethod == '카카오페이' }">selected</c:if>>카카오페이</option>
								<option value="토스 간편결제" <c:if test="${ payMethod == '토스 간편결제' }">selected</c:if>>토스 간편결제</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="border-right: none;">
							<div style="text-align: right;">
								<button id="clear" type="button" class="btn btn-secondary">초기화</button>
								<button id="search" type="button" class="btn btn-primary">검색</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<c:if test="${ orderCount eq 0 }">
				<div id="message" style="margin-top: 60px;">조회 결과가 없습니다.</div>
			</c:if>
			<c:if test="${ orderCount gt 0}">
				<table id="searchResult" class="table caption-top" style="height: fit-content;">
					<caption style="font-size: 14px; color: black;">총 <span style="color: red;">${ orderCount }</span>건의 검색 결과가 있습니다.</caption>
					<thead>
						<tr>
							<th class="align-middle text-center">주문번호</th>
							<th class="align-middle text-center">회원번호</th>
							<th class="align-middle text-center">상품명</th>
							<th class="align-middle text-center">가격</th>
							<th class="align-middle text-center">개수</th>
							<th class="align-middle text-center">사이즈</th>
							<th class="align-middle text-center">배송지</th>
							<th class="align-middle text-center" width="10%">결제 수단</th>
							<th class="align-middle text-center">결제 금액</th>
							<th class="align-middle text-center">주문 일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ list }" var="op" varStatus="opStatus">
							<tr>
								<td class="align-middle text-center">${ op.orderNo }</td>
								<td class="align-middle text-center">${ op.memberNo }</td>
								<td class="align-middle text-center">${ op.productName }</td>
								<td class="align-middle text-center"><fmt:formatNumber value="${ op.productPrice }" pattern="#,###,###"/>원</td>
								<td class="align-middle text-center">${ op.count }</td>
								<td class="align-middle text-center">${ op.size }</td>
								<td class="align-middle text-center">${ op.orderAddress }</td>
								<td class="align-middle text-center">${ op.orderPayType }</td>
								<td class="align-middle text-center"><fmt:formatNumber value="${ op.orderPrice }" pattern="#,###,###"/>원</td>
								<td class="align-middle text-center">${ op.orderDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<br><br><br>
				<div class="pagingArea">
					<c:if test="${ pi.currentPage > 1 }">
						<c:url value="${ loc }" var="oplistBack">
							<c:param name="page" value="${ pi.currentPage -1 }"/>
							<c:param name="name" value="${ name }"/>
							<c:param name="address" value="${ address }"/>
							<c:param name="startDate" value="${ startDate }"/>
							<c:param name="endDate" value="${ endDate }"/>
							<c:param name="payMethod" value="${ payMethod }"/>
						</c:url>
						<a href="${ oplistBack }" class="previousPage">이전</a>
					</c:if>
				
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<span class="currentPage page">${ p }</span>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url value="${ loc }" var="oplistNum">
								<c:param name="page" value="${ p }"/>
								<c:param name="name" value="${ name }"/>
								<c:param name="address" value="${ address }"/>
								<c:param name="startDate" value="${ startDate }"/>
								<c:param name="endDate" value="${ endDate }"/>
								<c:param name="payMethod" value="${ payMethod }"/>
							</c:url>
							<a href="${ oplistNum }"><span class="page">${ p }</span></a>
						</c:if>
					</c:forEach>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url value="${ loc }" var="oplistNext">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="name" value="${ name }"/>
							<c:param name="address" value="${ address }"/>
							<c:param name="startDate" value="${ startDate }"/>
							<c:param name="endDate" value="${ endDate }"/>
							<c:param name="payMethod" value="${ payMethod }"/>
						</c:url>
						<a href="${ oplistNext }" class="nextPage">다음</a>
					</c:if>
				</div>
			</c:if>
		</section>
	</section>
	
	<script>
		// 로그인 유저가 관리자가 아니면 history.back()
		window.onload = () => {
			const now = new Date();
			const today = now.getFullYear() + "-" + ('0' + (now.getMonth() + 1)).slice(-2) + "-" + ('0' + now.getDate()).slice(-2);
			
			const startDate = document.querySelector("#startDate");		
			const endDate = document.querySelector("#endDate");
			startDate.setAttribute("max", today);
			endDate.setAttribute("max", today);
			
			if(${ empty startDate }) {
				startDate.value = today;
				endDate.value = today;
			}
			
			startDate.addEventListener('change', function() {
				if(this.value=='') {
					this.value = today;
				}
				
				if(this.value > endDate.value) {
					endDate.value = today;
				}
			});
			
			endDate.addEventListener('change', function() {
				if(this.value=='') {
					this.value = today;
				}
				if(this.value < startDate.value) {
					this.value = today;
				}
			});
			
			const orderDateBtns = document.querySelectorAll(".orderDate");
			for(const orderDateBtn of orderDateBtns) {
				orderDateBtn.addEventListener('click', function() {
					if(this.name === 'date') {
						const date = new Date(new Date().setDate(new Date().getDate() - this.value));
						const changedDate = date.getFullYear() + "-" + ('0' + (date.getMonth() + 1)).slice(-2) + "-" + ('0' + date.getDate()).slice(-2);
						startDate.value = changedDate;
					} else if(this.name === 'month') {
						const date = new Date(new Date().setMonth(new Date().getMonth() - this.value));
						const changedDate = date.getFullYear() + "-" + ('0' + (date.getMonth() + 1)).slice(-2) + "-" + ('0' + date.getDate()).slice(-2);
						startDate.value = changedDate;
					}
					endDate.value = today;
				});
			}
			
			const productName = document.querySelector('#productName');
			const address = document.querySelector('#address');
			const payMethod = document.querySelector('#payMethod');
			
			document.querySelector("#clear").addEventListener('click', ()=> {
				productName.value = '';
				address.value = '';
				startDate.value = today;
				endDate.value = today;
				payMethod.children[0].selected = true;
			});
			
			document.querySelector('#search').addEventListener('click', () => {
				location.href="${contextPath}/searchOrder.ad?name=" + document.querySelector('#productName').value.trim() + "&address=" + document.querySelector('#address').value.trim() 
						+ "&startDate=" + startDate.value + "&endDate=" + endDate.value + "&payMethod=" + document.querySelector('#payMethod').value; 
			});
			
			if(${ !empty list }) {
				const resultTable = document.querySelector('#searchResult');
				const trs = resultTable.querySelector('tbody').querySelectorAll('tr');
				let rowCount = 1;
				for(let i=1; i<trs.length; i++) {
					if(trs[i].children[0].innerText === trs[i-1].children[0].innerText) {
						rowCount++;
						trs[i].children[0].style.display = "none";
						trs[i].children[1].style.display = "none";
						trs[i].children[6].style.display = "none";
						trs[i].children[7].style.display = "none";
						trs[i].children[8].style.display = "none";
						trs[i].children[9].style.display = "none";
					} else {
						if(rowCount > 1) {
							trs[i - rowCount].children[0].rowSpan = rowCount;
							trs[i - rowCount].children[1].rowSpan = rowCount;
							trs[i - rowCount].children[6].rowSpan = rowCount;
							trs[i - rowCount].children[7].rowSpan = rowCount;
							trs[i - rowCount].children[8].rowSpan = rowCount;
							trs[i - rowCount].children[9].rowSpan = rowCount;
						}
						rowCount = 1;
					}
				}
				if(rowCount > 1) {
					trs[trs.length - rowCount].children[0].rowSpan = rowCount;
					trs[trs.length - rowCount].children[1].rowSpan = rowCount;
					trs[trs.length - rowCount].children[6].rowSpan = rowCount;
					trs[trs.length - rowCount].children[7].rowSpan = rowCount;
					trs[trs.length - rowCount].children[8].rowSpan = rowCount;
					trs[trs.length - rowCount].children[9].rowSpan = rowCount;
				}
			}
		} 
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>