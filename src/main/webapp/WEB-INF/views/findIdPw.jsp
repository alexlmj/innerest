<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>Innerest Find_password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

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
	$(function() {
		$('#mail-submit').click(function(e) {
			e.preventDefault();
			if ($("#email").val() == '') {
				alert('이메일을 입력하세요');
				$("#email").focus();
				return false;
			}
			$("#mail-submit").prop("disabled", true);

			var queryString = $("#mailForm").serialize();

			$.ajax({
				url : "/findIdPw",
				method : "POST",
				data : queryString,
			}).done(function(data) {
				if (data == 'success') {
					alert("입력하신 메일로 아이디와 비밀번호 변경 링크가 전송되었습니다.");
					location.href = "/login";
				} else if (data == 'fail') {
					alert("이메일 주소를 정확히 입력해주세요.");
					$("#mail-submit").prop("disabled", false);
				}
			}).fail(function() {
				alert("SERVER ERROR");
			});
		});
	});
</script>
</head>
<body>
	<div id="wrapper-login">
		<div class="head-login-form"></div>

		<div class="container"></div>
		<div class="content-login-form">

			<h1 class="logo-login-center">
				<img src="/resources/images/logo/text_logo.png" alt="Innerest">
			</h1>

			<div class="notice-password">
				회원 가입시 기입하신 이메일 주소를 입력하시면, 해당 이메일로 아이디 및 비밀번호 변경 링크를 보내드립니다 :)<br>
			</div>

			<div class="wrap-login-enter">
				<form action="/findIdPw" method="post" id="mailForm">
					<input type="email" placeholder="이메일 입력하기" name="email"> <input type="submit" class="btn btn-password pure-button pure-button-primary" style="background-color: #1a9f9d;" id="mail-submit"
						value="메일전송">
				</form>
			</div>
		</div>
	</div>

	<div class="footer-login">
		<p>
			<span>INNEREST</span> &copy; Innerest Corp. All Rights Reserved.
		</p>
	</div>

</body>
</html>


