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

  <title>SB Admin 2 - Tables</title>

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
  
  <!-- Bootstrap core JavaScript-->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level custom scripts -->
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>	
<script>
$(document).ready(function(){
	$(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
             
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });


  $("#infoBtn").click(function(){
    var query = $("#infoForm").serialize();
    var address = $('#address').val(); //주소
    var detail_address = $('#detail_address').val(); //상세주소
    var name = $('#name').val(); //이름
    var phone = $('#phone').val(); //전화번호   
    if(address == ""){
      alert("우편번호를 검색해주세요");
      return false;
    }
    if(detail_address == ""){
      alert("상세주소를 입력해주세요");
      return false;
    }
    //이름 빈칸 체크
    if(name == ""){
      alert("이름을 입력해주세요");
      return false;
    }
    //전화번호 빈칸 체크
    if(phone == ""){
      alert("전화번호를 입력해주세요");
      return false;
    }

    $("#infoForm").attr("action","/mypage/my_info");
    $("#infoForm").attr("method","post");
    $("#infoForm").submit();
    alert("변경되었습니다.");
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
	<!-- end Sidebar -->

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
          <h1 class="mypage-headline h3 text-gray-800">회원정보수정</h1>
			
		  <form id="infoForm">
          <!-- DataTales Example -->
          <div class="main-box card mb-4">
            <div class="card-body">
              <table class = "table export-table">
               <tr class = "export-r">
                 <td class = "p-c1">주소변경</td>
                   <td class = "p-c2" > 
                <input type="text" name="zip" class="postcodify_postcode5 col-6 " value="${user.zip}" placeholder="우편번호" />
           
              <a href="#" class="btn btn-success btn-icon-split">
                              <span id="postcodify_search_button" class="text">우편검색</span>
                      </a>  
          <input type="text" name="addr" class="postcodify_address col-6" id = "address" value="${user.addr}" placeholder="도로명주소" /><br/>
          <input type="text" name="addr_detail" class="postcodify_details col-6" id = "detail_address" value="${user.addr_detail}" placeholder="상세주소" /><br/>
                    </td>
                </tr>
             
                <tr class = "export-r">
                  <td class = "p-c1">이름</td>
                  <td class = "p-c2"> 
                    <input type="text" class="form-control form-control-user col-5 onlyHangul" id="name" name="name" value="${user.name }" placeholder="이름">
                   </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">전화번호</td>
                  <td class = "p-c2"> 
                  <input type="text" class="form-control form-control-user col-6 onlyNumber" id="phone" name="phone" value="${user.phone }" placeholder="전화번호"> 
                  </td>
                </tr>
              </table>

      <div class="text-center">
           <button type="button" class="btn btn-success" id="infoBtn">저장하기</button>
                   <button type="button" class="btn btn-danger"> 취소하기 </button>
      </div> 

            </div>
          </div>
		</form>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
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
</body>

</html>
