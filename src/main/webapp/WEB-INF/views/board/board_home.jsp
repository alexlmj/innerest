<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
     
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
   <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">

    <!--related CSS file with Survey page-->
    <link rel="stylesheet" href="/resources/css/innerest/01.content.css">
    <link rel="stylesheet" href="/resources/css/innerest/common.css">
    <link rel="stylesheet" href="/resources/css/innerest/defualt.css">
    <link rel="stylesheet" href="/resources/css/innerest/font.css">
    <link rel="stylesheet" href="/resources/css/aos.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>Q&A</title>

<script type="text/javascript">

	document.addEventListener('keydown', function(event) {
   		if (event.keyCode === 13) {
   	    	event.preventDefault();
   		}
	}, true);

	function goPage(url, names, values) {
		var u="";
		if(Array.isArray(names)) {
			u = url + "?" + names[0] + "=" + values[0];
			for(var i=1;i<names.length;i++) {
				u += "&" + names[i] + "=" + values[i];
			}
		} else {
			u = url + "?" + names + "=" + values;
		}
		location.href = u;
	}
	
	function goSearch() {
		var sForm = document.searchForm;
		var reqPage = 1;
		
		var types = sForm.searchType;
		var searchType="";	
		for(var i=0;i<types.length;i++) {
			if(types[i].checked == true) {
				searchType += types[i].value;	
			}
		}
		var searchWord = sForm.searchWord.value;
		
		goPage("/board", ['reqPage','searchType','searchWord'] ,
				[reqPage,searchType,searchWord] );
	}
</script>

<style type="text/css">
#page a{
	color:black;
	text-decoration: none;
}

#page a#reqPage{
	color:red;
}

#page a:hover{
	color:red;
}

</style>

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/default-header-bar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/common/default-header.jsp"></jsp:include>
	
	<div class="site-wrap">
	<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-color">Q&amp;A</strong></div>
        </div>
      </div>
    </div>
    
    </div>

	<div class="container">
	
  <h2 style="margin-top: 20px;">Q &amp; A</h2>
  <p> 문의사항은 이곳에 남겨주세요 </p> 
  
  <div class="row">
  <div class="col-md-6 text-left">
  
  
  <div class = "write_button" > 
  <button class="btn btn-info btn-lg" onclick="javascript:location.href='/board/write'">글쓰기</button>
  </div>
  
  
   
  
  </div>
	<div id="search" class="col-md-6 text-right">
		<form id="searchForm" name="searchForm">
			<input <c:if test="${search.searchType.contains('t')}">checked="checked"</c:if> type="checkbox" name="searchType" value="t">제목
			<input <c:if test="${search.searchType.contains('c')}">checked="checked"</c:if> type="checkbox" name="searchType" value="c">내용
			<input <c:if test="${search.searchType.contains('w')}">checked="checked"</c:if> type="checkbox" name="searchType" value="w">작성자
			<input type="text" name="searchWord" value="${search.searchWord}"> <button type="button" onclick="goSearch()">검색</button>
		</form>
	</div>           
</div>

<div class="row">
  <table class="col-md-12 table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${boardList}" var="item">
			<tr>
				<td>${item.bnum}</td>
				<td>
				<c:if test="${item.type eq 'A'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
				<c:if test="${item.open_flag eq 'N'}"><span class="glyphicon glyphicon-lock"></span></c:if>
				<c:if test="${item.type eq 'A'}">[답변]&nbsp;</c:if>
				<a href="javascript:goPage('/board/read/${item.bnum }',['reqPage','searchType','searchWord'],[${search.reqPage},'${search.searchType}','${search.searchWord}']);">${item.title}</a>
				</td>
				<td><a href="#">${item.writer}</a></td>
				<jsp:useBean id="curTime" class="java.util.Date" />
				<fmt:formatDate var="curDate" value="${curTime}" pattern="yyyy-MM-dd" />
				<fmt:formatDate var="itemDate" value="${item.regdate}" pattern="yyyy-MM-dd" />
				
				<c:choose>
					<c:when test="${curDate eq itemDate}">
						<fmt:formatDate var="resultDate" value="${item.regdate}" pattern="HH:dd:ss"/>
					</c:when>
					<c:otherwise>
						<fmt:formatDate var="resultDate" value="${item.regdate}" pattern="yyyy-MM-dd"/>
					</c:otherwise>
				</c:choose>
				<td>${resultDate}</td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
</div>

<div class="row">
	<div id="page" class="col-md-12 text-center">
		<c:if test="${search.startPage-1 >= 1}"> <a href="javascript:goPage('/board',['reqPage','searchType','searchWord'],[${search.startPage-1},'${search.searchType}','${search.searchWord}']);">[ &lt;&lt; ]</a> </c:if>&nbsp;
		<c:if test="${search.reqPage-1 >= 1}"> <a href="javascript:goPage('/board',['reqPage','searchType','searchWord'],[${search.reqPage-1},'${search.searchType}','${search.searchWord}']);">[ &lt; ]</a> </c:if>&nbsp;
	
		<c:forEach begin="${search.startPage}" end="${search.endPage}" var="num">
			<a <c:if test="${search.reqPage eq num}"><c:out value="id=reqPage"/></c:if>
			href="javascript:goPage('/board',['reqPage','searchType','searchWord'],[${num},'${search.searchType}','${search.searchWord}']);">[ <c:out value="${num}"/> ]</a>&nbsp;
		</c:forEach>&nbsp;
	
		<c:if test="${search.reqPage+1 <= search.totalPageNum}"><a href="javascript:goPage('/board',['reqPage','searchType','searchWord'],[${search.reqPage+1},'${search.searchType}','${search.searchWord}']);">[ &gt; ]</a></c:if>&nbsp;
		<c:if test="${search.endPage+1 <= search.totalPageNum}"><a href="javascript:goPage('/board',['reqPage','searchType','searchWord'],[${search.endPage+1},'${search.searchType}','${search.searchWord}']);">[ &gt;&gt; ]</a></c:if>
	</div>
</div>
<div class="row" style="height:100px;"></div>

</div>	

<jsp:include page="/WEB-INF/views/common/main-footer.jsp"></jsp:include>
    
</body>
</html>
