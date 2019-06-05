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

  <title>mypage-비밀번호변경</title>

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

<script>

$(document).ready(function(){
	
/* 	//비밀번호 특수문자, 숫자, 문자 포함 여부 확인
$("#password").blur(function(){
  var pw = $('#password').val();

  var pattern1 = /[0-9]/; // 숫자 
  var pattern2 = /[a-zA-Z]/;  // 문자 
  var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;  // 특수문자 
  if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || pw.length < 8) { alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.") }
}); */
  
  
  $("#submitBtn").click(function(e){
    e.preventDefault();
    var query = $("#pwForm").serialize();

    //새비밀번호 검증
    var pw = $("#password").val();
    var confirm_pw = $("#confirm_password").val();

    if(pw =="" || pw.length < 8){
      alert("새 비밀번호를 8자리 이상 입력하세요");
      return false;
    }

    if(pw != confirm_pw || confirm_pw == ""){
      alert("새 비밀번호와 일치하지 않습니다");
      return false;
    }
    
    $.ajax({
         method: "POST",
         url: "/mypage/my_password",
         data: query,
         success: function(data) {
           if(data == 'success') {
             alert("비멀번호가 변경되었습니다.");
             $("form")[0].reset();
           } else if(data == 'fail') {
             alert("비밀번호를 정확히 입력하세요.");
           }
         }
    }); 
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

        <!-- Topbar -->

        <!-- End of Topbar -->



        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="mypage-headline h3 text-gray-800">비밀번호변경</h1>

          <!-- DataTales Example -->
          <div class="main-box card mb-4"> 
            <div class="card-body">
             
             <form class="pure-form" id="pwForm">
              <table class = "table export-table">
                <tr class = "export-r">
                  <td class = "p-c1">현재비밀번호</td>
                  <td class = "p-c2">
                   <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="currerntPassword" name="curPw" placeholder="현재비밀번호">
                  </div> 
                    </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">새 비밀번호 </td>
                  <td class = "p-c2"> 
                   <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" name="newPw" id="password" required class="form-control form-control-user" placeholder="새비밀번호">
                  </div> 
                  </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">비밀번호확인</td>
                  <td class = "p-c2">
                  <div class="col-sm-6">
                    <input type="password" id="confirm_password" required class="form-control form-control-user" placeholder="새비밀번호 확인">
                  </div>
                    </td>
                </tr>
                
               
                    
                 
                   
              </table>
				

				<div class="text-center">
				     <button type="submit" class="btn btn-success pure-button pure-button-primary" id="submitBtn">저장하기</button>
                  
                    <button type="button" class="btn btn-danger">
                    취소하기 </button>
                  
				</div> 
           
           </form>
            </div> 
         
 

          </div>

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
