<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>가자 GO</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css?after" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">
		<%@ include file ="include/menu.jsp" %>

			<!-- Banner : 홈 화면에 풍경 사진 나오는 곳! -->
				<section id="banner">

				</section>

			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<!-- 상품 목록 -->
									<section>
									<hr>
										<div class="row">
											
											<c:forEach var="row" items="${list}">
												<div class="col-4 col-6-medium col-12-small">
													<section class="box">
														<a href="/product/detail/${row.code}" class="image featured">
														<img width= 450px; height=300px; src="/images/${row.filename}" alt="" />
														</a>
														<header>
															<h3>${row.title}</h3>
														</header>
														<%-- <p>${row.description}</p> --%>
														<footer>
															<ul class="actions" text-align="right">
																<li><a href="/product/detail/${row.code}" class="button alt">자세히</a></li>															
															</ul>
														</footer>
													</section>
												</div>
											</c:forEach>
											
										</div> <!-- //class=row -->
										<p align="right"><a href="/product/list.do">더 많은 여행상품</a></p>
									</section>

							</div>

						</div>
					</div>
				</section>
		</div>
<%@ include file ="include/footer.jsp" %>