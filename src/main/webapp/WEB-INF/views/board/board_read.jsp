<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">



 <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<!--related CSS file with Survey page-->
<link rel="stylesheet" href="/resources/css/innerest/login.css">
 <link rel="stylesheet" href="/resources/css/innerest/common.css">
 <link rel="stylesheet" href="/resources/css/innerest/board.css">
        <link rel="stylesheet" href="/resources/css/innerest/font.css">
     <link rel="stylesheet" href="/resources/css/innerest/01.content.css">
     <link rel="stylesheet" href="/resources/css/aos.css">
    <link rel="stylesheet" href="/resources/css/style.css">

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

<title>문의 글 보기</title>
<script type="text/javascript">
function toReturnForm(type) {
	var toReturnForm = document.getElementById("toReturnForm");
	
	if(type == 1) { // 수정
		toReturnForm.action = "/board/update/${board.bnum}";
		toReturnForm.method = "get";
		toReturnForm.submit();
		return;
	}
	if(type == 2) { // 답변
		toReturnForm.action = "/board/reply/${board.bnum}";
		toReturnForm.method = "get";
		toReturnForm.submit();
		return;
	}
	if(type == 3) { // 뒤로
		toReturnForm.action = "/board";
		toReturnForm.method = "get";
		toReturnForm.submit();
		return;
	}
}
</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>


<div id="wrapper-login">
      <div class="head-login-form"></div>
</div>


<form id="toReturnForm">
<input type="hidden" name="reqPage" value="${search.reqPage }">
<input type="hidden" name="searchType" value="${search.searchType }">
<input type="hidden" name="searchWord" value="${search.searchWord }">
</form>

<div class="container">
    <h1 style="margin-top: 10px;">게시글 보기</h1>
    <hr>
  
 
글번호:<input type="text" name="num" readonly value="${board.bnum}"><br>
작성자:<input type="text" name="nickname" readonly value="${board.writer}" readonly><br>
제목: <input type="text" name="title" class="form-control" value="${board.title}" readonly><br>
내용:<textarea name="content" rows="25" cols="40" class="form-control" readonly> ${board.content}</textarea><br>

<!-- <button onclick="toReturnForm(1);">수정</button> -->
<c:if test="${id eq 'admin' and board.type eq 'Q'}"><button onclick="toReturnForm(2);">답변</button></c:if>

 <div style="text-align: center;">
 <button onclick="toReturnForm(3);">목록으로..</button> 
</div>

 </div>  
    
<div class="footer-login">
      <p>
         <span>INNEREST</span> &copy; Innerest Corp. All Rights Reserved.
      </p>
</div>

</body>
</html>