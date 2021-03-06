<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="site-navbar" role="banner">
   <div class="site-navbar-top">
      <div class="container">
         <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
               <!--<form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
                <input type="text" class="form-control border-0" placeholder="Search">
              </form>-->
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
               <div class="site-logo">
                  <a href="/"><img src="/resources/images/logo/logo_home.png" alt="innerest 로고" title="innerest"></a>
               </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
               <div class="site-top-icons">
                  <ul>
                     <c:choose>
                        <c:when test="${role eq 'P' || role eq 'U'}">
                           <li><a href="/mypage/my_order"><span class="icon icon-person"></span></a></li>
                                             <!--<li><a href="#"><span class="icon icon-heart-o"></span></a></li>-->
                           <li><a href="/shop/cart" class="site-cart"> <span class="icon icon-shopping_cart">
                           </span><span class="count">${cart }</span>
                           </a></li>
                        </c:when>
                        <c:when test="${role eq 'C'}">
                           <li><a href="/mypage/my_order"><span class="icon icon-person"></span></a></li>
                           
                           <!--<li><a href="#"><span class="icon icon-heart-o"></span></a></li>-->
                           <li><a href="/shop/cart" class="site-cart"> <span class="icon icon-shopping_cart">
                           </span><span class="count">${cart }</span>
                           </a></li>
                        </c:when>
                        <c:when test="${role eq 'A'}">
                           <li><a href="/admin/account"><span class="icon icon-person"></span></a></li>
                           
                           <!--<li><a href="#"><span class="icon icon-heart-o"></span></a></li>-->
                           <!-- <li><a href="/shop/cart" class="site-cart"> <span class="icon icon-shopping_cart">
                           </span><span class="count">2</span>
                           </a></li> -->
                        </c:when>
                        <c:otherwise>
                           <li><a href="/login"><span class="icon icon-person"></span></a></li>
                           <!--<li><a href="#"><span class="icon icon-heart-o"></span></a></li>-->
                           <li><a href="/login" class="site-cart"> <span class="icon icon-shopping_cart"></span></a></li>
                        </c:otherwise>
                     </c:choose>

                     <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                  </ul>
               </div>
            </div>

         </div>
      </div>
   </div>
   <nav class="site-navigation text-right text-md-center" role="navigation">
      <div class="container">
         <ul class="site-menu js-clone-nav d-none d-md-block">
            <li><a href="/">Home</a></li>
            <li><a href="/shop">Shop</a></li>
            <li><a href="/survey">Self-diagnostic</a></li>
            <li><a href="/document">Export document</a></li>
            <li><a href="/board">Q&amp;A</a></li>
         </ul>
      </div>
   </nav>
</header>

