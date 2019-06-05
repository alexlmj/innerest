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

  <title>mypage-고객주문관리</title>

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="/resources/css/dashboard_custom.css" rel="stylesheet">

    <!--  마이페이지용 헤더  기존 헤더테스트 -->
  <link rel="stylesheet" href="/resources/css/header_style.css"> 
  <link rel="stylesheet" href="/resources/css/innerest/font.css"> 
  <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
  
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
          <h1 class="mypage-headline h3 text-gray-800">고객주문관리</h1>

          <!-- DataTales Example -->
          <div class="main-box card mb-4">
            <div class="card-body">
            <!--검색창-->
              <div class = "d-flex flex-row-reverse">
                <div class="p-2 searchbar">
                  <form id="myForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 right">
           			<input type="hidden" name="searchType" value="name"> 
                    <div class="input-group">
                      <input type="text" value="${search.searchWord }" name="searchWord" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                      <div class="input-group-append">
                        <button id="searchBtn" class="btn btn-primary" type="button">
                          <i class="fas fa-search fa-sm"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

              <div class="table-overflow">
               <table class="table table-striped table-bordered table-hover table-width" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th class="center">주문일(결제번호)</th>
                                            <th class="center">상품/옵션정보</th>
                                            <th class="center">결제금액 / (수량)</th>
                                            <th class="center">구매자아이디</th>
                                            <th class="center">상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${bizOrderList}" var="o">
                                    	<tr class="gradeA">
                                            <td class="order-date center">${o.regdate}</td>
                                            <td style="vertical-align:middle;">    
                                            	<p class="align-line"><img class="img-product" width="60px" height="60px" src="/file/display/s/${o.file}"></p>
                                                <p class="align-line"><p class="order-name">${o.name}</p>
                                                <p id="option-select" class="order-option">옵션:${o.pd_name} | <span id="option-price">${o.pd_price}</span></p> 
                                            </td>
                                            <c:set var="tot_price" value="${o.pd_price * o.quantity}"></c:set>
                                            <td style="vertical-align: middle;">
                                            <p class="order-price"> ${tot_price} /</p>
                                            <p class="order-amount">${o.quantity} 개</p>
                                             </td>
                                            <td class="order-enterprise center">${o.id}</td>
                                            <td class="order-state center">
                                            
                                           
                                           <c:if test="${o.state eq 'PAY_ING'}">
                                           <a href="#" class="btn btn-secondary btn-icon-split btn-sm">
                                           <span class="text">입금대기</span>
                                           </a>
                                           </c:if>
                                           <c:if test="${o.state eq 'PAY_OK'}">
                                           <a href="#" id="OkBtn_${o.checkout_num}" data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-icon-split btn-sm OkBtn">
                                           <span class="text">입금완료</span>
                                           </a>
                                           </c:if>
               							   <c:if test="${o.state eq 'DEL_ING'}">
                                           <a href="#" class="btn btn-primary btn-icon-split btn-sm OkBtn">
                                           <span class="text">배송중</span>
                                           </a>
                                           </c:if>
                                           <c:if test="${o.state eq 'OK'}">
                                           <a href="#" class="btn btn-primary btn-icon-split btn-sm OkBtn">
                                           <span class="text">판매완료</span>
                                           </a>
                                           </c:if>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
                    <!-- The Modal -->
                      <div class="modal fade" id="myModal"><form id="modalForm">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content">
                          
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">배송정보입력</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class = "modal-wrapper">
                              <div class="modal-body">
                                  <div class = "modal-row row">
                                    <div class = "modal-font col-lg-3 col-md-3">
                                      택배사
                                    </div>
                                    <div class = "col-lg-9 col-md-9">
                                      <input type="text" class  = "post-info-input" name="name" value=""><br>
                                    </div>
                                  </div>

                                  <div class = "modal-row row">
                                    <div class = "modal-font col-lg-3 col-md-3">
                                      운송장
                                    </div>
                                    <div class = "col-lg-9 col-md-9">
                                      <input type="text" class  = "post-info-input" name="waybill" value=""><br>
                                    </div>
                                  </div>
                               
                              </div>
                            </div>
                            <input type="hidden" name="checkout_num">
                            <!-- Modal footer -->
                            <div class="modal-footer">
                              <button id="modalBtn" type="button" class="btn btn-secondary">OK</button>
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            
                          </div>
                        </div> </form>
                      </div>
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

      <jsp:include page="/WEB-INF/views/common/my-footer.jsp"></jsp:include>

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

<script>
function goPage(reqPage) {
	var query = $("#myForm").serialize();
	var url = "/mypage/cor_order?reqPage="+reqPage+"&"+query;
	location.href = url;
}

$(document).ready(function(){
	$("#searchBtn").on("click",function(e){
		goPage(1);
	});
	
	$(".OkBtn").on("click", function(){
		var num = $(this).attr("id").split("_")[1];
		$("input[name='checkout_num']").val(num);
	});
	
	$("#modalBtn").on("click", function(){
		var query = $("#modalForm").serialize();
		$.ajax({
			url : "/mypage/cor_order/delivery",
			method : "POST",
			dateType : "text/plain",
			data : query
		}).done(function(data) {
			if (data == 'success') {
				query = $("#myForm").serialize();
				alert("등록 완료")
				location.href = "/mypage/cor_order?reqPage=${search.reqPage}&" + query;
			} else if (data == 'fail') {
				alert("다시 시도해주세요");
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
