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
<link rel="stylesheet" href="../assets/css/main.css" />
<script src="/ckeditor/ckeditor.js"></script>
<script>
	function registration() {
		var title = document.form1.title.value;
		var price = document.form1.price.value;
		var starttime = document.form1.starttime.value;
	    var endtime = document.form1.endtime.value;
		var description = document.form1.description.value;
		var file1 = document.form1.file1.value;
		if (title == "") {
			alert("상품명을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if (price == "") {
			alert("가격을 입력하세요.");
			document.form1.price.focus();
			return;
		}
		if(starttime>endtime) {
	         alert("시작시간이 종료시간보다 늦습니다.");
	         return;
	    } 
/* 		if (description == "") {
			alert("상품설명을 입력하세요.");
			document.form1.description.focus();
			return;
		} */
		if (file1 == "") {
			alert("대표 이미지를 첨부하세요.");
			document.form1.file1.focus();
			return;
		}
		document.form1.action = "../product/insert.do";
		document.form1.submit();
	}
/* 	function time() {
		var starttime = document.form1.starttime.value;
		var endtime = document.form1.endtime.value;
		if(starttime>endtime) {
			alert("출발시간이 도착시간보다 늦습니다.");
			return;
		} 
	}*/
</script>
</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">
		<%@ include file="../include/menu.jsp"%>

		<!-- Main -->
		<section id="main">
			<div class="container">

				<!-- Content -->
				<article class="box post">
					<h2>상품 등록</h2>
					<form action="insert" name="form1" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td>상품명</td>
								<td><input name="title"></td>
							</tr>
							<tr>
								<td>투어지역(시/도)</td>
								<td><select name="area" id = "area">
								<option value = "시/도" selected disabled hidden>시/도</option>
								<option value = "강원도">강원도</option>
								<option value = "경기도">경기도</option>
								<option value = "경상남도">경상남도</option>
								<option value = "경상북도">경상북도</option>
								<option value = "광주광역시">광주광역시</option>
								<option value = "대구광역시">대구광역시</option>
								<option value = "대전광역시">대전광역시</option>
								<option value = "부산광역시">부산광역시</option>
								<option value = "서울특별시">서울특별시</option>
								<option value = "세종특별자치시">세종특별자치시</option>
								<option value = "울산광역시">울산광역시</option>
								<option value = "인천광역시">인천광역시</option>
								<option value = "전라남도">전라남도</option>
								<option value = "전라북도">전라북도</option>
								<option value = "제주특별자치도">제주특별자치도</option>
								<option value = "충청남도">충청남도</option>
								<option value = "충청북도">충청북도</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>투어 날짜</td>
								<td><input type="date" name="date"> <input
									type="time" name="starttime"> ~ <input type="time"
									name="endtime"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input name="price"></td>
							</tr>
							<tr>
								<td>상품설명</td>
								<td><textarea rows="5" cols="60" name="description"
										id="description"></textarea> 
									<!-- ckeditor 적용 -->	
									<script>
										CKEDITOR.replace("description", {
											filebrowserUploadUrl: "/imageUpload.do"
										});
									</script>
								</td>
							</tr>
							<tr>
								<td>상품이미지</td>
								<td><input type="file" name="file1" id="file1"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="hidden"
									${dto.write }><input type="hidden"
									${dto.code }> <input type="button" value="등록"
									onclick="registration()"> <input type="button"
									value="목록" onclick="location.href = '/product/list.do'">
								</td>
							</tr>
						</table>
					</form>
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

	<!-- Scripts -->
	<!-- 	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script> -->
</body>
</html>