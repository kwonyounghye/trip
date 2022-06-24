<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML>
<html>
<head>
	<title>가자 GO</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/assets/css/main.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="/board/write.do";
	});
});

function detail(board_idx) {
	location.href="/board/detail.do?board_idx="+board_idx;
}
function list(page){
	location.href="/board/list.do?curPage="+page
			+"&search_option=${map.search_option}&keyword=${map.keyword}";
}
</script>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
</style>
</head>

<body class="no-sidebar is-preload">
	<div id="page-wrapper">
	
	<%@ include file="../include/menu.jsp"%>
		
<section id="main">
	<div class="container">
		<h2 style="text-align: center;">문의 사항</h2><br>
<form name="form1" method="post" action="/board/list.do">
<ul class="actions">
	<li>
		<select name="search_option">
			<option value="all" <c:out value="${map.search_option=='all'?'selected':''}"/>>
				이름+내용+제목</option>
			<option value="name" <c:out value="${map.search_option =='name' ? 'selected':''}"/>>
				이름</option>
			<option value="contents" <c:out value="${map.search_option =='contents'?'selected':''}" />>
				내용</option>
			<option value="title" <c:out value="${map.search_option =='title'?'selected':'' }"/>>
				제목 </option>
		</select>	
		
	</li>
	<li><input name="keyword" value="${map.keyword}"></li>
	<li><input type="submit" value="조회"></li>
	<li><c:if test="${sessionScope.id != null }">
			<input type="button" id="btnWrite" value="글쓰기">
		</c:if> 
	</li>
</ul>
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>답변상태</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
<c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.board_idx}</td>
		<td>
			<c:if test="${row.cnt>0}">답변 완료</c:if>
			<c:if test="${row.cnt==0}">답변 대기</c:if>
		</td>
		<td><a href="#" onclick="detail('${row.board_idx}')"> ${row.title}</a></td>
		<td>${row.name}</td>	
		<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>	
		<td>${row.hit}</td>
	</tr>
</c:forEach>
</table>
<%@ include file ="../include/page.jsp" %>
</div>
</section>


<%@ include file ="../include/footer.jsp" %>
