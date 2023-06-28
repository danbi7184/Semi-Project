<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paymentStyle.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Passion for Fashion</title>
<script>
	function noEvent() {
	    if (event.keyCode == 116) {
	        event.keyCode= 2;
	        return false;
	    }
	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
	    {
	        return false;
	    }
	}
	document.onkeydown = noEvent;
</script>
</head>
<body oncontextmenu="return false">
	<c:if test="${ !empty loginUser.memberAddress }">
		<jsp:include page="../common/navbar.jsp"/>
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
		<section id="payment">
			<div id="pointInfo">
				<button type="button" id="backBtn" onclick="javascript:history.back()">이전페이지</button>
				<table class="table marginTopMediumLarge">
					<tr scope="col">
						<td scope="row" rowspan="2" width="10%" class="pointInfoTd">혜택정보</td>
						<td colspan="2" width="80%">${ loginUser.memberName }님은 [${ loginUser.grade } 회원]이십니다.</td>
					</tr>
					<tr scope="col">
						<td width="15%" class="b">가용적립금: <fmt:formatNumber value="${ loginUser.point }" pattern="#,###,###"/>원</td>
						<td class="b">쿠폰: 0개</td>
					</tr>
				</table>
			</div>
	
			<div id="paymentItem">
				<table class="table" id="paymentTable" class="marginTopMedium">
					<thead>
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
						<c:set var="productInfo" value="" scope="page"/>
						<c:set var="delimiterS" value="/" scope="page"/>
						<c:set var="delimiterA" value="&" scope="page"/>
	<%-- 					<c:set var="originalSum" value="0" scope="page"/> --%>
	<%-- 					<c:set var="saleSum" value="0" scope="page"/> --%>
	<%-- 					<c:set var="pointSum" value="0" scope="page"/> --%>
						<c:if test="${ productList.size() eq 1  }">
							<c:set var="payProductName"	value="${ productList[0].productName }" scope="page" />
						</c:if>
						<c:if test="${ productList.size() gt 1  }">
							<c:set var="payProductName"	value="${ productList[0].productName } 외 ${ productList.size() - 1 }건"	scope="page" />
						</c:if>
	
						<c:forEach items="${ productList }" var="product">
							<c:set var="productInfo" value="${productInfo}${ product.productNo }${ delimiterS }${ product.buyCount }${ delimiterS }${ product.size }${ delimiterS }${ delimiterA }"/>
							<c:set var="eachSum" value="${ product.productPrice*(100-product.discountRate)/100 * product.buyCount }" />
							<c:set var="originalSum" value="${ originalSum + product.productPrice*product.buyCount }" />
							<c:set var="saleSum" value="${ saleSum + eachSum }" />
							<c:set var="point" value="${ eachSum * 3 / 100 }" scope="page"/>
							<c:set var="pointSum" value="${ pointSum + point }" scope="page" />
							
							<tr>
								<td width="15%"><img src="${contextPath}/resources/product_img/${product.productMainPic}" alt="상품 사진" width="80px"></td>
								<td width="20%">
									<div class="itemName">${ product.productName }</div> 
									<div class="itemOption marginTopMicro">[옵션: ${ product.size }]<br/>
									</div>
								</td>
								<td width="15%">
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
								<td width="5%">${ product.buyCount }</td>
								<td width="10%"><span class="pointBtn">적</span>&nbsp;<fmt:formatNumber value="${ point }" pattern="#,###,###" />원</td>
								<td width="13%">
									<div>기본배송</div>
									<div>(해외배송 가능)</div>
								</td>
								<td width="7%">[무료]</td>
								<td width="15%"><fmt:formatNumber value="${ eachSum }" pattern="#,###,###" />원</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">[기본배송]</td>
							<td colspan="7" class="textRight">상품 구매 금액 <fmt:formatNumber value="${ originalSum }" pattern="#,###,###" />원 + 배송비 0 (무료) -
								상품 할인 금액 <fmt:formatNumber value="${ originalSum - saleSum }" pattern="#,###,###" /> = 합계 : <fmt:formatNumber value="${ saleSum }" pattern="#,###,###" />원
							</td>
						</tr>
					</tfoot>
				</table>
				<div class="changeInfo">※ 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</div>
			</div>
	
			<div id="paymentInfo" class="marginTopMediumLarge">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="2" width="80%">주문 정보</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row" width="20%">주문하시는 분</td>
							<td colspan="2" class="verticalCenter" name="infoTd">${ loginUser.memberName }</td>
						</tr>
						<tr>
							<td scope="row" width="20%">주소</td>
							<td colspan="2" class="verticalCenter" name="infoTd">${ loginUser.memberAddress }</td>
						</tr>
						<tr>
							<td scope="row" width="20%">일반전화</td>
							<td colspan="2" class="verticalCenter" name="infoTd">
								<c:if test="${ !empty loginUser.memberHomePhone }">
										${ loginUser.memberHomePhone }
								</c:if> 
								<c:if test="${ empty loginUser.memberHomePhone }">
									-
								</c:if>
							</td>
						</tr>
						<tr>
							<td scope="row" width="20%">휴대전화</td>
							<td colspan="2" class="verticalCenter" name="infoTd">${ loginUser.memberPhone }</td>
						</tr>
						<tr>
							<td scope="row" width="20%">이메일</td>
							<td colspan="2" class="verticalCenter">${ loginUser.memberEmail }</td>
						</tr>
					</tbody>
				</table>
	
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="2" width="80%">배송 정보</th>
							<th class="requiredInfo" width="30%">필수입력사항</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row" width="20%">배송지 선택</td>
							<td colspan="2"><input type="radio" id="sameAddress" name="addressChoice" checked><label for="sameAddress">주문자 정보와 동일</label> 
								<input type="radio" id="newAddress" name="addressChoice"><label for="newAddress">새로운 배송지</label>
							</td>
						</tr>
						<tr>
							<td scope="row" class="required" width="20%">받으시는 분</td>
							<td colspan="2" name="inputTd" class="verticalCenter">${ loginUser.memberName }</td>
						</tr>
						<tr>
							<td scope="row" class="required" width="20%">주소</td>
							<td colspan="2" name="inputTd" class="verticalCenter">${ loginUser.memberAddress }
							</td>
						</tr>
						<tr>
							<td scope="row" width="20%">일반전화</td>
							<td colspan="2" name="inputTd" class="verticalCenter">
								<c:if test="${ !empty loginUser.memberHomePhone }">
										${ loginUser.memberHomePhone }
								</c:if>
								<c:if test="${ empty loginUser.memberHomePhone }">
									-
								</c:if>
							</td>
						</tr>
						<tr>
							<td scope="row" class="required" width="20%">휴대전화</td>
							<td colspan="2" name="inputTd" class="verticalCenter">${ loginUser.memberPhone }
							</td>
						</tr>
						<tr>
							<td scope="row" class="required" width="20%">배송메시지</td>
							<td colspan="2">
								<select id="deliverySelect"	style="padding: 5px; display: block;">
									<option selected>직접 입력</option>
									<option>부재 시 경비실에 맡겨주세요.</option>
									<option>배송 전 연락바랍니다.</option>
									<option>부재 시 휴대폰으로 연락바랍니다.</option>
									<option>안내데스크(문서수발실)에 위탁 후 문자 부탁드립니다.</option>
								</select> 
								<input tye="text" id="deliveryMessage" class="message" maxlength="30" placeholder="배송메시지를 입력해주세요." />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	
			<div id="paymentPrice">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="3">결제 예정 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="priceInfo">총 주문 금액</td>
							<td class="priceInfo">총 할인 + 부가 결제 금액</td>
							<td class="priceInfo">총 결제 예정 금액</td>
						</tr>
						<tr>
							<td class="priceInfo"><span class="price"><fmt:formatNumber value="${ originalSum }" pattern="#,###,###" /></span>원</td>
							<td class="priceInfo"><span class="price" style="color: #f05454;" name="changeablePrice"><fmt:formatNumber value="${ originalSum - saleSum }" pattern="#,###,###" /></span>원</td>
							<td class="priceInfo b"><span class="price" name="changeablePrice"><fmt:formatNumber value="${ saleSum }" pattern="#,###,###" /></span>원</td>
						</tr>
						<tr>
							<td width="20%" class="paymentPriceTdBorder">총 할인금액</td>
							<td colspan="2" class="allSalePrice"><fmt:formatNumber value="${ originalSum - saleSum }" pattern="#,###,###" />원</td>
						</tr>
						<tr>
							<td width="20%" class="paymentPriceTdBorder">총 부가결제금액</td>
							<td colspan="2">0원</td>
						</tr>
						<tr>
							<td width="20%" class="paymentPriceTdBorder">적립금</td>
							<td colspan="2">
								<button id="useAllPoint">전액사용</button> 
								<input type="text" id="usePoint" style="text-align: right;" value="0"/>원 (총 사용가능 적립금: <span class="priceRed">${ loginUser.point>=3000? 3000 : loginUser.point }</span>원)
								<br/><br/> 
								- 적립금은 최소 0 이상일 때 결제가 가능합니다.<br/> 
								- 최대 사용금액은 제한이 없습니다.<br/>
								- 1회 구매 시 적립금 최대 사용금액은 3,000원입니다.<br/> 
								- 적립금으로만 결제할 경우, 결제 금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.<br/>
							<br />
							</td>
						</tr>
						<tr>
							<td width="20%" class="paymentPriceTdBorder">쿠폰</td>
							<td colspan="2">
								<button id="useCoupon">쿠폰사용</button> 
								<input type="text" id="useCouponInput" style="text-align: right;" value="0" readonly/>원
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	
			<div id="paymentType">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="4">결제 수단</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="75%">
								<input type="radio" name="payType" id="kgInicis" value="html5_inicis" checked><label for="kgInicis">KG이니시스</label>
								<input type="radio" name="payType" id="kakaoPay" value="kakaopay"><label for="kakaoPay">카카오페이</label>
								<input type="radio" name="payType" id="tossPay" value="tosspay"><label for="tossPay">토스 간편결제</label>
							</td>
							<td rowspan="2">
								<div class="textRight marginTopMicro">최종결제 금액</div>
								<div class="textRight marginTopSmall">
									<span class="finalPrice"><fmt:formatNumber value="${ saleSum }" pattern="#,###,###" /></span>원
								</div>
								<button type="button" id="payBtn" class="marginTopSmall">결제하기</button>
							</td>
						</tr>
						<tr>
							<td rowspan="3">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</td>
						</tr>
						<tr>
							<td>
								<div class="finalPointInfo">총 적립예정 금액 <span class="priceRed finalPoint"><fmt:formatNumber value="${ pointSum }" pattern="#,###,###" />원</span></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="finalPointInfo">상품별 적립금 <span class="finalPoint"><fmt:formatNumber value="${ pointSum }" pattern="#,###,###" />원</span></div>
								<div class="finalPointInfo">회원 적립금 <span class="finalPoint">0원</span></div>
								<div class="finalPointInfo">쿠폰 적립금 <span class="finalPoint">0원</span>	</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	
			<div id="descriptionDiv" class="marginTopSmall">
				<div>무이자 할부 이용안내</div>
				<div class="descriptionContent" style="margin-left: 10px;">
					무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.<br/> 
					무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
				</div>
			</div>
	
			<div id="descriptionDiv" style="margin-top: 25px;">
				<div>세금계산서 발행 안내</div>
				<div class="descriptionContent">
					부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.<br/>
					세금계산서는 사업자만 신청하실 수 있습니다.<br/> 
					배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.
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
					현금영수증 발행	금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.<br/> 
					발행신청 기간제한 현금영수증은 입금확인일로부터 48시간안에 발행을 해야 합니다.<br/> 
					현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경될 수 있습니다.)<br/> 
					현금영수증이나 세금계산서 중 하나만 발행 가능합니다.
				</div>
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
	</c:if>

	<script>
	// 나중에 로그인 안 되어있을 시 로그인 후 이용해달라는 메시지 띄우고 화면 이동
	window.onload = () => {
		const loginUser = '${loginUser}';
		let memberNo;
		if(loginUser == ''){
			alert('로그인 후 이용해주세요.');
			location.href='${contextPath}/loginView.me';
		} else if('${ loginUser.memberAddress }' == '') {
			alert('추가 정보 입력이 필요합니다.');
			location.href='${contextPath}/kakaoAddInfo.me';
		} else {
			memberNo = '${loginUser.memberNo}'
		}		
		
		let orderName;
		let orderHomePhone;
		let orderPhone;
		let orderAddress;
		let buyerMessage;
		
		const zipCodeAPI = () => {
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                let extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                } 
	                
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.querySelector(".inputZipCode").value = data.zonecode;
	                const inputAddresses = document.querySelectorAll(".inputAddress");
	                if(extraAddr === '') {
	                	inputAddresses[0].value = addr;
	                } else {
	                	inputAddresses[0].value = addr + extraAddr;
	                }
	                
// 	                커서를 상세주소 필드로 이동한다.
					inputAddresses[1].value = '';
					inputAddresses[1].focus();
	            }
	        }).open();
		}
		
		const addressChoices = document.getElementsByName("addressChoice");
		const infoTds = document.getElementsByName("infoTd");
		const inputTds = document.getElementsByName("inputTd");
		
		const sameAddress = () => {
			document.querySelector('#deliverySelect').children[0].selected = true;
			document.querySelector('#deliveryMessage').type = 'text';
			document.querySelector('#deliveryMessage').value = '';
			for(let i=0; i<inputTds.length; i++) {
				inputTds[i].innerHTML = infoTds[i].innerText;
			}
		}
		
		const newAddress = () => {
			inputTds[0].innerHTML = '<input type="text" placeholder="홍길동" class="orderName"/>';
			
			inputTds[1].innerHTML = '<input type="number" class="inputZipCode" readonly/>';
			inputTds[1].innerHTML += '<button type="button" class="zipCode">우편번호</button><br>';
			inputTds[1].innerHTML += '<input type="text" class="marginTopMicro inputAddress" placeholder="우편번호 버튼을 통해 기본 주소를 선택해주세요." readonly/><span class="addressInfo">기본주소</span><br>';
			inputTds[1].innerHTML += '<input type="text" class="marginTopMicro inputAddress" placeholder="나머지 주소를 입력해주세요."/><span class="addressInfo">나머지주소</span>';
			
			inputTds[2].innerHTML = '<input type="text" style="width: 50px" class="inputPhone homePhone" maxlength="3" placeholder="02"/>'
			inputTds[2].innerHTML += '-&nbsp;<input type="text" class="inputPhone homePhone" maxlength="4"/>-&nbsp;<input type="text" class="inputPhone homePhone" maxlength="4"/>';
			
			inputTds[3].innerHTML = '<input type="text" class="inputPhone cellphone" style="width: 50px" value="010" maxlength="3"/>';
			inputTds[3].innerHTML += '-&nbsp;<input type="text" class="inputPhone cellphone" maxlength="4"/>-&nbsp;<input type="text" class="inputPhone cellphone" maxlength="4"/>';
			document.querySelector('#deliverySelect').children[0].selected = true;
			document.querySelector('#deliveryMessage').type = 'text';
			document.querySelector('#deliveryMessage').value = '';
		}
		
		addressChoices[0].addEventListener('click', () => {
			sameAddress();
		});
		
		addressChoices[1].addEventListener('click', () => {
			newAddress();
			document.querySelector('.zipCode').addEventListener('click', zipCodeAPI);
		});

		const usePointInput = document.querySelector("#usePoint");
		const useCouponInput = document.querySelector("#useCouponInput");
		const userPoint = usePointInput.parentElement.querySelector("span").innerText;
		const userPointFunc = function() {
			const regNum = /^[0-9]{0,4}$/;;
			if(!regNum.test(usePointInput.value)) {
				usePointInput.value = 0;
			}else if(usePointInput.value < 0) {
				usePointInput.value = 0;
			} else if(usePointInput.value > userPoint) {
				usePointInput.value = userPoint;
			}
			
			const changeablePrices = document.getElementsByName('changeablePrice');
			const allSaleSum = new Intl.NumberFormat('en-US', { style: 'decimal' }).format(Number(${ originalSum - saleSum }) + Number(usePointInput.value) + Number(useCouponInput.value));
			const finalPrice = new Intl.NumberFormat('en-US', { style: 'decimal' }).format(Number(${ saleSum } - usePointInput.value - useCouponInput.value));
			
			changeablePrices[0].innerHTML = allSaleSum;
			changeablePrices[1].innerHTML = finalPrice;
			document.querySelector('.allSalePrice').innerHTML = allSaleSum + "원";
			document.querySelector('.finalPrice').innerHTML = finalPrice;
		}
		usePointInput.addEventListener('change', userPointFunc);
		document.querySelector("#useAllPoint").addEventListener('click', function() {
			usePointInput.value = userPoint;
			userPointFunc();
		});
		
		let couponWin;
		let data;
		let couponNo = 0;
		let couponPrice = 0;
		document.querySelector("#useCoupon").addEventListener('click', ()=> {
			if(couponWin != null) {
				couponWin.close();
			}
			
			couponWin = window.open("${contextPath}/coupon.pay", "couponPage", "width=400, height=500");
			const finalPrice = document.querySelector('.finalPrice').innerHTML;
			couponWin.onload = function() {
			  couponWin.document.getElementById("price").innerText = finalPrice + "원";
			};
			couponWin.focus();
			
		});
		
		window.addEventListener("message", function(event) {
			try {
				let data = JSON.parse(event.data);
				if(data.isCanceled != null) {
					if(!data.isCanceled) {
						couponNo = data.couponNo;
						couponPrice = data.couponPrice;
						useCouponInput.value = couponPrice;
					} else {
						couponNo = 0;
						couponPrice = 0;
						useCouponInput.value = 0;
					}
					
					const changeablePrices = document.getElementsByName('changeablePrice');
					const allSaleSum = new Intl.NumberFormat('en-US', { style: 'decimal' }).format(Number(${ originalSum - saleSum }) + Number(usePointInput.value) + Number(useCouponInput.value));
					const finalPrice = new Intl.NumberFormat('en-US', { style: 'decimal' }).format(Number(${ saleSum } - usePointInput.value - useCouponInput.value));
					
					changeablePrices[0].innerHTML = allSaleSum;
					changeablePrices[1].innerHTML = finalPrice;
					document.querySelector('.allSalePrice').innerHTML = allSaleSum + "원";
					document.querySelector('.finalPrice').innerHTML = finalPrice;
				}
			} catch(error) {}
		});
		
		document.querySelector('#deliverySelect').addEventListener('change', function() {
			if(this.value === '직접 입력') {
				deliveryMessage.type = 'text';
				deliveryMessage.value = '';
				deliveryMessage.placeholder = '배송메시지를 입력해주세요.';
				deliveryMessage.focus();
			} else {
				deliveryMessage.type = 'hidden';
				deliveryMessage.value = this.value;
			}
		});
		
		const date = new Date();
		const formatDate = "" + date.getFullYear() + ('0' + (date.getMonth() + 1)).slice(-2) + ('0' + date.getDate()).slice(-2) + ('0' + date.getHours()).slice(-2) + ('0' + date.getMinutes()).slice(-2) + ('00' + date.getMilliseconds()).slice(-3);
		const randomNumStr = (Math.floor(Math.random() * 10000) + "").padStart(19-formatDate.length, '0');
		const productId = formatDate + randomNumStr;
		
		function completePost(orderNo) {
			const form = document.createElement("form");
			form.setAttribute("method", "post");
			form.setAttribute("action", "${ contextPath }/payCompleteView.pay");
			
			const hidden = document.createElement("input");
			hidden.setAttribute("type", "hidden");
			hidden.setAttribute("name", "orderNo");
			hidden.setAttribute("value", orderNo);
			
			form.appendChild(hidden);
			document.body.appendChild(form);
			form.submit();
		}
		
		console.log('${cNoList}');
		
		function requestPayment(pgEng, pgKor) { 
			IMP.init("imp40114615");	
			IMP.request_pay({
			    pg: pgEng,
			    pay_method: 'card',
			    merchant_uid: productId, // 상점에서 관리하는 주문 번호
			    name: '${ payProductName }',
			    amount: parseInt(document.querySelector('.finalPrice').innerText.replace(',', '')),
			    buyer_name: '${ loginUser.memberName }',
			    buyer_email: '${ loginUser.memberEmail }',
			    buyer_tel: '${ loginUser.memberPhone }',
			    buyer_addr: '${ memberAddress }',
			    custom_data: buyerMessage
			}, rsp => { // 결제 결과를 처리하는 콜백 함수
			    if (rsp.success) { // 결제가 성공적으로 이루어진 경우
			    	console.log(rsp)
			    	new Promise((resolve, reject) => {
			    		//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				    	$.ajax({
				    		url: "${ contextPath }/verifyIamport/" + rsp.imp_uid + ".pay", 
				    		type: 'POST',
				    		success: data => {
					    		console.log(data);
					    		console.log(data.response);
					    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					    		if (rsp.paid_amount == data.response.amount) { // 실제 금액과 결제 금액이 일치하는지 확인
					    			resolve(rsp.paid_amount);
					    		}
				    		},
				    		fail: data => {
				    			//[3] 아직 제대로 결제가 되지 않았습니다.
				    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				    			reject();
				    		}
				    	});
			    	}).then((amount) => { // 결제가 성공하고 서버에서 결제 정보를 확인한 후 실행
			    		$.ajax({
			    			url: "${ contextPath }/insertOrder.pay",
			    			type: 'POST',
			    			data: {
			    				orderNo: parseInt(productId),
			    				memberNo: memberNo,
			    			    orderPayType: pgKor,
			    			    orderPrice: amount,
			    			    orderUsedPoint: parseInt(usePointInput.value),
			    			    orderEarnPoint: parseInt(${ pointSum }),
			    			    orderName: orderName,
			    			    orderHomePhone: orderHomePhone,
			    			    orderPhone: orderPhone,
			    			    orderAddress: orderAddress,
			    			    orderMessage: buyerMessage,
			    			    productInfo: '${ productInfo }',
			    			    couponNo: couponNo,
			    			    cNoList: '${cNoList}',
			    			},
			    			success: data => {
			    				if(data == 0) {
			    					alert("결제 처리 과정에서 오류가 발생했습니다.");
			    				} else {
			    					completePost(data);
			    				}
			    			}
			    		});
			    	}).catch(() => {
			    		alert("결제가 정상적으로 이루어지지 않았습니다.")
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '\n' + rsp.error_msg + ""
			        
			        alert(msg);
			    }
			});
		}
		
		document.getElementById('payBtn').addEventListener('click', function() {
			let pgEng = '';
			let pgKor = '';
			const payTypes = document.getElementsByName("payType");
			for(const payType of payTypes) {
				if(payType.checked) {
					pgEng = payType.value;
					pgKor = payType.nextElementSibling.innerText;
					break;
				}
			}
			let checkInput = true;
			let homeNumber = '';
			let phoneNumber = '';
			const inputElements = document.getElementsByTagName('input');
			const homePhones = document.getElementsByClassName("homePhone");
			const cellphones = document.getElementsByClassName("cellphone");
			for(const inputElement of inputElements) {
				if(inputElement.type === 'radio' || inputElement.type === 'checkbox' || inputElement.id === 'usePoint' || inputElement.classList.contains('homePhone') || inputElement.id === 'deliveryMessage') {
					continue;
				} 
				if(inputElement.value.trim() === '') {
					alert('필수 입력 사항을 입력해 주세요.');
					inputElement.scrollIntoView();
					checkInput = false;
					break;
				}	
			}
			
			for(const homePhone of homePhones) {
				homeNumber += homePhone.value + "-";
			}
			for(const cellphone of cellphones) {
				phoneNumber += cellphone.value + "-";
			}
			homeNumber = homeNumber.substring(0, homeNumber.length-1);
			phoneNumber = phoneNumber.substring(0, phoneNumber.length-1);
			
			const regHomeNumber = /0([2-6]{1})([1-4]?)-([0-9]{3,4})-([0-9]{4})/g;
			const regPhoneNumber = /01([0-9]{1})-([0-9]{3,4})-([0-9]{4})/g;
			if(!(homeNumber == '' || homeNumber == '--') && !regHomeNumber.test(homeNumber)) {
				alert("전화번호 형식에 맞지 않습니다. 다시 입력해주세요.");
				homePhones[0].scrollIntoView();
				checkInput = false;
			}
			if(checkInput && !(phoneNumber == '' || phoneNumber == '010--') && !regPhoneNumber.test(phoneNumber)) {
				alert("전화번호 형식에 맞지 않습니다. 다시 입력해주세요.");
				cellphones[0].scrollIntoView();
				checkInput = false;
			}
			
			if(checkInput && deliveryMessage.value.trim() === '') {
				alert('배송 메시지를 입력해 주세요.');
				checkInput = false;
				deliverySelect.scrollIntoView();
			}
			
			if(checkInput) {
				let addr = '';
				const inputAddresses = document.querySelectorAll(".inputAddress");
				const dm = document.querySelector('#deliveryMessage');
				if(dm.type === 'text') {
					buyerMessage = dm.value;
				} else {
					buyerMessage = dm.parentElement.children[0].value;
				}
				for(const inputAddress of inputAddresses) {
					addr += inputAddress.value.trim() + " ";
				}
				if(document.querySelector('#newAddress').checked) {
					orderName = document.querySelector('.orderName').value.trim();
					if(homeNumber !== '--') {
						orderHomePhone = homeNumber;
					}
					orderPhone = phoneNumber;
					orderAddress = addr.substring(0, addr.length-1);
				} else {
					orderName = '${ loginUser.memberName }';
					orderPhone = '${ loginUser.memberPhone }';
					orderAddress = '${ loginUser.memberAddress }';
				}
				requestPayment(pgEng, pgKor);
			}
		});
	}
	</script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>