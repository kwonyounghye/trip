<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>

<head>
<title>가자 GO</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function list(page) {
		location.href = "/product/list.do?curPage=" + page
				+ "&keyword=${map.keyword}";
	}
</script>
<style type="text/css">
table div {
	vertical-align: middle;
	font-size: 30px;
}

table div {
	text-decoration: none;
	vertical-align: middle;
	text-align: center;
	color: black;
}

img {
	width: 300px;
	height: 300px;
}

a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">

	<%@ include file="../include/menu.jsp"%>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<!-- Content -->
				<article class="box post" style="height: 100%; width: 100%;">
					
					<header>
						<h2>상품목록</h2>
						<br>
						<form name="form1" method="post" action="/product/list.do" style="width: 100%">
							<div style="width: 90%; float: left;">
								<span style="float: left; margin-top: 1%; margin-right: 1%">
									상품명 </span><input type="text"
									style="margin-right: 1%; float: left; width: 60%; height: 40%;"
									name="keyword" value="${map.keyword}"> <input
									style="float: left; margin-right: 1%" type="submit" value="조회">
								<span style="float: left; margin-right: 1%; margin-top: 1%">
									등록된 상품 개수: <%-- ${fn:length(list)} --%>${map.count }</span>
							</div>
							<%-- <c:if test="${sessionScope.id != null}"> --%>
							<a
								style="float: right; text-decoration: none; margin-top: 1%; color: black;"
								type="button" href="/product/registration.do">상품등록</a>
							<%-- </c:if> --%>
						</form>
					</header>
					<br>
						<div style="height:100% ;width:100%;">
							<c:forEach var="row" items="${map.list }" varStatus="vs">
						<div style="word-break: break-word; width:100%;padding:0"> 
									 <%-- <c:if test="${vs.count mod 2 == 0}"> --%>
										<div style= "float:left;margin:3%;margin-left:15%; text-align:center">
											<a href="/product/detail/${row.code}" >
												<p style="font-size: 100%; margin: 0; text-align: left">${row.area}</p>
												<c:choose>
													<c:when test="${row.filename != '-'}">
														<img src="/images/${row.filename }" width="110px"
															height="100px">
													</c:when>
													<c:otherwise>
														<p style="margin: 100px; font-size: 100%;">[상품 이미지 미등록]</p>
													</c:otherwise>
												</c:choose><br>
												<p  style="margin:0;font-size: 150%;">${row.title }</p>
												<p style="margin:0;font-size: 150%;"> <fmt:formatNumber value="${row.price }" pattern="#,###" />원</p>
											</a>
										</div>
										<%--  </c:if> --%>
						
							</c:forEach>
							<table>
							<tr style="width: 100%; height: 100%;">
								<td colspan="6" align="center">
									<c:if test="${map.page_info.curBlock > 1}">
										<a href="javascript:list('1')">[처음]</a>
									</c:if> 
									<c:if test="${map.page_info.curBlock > 1}">
										<a href="javascript:list('${map.page_info.prevPage }')">[이전]</a>
									</c:if> 
									
									<c:forEach var="num" begin="${map.page_info.blockBegin }" end="${map.page_info.blockEnd }">
										<c:choose>
											<c:when test="${num == map.page_info.curPage}">
												<span style="color: red">${num }</span>&nbsp;
											</c:when>
											<c:otherwise>
												<a href="javascript:list('${num}')">${num}</a>&nbsp;
											</c:otherwise>
										</c:choose>
									</c:forEach> 
									<c:if test="${map.page_info.curBlock <= map.page_info.totBlock}">
										<a href="javascript:list('${map.page_info.nextPage }')">[다음]</a>
									</c:if> 
									<c:if test="${map.page_info.curPage <= map.page_info.totPage }">
										<a href="javascript:list('${map.page_info.totPage }')">[끝]</a>
									</c:if>
								</td>
							</tr>
						</table>
						</div>
					</div>
				</article>
			</div>
		</section>
		<!-- Footer -->
		<section id="footer">
			<div class="container">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</section>
	</div>
</body>
</html>