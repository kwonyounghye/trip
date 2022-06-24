<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>가자 GO</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css?after" />
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnList").click(function() {
			location.href = "/product/list.do";
		});

		$("#btnAllDelete").click(function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "/wish/deleteAll.do";
			}
		});
	});
	function btnOrder(code){
		location.href = "/order/orderPage.do?code=" + code;
	}

	function btnDelete(wish_id) {
		location.href = "/wish/delete.do?wish_id=" + wish_id;
	}
</script>
</head>
<body class="wish_list">
	<div id="page-wrapper">
		<%@ include file="../include/menu.jsp"%>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<h2 style="text-align: center;">My Wish-List</h2>
				<br> <br>
				<c:choose>
					<c:when test="${map.count == 0}"> <!-- 장바구니가 비어있을때 -->
							장바구니가 비었습니다.
					</c:when>
					<c:otherwise> <!-- 장바구니가 비어있지 않을때 -->
						<form id="form1" name="form1" method="post" action="/wish/update.do">
							<table border="1" width="400px">
								<tr>
									<th>여행 상품명</th>
									<th>가격</th>
									<th>인원 수</th>
									<th>총 금액</th>
									<th>&nbsp;</th>
								</tr>
								<!-- var 사용할 변수명 -->
								<!-- items Collection 객체(List, Map) -->
								<c:forEach var="row" items="${map.list}">
									<tr>
										<!-- 여행 제목 -->
										<td>${row.title}</td>
										<!-- 가격 -->
										<td>${row.price}</td>
										<td>
											<!-- 각 행의 총 금액 --> 
											총 <input type="number" style="width: 30%; border:solid 1px #dddddd; border-radius:5px;" min="0" max="100" name="amount" value="${row.amount}">명 
											<!-- hidden : 보내지만 화면에는 안보이게 한다 --> 
											<!-- 각 행의 wish 코드 --> 
											<input type="hidden" name="wish_id" value="${row.wish_id}">
										</td>

										<!-- 행의 금액 -->
										<td>${row.money}</td>

										<td>
											<!-- 결제 버튼 --> 
											<input type="button" onclick="btnOrder('${row.code}')" value="결제" style="float:right; width:100px; height:30px; font-size:15px; margin-right:50px; text-align:center; padding:0px;">
											<!-- 삭제 버튼 --> 
											<input type="button" onclick="btnDelete('${row.wish_id}')" value="삭제" style="float: right; margin-right: 20px; width: 100px; height: 30px; font-size: 15px; text-align: center; padding: 0px;">
											
										</td>
									</tr>
								</c:forEach>
							</table>

							<!-- 하단 버튼 영역 -->
							<button id="btnUpdate" style="float: left; width: 160px; font-size: 15px;">수정</button>
							<button type="button" id="btnAllDelete" style="width: 160px; margin-left: 50px; font-size: 15px;">장바구니 비우기</button>

						</form>
					</c:otherwise>
				</c:choose>
				<button type="button" id="btnList" style="float: right; width: 160px; margin: 10px; font-size: 15px;">상품목록</button>
			</div>
		</section>

		<!-- Footer -->
		<section id="footer">
			<%@ include file="../include/footer.jsp"%>
		</section>

	</div>
</body>
</html>