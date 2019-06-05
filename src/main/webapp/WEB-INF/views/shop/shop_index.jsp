<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Innerest-Shop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

    <!--related CSS file with Shop page-->
    <link rel="stylesheet" href="/resources/css/innerest/01.content.css">
    <link rel="stylesheet" href="/resources/css/innerest/02.survey_style.css">
    <link rel="stylesheet" href="/resources/css/innerest/03.loading_page.css">
    <link rel="stylesheet" href="/resources/css/innerest/04.selection.css">
    <link rel="stylesheet" href="/resources/css/innerest/common.css">
    <link rel="stylesheet" href="/resources/css/innerest/defualt.css">
    <link rel="stylesheet" href="/resources/css/innerest/font.css">
    <link rel="stylesheet" href="/resources/css/aos.css">
    <link rel="stylesheet" href="/resources/css/style.css">
  </head>
  <body>
  
  <div class="site-wrap">
  
   <jsp:include page="/WEB-INF/views/common/default-header-bar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/common/default-header-shop.jsp"></jsp:include>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">Shop</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
        
          <div class="col-md-9 order-2">
            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Shop All</h2></div>
                <div class="d-flex">
                  <div class="dropdown mr-1 ml-md-auto">
                    <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   		 정렬
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                      <a class="dropdown-item" href="#" val="new">최신순</a>
                      <a class="dropdown-item" href="#" val="high">높은 가격순</a>
                      <a class="dropdown-item" href="#" val="low">낮은가격순</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!--product list / 아이템 총 12개-->
            <div class="row mb-5">
			<c:forEach items="${pList}" var="p">
				<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                <div class="block-4 text-center border">
                  <figure class="block-4-image">
                    <a href="/shop/${p.num}">
                    <img src="/file/display/${p.file_num1}" alt="Image placeholder" class="img-fluid">
                    </a>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="/shop/${p.num}"><c:out value="${p.name}"/> </a></h3>
                    <p class="mb-0">${p.des }</p>
                    <p class="text-primary font-weight-bold">${p.price}$</p>
                  </div>
                </div>
              </div>
			</c:forEach>
            </div>

            <!--paging-->
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                  <ul>
                    <c:if test="${page.reqPage-1 >= 1}"> <li><a href="javascript:sendForm(${page.reqPage-1});">&lt;</a></li></c:if>
                    	<c:forEach begin="${page.startPage}" end="${page.endPage}" var="num">
							<li <c:if test="${page.reqPage eq num}"><c:out value="class=active"/></c:if>>
								<a href="javascript:sendForm(${num});"><c:out value="${num}"/></a></li>
						</c:forEach>
                    <c:if test="${page.reqPage+1 <= page.totalPageNum}"><li><a href="javascript:sendForm(${page.reqPage+1});">&gt;</a></li></c:if>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- end paging -->
				
          <!-- category -->
          <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="#" class="d-flex"><span>ALL</span> <span class="text-black ml-auto" id="all"></span></a></li>
                <c:forEach items="${categoryList}" var="c"> <!-- ALL COSMETIC PET FOOD ETC -->
                <li class="mb-1"><a href="#" class="d-flex">
                <span class="categorySpan">${c.name}</span>
                <span class="text-black ml-auto">(<span class="category-count">${c.count}</span>)</span>
                </a></li>
                </c:forEach>
                </ul>
            </div>
          </div>
          <!-- end category -->
          
          <form id="shopForm" method="get" action="/shop">
	 		 <input type="hidden" name="sortType" id="sort_type" value="${sortType}">
	 		 <input type="hidden" name="category" id="category" value="${category}">
	 		 <input type="hidden" name="reqPage" id="reqPage">
          </form>
          
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>
  </div>
  
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/main.js"></script>
  <script>
  
  
  function sendForm(reqPage) {
	  $("#reqPage").val(reqPage);
	  $("#shopForm").submit();
  }
  
  $(document).ready(function(){
	  var count = 0;
	  $(".category-count").each(function(){
		  count += Number($(this).html());
	  })
	  $("#all").html("("+count+")");
	  
      $(".dropdown-item").on("click",function(){
    	  var sortType = $(this).attr("val");
    	  $("#sort_type").val(sortType);
    	  sendForm(1);
      });

      $(".mb-1").on("click",function(){
    	  var categoryValue = $(this).find(".categorySpan").html();
    	  $("#category").val(categoryValue);
    	  sendForm(1);
      });
  });
  
  
  </script>
  </body>
</html>