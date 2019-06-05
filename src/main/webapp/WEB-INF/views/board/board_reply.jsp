<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 글 답변</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
<form action="/board/reply/${parent.bnum}" method="post">
질문자:<input type="text" value="${parent.writer}" readonly><br>
질문제목:<input type="text" readonly value="${parent.title}"><br>
문의내용:<textarea rows="25" cols="20" readonly>${parent.content}</textarea><br>
--------------------------------------------------------------------------------

답변제목:<input type="text" name="title"><br>
답변내용:<textarea rows="25" cols="20" name="content"></textarea><br>

<input type="submit" value="확인"> <input type="button" value="취소" onclick="javascript:location.href='/board';">
</form>
</body>
</html>