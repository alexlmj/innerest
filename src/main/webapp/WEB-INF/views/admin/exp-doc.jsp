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

<title>INNEREST-진단관리</title>
<!--  헤더테스트 -->
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
					<h1 class="mypage-headline h3 text-gray-800">진단관리</h1>


					<!-- DataTales Example -->
					<div class="main-box card mb-4">

						<div class="card-body">

							<!-- Search -->
							<div class="p-2 searchbar">
								<form id="adminForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
									<input type="hidden" name="reqPage" value="${search.reqPage }">
									<input type="hidden" name="searchType" value=${search.searchType }>
									<div class="input-group">
										<input type="text" name="searchWord" value="${search.searchWord}" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<div class="table-overflow">

							<form>

								<table class="table table-bordered customers table-width" id="dataTable" width="100%" cellspacing="0">


									<thead>
									
										<tr>
											<th><input type="checkbox" name="all" class="check-all"></th>
											<th scope="col">기업명</th>
											<th scope="col">제품명</th>
											<th scope="col">출발지</th>
											<th scope="col">수출국가</th>
											<th scope="col">선적종류</th>
											<th scope="col">도착지</th>
											<th scope="col">G/W</th>
											<th scope="col">HS-code</th>
											<th scope="col">수출필요서류</th>
											<th scope="col">산출비용</th>
											<th scope="col">저장날짜</th>
										</tr>
										
									</thead>
									<tbody>
										<c:forEach items="${dList }" var="d">
										<tr class="member-info" id="${d.num }">
											<td><input type="checkbox" name="cb" class="ab"></td>

											<td class="member-id">${d.store_name }</td>
											<td class="member-email">${d.name }</td>
											<td class="member-name">${ d.start_point}</td>
											<td class="member-contact">${d.country }</td>
											<td class="member-address">${d.transport }</td>
											<td class="member-joindate">${d.end_point }</td>
											<td class="member-enterprise">${d.weight }</td>
											<td class="member-enterprise">${d.hs_code }</td>
											<td class="member-required-dcs"><input type="text" name="required-docs" class="expo-input" value="${d.document }"></td>
											<td class="member-expense"><input type="text" name="expense" class="expo-input" value="${d.price }"></td>
											<td class="member-date">${d.regdate }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>

							</form>
						</div>
					</div>

					<!--pagination-->
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

					<!--저장하기 버튼-->
					<div class=" save-btn-wrapper2 d-flex justify-content-center">
						<button class="save-btn btn btn-sm btn-primary" id="saveBtn">저장하기</button>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->

		
<!-- Footer -->
		<jsp:include page="/WEB-INF/views/common/admin-footer.jsp"></jsp:include>
<!-- End of Footer -->

		</div>
		<!-- End of Main Content -->

 
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
			$("input[name='reqPage']").val(reqPage);
			$("#adminForm").attr("action","/admin/exDoc");
			$("#adminForm").attr("method","post");
			$("#adminForm").submit();
		}

		$(document).ready(function() {
			$("#searchBtn").on("click", function() {
				goPage(1);
			});
			
			$("#saveBtn").on("click", function(){
				var docArray = new Array();
				
				$(".member-info").each(function(){
					var ck = $(this).find("input[name='cb']").prop("checked");
					if(ck == false) {
						return true;
					}
					var obj = new Object();
					
					var num = $(this).attr("id");
					var doc = $(this).find("input[name='required-docs']").val();
					var price = $(this).find("input[name='expense']").val();
					
					obj.num = num;
					obj.document = doc;
					obj.price = price;
					
					docArray.push(obj);
				});
				var jsonData = JSON.stringify(docArray);
				
				if(docArray.length < 1) {
					alert("수정하실 수출 서류를 체크해주세요.");
					return;
				}
				
			    $.ajax({
			    	url : "/ajax/document",
			    	type : "post",
			    	contentType: "application/json",
			    	dataType : "text",
			    	data : jsonData
				}).done(function(data){
					if(data == 'success') {
						alert("수정 완료");
						return;
					} else if (data == 'fail') {
						alert('다시 시도해주세요');
					}
				}).fail(function() {
					alert("SERVER ERROR");
				});
			});
			
			
		});
  </script>
</body>

</html>
