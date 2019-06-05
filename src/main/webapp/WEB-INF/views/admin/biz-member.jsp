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

  <title>INNEREST-기업회원심사</title>
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
<div class  = "container-fluid"> 

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

        <!-- Topbar -->

        <!-- End of Topbar -->



        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="mypage-headline h3 text-gray-800">기업회원심사</h1>

          
          <div class="main-box card mb-4">
            <div class="card-body">

            <div class = "d-flex filter-header">
            <!--checkbox-->
            <div class = "mr-auto p-2 checkbox">
                <!-- Material inline 1 -->
                <div class="form-check form-check-inline">
                  <input type="checkbox" class="form-check-input" value="i">
                  <label class="form-check-label" for="materialInline1">회원아이디</label>
                </div>

                <!-- Material inline 2 -->
                <div class="form-check form-check-inline">
                    <input type="checkbox" class="form-check-input" value="n">
                    <label class="form-check-label" for="materialInline2">회원이름</label>
                </div>
            </div>
            
            <!-- Search -->
          <div class = "p-2 searchbar">
            <form id="adminForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<input type="hidden" name="searchType" value=${search.searchType }>
              <div class="input-group">
                <input type="text" name="searchWord" value="${search.searchWord}" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                  </button>
                </div>
              </div>
            </form>
            <!--<div class="input-group md-form form-sm form-2 pl-0">
              <input class="form-control my-0 py-1 red-border" type="text" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="input-group-text red lighten-3" id="basic-text1"><i class="fas fa-search text-grey" aria-hidden="true"></i></button>
              </div>
            </div>-->
          </div> 
            </div>


            <!-- 회원관리 테이블 시작 -->
              <div class = "table-overflow">
                <table class="table table-striped table-width">
                  <thead>
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">회원ID</th>
                      <th scope="col">Email</th>
                      <th scope="col">이름</th>
                      <th scope="col">연락처</th>
                      <th scope="col">주소</th>
                      <th scope="col">가입일자</th>
                      <th scope="col">기업회원</th>
                      <th scope="col">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${uList}" var="u">
                    <tr class = "member-info">
                      <th class = "member-numbering" scope="row">${u.num}</th>
                      <td class = "member-id">${u.id }</td>
                      <td class = "member-email">${u.email }</td>
                      <td class = "member-name">${u.name }</td>
                      <td class = "member-contact">${u.phone }</td>
                      <td class = "member-address">${u.addr} ${u.addr_detail }</td>
                      <td class = "member-joindate">${u.regdate }</td>
                      <td class = "member-enterprise">
					  <c:if test="${u.role == 'C' }">O</c:if>
					  <c:if test="${u.role == 'P' || u.role == 'U' }">X</c:if>
					  </td>
                      <td class = "member-edit">
                        <a class = "member-remove btn btn-sm btn-danger" role="${u.num }" href="#" id="changeBtn">전환</a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
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

  <!--dashboard_custom.js-->
  <script src="/resources/js/dashboard_custom.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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
			var query = $("#adminForm").serialize();
			var url = "/admin/cor_member?regPage=" + reqPage + "&" + query;
			location.href = url;
		}

		$(document).ready(function() {
			var searchType = "${search.searchType}";
			if(searchType.indexOf("i") != -1) {
				$("input:checkbox[value='i']").prop("checked", true);
			}
			if(searchType.indexOf("n") != -1) {
				$("input:checkbox[value='n']").prop("checked", true);
			}
			
			$("#searchBtn").on("click", function() {
				goPage(1);
			});
			
			$("#changeBtn").on("click", function(){
				var num = $(this).attr("role");
				var reqPage = "${search.reqPage}";
				$.ajax({
					url : "/admin/upgrade/"+num,
					method : "GET",
					dateType : "text/plain",
				}).done(function(data) {
					if (data == 'success') {
						alert("전환 완료");
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
