<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>checkout</title>
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

    <!--MainPage CSS-->
    <link rel="stylesheet" href="/resources/css/innerest/common.css">
    <link rel="stylesheet" href="/resources/css/innerest/defualt.css">
    <link rel="stylesheet" href="/resources/css/innerest/font.css">
   
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
          <div class="col-md-12 mb-0"><a href="/">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">Shop</strong><span class="mx-2 mb-0">/</span><strong class="text-color">결제</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
       <!--  <div class="row mb-5">
          <div class="col-md-12">
            <div class="border p-4 rounded" role="alert">
              Returning customer? <a href="#">Click here</a> to login
            </div>
          </div>
        </div> --><form id="checkoutForm">
        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black">주문하기</h2>
            <div class="p-3 p-lg-5 border" id = "billing">
              <!--<div class="form-group">
                <label for="c_country" class="text-black">Country <span class="text-danger">*</span></label>
                <select id="c_country" class="form-control">
                  <option value="1">Select a country</option>    
                  <option value="2">bangladesh</option>    
                  <option value="3">Algeria</option>    
                  <option value="4">Afghanistan</option>    
                  <option value="5">Ghana</option>    
                  <option value="6">Albania</option>    
                  <option value="7">Bahrain</option>    
                  <option value="8">Colombia</option>    
                  <option value="9">Dominican Republic</option>    
                </select>
              </div>-->
              <div class="form-group row">
                <div class="col-md-6">
                  <label for="c_fname" class="text-black">이름(Name) <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_fname" name="name">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_address" class="text-black">주소(Address) <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_address" name="addr" placeholder="Street address">
                </div>
              </div>

              <div class="form-group">
                <input type="text" class="form-control" name="addr_detail" placeholder="Apartment, suite, unit etc. (optional)">
              </div>

              <div class="form-group">
                <div class="col-md-6" id = "zip">
                  <label for="c_postal_zip" class="text-black">우편번호(Zip) <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_postal_zip" name="zip">
                </div>
              </div>

              <div class="form-group row mb-5">
                <div class="col-md-6">
                  <label for="c_email_address" class="text-black">이메일(Email Address) <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_email_address" name="email">
                </div>
                <div class="col-md-6">
                  <label for="c_phone" class="text-black">연락처(Phone) <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_phone" name="phone" placeholder="Phone Number">
                </div>
              </div>

              <!-- <div class="form-group">
                <label for="c_ship_different_address" class="text-black" data-toggle="collapse" href="#ship_different_address" role="button" aria-expanded="false" aria-controls="ship_different_address"><input type="checkbox" value="1" id="c_ship_different_address">다른 주소로 보낼 경우</label>
                <div class="collapse" id="ship_different_address">
                  <div class="py-2">

                    <div class="form-group">
                      <label for="c_diff_country" class="text-black">Country <span class="text-danger">*</span></label>
                      <select id="c_diff_country" class="form-control">
                        <option value="1">Select a country</option>    
                        <option value="2">bangladesh</option>    
                        <option value="3">Algeria</option>    
                        <option value="4">Afghanistan</option>    
                        <option value="5">Ghana</option>    
                        <option value="6">Albania</option>    
                        <option value="7">Bahrain</option>    
                        <option value="8">Colombia</option>    
                        <option value="9">Dominican Republic</option>    
                      </select>
                    </div>


                    <div class="form-group row">
                      <div class="col-md-6">
                        <label for="c_diff_fname" class="text-black">이름(First Name) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_diff_fname" name="c_diff_fname">
                      </div>
                      <div class="col-md-6">
                        <label for="c_diff_lname" class="text-black">성(Last Name) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_diff_lname" name="c_diff_lname">
                      </div>
                    </div>

                    <div class="form-group row">
                      <div class="col-md-12">
                        <label for="c_diff_address" class="text-black">주소(Address) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_diff_address" name="c_diff_address" placeholder="Street address">
                      </div>
                    </div>

                    <div class="form-group">
                      <input type="text" class="form-control" placeholder="Apartment, suite, unit etc. (optional)">
                    </div>

                    <div class="form-group row">
                      <div class="col-md-6" id = "zip">
                        <label for="c_diff_postal_zip" class="text-black">우편번호(Zip) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_diff_postal_zip" name="c_diff_postal_zip">
                      </div>
                    </div>

                    <div class="form-group row mb-5">
                      <div class="col-md-6">
                        <label for="c_diff_email_address" class="text-black">이메일(Email Address) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_diff_email_address" name="c_diff_email_address">
                      </div>
                      <div class="col-md-6">
                        <label for="c_diff_phone" class="text-black">연락처(Phone) <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_diff_phone" name="c_diff_phone" placeholder="Phone Number">
                      </div>
                    </div>

                  </div>

                </div>
              </div> -->

              <div class="form-group">
                <label for="c_order_notes" class="text-black">주문요청사항</label>
                <textarea name="memo" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
              </div>

            </div>
          </div>
          <div class="col-md-6">
            
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">주문내역</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th>상품</th>
                      <th>가격</th>
                    </thead>
                    <tbody>
                    <c:set var= "sum" value="0"/>

                    <c:forEach items="${cartList}" var="c">
                       <c:set var= "price" value="${c.quantity*c.pd_price}"/>
                   	   <tr>
                        <td>${c.name} (옵션:${c.pd_name})<strong class="mx-2">x</strong> ${c.quantity}</td>
                        <td class="pd_price">${price}</td>
                      </tr>
                      <c:set var= "sum" value="${sum + price}"/>
                      <input type="hidden" name="pd_num" value="${c.pd_num}">
                      <input type="hidden" name="quantity" value="${c.quantity}">
                    </c:forEach>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>총 결제 금액</strong></td>
                        <td class="text-black font-weight-bold"><strong id="total">${sum}</strong></td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="border p-3 mb-3">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">계좌 입금</a></h3>

                    <div class="collapse" id="collapsebank">
                      <div class="py-2">
                        <p class="mb-0"><strong>입금계좌번호:</strong>&nbsp;&nbsp;1002-123-456789</p>
                        <p class="mb-0"><strong>입금은행:</strong>&nbsp;&nbsp;우리은행</p>
                        <p class="mb-0"><strong>예금주:</strong>&nbsp;&nbsp;이너레스트 솔루션</p>
                        <p class="mb-0">주문 후 4시간 안에 입금해주셔야 결제가 완료됩니다<br>물품 발송 시 문자 안내를 드립니다</p>
                      </div>
                    </div>
                  </div>

                  <!--<div class="border p-3 mb-3">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>

                    <div class="collapse" id="collapsecheque">
                      <div class="py-2">
                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                      </div>
                    </div>
                  </div>

                  <div class="border p-3 mb-5">
                    <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Paypal</a></h3>

                    <div class="collapse" id="collapsepaypal">
                      <div class="py-2">
                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                      </div>
                    </div>
                  </div>-->
				<input type="hidden" name="price" value="${sum}">
                  <div class="form-group">
                    <button class="btn btn-primary btn-lg py-3 btn-block" id="orderBtn">Place Order</button>
                  </div>

                </div>
              </div>
            </div>

          </div>
        </div></form>
        <!-- </form> -->
      </div>
    </div>
     </div>

 <jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>
 

  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/main.js"></script>
  <script>
  $(document).ready(function(){
	 $("#orderBtn").click(function(){
		var query = $("#checkoutForm").serialize();
		$("#checkoutForm").attr("action","/shop/checkout_b"); 
		$("#checkoutForm").attr("method","post"); 
		$("#checkoutForm").submit();
	 });
  });
  </script>
  </body>
</html>