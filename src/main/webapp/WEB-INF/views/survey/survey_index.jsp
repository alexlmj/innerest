<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Innerest-Self Diagnostic</title>
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
<link rel="stylesheet" href="/resources/css/innerest/02.survey_style.css">
<link rel="stylesheet" href="/resources/css/innerest/03.loading_page.css">
<link rel="stylesheet" href="/resources/css/innerest/04.selection.css">
<link rel="stylesheet" href="/resources/css/innerest/common.css">
<link rel="stylesheet" href="/resources/css/innerest/defualt.css">
<link rel="stylesheet" href="/resources/css/innerest/font.css">

<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/style.css">

</head>
<body>

	<div class="site-wrap">
		   <jsp:include page="/WEB-INF/views/common/default-header-bar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">Self-diagnostic</strong>
					</div>
				</div>
			</div>
		</div>

		<!-- Servey 시작 -->
		<div class="container">
			<div class="content-survey survey-position">

				<!--
       <div class="title-top-content-wrap">
        <p class="title-top-content"> | 수출진단 </p>
       </div>-->


				<!-- <div class="content-selection">
          <div class="top-title-select">
              <h2>Self-Diagnostics</h2>
          </div>
     </div>-->

				<div class="survey-title">

					<p>
						다음은 귀하가 필요한 수출 준비도를 알아보는 자가진단입니다.<br> 설문에 응답해 주세요.
					</p>
				</div>

				<div class="survey-main-content">

					<div class="survey-question diagnotics_padding">

					  <label id = "test"><input name = "test" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">1. 회사 설립이 되어있다.</label>
			          <label id = "test1"><input name = "test1" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">2. 물량확보가 되어있다</label>
			          <label id = "test2"><input name = "test2" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">3. 수출 경험이 있다</label>
			          <label id = "test3"><input name = "test3" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">4. 거래하는 물류회사가 있다</label>
			          <label id = "test4"><input name = "test4" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">5. 납품하려는 제품의 HS-CODE를 알고있다</label>
			          <label id = "test5"><input name = "test5" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">6. 지정 통관 회사가 있다</label>
			          <label id = "test6"><input name = "test6" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">7. 국내 품질 보증 절차가 이루어져 있다</label>
			          <label id = "test7"><input name = "test7" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">8. 수출 시 필요한 서류가 무엇인지 알고있다</label>
			          <label id = "test8"><input name = "test8" class="test" type="checkbox" value="1" onclick="survey(name)" style="opacity:0;">9. 필요한 서류가 무엇인지 알고 서류 준비가 되었다</label>
			          <label id = "test9"><input name = "test9" class="test" type="checkbox" value="0.5" onclick="survey(name)" style="opacity:0;">10. 해외 시장조사가 이루어져 있다</label>
			          <label id = "test10"><input name = "test10" class="test" type="checkbox" value="0.5" onclick="survey(name)" style="opacity:0;">11. 마케팅을 진행하고 있다</label>

					</div>
				</div>


			<!-- //selection box -->

				<div class="align-width-btn">
					<button id="btnSurvey" class="btn-check-document btn-bottom-04-select" align="center" data-toggle="modal" data-target="#myModal" onclick = "move()">진단 결과</button> 
				</div>


				<!-- modal(?)-->
				<!--<div id="modalDocument" class="modal-document-list">
            <div class="close-modal"><span>X</span></div>-->
				<!--  이미지로 교체-->


				<!-- <div id="wrapperLoadingPage">
      <div class="content-loading-page">
          <div class="top-title-notify-result">
              <p class="text-notify-result">진단 결과가 나왔습니다.</p>
          </div>
          
          <div class="wrap-result-page">
               <div class="wrap-gauge-bar"> 
          <h1>진단결과</h1> 
        <div id="myProgress">
           <div id="myBar2">10%</div>
        </div> 
             </div>  
              
              <div class="result-emotion-icon">
                  <img src="images/icon/icon_smile.png" alt="smile icon">
              </div>
              <p class="notify-result-ment">"이제 거의 다 되었네요!"</p>
              
              <a class="join-membership-btn" href="#">회원가입 후 더 자세히 알아보기</a>
          </div>
          
          
      </div>
        </div>-->

				<!-- The Modal -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-md">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">진단결과 확인</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<div id="wrapperLoadingPage">
									<div class="content-loading-page">

										<div class="wrap-result-page">
											<div class="wrap-gauge-bar">
												<h1>진단결과</h1>
												<div id="myProgress">
													<div id="myBar2">10%</div>
												</div>
											</div>

											<div class="result-emotion-icon">
												<img src="/resources/images/icon/icon_smile.png" alt="smile icon">
											</div>
											<p class="notify-result-ment">"이제 거의 다 되었네요!"</p>

											<c:if test="${role eq null}">
												<a class="join-membership-btn" href="/regist">회원가입 후 더 자세히 알아보기</a>
											</c:if>
											<c:if test="${role eq 'P'}">
												<a class="join-membership-btn" href="/my/ex_cor">기업회원 전환 후 더 자세히 알아보기</a>
											</c:if>
											
											<c:if test="${role eq 'C'}">
												<a class="join-membership-btn" href="/document">더 자세히 알아보기</a>
											</c:if>
										</div>


									</div>
								</div>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>


			</div>





		</div>
	</div>
	<!--//survey finish-->

	<!--footer-->
	<jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>


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
 
</body>
</html>