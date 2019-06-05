<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!--related CSS file with Survey page-->
<link rel="stylesheet" href="/resources/css/innerest/login.css">
 <link rel="stylesheet" href="/resources/css/innerest/common.css">
 <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
 <link rel="stylesheet" href="/resources/css/innerest/board.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $("qnasubmit").click(
    function() {
       //제목 빈칸 체크
       if($('#title').val()==""){
          alert("제목을 입력해주세요");
          return false;
       }
    });
</script>
  
<title>게시글 수정 페이지</title>
</head>
<body>

<div id="wrapper-login">
      <div class="head-login-form"></div>
</div>

<div class="container">
    <h1 style="margin-top: 10px;">게시글 수정</h1> 
    <hr>

<form action="/article/update" method="post">
<input type="hidden" name="reqPage" value="${search.reqPage }">
<input type="hidden" name="searchType" value="${search.searchType }">
<input type="hidden" name="searchWord" value="${search.searchWord }">

글번호:<input type="text" name="num" readonly value="${board.bnum}"><br>
작성자:<input type="text" name="nickname" readonly value="${board.writer}" readonly><br>
제목:<input type="text" name="title" value="${board.title}"><br>
내용:<textarea name="content" rows="25" cols="40" class="form-control" readonly> ${board.content}</textarea><br>

	<div style="text-align: center;">
<input type="submit" value="수정">
	</div>
</form>

 
</div> 

    
<div class="footer-login">
      <p>
         <span>INNEREST</span> &copy; Innerest Corp. All Rights Reserved.
      </p>
</div>

 
</body>
</html>