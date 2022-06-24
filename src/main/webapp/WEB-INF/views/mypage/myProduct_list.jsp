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
	<link rel="stylesheet" href="../assets/css/main.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#btnOrder_list").click(function(){//게시판 목록으로
		location.href="/mypage/order_list.do";
	});
	
	$("#btnMyProduct").click(function(){
		location.href="/mypage/myProduct_list.do";
	});
});
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
<input type="button" id="btnOrder_list" value="주문 목록">
<input type="button" id="btnMyProduct"  value="내 상품">

	<!-- 내 상품 목록 영역 -->
	<div id="div_myProduct">
	<c:choose>
	<c:when test="${map.size == 0}">
		<br>내 상품 목록이 비어있습니다
	</c:when>
	<c:otherwise>
		<br><h2  style="text-align: center;">My Page - 내 상품 목록</h2><br>
		<table>
			<tr>
				<th>상품번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>출발날짜</th>
				<th>가격</th>
			</tr>
		<c:forEach var="row" items="${map.list}">
			<tr>
				<td>${row.code}</td>
				<td><img src="/images/${row.filename}" width="100px" height="100px"></td>
				<td><a href="/product/detail/${row.code}">${row.title}</a></td>
				<td>${row.date}</td>
				<td>${row.price}</td>
			<tr>
		</c:forEach>
			
		</table>
	</c:otherwise>
	</c:choose>
	</div>

</div>
</section>


<%@ include file ="../include/footer.jsp" %>
