<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <style>
 
 /* 상단 헤더 바 2019.06.03  마이페이지용  */ 

.headerbar { width: 100%; height:30px; width:100%; background : #1a9f9d;  margin: 0; padding: 0;}

.headerbar .fn_menu {float:right; padding-top:4px; line-height: 1.2;} 
.headerbar .fn_menu > ul,li,ol { list-style: none;}
.headerbar .fn_menu > ul {overflow:visible; margin-top:-1px;}
.headerbar .fn_menu > ul > li {float:left; padding-top:1px;}
.headerbar .fn_menu > ul > li + li {margin-left:21px;}
.headerbar .fn_menu a {color:#fff; font-size:12px; letter-spacing:0;  text-decoration: none;}  
  	
 
 </style>
 <!-- 상단 헤더바 2019.06.03 --> 
  <div class="headerbar">
      <div class = "container"> 
     	 <div class="fn_menu">
      	 <ul>
          
  	          <c:choose>
                      
                       <c:when test="${role eq 'P' || role eq 'U'}">
                     	   <li><a href="/logout">로그아웃</a></li>  
                           <li><a href="/mypage/my_password">마이페이지</a></li> 
                       </c:when>
                       
                         <c:when test="${role eq 'C'}">
                          <li><a href="/logout">로그아웃</a></li>  
                           <li><a href="/mypage/my_password">마이페이지</a></li> 
                        </c:when>
                        
                        <c:when test="${role eq 'A'}">
                          <li><a href="/logout">로그아웃</a></li>  
                           <li><a href="/mypage/my_password">마이페이지</a></li>
                            <li><a href="/admin/account">관리자</a></li>  
                        </c:when>
                        
                        <c:otherwise>
                           <li><a href="/login">로그인</a></li> 
                           <li><a href="/regist">회원가입</a></li> 
                           <li><a href="/login">마이페이지</a></li> 
                        </c:otherwise>
                        
               
            </c:choose>
     
  	         
         </ul>
         </div>
      </div>
   </div>
       