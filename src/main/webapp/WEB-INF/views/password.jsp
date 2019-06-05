<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>mypage-비밀번호변경</title>

<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/dashboard_custom.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!--  헤더테스트 -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">


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
				새로운 비밀번호를 입력해주세요. <br>
			</div>

			<div class="wrap-login-enter">
				<form class="pure-form" id="pwForm" action="/password" method="post">
					<input type="hidden" name="emailtoken" value="${emailtoken}">
					<input type="password" name="pw" id="pw1" required class="form-control form-control-user" placeholder="새 비밀번호"> <input type="password" id="pw2" required
						class="form-control form-control-user" placeholder="비밀번호 확인">
					<button type="button" id="submitBtn" class="btn btn-password pure-button pure-button-primary">변경하기</button>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>
	<script src="/resources//js/dashboard_custom.js"></script>
	<script>
$(document).ready(function(){
	$("#submitBtn").on("click", function(e){
		var pw1 = $("#pw1")
		var pw2 = $("#pw2");
		
		if(pw1.val() == "" || pw1.val().length < 8) {
			alert("8자리 이상 입력해주세요");
			return;
		}
		
		if(!(pw1.val() == pw2.val())) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		$("#pwForm").submit();
	});
});
</script>



</body>

</html>
