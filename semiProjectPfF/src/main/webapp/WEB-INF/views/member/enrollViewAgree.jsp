<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PfF 회원가입 약관동의</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<style>
	*{font-family:'Noto Sans KR', sans-serif;padding: 0;box-sizing: border-box; min-height: 100%; margin-left: 0; margin-right: 0;}
	body{background: #EEEFF1 url(${ contextPath }/resources/image/y-repeat.png) repeat-y 50% 0;}
	ul>li{list-style: none}
	a{text-decoration: none;}
	.clearfix::after{content: "";display: block;clear: both;}
	
	.box{
		width: 600px; height: 100%;background-color: #fff; margin-right: auto; margin-left: auto;
    padding-top: 50px; padding-left: 50px; padding-right: 50px; padding-bottom: 0; min-height: 100%;
    text-align: center; border: none;	
	}
	
	ul.join_box{border: 1px solid #ddd;background-color: #fff;}
	.checkBox,.checkBox>ul{position: relative;}
	.checkBox>ul>li{float: left;}
	.checkBox>ul>li:first-child{width: 85%;padding: 15px;color: #888;}
	.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
	.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #EEEFF1;color: #888; border: none;}
	.footBtwrap{margin-top: 15px; margin-left: 3%}
	.footBtwrap>li{float: left; width: 50%;height: 60px;}
	.fpmgBtn1, .fpmgBtn2{display: block; width: 94%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
	.fpmgBtn1{background-color: #fff;color:#555; border: 1px solid #555; cursor:pointer;}
	.fpmgBtn2{background-color: black;color: #fff; border:none; cursor:pointer;}
	
	
</style>
</head>
<body>
<body>
<script>
	// 로그인 되어있으면 홈으로보냄
	if(${loginUser != null}){
		  location.href='${ contextPath }';
	}
</script>
	<div class="box">
		<form action="enrollView.me" method="post">
			<a href="#"><img alt="로고" src="${ contextPath }/resources/image/logo1.png"></a><br><br><br>
			<ul class="join_box">
				<li class="checkBox check01">
					<ul class="clearfix">
						<li><label for="ckAll"><b>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</b></label></li>
						<li class="checkAllBtn"><input type="checkbox" id="ckAll" class="chkAll" onclick="checkAll()"></li>
					</ul>
				</li>
				<li class="checkBox check02">
					<ul class="clearfix">
						<li><label for="ck1" style="float: left;">이용약관 동의(필수)</label></li>
						<li class="checkBtn"><input type="checkbox" id="ck1" required="required" onclick="checkCk1()">
						</li>
					</ul> 
					<textarea name="" id="" disabled="disabled" style="resize:none;">[제1조 목적]
					본 약관은 Passion for Fashion 쇼핑몰 (이하 "쇼핑몰" 이라 함) 에서 제공하는 인터넷 관련 서비스 (이하 "서비스" 라 함)을 이용함에 있어 쇼핑몰과 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.
[제2조(정의)]
1. "쇼핑몰" 이란 Passion for Fashion 쇼핑몰을 말합니다.
2. "이용자"란 본 약관에 따라 쇼핑몰이 제공하는 서비스를 받는 자를 말합니다.
3. "회원"이란 쇼핑몰에 회원등록을 한 자로서, 계속적으로 쇼핑몰이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
4. "비회원"이란 회원에 가입하지 않고 쇼핑몰이 제공하는 서비스를 이용하는 자를 말합니다.

[제3조 (약관의 게시와 개정)]
1. 쇼핑몰은 이 약관의 내용과 상호, 대표자 성명, 영업소 소재지, 전화번호, 이메일주소 등을 이용자가 알 수 있도록 초기화면에 게시합니다.
2. 쇼핑몰은 개정약관의 효력 발생일 7일전, 개정약관 및 개정 내용과 사유를 현행약관과 함께 초기화면에 게시합니다. 다만, 이용자에게 불리하거나 중대한 내용의 변경은 적용일자 30일전에 공지합니다.
3.개정약관은 적용일 이후부터 쇼핑몰 웹사이트를 통해 적용합니다. 이용자가 개정약관에 동의하지 않으면 쇼핑몰은 해당 이용자와의 계약을 해지할 수 있습니다.

[제4조 (서비스의 제공 및 변경)]
1. 쇼핑몰은 다음과 같은 업무를 수행합니다.
- 상품 또는 용역에 대한 정보 제공 및 구매계약의 체결
- 구매계약이 체결된 상품 또는 용역의 배송
- 기타 쇼핑몰이 정하는 업무
2. 쇼핑몰은 상품 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 제공할 상품이나 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 상품 또는 용역의 내용 및 제공일자를 명시하여 현재의 상품 또는 용역의 내용을 게시한 곳에 그 적용일자 이전 7일부터 공지합니다.
3. 쇼핑몰은 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 쇼핑몰 초기화면에 공지한 바에 따릅니다.

[제5조 (서비스의 중단)]
1. 쇼핑몰은 컴퓨터 등 정보통신설비의 보수점검/교체 및 고장, 통신두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
2. 쇼핑몰은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 책임을 지지 않습니다.
3. 사업종목의 전환, 사업의 포기, 업체 간 통합 등의 이유로 쇼핑몰이 서비스를 제공할 수 없게 되는 경우에는 쇼핑몰은 이용자에게 사전 공지를 하고 본래 제공하려고 하였던 서비스를 대체할 수 있는 서비스를 이용자에게 제공할 수 있습니다.

[제6조 (회원가입)]
1. 이용자는 쇼핑몰이 정한 가입 양식에 따라 회원정보를 기입한 후 본 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
2. 쇼핑몰은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
- 가입신청자가 이 약관 제7조 제3항에 의하여 쇼핑몰과 이용계약이 해지된 적이 없는 경우
- 등록 내용에 허위, 기재누락, 오기가 없는 경우
- 만 14세 이상의 경우

[제7조 (회원탈퇴 및 자격 상실 등)]
1. 회원은 쇼핑몰에 언제든지 탈퇴를 요청할 수 있으며, 쇼핑몰은 즉시 회원탈퇴를 처리합니다.
2. 회원이 다음 각 호의 사유에 해당하는 경우, 쇼핑몰은 회원자격을 제한 및 정지시킬 수 있습니다.
- 가입신청시에 허위내용을 등록한 경우
- 다른 사람의 쇼핑몰 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
- 광고, 판매홍보를 비롯한 영리활동을 목적으로 서비스를 이용하는 경우
- 서비스와 관련하여 쇼핑몰의 지식재산권을 침해하는 경우

[제8조 (회원에 대한 통지)]
1. 쇼핑몰이 회원에 대한 통지를 하는 경우, 회원이 가입신청 시 쇼핑몰에 제출한 전자우편 주소로 할 수 있습니다.
2. 쇼핑몰은 불특정다수 회원에 대한 통지의 경우 1주일 이상 쇼핑몰 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.

[제9조 (구매신청)]
1. 이용자는 쇼핑몰에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청합니다.
- 웹사이트에서 제공되는 구매신청 양식을 작성하여 신청하는 방법
- 기타 쇼핑몰이 인정하는 방법
2. 쇼핑몰은 제1항과 같이 구매신청을 받은 경우에는 다음 각 호의 내용을 고지합니다.
- 재화 등의 검색 및 선택
- 결제방법의 선택 및 결제정보 확인
- 재화 등의 구매신청에 관한 확인 또는 쇼핑몰의 확인에 대한 응답(받았을 때를 의미함)
- 재화 등의 배송 또는 제공의 시작에 대한 안내

[제10조 (계약의 성립)]
1. 쇼핑몰이 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 수신확인 및 구매신청에 대한 정보제공 등을 할 수 있습니다.
- 신청 내용에 허위, 기재누락, 오기가 있는 경우
- 기타 구매신청에 따라서 승인하는 것이 쇼핑몰의 기술상 현저히 지장이 있다고 판단하는 경우
2. 쇼핑몰의 승인이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

[제11조(지급방법)]
쇼핑몰에서 구매한 상품에 대한 대금지급방법은 다음 각 호와 같습니다.
- 신용카드 결제
- 계좌이체
- 개인정보 및 보안 확인 후, 가상계좌 입금
- 그 외 쇼핑몰에서 인정하는 결제수단

[제12조 (수신확인통지, 구매신청 변경 및 취소)]
1. 쇼핑몰은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
2. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 쇼핑몰은 배송 전에 이용자 요청에 따라 처리하며, 배송이 시작된 경우에는 제15조의 교환 및 반품에 관한 규정에 따릅니다.

[제13조(배송)]
1. 쇼핑몰은 이용자와의 계약에 따른 재화 등을 지정한 전문 배송업자를 통해 배송합니다.
2. 쇼핑몰은 이용자가 구매한 재화 등을 제7조제2항에서 정한 바에 따라 배송합니다.

[제14조(환급 등)]
1. 쇼핑몰은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화의 대금을 환불합니다.
2. 쇼핑몰 은 환불 시, 이용자가 신용카드, 가상계좌 등의 결제수단으로 재화 등을 구매한 때에는 가능한 한 해당 결제수단으로 환불합니다. 단, 제9조제2항의 규정에 의하여 쇼핑몰이 부담하는 배송비 등의 비용은 차감한 금액을 환불합니다.
3. 쇼핑몰 은 위약이 있는 경우, 재화 등의 반환을 받은 후 3일 이내에 그 사유를 이용자에게 알려 환급 시기를 조율할 수 있습니다.

[제15조(교환 및 반품)]
1. 쇼핑몰은 이용자의 교환, 반품요청이 있는 경우 재화 등의 상태확인을 위하여 영업일 10일 이내에 해당 재화 등을 수령합니다.
2. 재화 등의 교환 또는 반품은 쇼핑몰의 귀책사유 없이 이용자의 단순변심에 의한 것이 아닌 경우에만 가능합니다.
3. 이용자가 재화를 반환할 경우, 배송비는 쇼핑몰이 부담합니다. 다만 EMS 등을 이용하여 택배비를 부담한 경우에는 쇼핑몰이 정한 규정에 따릅니다.
4. 반품시 지연 배상금을 지급하지 않습니다.

[제16조(개인정보보호)]
1. 쇼핑몰은 이용자의 정보수집시 서비스제공을 위하여 필요한 최소한의 정보를 수집하며, 이용자의 별도 동의 없이 불필요한 정보를 수집할 수 없습니다.
2. 쇼핑몰은 이용자가 제공한 정보를 본인의 사전동의 없이 타인에게 누설, 배포, 공유하지 않습니다. 다만, 다음의 경우는 예외로 합니다.
- 이용자들이 사전에 공개에 동의한 경우
- 관계법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
3. 쇼핑몰은 이용자의 정보를 관리하기 위하여 개인정보처리방침을 운영하며, 본 약관과 함께 공지합니다.

[제17조(쇼핑몰의 의무)]
1. 쇼핑몰은 이 약관이 정하는 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다.
2. 쇼핑몰은 이용자로부터 제기된 의견이나 불만이 정당하다고 인정할 경우 이를 처리하여야 합니다. 이용자가 신청한 서비스 제공에 장애가 있을 경우 이를 지체 없이 수리 또는 복구합니다.

[제18조(면책조항)]
1. 쇼핑몰은 이용자가 서비스를 이용하기 위하여 쇼핑몰에 등록한 정보에 관한 책임이 전적으로 이용자에게 있으며, 이용자가 자신의 정보등록에 있어 허위의 정보를 등록하여 발생한 결과에 대한 책임은 이용자 본인에게 있습니다.
2. 쇼핑몰은 이용자가 서비스를 이용하며 기대하는 수익 및 손해에 관하여 책임을 부담하지 않습니다.
3. 쇼핑몰은 이용자가 서비스 이용과 관련하여 기대하는 수익 및 손해를 포함하여 어떠한 손해도 책임을 부담하지 않습니다. 다만, 쇼핑몰의 고의나 과실이 인정될 경우에는 그러하지 않습니다.

[제19조(재판권 및 준거법)]
1. 쇼핑몰과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 대한민국 법률에 따릅니다.
2. 쇼핑몰과 이용자간에 제기된 전자상거래 소송에는 대한민국 법률을 준거법으로 합니다.

본 약관은 2021년 9월 1일부터 시행됩니다.
	        		</textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li><label for="ck2" style="float: left;">개인정보 수집 및 이용에 대한 안내(필수)</label></li>
						<li class="checkBtn"><input type="checkbox" id="ck2" required="required" onclick="checkCk2()">
						</li>
					</ul> <textarea name="" id="" disabled="disabled" style="resize:none;">[Passion for Fashion 쇼핑몰 개인정보 수집 및 이용 안내]

Passion for Fashion 쇼핑몰은 고객님의 개인정보를 소중히 보호하고 안전하게 관리하기 위해 최선의 노력을 다하고 있습니다. 아래에는 Passion for Fashion이 개인정보를 수집하고 이용하는 방법에 대한 안내가 포함되어 있습니다. 개인정보 수집 및 이용에 대한 안내를 주의 깊게 읽어주시기 바랍니다.

1. 수집하는 개인정보 항목 및 수집 방법
Passion for Fashion은 쇼핑몰 이용 과정에서 아래와 같은 개인정보를 수집할 수 있습니다:

성명, 주소, 전화번호, 이메일 주소 등의 개인정보
결제 정보(신용카드 정보, 은행 계좌 정보 등)
서비스 이용 기록, 접속 로그, 쿠키, IP 주소 등의 개인정보
개인정보는 다음과 같은 방법으로 수집될 수 있습니다:

회원가입 시 고객이 직접 입력하는 정보
주문 및 결제 과정에서 고객이 제공하는 정보
고객 문의나 서비스 이용 과정에서 발생하는 정보
2. 개인정보의 수집 및 이용 목적
Passion for Fashion은 수집한 개인정보를 다음과 같은 목적으로 이용합니다:

회원 관리, 서비스 제공 및 운영
상품 배송 및 교환/반품 처리
결제 및 환불 처리
고객 문의 응답 및 서비스 개선
이벤트나 프로모션 안내
서비스 이용에 관련된 고지사항 전달
3. 개인정보의 보유 및 이용 기간
Passion for Fashion은 개인정보의 보유 및 이용 기간을 아래와 같이 정합니다:

회원 탈퇴 시까지 또는 요청 시까지 회원 정보를 보유합니다.
관련 법령에 따라 일정 기간 동안 개인정보를 보관할 수 있습니다.
4. 개인정보의 제공 및 위탁
Passion for Fashion은 원칙적으로 고객의 개인정보를 외부에 제공하지 않으며, 동의 없이 다른 목적으로 이용하지 않습니다. 다만, 아래의 경우에는 예외로 합니다:

고객의 동의가 있는 경우
법령에 의거하여 제공이 요구되는 경우
서비스 제공에 필요한 업무를 외부 업체에 위탁하는 경우
5. 개인정보의 보호 및 안전 조치
Passion for Fashion은 고객의 개인정보를 안전하게 보호하기 위해 다음과 같은 보안 조치를 적용합니다:

개인정보 처리 시스템에 대한 접근 제한 및 모니터링
개인정보를 암호화하여 저장 및 관리
개인정보 처리 직원에 대한 교육 및 감독
6. 개인정보에 대한 권리와 옵션
고객은 Passion for Fashion에 대해 아래와 같은 권리를 행사할 수 있습니다:

개인정보 열람, 정정, 삭제 요청
개인정보 수집 및 이용에 대한 동의 철회
개인정보 처리의 제한 요청
개인정보 이전의 제한 요청
위 권리 행사나 개인정보 관련 문의를 위해서는 고객센터로 문의하여 주시기 바랍니다.

Passion for Fashion은 개인정보 처리에 관한 법령 및 정부 지침을 준수하고 있으며, 개인정보 처리에 대한 본 안내를 개정하는 경우 사전 공지를 통해 고지할 것입니다.

감사합니다.

[고객센터 연락처]

전화: 010-5758-8327
이메일: m_chyo_@naver.com
[개인정보 보호책임자]

성명: 문치호
이메일: m_chyo_@naver.com
[변경일자]
본 개인정보 수집 및 이용 안내의 내용은 2023년 5월 25일에 최종 변경되었습니다.</textarea>
				</li>
				<li class="checkBox check03">
					<ul class="clearfix">
						<li><label for="ckSel" style="float: left;">이벤트 등 프로모션 알림 메일 수신(선택)</label></li>
						<li class="checkBtn"><input type="checkbox" name="eventAgree" id="ckSel" onclick="checkCkSel()" value="Y">
						</li>
					</ul> <textarea name="" id="" disabled="disabled" style="resize:none;">
안녕하세요!

Passion for Fashion 쇼핑몰에서는 고객님들께 다양한 이벤트와 프로모션 정보를 제공하기 위해 알림 메일을 발송하고 있습니다. 이메일을 통해 특별 할인, 새로운 상품 출시, 세일 정보 등 다양한 소식을 받아보실 수 있습니다.

고객님께서 Passion for Fashion 쇼핑몰의 이벤트 및 프로모션 알림 메일을 수신하고자 하신다면, 아래의 절차를 따라주시면 됩니다:

Passion for Fashion 쇼핑몰 웹사이트에 로그인합니다.
마이 페이지 또는 회원 정보 수정 페이지로 이동합니다.
개인정보 설정 또는 알림 설정과 관련된 항목을 찾습니다.
"이벤트 및 프로모션 알림 메일 수신" 또는 유사한 항목을 확인하고, 해당 옵션을 선택합니다.
변경 사항을 저장하고 업데이트합니다.
이렇게 설정을 완료하시면 Passion for Fashion 쇼핑몰의 이벤트 및 프로모션 알림 메일을 정기적으로 받아보실 수 있습니다. 주요 이벤트나 특별 할인 기회를 놓치지 않으시고 항상 최신 소식을 받아보실 수 있습니다.

감사합니다! Passion for Fashion에서 멋진 쇼핑 경험을 제공하기 위해 최선을 다하겠습니다.</textarea><br><br>
				</li>
			</ul><br/><br/><br/>
			<ul class="footBtwrap clearfix">
				<li><input type="button" class="fpmgBtn1" value="비동의" onClick="location.href='${ contextPath }/loginView.me'"/></li>
				<li><button class="fpmgBtn2">동의</button></li>
			</ul>
		</form>
	</div>
	
<script>
	const ckAll = document.getElementById('ckAll');
	const ck1 = document.getElementById('ck1');
	const ck2 = document.getElementById('ck2');
	const ckSel = document.getElementById('ckSel');
	
// 	카운트 3일때 전체선택, ck1, ck2, ckSel 체크할떄마다 1씩늘어나고 체크해제하면 1씩줄어듦
	let count = 0;
	
	
// 	전체선택 클릭 시 모두체크/체크해제
	const checkAll = ()=>{
		if(ckAll.checked==true){
			ck1.checked = true;
			ck2.checked = true;
			ckSel.checked = true;
			count = 3;
		} else{
			ck1.checked = false;
			ck2.checked = false;
			ckSel.checked = false;
			count = 0;
		}
		
	}
	
	const checkCk1 = () =>{
		if(ck1.checked==true){
			count++;
		} else{
			count--;
		}
		
		if(count == 3){
			ckAll.checked = true;
		} else{
			ckAll.checked = false;
		}
		
	}
	
	const checkCk2 = () =>{
		if(ck2.checked==true){
			count++;
		} else{
			count--;
		}
		
		if(count == 3){
			ckAll.checked = true;
		} else{
			ckAll.checked = false;
		}
		
	}

	const checkCkSel = () =>{
		if(ckSel.checked==true){
			count++;
		} else{
			count--;
		}
		
		if(count == 3){
			ckAll.checked = true;
		} else{
			ckAll.checked = false;
		}
		
	}
	
</script>
</body>
</html>