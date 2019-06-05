<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>mypage-수출진단확인</title>

  <!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!--  마이페이지용 헤더  기존 헤더테스트 -->
  <link rel="stylesheet" href="/resources/css/header_style.css"> 
  <link rel="stylesheet" href="/resources/css/innerest/font.css"> 
  <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
 
  <!-- Custom styles for this template -->
  <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="/resources/css/dashboard_custom.css" rel="stylesheet">
  
  <!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

  <script>
function goPage(reqPage) {
	var query = $("#myForm").serialize();
	var url = "/mypage/my_exDoc?reqPage="+reqPage+"&"+query;
	location.href = url;
}
$(document).ready(function(){
	$("#searchBtn").on("click",function(e){
		goPage(1);
	});
});

</script>
 

</head>

<body id="page-top">
<jsp:include page="/WEB-INF/views/common/default-header-bar.jsp"></jsp:include>

<div class  = "container-fluid">
	    <jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>
</div>

  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/common/my-sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

<!--***************************************************여기서부터 메인 내용******************************************************-->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="mypage-headline h3 text-gray-800">수출진단확인</h1>

          <!-- DataTales Example -->
          <div class="main-box card mb-4">
           
            <div class="card-body">
            <!--검색창-->
              <div class = "d-flex flex-row-reverse">
                <div class="p-2 searchbar">
                  <form id="myForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 right">
                    <div class="input-group">
                      <input type="hidden" name="searchType" value="name">
                      <input type="text" id="searchWord" name="searchWord" value="${search.searchWord}" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
                     <th> 진단날짜 </th> 
                 
                      <th>제품명</th>
                      <th>HS-code</th>
                      <th>산출비용</th> 
                      <th>필요서류</th>
                    </tr>
                  </thead>
                <tbody>
 
 <c:forEach items="${docList}" var="d">
  <tr>
    <td>
       	${d.regdate}
    </td>
     <td> ${d.name} </td>
    <td>
    <!-- hscode확인 불러오기 --> 
    
    ${d.hs_code }
    </td>
    <td>
    <c:choose>
    <c:when test="${d.state == 'ING' }">진행중...</c:when>
    <c:otherwise>${d.price} $</c:otherwise>
    </c:choose>
    </td>
    <td id = "order-state">
    <c:choose>
    <c:when test="${d.state == 'ING' }">진행중...</c:when>
    <c:otherwise>${d.document }</c:otherwise>
    </c:choose>
    </td>
  </tr>
 </c:forEach>
    </tbody>
                </table>
                 
								</form>
              </div>
              
              <!--pagination-->
              <div class = "d-flex flex-row-reverse">
                <nav aria-label="Page navigation example" class="review-paging">
                  <ul class="pagination">
                    <c:if test="${search.startPage-1 >= 1}">
                    <li class="page-item">
                      <a class="page-link" href="javascript:goPage(${search.startPage-1});" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>
                    </c:if>
                    
                    <c:forEach begin="${search.startPage}" end="${search.endPage}" var="num">
                    <li class="page-item"><a class="page-link" href="javascript:goPage(${num})">${num }</a></li>
					</c:forEach>
                    
                    <c:if test="${search.endPage+1 <= search.totalPageNum}">
                    <li class="page-item">
                      <a class="page-link" href="javascript:goPage(${search.endPage+1});" aria-label="Next">
                        <span aria-hidden="true">»</span>
                        <span class="sr-only">Next</span>
                      </a>
                    </li>
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
      <jsp:include page="/WEB-INF/views/common/my-footer.jsp"></jsp:include>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  

</body>

</html>
