<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
	* {font-family:'Noto Sans KR', sans-serif; box-sizing: border-box;}
 	body {margin: 0; background-color: #EEEFF1;}
 	
 	.login-form {width: 500px; height: 100%; background-color: #fff; margin-right: auto; margin-left: auto; margin-top: 200px;
    padding: 50px; padding-left: 100px; padding-right: 100px; padding-bottom: 100px; 
    text-align: center; border: none; }
	
	.input-container{
		position:relative;
		margin-bottom:30px;
	}
	
 	.input-container label{ 
 		position:absolute; 
 		top:10px; 
 		left:20px; 
 		font-size:16px; 
 		color:#555; 
 	    transition: all 0.2s ease-in-out; 
 	} 
	
	.input-container input{ 
	  border:0;
	  border-bottom:1px solid #555;  
	  background:transparent;
	  width:260px;
	  padding:8px 0 5px 0;
	  font-size:16px;
	  color:#555;
	}
	.input-container input:focus{ 
	 border:none;
	 outline:none;
	 border-bottom:1px solid #e74c3c;	
	}
	
	.input-container input:focus ~ label,
	.input-container input:valid ~ label{
		top:-12px;
		font-size:12px;
		
	}
	
	.submit-btn {font-size: 14px; border: none; padding: 10px; width: 260px; background-color: black; margin-bottom: 5px; color: white; cursor:pointer;}
 	.submit-btn:active{color: #808080;transition: all ease 1s 0s;}
	
	#join {font-size: 14px; border: 1px solid black; box-sizing: border-box; padding: 10px; width: 260px; background-color: white; margin-bottom: 30px; color: black; cursor:pointer;}
 	#join:active{color: #808080; transition: all ease 1s 0s; background:black;}
 	
 	.links {text-align: center;}
 	.links a {font-size: 12px; color: #9B9B9B;}
 	.links span{font-size: 10px; color:#9B9B9B;}
 	#kakao{margin-top:30px}
</style>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
<script>
	// 로그인 되어있으면 홈으로보냄
	if(${loginUser != null}){
		  location.href='${ contextPath }';
	}
</script>
  <div class="login-form">
    <form action="${ contextPath }/login.me" method="post">
      <a href="${ contextPath }"><img alt="로고" src="${ contextPath }/resources/image/logo1.png"></a><br/><br/>
      
      <div class="input-container">
      	<input type="text" name="memberId" id="id"  required="required"/>
      	<label for="id">아이디</label>
      </div>
      
      <div class="input-container">
      	<input type="password" name="memberPwd" id="pwd"  required="required"/>
      	<label for="pwd">비밀번호</label>
      </div>
      
      <input type="submit" value="로그인" class="submit-btn">
      <a href="${ contextPath }/enrollViewAgree.me"><input type="button" value="회원가입" id="join"></a>
    </form>
 
    <div class="links">
      <a href="${contextPath}/findId.me">아이디찾기</a>
      <span>　　|　　</span>
      <a href="${contextPath}/findPwd.me">비밀번호찾기</a>
      
    </div>
    <a href="javascript:void(0)" onclick="kakaoLogin();"><img alt="카카오로그인" src="${ contextPath }/resources/image/kakaologin.PNG" id="kakao"></a>
  </div>
  
  <script>
  // kakao로긴 보내줄 폼생성
  function sendPost(url, params) {
	    var form = document.createElement('form');
	    form.setAttribute('method', 'post');
	    form.setAttribute('action', url);
	    document.charset = "UTF-8";

	    for (var key in params) {
	      var hiddenField = document.createElement('input');
	      hiddenField.setAttribute('type', 'hidden');
	      hiddenField.setAttribute('name', key);
	      hiddenField.setAttribute('value', params[key]);
	      form.appendChild(hiddenField);
	    }

	    document.body.appendChild(form);
	    form.submit();
  }
  
  
  Kakao.init('6954463b661b4975a99753361883b6a6');
  function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  sendPost('${contextPath}/kakaoLogin.me', {memberId:response.id, 
	        		  										memberNickName:response.kakao_account.profile.nickname});
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
		
	}
  </script>
  
</body>
</html>