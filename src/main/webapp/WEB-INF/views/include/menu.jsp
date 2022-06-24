<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<!-- Header -->
				<section id="header">

					<!-- Logo -->
						<h1><a href="/"><span style="font-size:110%;">가자 &nbsp;&nbsp;</span><span style="font-size:150%">GO </span>!</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="/">Home</a></li>
								<li><a href="/product/list.do">상품목록</a></li>					
								<li><a href="/wish/list.do">찜한 상품</a></li>
								<li>
									<a href="#">게시판</a>
									<ul>
										<li><a href="/board/list.do">문의 사항</a></li>
										<li><a href="/notice/list.do">공지 사항</a></li>
										<c:if test="${sessionScope.id != null}">
											<li><a href="/mypage/order_list.do">My Page</a></li>
										</c:if>
									</ul>
								</li>
								<li>
								<c:choose>
									<c:when
										test="${sessionScope.id == null and sessionScope.adminid == null}">
										<li><a href="/member/login.do">로그인</a></li>
										<li><a href="/member/join.do">회원가입</a></li>
									</c:when>
									<c:when test="${sessionScope.id != null}">
										<li><a href="/mypage/order_list.do">${sessionScope.name}님</a></li>
										<li><a href="/member/logout.do">로그아웃</a></li>
									</c:when>
								</c:choose>
								</li>
							</ul>
						</nav>
				</section>
				