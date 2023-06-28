<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Passion for Fashion</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paymentCompleteStyle.css">
</head>
<body>
	<jsp:include page="../common/navbar.jsp"/>
	<section id="payment">
    <div id="pointInfo">
		<table class="table marginTopMediumLarge">
			<tr scope="col">
				<td scope="row" rowspan="2" width="10%" class="pointInfoTd">혜택정보</td>
				<td colspan="2" width="80%">${ loginUser.memberName } 님은 [${ loginUser.grade } 회원]이십니다.</td>
			</tr>
			<tr scope="col">
				<td width="15%" class="b">가용적립금: <fmt:formatNumber value="${ loginUser.point }" pattern="#,###,###"/>원</td>
				<td class="b">쿠폰: 0개</td>
			</tr>
		</table>
    </div>

	<div id="paymentCompleteMessage">
		<div>고객님의 주문이 완료 되었습니다.</div>
		<div>주문내역 및 배송에 관한 안내는 <span><a href="#" class="b">주문조회</a></span>를 통하여 확인 가능합니다.</div>
		<div>주문 번호 : ${ order.orderNo }</div>
		<div>주문 일자 : <fmt:formatDate value="${ order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	</div>

	<div id="paymentInfo" class="marginTopMediumLarge">
		<table class="table">
		  <legend>결제 정보</legend>
			<tbody class="borderTop">
				<tr>
					<td width="15%">최종결제금액</td>
					<td><fmt:formatNumber value="${ order.orderPrice }" pattern="#,###,###"/>원</td>
				</tr>
				<tr>
					<td>결제 수단</td>
					<td><div>${ order.orderPayType }</div></td>
				</tr>
			</tbody>
		</table>
	</div>
  
	<div id="paymentItem" class="marginTopMediumLarge">
		<table class="table" id="paymentTable" class="marginTopMedium">
			<legend>주문 상품 정보</legend>
			<thead class="borderTop">
			  <tr>
			    <th scope="col">이미지</th>
			    <th scope="col">상품정보</th>
			    <th scope="col">판매가</th>
			    <th scope="col">수량</th>
			    <th scope="col">적립금</th>
			    <th scope="col">배송구분</th>
			    <th scope="col">배송비</th>
			    <th scope="col">합계</th>
			  </tr>
			</thead>
			<tbody>
				<c:forEach items="${ opList }" var="product">
					<c:set var="eachSum" value="${ product.productPrice*(100-product.discountRate)/100 * product.count }"/>
					<c:set var="point" value="${ eachSum * 3 / 100 }" scope="page"/>
					<c:set var="originalSum" value="${ originalSum + product.productPrice*product.count }" />
					<c:set var="saleSum" value="${ saleSum + eachSum }" />
					<c:set var="pointSum" value="${ pointSum + point }" scope="page" />
					<tr>
						<td><img src="${contextPath}/resources/product_img/${product.productMainPic}" alt="상품 사진" width="80px"></td>
						<td>
							<div class="itemName">${ product.productName }</div>
							<div class="itemOption marginTopMicro">[옵션: ${ product.size }]</div>
						</td>
						<td>
							<c:if test="${ product.discountRate ne 0}">
								<div class="originalPrice">
									<fmt:formatNumber value="${ product.productPrice }"	pattern="#,###,###" />원
								</div>
								<div class="`marginTopMicro">
									<fmt:formatNumber value="${ product.productPrice*(100-product.discountRate)/100 }" pattern="#,###,###" />원
								</div>
							</c:if> 
							<c:if test="${ product.discountRate eq 0 }">
								<div>
									<fmt:formatNumber value="${ product.productPrice }"	pattern="#,###,###" />원
								</div>
							</c:if>
						</td>
						<td>${ product.count }</td>
						<td><fmt:formatNumber value="${ point }" pattern="#,###,###"/>원</td>
						<td>
							<div>기본배송</div>
							<div>(해외배송 가능)</div>
						</td>
						<td>[무료]</td>
						<td><fmt:formatNumber value="${ eachSum }" pattern="#,###,###" />원</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="1" style="padding: 15px">[기본배송]</td>
					<td colspan="7" class="textRight">상품 구매 금액 <fmt:formatNumber value="${ originalSum }" pattern="#,###,###" />원 
						+ 배송비 0 (무료) - 상품 할인 금액 <fmt:formatNumber value="${ originalSum - saleSum }" pattern="#,###,###" /> = 합계 : <fmt:formatNumber value="${ saleSum }" pattern="#,###,###" />원
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
    
	<div id="paymentPrice" class="marginTopMediumLarge">
		<table class="table">
			<tbody>
				<tr>
					<td>총 주문 금액</td>
					<td>총 결제 금액</td>
				</tr>
				<tr>
					<td><span class="price"><fmt:formatNumber value="${ originalSum }" pattern="#,###,###" /></span>원</td>
					<td><span class="price"><fmt:formatNumber value="${ order.orderPrice }" pattern="#,###,###" /></span>원</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="paymentPoint" class="marginTopMedium">
		<table class="table">
			<tbody class="borderTop">
				<tr>
					<td width="15%">총 적립예정금액</td>
					<td><fmt:formatNumber value="${ pointSum }" pattern="#,###,###"/>원</td>
				</tr>
				<tr>
					<td>상품별 적립금</td>
					<td><fmt:formatNumber value="${ pointSum }" pattern="#,###,###"/>원</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="paymentAdress" class="marginTopMediumLarge">
	<table class="table">
		<legend>배송지정보</legend>
		<tbody class="borderTop">
			<tr>
				<td width="15%">받으시는분</td>
				<td>${ order.orderName }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${ order.orderAddress }</td>
			</tr>
			<tr>
				<td>일반전화</td>
				<td>
					<c:if test="${ !empty order.orderHomePhone }">
							${ order.orderHomePhone }
					</c:if> 
					<c:if test="${ empty order.orderHomePhone }">
						-
					</c:if>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>${ order.orderPhone }</td>
			</tr>
			<tr>
				<td>배송메시지</td>
				<td>${ order.orderMessage }</td>
			</tr>
		</tbody>
	</table>
	</div>
    
	<div id="buttonDiv">
		<button type="button" id="moreShopping" class="buttonDivBtn" onclick="javascript:location.href='${contextPath}/productList.pr?productType=상의'">쇼핑계속하기</button>
		<button type="button" id="checkOrder" class="buttonDivBtn">주문확인하기</button>
	</div>

	<div id="descriptionDiv">
		<div>이용안내</div>
		<div class="descriptionContent">
			배송은 결제완료 후 지역에 따라 1일 ~ 3일 가량이 소요됩니다.<br/>
			상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수 있습니다.<br/>
			주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고하십시오.
		</div>
		<div>세금계산서 발행 안내</div>
		<div class="descriptionContent">
			부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.<br/>
			세금계산서는 사업자만 신청하실 수 있습니다.<br/>
			배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</br>
		</div>
		<div>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경 안내</div>
		<div class="descriptionContent">
			변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며<br/>
			신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)<br/>
			상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.
		</div>
		<div>현금영수증 이용안내</div>
		<div class="descriptionContent">
			현금영수증은 1원 이상의 현금성거래(무통장 입금, 에스크로, 예치금)에 대해 발행이 됩니다.<br/>
			현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.<br/>
			발행신청 기간제한 현금영수증은 입금확인일로부터 48시간안에 발행을 해야 합니다.<br/>
			현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경될 수 있습니다.)<br/>
			현금영수증이나 세금계산서 중 하나만 발행 가능합니다.
		</div>
	</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>