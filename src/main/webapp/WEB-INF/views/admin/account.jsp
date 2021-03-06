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

<title>INNEREST-입금관리</title>

 <!--  헤더테스트 -->
  <link rel="stylesheet" href="/resources/css/header_style.css">
  <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
  
<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/css/dashboard_custom.css" rel="stylesheet">

 
</head>

<body id="page-top">
	<div class="container-fluid">
		<!-- Topbar --> 
	</div>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/common/admin-sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->
		<!--***************************************************여기서부터 메인 내용******************************************************-->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="mypage-headline h3 text-gray-800">입금관리</h1>


					<!-- DataTales Example -->
					<div class="main-box card mb-4">

						<div class="card-body">
							<form id="accountForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">

								<div class="d-flex filter-header">
									<!--checkbox-->
									<div class="mr-auto p-2 checkbox">
										<!-- Material inline 1 -->
										<div class="form-check form-check-inline">
											<input type="checkbox" class="form-check-input" value="n" >
											 <label class="form-check-label" for="materialInline1">상품명</label>
											  <input type="checkbox" class="form-check-input" value="p">
												 <label class="form-check-label" for="materialInline2">구매자</label>
												  <input type="checkbox" class="form-check-input" value="c">
												   <label class="form-check-label"	for="materialInline3">판매기업</label>
										</div>

									</div>
									<input type="hidden" name="searchType">
									<!-- Search -->
									<div class="p-2 searchbar">
										<div class="input-group">
											<input type="text" name="searchWord" value="${search.searchWord }" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
											<div class="input-group-append">
												<button id="searchBtn" class="btn btn-primary" type="button">
													<i class="fas fa-search fa-sm"></i>
												</button>
											</div>
										</div>
									</div>
								</div>

								<div class="table-overflow">
									<table class="table table-bordered customers table-width" id="dataTable" cellspacing="0">
										<thead>
											<tr>
												<th>주문일(결제번호)</th>
												<th>상품/옵션정보</th>
												<th>수량</th>
												<th>결제금액</th>
												<th>구매자</th>
												<th>판매기업</th>
												<th>입금상태</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${adminOrderList}" var="o">
											<tr class="even gradeA">
												<td class="order-date center">${o.regdate}
												</td>
												<td style="vertical-align: middle;">
													<p class="align-line">
														<img class="img-product" width="60px" height="60px" src="/file/display/s/${o.file_num }">
													</p>
													<p class="align-line">
													<p class="order-name">${o.product_name }</p>
													<p id="option-select" class="order-option">
														옵션:${o.pd_name } | <span id="option-price">${o.pd_price }</span>
													</p>
												</td>
												<td style="vertical-align: middle;">
													<p class="order-amount">(${o.quantity })</p>
												</td>

												<td style="vertical-align: middle;">
												<c:set value="${o.pd_price * o.quantity}" var="total_price"></c:set>
													<p class="order-price">${total_price}$/</p>
												</td>
												<td class="order-member center">${o.name }</td>
												<td class="order-enterprise center">${o.store_name }</td>

												<td class="order-state center">
												<!-- <span class="order-state-btn btn btn-sm btn-secondary">구매취소</span><br>-->
												<c:choose>
												<c:when test="${o.state == 'PAY_ING'}">
												<span class="order-state-btn btn btn-sm btn-primary">입금대기</span><br>
												<a href="#"><span id="pay_ok" role="${o.checkout_num }" class="order-state-btn btn btn-sm btn-secondary">입금완료</span></a><br>
												</c:when>
												<c:otherwise>
												<span class="order-state-btn btn btn-sm btn-primary">입금완료</span><br>
												</c:otherwise>
												</c:choose>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
							</form>
							<!--pagination***************************-->
							<div class="d-flex flex-row-reverse">
								<nav aria-label="Page navigation example" class="review-paging">
									<ul class="pagination">
										<c:if test="${search.reqPage-1 >= 1}">
											<li class="page-item"><a class="page-link" href="javascript:goPage(${search.reqPage-1});" aria-label="Previous"> <span aria-hidden="true">«</span> <span class="sr-only">Previous</span>
											</a></li>
										</c:if>

										<c:forEach begin="${search.startPage}" end="${search.endPage}" var="num">
											<li class="page-item"><a class="page-link" href="javascript:goPage(${num})">${num }</a></li>
										</c:forEach>

										<c:if test="${search.reqPage+1 <= search.totalPageNum}">
											<li class="page-item"><a class="page-link" href="javascript:goPage(${search.reqPage+1});" aria-label="Next"> <span aria-hidden="true">»</span> <span class="sr-only">Next</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->

		<!-- Footer -->
		<jsp:include page="/WEB-INF/views/common/admin-footer.jsp"></jsp:include>
		<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>
	<script src="/resources/js/dashboard_custom.js"></script>
	<script>
	document.addEventListener('keydown', function(event) {
   		if (event.keyCode === 13) {
   	    	event.preventDefault();
   		}
	}, true);
	
		function goPage(reqPage) {
			var searchType = "";
			$(".form-check-input").each(function() {
				if ($(this).prop("checked") == true) {
					searchType += $(this).val();
				}
			});
			$("input[name='searchType']").val(searchType);
			var query = $("#accountForm").serialize();
			var url = "/admin/account?regPage=" + reqPage + "&" + query;
			location.href = url;
		}

		$(document).ready(function() {
			var searchType = "${search.searchType}";
			if(searchType.indexOf("n") != -1) {
				$("input:checkbox[value='n']").prop("checked", true);
			}
			if(searchType.indexOf("p") != -1) {
				$("input:checkbox[value='p']").prop("checked", true);
			}
			if(searchType.indexOf("c") != -1) {
				$("input:checkbox[value='c']").prop("checked", true);
			}
			
			$("#searchBtn").on("click", function() {
				goPage(1);
			});
			
			$("#pay_ok").on("click",function(){
				var checkout_num = $(this).attr("role");
				var reqPage = "${search.reqPage}";
				
				$.ajax({
					url : "/admin/account/ok?num="+checkout_num,
					method : "GET",
					dateType : "text/plain",
				}).done(function(data) {
					if (data == 'success') {
						alert("입금 확인");
						goPage(reqPage);
					} else if (data == 'fail') {
						alert("올바르지 않은 요청입니다");
						return;
					}
				}).fail(function() {
					alert("SERVER ERROR");
				});
			});
			
		});
	</script>
</body>
</html>







