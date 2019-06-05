<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Innerest-Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

<!--related CSS file with Survey page-->
<link rel="stylesheet" href="/resources/css/innerest/login.css"> 
<link rel="stylesheet" href="/resources/css/innerest/common.css">
<link rel="stylesheet" href="/resources/css/innerest/defualt.css">
<link rel="stylesheet" href="/resources/css/innerest/font.css">

<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/style.css">

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/jquery-ui.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="/resources/js/progress.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/main.js"></script>
<script>
$(document).ready(function() {
	$("#loginBtn").click(function(e) {
		e.preventDefault();
		//javascript 검증 필요
		
		var queryString = $("#loginForm").serialize();

		$.ajax({
			url : "/login",
			method : "POST",
			dateType : "text/plain",
			data : queryString
		}).done(function(data) {
			if (data == 'success') {
				location.href = "/";
			} else if (data == 'fail') {
				alert("아이디 또는 비밀번호를 확인해주세요");
				return;
			}
		}).fail(function() {
			alert("SERVER ERROR");
		});
	});
});
</script>
</head>
<body>
<div class="head-login-form"></div>
	<div class="container">
		<div id="wrapper-login">
				<div class="content-login-form">
			<h1 class="logo-login-center">
				<a href="/"><img src="/resources/images/logo/text_logo.png" alt="Innerest"> </a>
			</h1>
			<div class="wrap-login-enter">
				<form action="/login" method="post" id="loginForm">
					<input type="text" placeholder="ID" name="id"> <input type="password" placeholder="PW" name="pw">
					<button class="btn-login" id="loginBtn">로그인</button>
					<ul class="wrap-find-id clear">
						<li><a href="/regist">회원가입</a></li>
						<li><a href="/findIdPw">계정찾기</a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>

	<div class="footer-login">
		<p>
			<span>INNEREST</span> &copy; Innerest Corp. All Rights Reserved.
		</p>
	</div>
</div>
</body>
</html>
