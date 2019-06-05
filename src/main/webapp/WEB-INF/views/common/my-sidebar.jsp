<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-text mx-3">Mypage</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        계정
      </div>

        <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="/mypage/my_password">
          <i class="fas fa-fw fa-cog"></i>
          <span>비밀번호 변경</span>
        </a>
         
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="/mypage/my_info">
          <i class="fas fa-fw fa-wrench"></i>
          <span>회원정보 수정</span>
        </a>
 
      </li>

      <!-- Nav Item - convert to enterprise -->
      
      <li class="nav-item"> 
        <a class="nav-link" href='
        <c:if test="${role eq 'U'}"><c:out value="javascript:alert('이미 신청 하셨습니다');"></c:out></c:if>
        <c:if test="${role ne 'U'}"><c:out value="/mypage/my_regCor"></c:out></c:if>
        '>
          <i class="fas fa-fw fa-user"></i>
          <span>기업회원 전환</span></a>
      </li>

      <!-- Nav Item - export document confirmation -->
      <li class="nav-item">
        <a class="nav-link" href="/mypage/my_exDoc">
          <i class="fas fa-fw fa-file"></i>
          <span>수출진단 확인</span></a>
      </li>

      <!-- Nav Item - order list -->
      <li class="nav-item">
        <a class="nav-link" href="/mypage/my_order">
           <i class="fas fa-fw fa-shopping-cart"></i>
          <span>주문내역조회</span></a>
      </li>

      <!-- Nav Item - order list -->
      <li class="nav-item">
        <a class="nav-link" href="#">
           <i class="fas fa-fw fa-truck"></i>
          <span>(환불/교환)</span></a>
      </li>


      <!-- Divider -->
      <hr class="sidebar-divider">
<c:if test="${role == 'C'}">
      <!-- Heading -->
      <div class="sidebar-heading">
        기업회원
      </div>
 
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="/mypage/cor_product">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>상품관리</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="/mypage/cor_order">
          <i class="fas fa-fw fa-table"></i>
          <span>고객주문관리</span></a>
      </li>
</c:if>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>