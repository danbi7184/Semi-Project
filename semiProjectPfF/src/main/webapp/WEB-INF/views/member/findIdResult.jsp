<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
	* {font-family:'Noto Sans KR', sans-serif; box-sizing: border-box;}
 	
 	html, body {
  	height: 100%;
	}
 	
 	body {margin: 0; background-color: #EEEFF1;}
 	
 	.findIdResult-form {width: 500px; height: 100%; background-color: #fff; margin-right: auto; margin-left: auto;
    padding: 50px; padding-left: 100px; padding-right: 100px; padding-bottom: 100px; 
    text-align: center; border: none; }
    
    .findIdResult {
    position: absolute;
    top: 50%;
    right: 0;
    left: 0;
    margin: 0 auto;
    padding: 0 15px;
    transform: translateY(calc(-50% - 50px));
    max-width: 355px;
	} 
    
	.findIdResultTitle {
    font-size: 22px;
    line-height: 30.8px;
    text-align: center;
	}
	
	.findIdResultList {
    overflow-y: auto;
    max-height: 255px;
    margin: 20px 8px 0;
    padding: 5px 0;
    background-color: #f5f5f5;
	}
	
	.findIdResultListItem {
    display: flex;
    padding: 13px 15px;
	}
    
    .findIdResultListItemId {
    box-sizing: border-box;
    width: 100%;
    padding-right: 10px;
    word-break: break-all;
	}
    
    .notFindIdResult {
    position: absolute;
    top: 50%;
    right: 0;
    left: 0;
    margin: 0 auto;
    padding: 0 15px;
    transform: translateY(-50%);
	}
    
    .notFindIdResultTitle {
    font-size: 22px;
    line-height: 33px;
    text-align: center;
	}
	
	.notFindIdResultText {
    margin-top: 20px;
    font-size: 14px;
    line-height: 21px;
    color: #6e6e6e;
    text-align: center;
	}
    
    .forgetPwd {
    padding-right: 15px;
    padding-left: 15px;
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    max-width: 355px;
    margin: 0 auto;
    text-align: center;
	}
    
    .forgetPwdText {
    margin-bottom: 40px;
    font-size: 15px;
    line-height: 22.5px;
	}
	
	.findPwdHref {
    display: inline-block;
    margin-left: 2px;
    color: #0078ff;
	}
	
	.loginBtn {
    display: block;
    box-sizing: border-box;
    width: 100%;
    height: 50px;
    padding: 14px 16px 15px;
    border: 1px solid #000;
    border-radius: 4px;
    font-weight: 700;
    border-color: #0078ff;
    background-color: #0078ff;
    color: #fff;
	}
    
</style>

</head>
<body>

	<div class="findIdResult-form">
	    	<div><h3>아이디 찾기 결과</h3></div>
	    	<c:if test="${existId}">
	    		 <div class="findIdResult">
                 	<p class="findIdResultTitle">회원님의 이메일로
                    	<br>가입된 아이디가 있습니다.
                    </p>
                    	<ul class="findIdResultList">
                        	<li class="findIdResultListItem">
                            	<div class="findIdResultListItemId" id="memberId">아이디 : ${id}</div>
                            </li>
                        </ul>
                    </div>
					<div class="forgetPwd">
						<p class="forgetPwdText">
							비밀번호가 기억나지 않으세요?
							<a href="${contextPath}/findPwd.me" class="findPwdHref">비밀번호 찾기</a>
						</p>
						<a href="${contextPath}/loginView.me" class="loginBtn">로그인</a>
					</div>
			</c:if>
			<c:if test="${!existId}">
				<div class="notFindIdResult">
                	<p class="notFindIdResultTitle">입력하신 이메일로 가입된
                    	<br>아이디를 찾을 수 없습니다.
                    </p>
                    <p class="notFindIdResultText">확인 후 다시 시도해주세요.
                    </p>
                </div>
                <div class="forgetPwd">
                	<a href="${contextPath}/findId.me" class="loginBtn">아이디 찾기</a>
                </div>
			</c:if>

	
	
	</div>

</body>

<script>
</script>
</html>