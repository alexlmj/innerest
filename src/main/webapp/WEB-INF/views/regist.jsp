<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Innerest-회원가입</title>
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
<link rel="stylesheet" href="/resources/css/innerest/01.content.css">
<link rel="stylesheet" href="/resources/css/innerest/common.css">
<link rel="stylesheet" href="/resources/css/innerest/defualt.css">
<link rel="stylesheet" href="/resources/css/innerest/font.css">

<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/style.css">

</head>
<body>

	<div class="site-wrap">

		<jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>


		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="/">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">회원가입</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<!--이용약관 동의-->
				<form id="register-form" method="post" action="/regist">
					<div class="col-wrapper" id="info-1">
						<h5>이용약관 및 개인정보 수집 및 이용 동의</h5>
						<p>동의를 하셔야 회원가입이 완료됩니다</p>
						<div class="row">
							<div class="col-lg-6 col-sm-12">
								<p class="condition">
									제1조(목적)<br> 이 약관은 이너레스트 회사(전자상거래 사업자)가 운영하는 이너레스트 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.<br> <br> ※「PC통신, 무선 등을
									이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br> <br> 제2조(정의)<br> ①“몰” 이란 이너레스트 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며,
									아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
								</p>
								<!-- Default checked -->
								<div class="custom-control custom-checkbox agree-wrapper">
									<p class="agree">이용약관에 동의하십니까?</p>
									<input type="checkbox" class="custom-control-input" id="policy-agree"> <label class="custom-control-label" for="policy-agree">동의함</label>
								</div>
							</div>
							<div class="col-lg-6 col-sm-12">
								<p class="condition">
									제1조(목적)<br> 이 약관은 이너레스트 회사(전자상거래 사업자)가 운영하는 이너레스트 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.<br> <br> ※「PC통신, 무선 등을
									이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」<br> <br> 제2조(정의)<br> ①“몰” 이란 이너레스트 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며,
									아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
								</p>
								<!-- Default checked -->
								<div class="custom-control custom-checkbox agree-wrapper">
									<p class="agree">개인정보 수집 및 이용에 동의하십니까?</p>
									<input type="checkbox" class="custom-control-input" id="personal-data-agree"> <label class="custom-control-label" for="personal-data-agree">동의함</label>
								</div>
							</div>
						</div>
					</div>
					<div class="div-line"></div>
					<!--기본 정보 입력-->
					<div class="col-wrapper" id="info-2">
						<h5>기본정보</h5>

						<table class="register-table">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>
										<div class="form-group">
											<input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id" data-rule-required="true" placeholder="20자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="20">
											&nbsp;&nbsp;
											<span id="idMsg"></span>
										</div>
									</td>
								</tr>

								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<!--<input type="password" name="pass" id="user-pw" required class="form-control form-control-user" placeholder="">--> <input type="password" class="form-control" id="password"
										name="pw" data-rule-required="true" placeholder="패스워드" minlength="8" maxlength="30">
									</td>
								</tr>

								<tr>
									<th scope="row">비밀번호 확인</th>
									<td>
										<!--<input type="password" id="user-pw-check" required class="form-control form-control-user" placeholder="">--> <input type="password" class="form-control" id="passwordCheck"
										data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
									<div id="pwcheck-wrapper">
											<span id="pwcheck-content"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td><input type="text" class="form-control onlyHangul" id="name" name="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15"></td>
								</tr>
								<tr>
									<th scope="row">주소</th>
				   <td>
	  
					 <div class="row address-search">
							  <input type="text" class="form-control postcodify_postcode5" id="zip" name="zip">&nbsp;&nbsp;
									<button type="button" class="btn" id="postcodify_search_button">검색</button>
					  </div>
						  
							  <input type="text" name="addr" class="form-control postcodify_address" id="basic-address" placeholder="기본주소"> 
							  <input type="text" name="addr_detail" class="form-control postcodify_details" id="detail-address"  placeholder="상세주소">

					  </td>
									 
								</tr>
								<tr>
									<th scope="row">휴대전화</th>
									<td><input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11"></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td><input type="email" class="form-control" id="email" name="email" data-rule-required="true" placeholder="이메일" maxlength="40"></td>
								</tr>
								<tr>
									<th scope="row">수신동의</th>
									<td>
										<div class="row">
											<label for="inputEmailReceiveYn" class="col-lg-3 control-label">이메일 수신여부</label>
											<!-- Default inline 1-->
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" id="defaultInline1" name="email_flag" value="Y" checked> <label class="custom-control-label" for="defaultInline1">수신함</label>
											</div>

											<!-- Default inline 2-->
											<div class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" id="defaultInline2" name="email_flag" value="N"> <label class="custom-control-label" for="defaultInline2">수신하지 않음</label>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<!--회원가입하기 버튼-->
						<div class="col-wrapper" id="info-3">
							<div class="form-group">
								<div class="text-center">
									<div class="form-group">
										<button type="submit" class="btn btn-join">회원가입 하기</button>
									</div>
								</div>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>

	<!--footer-->
	<jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>

	<!-- 모달창 -->
	<div class="modal fade" id="defaultModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<p class="modal-contents"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!--// 모달창 -->

	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/jquery-ui.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/aos.js"></script>

	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/register.js"></script>
	
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
  <script>
  
  $(document).ready(function(){
		$("#id").on("blur",function(){
	    	var id = $("#id").val();
	    	$.ajax({
	    		url : "/regist/idc",
	    		method : "post",
	    		data : id,
	    		dataType :"text",
	    		contentType :"text/plain"
	    	}).done(function(data){
	    		if(data == 'new') {
	    			$("#idMsg").css("color", "green");
	    			$("#idMsg").html("가입 가능한 아이디입니다");
	    			ok = true;
	    		} else if(data == 'duple') {
	    			$("#idMsg").css("color", "red");
	    			$("#idMsg").html("이미 존재하는 아이디입니다");
	    			ok = false;
	    		} 
	    	}).fail(function() {
	    		alert("SERVER ERROR");
	    	});
	    });
	});
  </script>
</body>
</html>