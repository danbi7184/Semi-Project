<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<style>
	body{ background-color: #EEEFF1; }
</style>
</head>
<body>
	<script>
		window.onload = () =>{
			alert("${errorMessage}");
			location.href= history.back();
		}
	</script>
</body>
</html>