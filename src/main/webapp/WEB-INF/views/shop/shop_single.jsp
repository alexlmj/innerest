<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Innerest</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

    <!--shop-single CSS-->
    <link rel="stylesheet" href="/resources/css/innerest/shop.css">

    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
  </head>
  <body>
  
  <div class="site-wrap">
    <jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">Shop</strong><span class="mx-2 mb-0">/</span><strong class="text-color">상품명</strong></div>
        </div>
      </div>
    </div>


    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="/file/display/${product.file_num1}" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-6">
            <h2 class="text-black">${product.name}</h2>
            <p>${product.des}</p>
<!--             <p class="mb-4">Ex numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.</p>
 -->            <p><strong class="text-primary h4">${product.price}$</strong></p>

            <div class ="product-option">
              <select id = "option-list" class="browser-default custom-select">
              	<option selected value="0" disabled="true">--------------</option>
              	<c:forEach items="${product.pdList}" var="option">
                <option value="${option.pd_price}" id="${option.pd_num}">
                <p class= "option-name">${option.pd_name}&nbsp;&nbsp;</p>
                <p>(+<span id = "option-price">${option.pd_price}</span>)</p>  
                </option>
                </c:forEach>
              </select>
            </div>

            <!--상품 추가 기능-->
            <ul class = "selec-product">
              <!--<li class = "selec-wrapper" id= "option_x">
                <p class = "selec-each">testtest</p>
                <p id = "each-price">0</p>
                <div class="selec-count">
                  <div class="add-btn input-group mb-3" style="max-width: 109px;">
                    <div class="input-group-prepend">
                      <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                    </div>
                    <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                    <div class="input-group-append">
                      <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                    </div>
                  </div>
                </div>
                <button class = "remove"><i class="fas fa-times"></i></button>
              </li>-->
            </ul>


            <div class = "price-info">
              <p class = "price-sec1"><strong class="text-primary h4">총 상품금액</strong></p>
              <p class = "price-sec2"><strong class="text-primary h4">$<span id = "total">0.00</span></strong></p>
            </div>
            <div class = "cart-buy-btn">
              <p class = "cart"><a href="#" class="buy-now btn btn-sm btn-primary">장바구니 넣기</a></p>
              <p class = "buy"><a href="#" class="buy-now btn btn-sm btn-primary">구매하기</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- 제품 상세 정보 -->
    <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
        <!--제품상세 section-->
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>제품 상세</h2>           
          </div>
          <img class= "img-responsive" src="/file/display/${product.file_num2}" alt="Image">

        <!--제품 후기 section-->
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>제품 후기</h2>           
          </div>
          <div class= "container review-wrapper">
          	<div class="review">
          	<!--  review here -->
            </div>
            
            <!--pagination-->
            <nav aria-label="Page navigation example" class="review-paging">
                  <ul class="pagination">
                    <c:if test="${page.startPage-1 >= 1}">
                    <li class="page-item">
                      <a class="page-link" href="/shop/${product.num}?reqPage=${page.startPage-1}" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>
                    </c:if>
                    
                    <c:forEach begin="${page.startPage}" end="${page.endPage}" var="num">
                    <li class="page-item"><a class="page-link" href="javascript:getReviewPage(${num})">${num }</a></li>
					</c:forEach>
                    
                    <c:if test="${page.endPage+1 <= page.totalPageNum}">
                    <li class="page-item">
                      <a class="page-link" href="/shop/${product.num}?reqPage=${page.endPage+1}" aria-label="Next">
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

    <!--상위 고정 상품정보창-->   
    <div class = "container" id= "subinfo">
      <div class = "fixWrapper">
        <div class = row>
        <div class = "col-md-6 col-6">
          <h4 id = "productName">${product.name }</h4>
          <p id = "productPrice">${product.price}</p>
        </div>
        <div class = "col-md-6 col-sm-6 col-6">
          <div id = "fixbuynow">
            <a href="#site-section" class = "buy-now btn btn-sm btn-primary">구매하러가기</a>
          </div>
        </div>
      </div>
      </div>
    </div>
    
	<!-- hidden Form -->
    <form id="shopForm">
    </form>	
    
    <jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>
  </div>

  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/shop.js"></script>
  <script src="/resources/js/main.js"></script>
  
  <script type="text/javascript">
    $.each($("input[name='whatever1']"), function(){          
      var ratingValue = $(this).val();
      var $star_rating = $(this).closest('.star-rating').find('.fa');

      var SetRatingStar = function() {
        return $star_rating.each(function() {
          if (parseInt(ratingValue) >= parseInt($(this).data('rating'))) {
            return $(this).removeClass('fa-star-o').addClass('fa-star');
          } else {
            return $(this).removeClass('fa-star').addClass('fa-star-o');
          }
        });
      };

      SetRatingStar();

    });
    
    function showReviewPage(data) {
    	$(".review").empty();
    	for(var i=0; i<data.length; i++) {
			var html = '<div class = "col-lg-6 col-sm-12">'+
	            	   '<p>'+data[i].id+'</p><p>'+data[i].regdate+'</p><p>'+data[i].content+'</p></div>';
			$(".review").append(html);
		}
    }
    
    function getReviewPage(reqPage) {
    	var obj = new Object();
    	obj.reqPage = reqPage;
    	
    	$.ajax({
    		url : "/ajax/review/${product.num}",
    		method: "post",
    		contentType: "application/json",
    		data : JSON.stringify(obj)
    	}).done(function(data) {
    		showReviewPage(data);
    	}).fail(function(){
    		alert("SERVER ERROR");
    		return;
    	});
    }
    
    $(document).ready(function(){
    	getReviewPage(1);
    });
  </script>
    
  </body>
</html>