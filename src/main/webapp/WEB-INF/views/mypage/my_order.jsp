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

  <title>Innerest-주문내역확인</title>

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="/resources/css/dashboard_custom.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
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
          <h1 class="mypage-headline h3 text-gray-800">주문내역확인</h1>

          <!-- DataTales Example -->
          <div class="main-box card mb-4">
            <div class="card-body">
            <!--검색창-->
              <div class = "d-flex flex-row-reverse">
                <div class="p-2 searchbar">
                  <form id="myForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 right">
                  <input type="hidden" name="searchType" value="name">
                    <div class="input-group">
                      <input type="text" name="searchWord" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
                                            <th class="center">상품/옵션정보(수량)</th>
                                            <th class="center">결제금액</th>
                                            <th class="center">구매회사</th>
                                            <th class="center" colspan="2">상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                  	  <c:forEach items="${orderList }" var="o">
                                        <tr class="even gradeA" id="checkout-${o.checkout_num}">
                                            <td class="order-date center">${o.regdate}</td>
                                            <td style="vertical-align:middle;">    
                                            	<p class="align-line"><img class="img-product" width="60px" height="60px" src="/file/display/${o.file}"></p>
                                                <p class="align-line"><p class="order-name" id="product-${o.product_num}">${o.name }</p>
                                                <p id="option-select" class="order-option">옵션:<span class="m2">${o.pd_name}</span> | <span id="option-price" class="m3">${o.pd_price }</span></p> 
                                            </td>
                                            <c:set value="${o.quantity * o.pd_price}" var="tot_price"></c:set>
                                            <td style="vertical-align: middle;">
                                            <p class="order-price"> ${tot_price} /</p>
                                            <p class="order-amount">(${o.quantity}개)</p>
                                             </td>
                                            <td class="order-enterprise center">${o.store_name }</td>
                                            
                                <!-- 이 부분은 자바스크립트로, 입급완료시에 바뀌어야 함 --> 
                                <c:choose>
                                <c:when test="${o.state ne 'OK'}">
                               		 <c:if test="${o.state eq 'PAY_ING'}">
                               		 <td colspan="2" class="order-state center">
                               		 <a href="#" class="btn btn-secondary btn-icon-split btn-sm">
                               		 <span class="text">입금대기</span></a></td>
                               		 </c:if>
                               		 
                    	 			 <c:if test="${o.state eq 'PAY_OK'}">
                    	 			 <td colspan="2" class="order-state center">
                    	 			 <a href="#" class="btn btn-secondary btn-icon-split btn-sm">
                    	 			 <span class="text">배송대기</span></a></td>
                    	 			 </c:if>

                    	 			 <c:if test="${o.state eq 'DEL_ING'}">
                    	 			 <td class="order-state center">
                    	 			 <a href="#" role="${o.checkout_num}" class="btn btn-secondary btn-icon-split btn-sm delBtn" data-toggle="modal" data-target="#deliveryModal">
                    	 			 <span class="text">배송중(운송장번호확인)</span></a>
                    	 			 <td>
                    	 			 <a href="#" role="${o.checkout_num}" class="btn btn-review btn-icon-split btn-sm okBtn" >
                                     <span class="text">구매완료</span></a>
                                     </td>
                    	 			 </c:if>
                                </c:when>
                                <c:otherwise>
                                <td colspan="2">
                                	<c:if test="${o.review_flag eq 'N'}">
                                     <a href="#" class="btn btn-review btn-icon-split btn-sm"  data-toggle="modal" data-target="#myModal">
                                     <span class="text">리뷰작성하기</span></a>
                                	</c:if>
                                    <c:if test="${o.review_flag eq 'Y'}">
                                     <a href="/shop/${o.product_num }" class="btn btn-review btn-icon-split btn-sm">
                                     <span class="text">리뷰작성완료</span></a>
                                	</c:if> 
                                </td>
                                </c:otherwise>
                                </c:choose>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                </table>
                                
                                
              <!-- The Modal -->
              <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">후기작성</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class = "modal-wrapper">
                      <div class="modal-body">
                           <p class = "review-p">상품명: <span id = "product-name"></span></p> 
                           <p class = "review-p">옵션: <span id = "product-option"></span></p>
                           <p class = "review-p">가격: <span id = "product-price"></span></p> 
                          <!-- <div class="form-group form-inline">
                            <label for="sel1">별점:</label>
                            <select class="form-control" id="sel1">
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                              <option>5</option>
                            </select>
                          </div> -->
                          <div class="form-group">
                            <label for="comment">후기:</label>
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                          </div>

                           <!--저장하기 버튼-->
                            <div class = " save-btn-wrapper2 d-flex justify-content-center">
                              <button class = "save-btn btn btn-sm btn-primary" id="reviewBtn">저장하기</button>
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

	<!-- 택배 조회 Modal -->
                      <div class="modal fade" id="deliveryModal">
                        <div class="modal-dialog modal-dialog-centered">
                          <div class="modal-content">
                          
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">배송정보확인</h4>
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
                                      <input type="text" readonly="readonly" class  = "post-info-input" name="name" value=""><br>
                                    </div>
                                  </div>

                                  <div class = "modal-row row">
                                    <div class = "modal-font col-lg-3 col-md-3">
                                      운송장
                                    </div>
                                    <div class = "col-lg-9 col-md-9">
                                      <input type="text" readonly="readonly" class  = "post-info-input" name="waybill" value=""><br>
                                    </div>
                                  </div>
                               
                              </div>
                            </div>
                            <input type="hidden" name="checkout_num">
                            <!-- Modal footer -->
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            
                          </div>
                        </div>
                      </div>

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

  <script type="text/javascript">

    var getInfo = function(){
      $(document).on("click","#review-btn",function(e){
        var productName = $(this).closest(".gradeA").find(".order-name").text();
        var productOption = $(this).closest(".gradeA").find(".order-option").text();
        var productPrice = $(this).closest(".gradeA").find(".order-price").text();
        
        $('#product-name').text(productName);
        $('#product-option').text(productOption);
        $('#product-price').text(productPrice);
      });
    };
    getInfo();

  </script>

<script>
function goPage(reqPage) {
	var query = $("#myForm").serialize();
	var url = "/mypage/my_order?reqPage="+reqPage+"&"+query;
	location.href = url;
}

$(document).ready(function(){

    $(".btn-review").on("click",function(){
    	var tr = $(this).closest("tr");
    	var td = tr.children("td");
    	
    	var checkout_num = tr.attr("id").split("-")[1];
    	var product_num = (td.children(".order-name").attr("id").split("-")[1]);
    	var product_name = (td.children(".order-name").text());
    	var option_name = (td.find(".m2").html());
    	var option_price = (td.find(".m3").html());
    	
    	$("#product-name").text(product_name);
    	$("#product-option").text(option_name);
    	$("#product-price").text(option_price);
    	
    	$("#reviewBtn").on("click", function(e){
    		var obj = new Object();
    		obj.product_num = product_num;
    		obj.content = $("#comment").val();
    		obj.checkout_num = checkout_num;
    		
    		var jsonString = JSON.stringify(obj);

    		$.ajax({
    			url : "/ajax/review/",
    			method : "POST",
    			contentType: "application/json",
    			dataType:"text",
    			data: jsonString
    		}).done(function(data) {
    			if(data == 'success') {
    				alert("리뷰를 작성하셨습니다");
    				location.href="/mypage/my_order";
    			}
    		}).fail(function() {
    			alert("SERVER ERROR");
    		});
        });
    });
	
    
    
	$("#searchBtn").on("click",function(e){
		goPage(1);
	});
	
	$(".delBtn").on("click", function(e) {
		var checkout_num = $(this).attr("role");
		
		$.ajax({
			url : "/mypage/delivery/"+checkout_num,
			method : "GET",
			dateType : "json"
		}).done(function(data) {
			$("input[name='name']").val(data.name);
			$("input[name='waybill']").val(data.waybill);
		}).fail(function() {
			alert("SERVER ERROR");
		});
	});
	
	$(".okBtn").on("click", function(e) {
		var checkout_num = $(this).attr("role");
		
		$.ajax({
			url : "/mypage/my_order/ok?checkout_num="+checkout_num,
			method : "GET",
			dateType : "text/plain"
		}).done(function(data) {
			if(data == 'success') {
				alert("구매 완료되었습니다. 리뷰를 작성해주세요!");
				var reqPage = "${search.reqPage}";
				goPage(reqPage);
			} else if(data == 'fail') {
				alert("다시 시도해주세요");
			}
		}).fail(function() {
			alert("SERVER ERROR");
		});
	});
});

</script>
</body>

</html>
