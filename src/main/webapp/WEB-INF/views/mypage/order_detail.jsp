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
	$("#btnList").click(function(){//게시판 목록으로
		location.href="/mypage/order_list.do";
	});
});
</script>

</head>


<body class="no-sidebar is-preload">
	<div id="page-wrapper">
		<%@ include file="../include/menu.jsp"%>

<section id="main">
<div class="container">
	<h2 style="text-align: center;">My 주문 상세 페이지</h2><br>
	<table>
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>출발날짜</th>
			<th>상품가격</th>
			<th>인원</th>
			<th>금액</th>
			<th>결제</th>
		</tr>
		<tr>
			<td>${dto.order_id}</td>
			<td>${dto.title}</td>
			<td>${dto.date}</td>
			<td>${dto.price}</td>
			<td>${dto.amount}</td>
			<td>${dto.money}</td>
			<c:choose>
				<c:when test="${dto.pay == 1}">
					<td>현&nbsp;&nbsp;금</td>
				</c:when>
				<c:when test="${dto.pay == 2}">
					<td>신용카드</td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>					
			</c:choose>
		</tr>
		<tr>
			<td>판매자 : ${dto.writer_name}</td>
		</tr>
		<tr>
		 	<td colspan="6">
		 		<c:if test="${row.filename != null}">
					<img src="/images/${row.filename}" width="600px" height="400px">
				</c:if>
				<br>${dto.description}
			</td>
		</tr>
	</table>
	<input type="button" id="btnList" value="주문 목록">

</div>
</section>


<%@ include file ="../include/footer.jsp" %>
