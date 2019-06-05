<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
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

<title>게시글 작성 페이지</title>
</head>
<body>


<div id="wrapper-login">
      <div class="head-login-form"></div>
</div>


  <div class="container">
    <h1 style="margin-top: 10px;">게시글 작성</h1>
    <p>문의가 있으시다면 남겨주세요.</p>
    <hr>
  


<form id = "qna-docs" action="/board/write" method="post">
작성자:<input type="text" name="writer" value="${id}" readonly><br>
제목:<input type="text" name="title" id = "title">
<br>
내용:<textarea name="content" id = "content" rows="25" cols="40" class="form-control"></textarea><br>
<div class="board-margin">
비밀글여부: 공개<input type="radio" name="open_flag" checked value="Y"> 비공개<input type="radio" name="open_flag" value="N">
</div> <br>
<div style="text-align: center;">
   <input type="submit" id = "qnasubmit" value="확인" >
   <input type="reset" value="취소" >
</div>
</form>

</div> 

    
<div class="footer-login">
      <p>
         <span>INNEREST</span> &copy; Innerest Corp. All Rights Reserved.
      </p>
</div>

<script type="text/javascript">
$("#qna-docs").submit(function(){
  var title = $('#title').val(); //제목
  var content = $('#content').val(); // 내용
  
  //제목 빈칸 체크 
  if(title==""){
    alert("제목을 입력해주세요");
    return false;
  }

  //내용 빈칸 체크
  if(content==""){
    alert("내용을 입력해주세요");
    return false;
  }
  });
</script>
</body>
</html>