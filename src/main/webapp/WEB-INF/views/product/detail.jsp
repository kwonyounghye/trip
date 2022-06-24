<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가자 GO</title>
<link rel="stylesheet" href="/assets/css/main.css?after" />
<style>
a {
	text-decoration: none;
	color: black;
}
</style>
<script>
	function product_delete() {
		if (confirm("삭제하시겠습니까?")) {
			document.form2.action = "/product/delete.do";
			document.form2.submit();
		}
	}
	
	function board_list() {
		location.href="/board/list.do";
	}
</script>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">
		<%@ include file="../include/menu.jsp"%>

		<section id="main" style="">
			<div style="height: 100%; margin: 0 auto;">
				<div style="background: white; border-radius: 30px; width: 70%; height: 700px; margin: 0 auto;">
					<form name="form2" method="post" enctype="multipart/form-data">
					<div style="width: 100%">
						<p style="font-size: 200%; margin: 3%; float: left">상품정보</p>
						
						<p style="width: 50%;margin:2%; height: 100%; float: right; display: inline-block;">
							<a
								style="float: right; color: black; margin: 3%; text-decoration: none;"
								href="/product/list.do">상품목록</a>
							<c:if test="${sessionScope.id == dto.writer}">
							<%-- <c:if test="${sessionScope.id != null}"> --%>
								<input type="hidden" name="code" value="${dto.code }">
								<a style="margin: 3%; float: right;"
									href="/product/edit/${dto.code}">수정</a>
								<input type="button" onclick="product_delete()"
									style="background: none; color: black; font-weight: 1; float: right; margin: 3%; padding: 0"
									value="삭제">
							</c:if>
						</p>
					</div>
					</form>

					<div style="width: 100%; height: 100%;">
						<div style="width: 50%; height: 100%; float: left;">
							<div style="width: 80%; height: 45%; margin: 20% auto; margin-top: 0;">
								<c:choose>
									<c:when test="${dto.filename != '-'}">
										<img style="width: 100%; height: 100%;"
											src="/images/${dto.filename }">
									</c:when>
									<c:otherwise>
										<img src="/images/${dto.filename }"
											style="margin: 40px; display: none;">
										<p style="margin: 110px; height: 280px;">[상품 이미지 미등록]</p>
										<br>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div style="width: 50%; height: 100%; float: left; color: black; text-align: center; line-height: 1; position: relative;">
							<p style="font-size: 150%; margin-top: 5%; margin-right: 2%;">여행명 : ${dto.title}</p>
							<p style="font-size: 130%;">여행 지역 : ${dto.area}</p>
							<p style="font-size: 130%; ">여행 날짜 : ${dto.date }&nbsp; ${dto.starttime } ~ ${dto.endtime }</p>
							<p style="font-size: 130%; text-align: center; /* position: absolute;  right: 40%; bottom: 30% */ margin-top: 5%">가격 : ${dto.price }&nbsp;원</p>
							<p style="font-size: 130%;  color: black;">상품코드 : ${dto.code }</p>
							<form name="form1" method="post" action="/wish/insert.do"
								style="margin-left: 10%; overflow: hidden; margin-top: 10%">
								<input type="hidden" name="writer" value="${dto.writer}">
								<input type="hidden" name="code" value="${dto.code}"> 
								<input type="submit" value="구매/위시리스트" style="margin: 5%; float: left;">	
								<input type="button" onclick="board_list()" value="상품문의" 	style="float: left; margin: 5%">						
							</form>
						</div>
					</div>
				</div>
					
				<div style="">
					<div style="width: 70%; height: 100%; margin	: auto;">
						<h2>상품설명</h2>
						<div style="width: 70%; height: 100%; resize: none;" >${dto.description	}</div>
					</div>
					<div style="margin-top: 10%; width: 70%; height: 10	0%;">
						<h2 style="margin-left: 20%">가이드 소개	</h2>
						<div style="width: 70%; height: 100%; margin-left: 20%">${dto.introduction}</div>					</div>
					</div>
				</div>
					
			</div>

		</section>

<%@ include file ="../include/footer.jsp" %>
