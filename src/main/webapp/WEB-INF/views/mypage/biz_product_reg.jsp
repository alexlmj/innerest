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

  <title>mypage-상품등록</title>

  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

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
 $(document).ready(function(){
 
 $(document).on('click', '.add', function(){
  var html = '';
  html += '<tr>';
  html += '<td><input type="text" name="pd_name" class="form-control item_name" /></td>';
  html += '<td><input type="text" name="pd_inven" class="form-control item_quantity" /></td>';
  html += '<td><input type="text" name="pd_price" class="form-control item_price" /> </td>';
	 
//	  html += '<td><select name="item_unit[]" class="form-control item_unit"><option value="">Select Unit</option><?php echo fill_unit_select_box($connect); ?></select></td>';
  html += '<td><button type="button" class="btn btn-danger btn-sm remove"><span class="glyphicon glyphicon-minus"></span></button></td></tr>';
  $('#item_table').append(html);
 });
 
 $(document).on('click', '.remove', function(){
  $(this).closest('tr').remove();
 });
 
 $('#regBtn').on('click', function(){	
  var error = '';
  var tag = '';
  
  $('.item_name').each(function(){
   var count = 1;
   if($(this).val() == '')
   {
    error += "<p>Enter Item Name at "+count+" Row</p>";
    return false;
   }
   count = count + 1;
  });
  
  $('.item_quantity').each(function(){
   var count = 1;
   if($(this).val() == '')
   {
    error += "<p>Enter Item Quantity at "+count+" Row</p>";
    return false;
   }
   count = count + 1;
  });
	 
	 //* select unit 부분인데 Price로 바뀐 영영 *// 
  $('.item_price').each(function(){
   var count = 1;
   if($(this).val() == '')
   {
    error += "<p>Enter Item Price at "+count+" Row</p>";
    return false;
   }
   count = count + 1;
  });

  $('.mytag').each(function(){
	   if($(this).val() != '')
	   {
	    tag += "#"+$(this).val();
	   }
   });	 
   
  $("#tag1").val(tag);
  if(error == '')
  {
	var query = $("#insert_form").serialize();
	var url = "/mypage/cor_product/reg";
	 var form = $("#insert_form")[0];
	 var form_data = new FormData(form);
    $.ajax({
    url: url,
    enctype: 'multipart/form-data',
    method:"POST",
    data: form_data,
    processData: false,
    contentType: false,
    success:function(data)
    {
     if(data == 'success')
     {
    	 alert("등록되었습니다.");
    	 location.href="/mypage/cor_product";
     } else {
    	 alert("ERROR");
     }
    }
   }); 
  }
  else
  {
   $('#error').html('<div class="alert alert-danger">'+error+'</div>');
  }
 });
 
});
</script>
</head>

<body id="page-top">
<div class  = "container-fluid">
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
    <jsp:include page="/WEB-INF/views/common/my-sidebar.jsp"></jsp:include>
    <!-- End of Sidebar -->

<!--***************************************************여기서부터 메인 내용******************************************************-->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
      <form id="insert_form" enctype="multipart/form-data">
        <!-- Topbar -->

        <!-- End of Topbar -->



        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="mypage-headline h3 text-gray-800">상품등록</h1>

          <!-- DataTales Example -->
          <div class="main-box card mb-4">
            <div class="card-body">
              <table class = "table export-table">
                <tr class = "export-r">
                  <td class = "reg_product1">분류</td>
                  <td class = "reg_product2"> 
                  <select name="category">
                 <option value="all" selected="selected"></option> 
 				 <option value="cosmetic">Cosmetic</option>
 				 <option value="pet">Pet product</option>
 				 <option value="food">Food</option>
 				 <option value="etc">Etc</option>
					</select> </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">제품명</td>
                <td class = "p-c2">   
                
                      <input type="text" class="form-control form-control-user col-6" id="exampleInputPassword" name="name" placeholder="(직접 입력하세요)"> 
                      
                        </td> 
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">제품설명</td>
                  <td class = "p-c2">
                  
                <input type="text" class="form-control form-control-user col-6" id="exampleInputPassword" name="des"placeholder="(직접 입력하세요)"> 
                    
                     
                       </td>
                </tr>
                <tr class = "export-r">
                  <td class = "p-c1">가격</td>
                  <td class = "p-c2">
                  
          
                  
                   <input type="text" class="form-control form-control-user col-4" id="exampleInputPassword" name="price"placeholder="(숫자만 입력하세요)"> 
                  
                  
                  </td>
                </tr>
                
                
<!-- 상품수량 체크 
                <tr class = "export-r">
                  <td class = "p-c1">상품수량</td>
                  <td class = "p-c2">
                   <input type="text" name="amount" class="form-control form-control-user col-4" id="exampleInputPassword" name="product_contents"placeholder="(숫자만 입력하세요)"> 
              </td>
                </tr> 
-->
               
               
                <tr class = "export-r">
                  <td class = "p-c1">옵션</td>
                  <td class = "p-c2"> 
                     <div class="container">
    
   
    <div class="table-repsonsive">
     <span id="error"></span>
     <table class="table table-bordered" id="item_table">
      <tr>
       <th>Option Name</th>
       <th>Option Quantity</th>
       <th>Option Price</th>
       <th><button type="button" name="add" class="btn btn-success btn-sm add"> <span class="glyphicon glyphicon-plus"></span></button></th>
      </tr>

     </table>
     <!--
     <div align="center">
     	 <input type="submit" name="submit" class="btn btn-info" value="Insert" />
     </div>
-->
    </div>
  </div>      
                  </td>
                </tr>
 
          
                
                <tr class = "export-r">
                  <td class = "p-c1">해쉬태그</td>
                  <td class = "p-c2">
                 	 <input value="" class="mytag">
                	  <input value="" id="tag2" class="mytag">
               		   <input value="" id="tag3" class="mytag">
               		   <input type="hidden" name="tag" id="tag1">
                 	  </td>
                </tr>
                
                 <tr class = "export-r">
                  <td class = "p-c1">대표이미지</td>
                  <td class = "p-c2">   
<!--
                  
					   <button class="btn btn-sm btn-primary"> 업로드 </button> 
-->
                  
                	  <input type="file" name="title_image" id="myFile">
                  
                   </td>
                </tr>
                
                 <tr class = "export-r">
                  <td class = "p-c1">랜딩이미지</td>
                  <td class = "p-c2">   
            <input type="file" name="content_image" id="myFile">
<!--
  				     <input type="file" id="real-file" hidden="hidden" >
					<button type="btn btn-sm btn-primary" id="custom-button">업로드 </button>
					<span id="custom-text">No file chosen, yet.</span>
-->            </td>
                </tr>
                
              </table> 
            </div>
            
            <!-- 새로운 버전 --> 
             <div class="text-center">
				   <button type="button" id="regBtn" class="btn btn-success">저장하기</button>
                   <button type="button" class="btn btn-danger"> 취소하기 </button>
             </div> 

            
             <!--저장하기 버튼 (예전 Span버전 )
               	<div class="text-center">
				   <a href="#" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                    <span class="text">저장하기</span>
                  </a>
                  
                   <a href="#" class="btn btn-danger btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                    <span class="text">취소하기</span>
                  </a>
                  
				</div>
           
           -->
            
             

            
          </div>
          
          
            
           

        </div>
        <!-- /.container-fluid -->

   </form>
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
