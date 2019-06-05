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

  <title>Innerest - 기업회원전환</title>

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
	
 
<!-- Bootstrap core JavaScript-->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin-2.min.js"></script>
  <script src="/resources/js/jquery.validate.min.js"></script>


  <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
  <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script>
$(document).ready(function(){
  $('#corForm').validate({
            rules: {
                store_name:{required:true}, // 스토어명
                rep_name:{required:true}, // 대표자명
                biz_number:{required:true, digits:true}, // 사업자번호
                business:{required:true}, // 업태
                sector:{required:true}, // 업종
                csbr_flag:{required:true}, // 신고
                qna_phone:{required:true, digits:true}, // cs대표번호
                manager_phone:{required:true, digits:true}, // 담당자 번호
                out_zip:{required:true, digits:true} // 우편번호
            },
            messages: {
                store_name: {
                     required:"스토어명을 입력하세요."
                },
                rep_name: {
                     required:"대표자명을 입력하세요."
                },
                biz_number: {
                     required:"사업자번호를 입력하세요."
                },
                business: {
                     required:"업태를 입력하세요."
                },
                sector: {
                     required:"업종을 입력하세요."
                },
                csbr_flag: {
                     required:"신고여부를 선택해주세요.",
                },
                qna_phone: {
                     required:"고객대표번호를 입력하세요.",
                     digits: "숫자만 입력하세요"
                },
                manager_phone: {
                     required:"담당자 번호를 입력하세요.",
                     digits: "숫자만 입력하세요"
                },
                out_zip: {
                     required:"주소를 입력하세요."
                }
            },
            submitHandler: function (frm){
                //frm.attr("action","/mypage/my_regCor"),
                //frm.attr("method","post"),
                frm.submit();   //유효성 검사를 통과시 전송
            },
            success: function(e){
            }
           
        });
	
	//$("#corBtn").click(function(){
		//javascript 검증 필요
		//var f = $("#corForm");
		
		//f.attr("action","/mypage/my_regCor");
		//f.attr("method","post");
		//f.submit();
	//});
});
</script>
	
</head>

<body id="page-top">
<jsp:include page="/WEB-INF/views/common/default-header-bar.jsp"></jsp:include>

<div class  = "container-fluid">
	    <jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>
</div>
              <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar static-top">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

              <a id = "logo" href="#"><h2>INNEREST</h2></a>

        </nav>

</div>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/common/my-sidebar.jsp" />
    <!-- End of Sidebar -->

<!--***************************************************여기서부터 메인 내용******************************************************-->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
      <form id="corForm" method="post" action="/mypage/my_regCor">
		<input type="hidden" name="user_num" value="${num}">
        <!-- Topbar -->

        <!-- End of Topbar -->



        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="mypage-headline h3 text-gray-800">기업회원전환</h1>
			
          <!-- DataTales Example -->
          <div class="main-box card mb-7">
          
            <div class="card-body">
              <table class = "table export-table">
                <tr class = "export-r">
                  <td class = "p-c1">스토어명</td>
                  <td class = "p-c3">   
                  		<input type="text" class="form-control form-control-user col-6" name="store_name" placeholder=""> 
                  </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">대표자명</td>
                  <td class = "p-c3">  
                    <input type="text" class="form-control form-control-user col-6" name="rep_name" placeholder="">
                  </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">사업자 등록번호</td>
                  <td class = "p-c3">  
                    <input type="text" name="biz_number" class="form-control form-control-user col-6" placeholder="-없이 입력해주세요">  
                  </td>
                </tr>
                
               <tr class = "export-r">
                 <td class = "p-c1">업태</td>
                  <td class = "p-c3">  
                    <input type="text" name="business" class="form-control form-control-user col-6" placeholder="">  
                  </td>
                </tr>
                
                 <tr class = "export-r">
                 <td class = "p-c1">업종</td>
                  <td class = "p-c3">  
                    <input type="text" name="sector" class="form-control form-control-user col-6" placeholder="">  
                  </td>
                </tr>
                
                <tr class = "export-r">
                 <td class = "p-c1">통신판매업 신고를 하셨습니까?</td>
                  <td class = "p-c3">
                      <label class="radio-inline"><input type="radio" name="csbr_flag" value = "N" id = "csbr_flag" checked style = "margin: 0px 5px;">신고함</label>
                      <label class="radio-inline"><input type="radio" name="csbr_flag" value = "Y" id = "csbr_flag" style = "margin: 0px 5px;">신고안함</label>
                  </td>
                </tr>
                
                 <tr class = "export-r">
                 <td class = "p-c1">고객문의 대표번호</td>
                  <td class = "p-c3">  
                    <input type="text" name="qna_phone" class="form-control form-control-user col-6" placeholder="">  
                  </td>
                </tr>
                
                 <tr class = "export-r">
                 <td class = "p-c1">담당자 번호</td>
                  <td class = "p-c3">  
                    <input type="text" name="manager_phone" class="form-control form-control-user col-6" placeholder="">  
                  </td>
                </tr>
                
                 <tr class = "export-r">
                 <td class = "p-c1">출고지 주소</td>
                   <td class = "p-c2" > 
           			<input type="text" name="out_zip" class="postcodify_postcode5 col-6 " placeholder="우편번호" />
		 			 
						  <a href="#" class="btn btn-success btn-icon-split">
                              <span id="postcodify_search_button" class="text">우편검색</span>
            		      </a>  
					<input type="text" name="out_addr" class="postcodify_address col-6 " placeholder="도로명주소" /><br/>
					<input type="text" name="out_addr_detail" class="postcodify_details col-6 " placeholder="상세주소" /><br/>
                    </td>
                </tr>          
              </table>

              

             <div class="text-center">
				   <button type="submit" id="corBtn" class="btn btn-success">저장하기</button>
                   <button type="button" class="btn btn-danger"> 취소하기 </button>
                  
			</div> 

 

            </div>
          </div>

        </div></form>
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
