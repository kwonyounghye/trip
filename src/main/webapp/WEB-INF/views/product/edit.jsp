<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>가자 GO</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/assets/css/main.css" />
<script src="/ckeditor/ckeditor.js"></script>

<script>
	function product_delete() {
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "../delete.do";
			document.form1.submit();
		}
	}
	function product_update() {
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
/* 		if (file1 == "") {
			alert("대표 이미지를 첨부하세요.");
			document.form1.file1.focus();
			return;
		} */
		document.form1.action = "/product/update.do";
		document.form1.submit();
	}
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

					<h2>수정</h2>
					<form id="form1" name="form1" method="post"
						enctype="multipart/form-data">
						<table>
							<tr>
								<td>상품명</td>
								<td><input name="title" value="${dto.title }"></td>
							</tr>
							<tr>
								<td>투어지역(시/도)</td>
								<td><select name="area">
										<option value="시/도" selected disabled hidden>시/도</option>
										<option value="강원도"
											<c:if test="${dto.area == '강원도' }">selected</c:if>>강원도</option>
										<option value="경기도"
											<c:if test="${dto.area == '경기도' }">selected</c:if>>경기도</option>
										<option value="경상남도"
											<c:if test="${dto.area == '경상남도' }">selected</c:if>>경상남도</option>
										<option value="경상북도"
											<c:if test="${dto.area == '경상북도' }">selected</c:if>>경상북도</option>
										<option value="광주광역시"
											<c:if test="${dto.area == '광주광역시' }">selected</c:if>>광주광역시</option>
										<option value="대구광역시"
											<c:if test="${dto.area == '대구광역시' }">selected</c:if>>대구광역시</option>
										<option value="대전광역시"
											<c:if test="${dto.area == '대전광역시' }">selected</c:if>>대전광역시</option>
										<option value="부산광역시"
											<c:if test="${dto.area == '부산광역시' }">selected</c:if>>부산광역시</option>
										<option value="서울특별시"
											<c:if test="${dto.area == '서울특별시' }">selected</c:if>>서울특별시</option>
										<option value="세종특별자치시"
											<c:if test="${dto.area == '세종특별자치시' }">selected</c:if>>세종특별자치시</option>
										<option value="울산광역시"
											<c:if test="${dto.area == '울산광역시' }">selected</c:if>>울산광역시</option>
										<option value="인천광역시"
											<c:if test="${dto.area == '인천광역시' }">selected</c:if>>인천광역시</option>
										<option value="전라남도"
											<c:if test="${dto.area == '전라남도' }">selected</c:if>>전라남도</option>
										<option value="전라북도"
											<c:if test="${dto.area == '전라북도' }">selected</c:if>>전라북도</option>
										<option value="제주특별자치도"
											<c:if test="${dto.area == '제주특별자치도' }">selected</c:if>>제주특별자치도</option>
										<option value="충청남도"
											<c:if test="${dto.area == '충청남도' }">selected</c:if>>충청남도</option>
										<option value="충청북도"
											<c:if test="${dto.area == '충청북도' }">selected</c:if>>충청북도</option>
								</select></td>
							</tr>
							<tr>
								<td>투어 날짜</td>
					
								<td><input type="date" name="date" value="${dto.date }"><input
									type="time" name="starttime" value="${dto.starttime }">
									~ <input type="time" value="${dto.endtime }" name="endtime"></td>
							<tr>
								<td>가격</td>
								<td><input name="price" value="${dto.price }"></td>
							</tr>
							<tr>
								<td>상품설명</td>
								<td>
									<textarea rows="5" cols="60" name="description"
										id="description">${dto.description }</textarea> 
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
								<td><img src="/images/${dto.filename }" width="300px"
									height="300px"> <br> <input type="file" name="file1"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="hidden" name="code" value="${dto.code }"> 
									<input type="hidden" name="writer" value="${dto.writer }"> 
									<input type="button" value="수정" onclick="product_update()"> 
									<input type="button" value="삭제" onclick="product_delete()"> 
									<input type="button" value="목록" onclick="location.href = '/product/list.do'">
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

</body>
</html>