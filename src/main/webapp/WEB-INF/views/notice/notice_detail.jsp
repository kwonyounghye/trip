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
<script src="/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	$("#btnList").click(function(){
		location.href="/notice/list.do";
	});

	$("#btnUpdate").click(function(){
		document.form1.action="/notice/update.do";
		document.form1.submit();
	});
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="/notice/delete.do";
			document.form1.submit();
		}
	});
	
});
</script>

</head>

<body class="no-sidebar is-preload">
	<div id="page-wrapper">
	
	<%@ include file="../include/menu.jsp"%>


<section id="main">
<div class="container">
	<h2 style="text-align: center;">공지사항 상세내용</h2><br>
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>번호 : ${dto.idx}</td>
			</tr>
			<tr>
				<td>날짜 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td>조회수 : ${dto.hit}</td>
			</tr>
			<tr>
				<td>
					제목 : 
					<c:choose>
						<c:when test="${sessionScope.adminid != null}">
							<input name="title" size="100%" value="${dto.title}">
						</c:when>
						<c:otherwise>
							${dto.title}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
					내용 : 
					<c:choose>
						<c:when test="${sessionScope.adminid != null}">
							<textarea rows="60" cols="60" name="contents" id="contents">${dto.contents}</textarea>
						 	<!-- ckeditor 적용(id가 contents인 태그를 스마트에디터로 변경 ) -->	
							<script>
								CKEDITOR.replace("contents", {
									filebrowserUploadUrl: "/imageUpload.do"
								});
							</script>
						</c:when>
						<c:otherwise>
							${dto.contents}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>		
		</table>
		<div>
			<input type="hidden" name="idx" value="${dto.idx}" >
		 	<c:if test="${sessionScope.adminid != null}"> 
				<button type="button" id="btnUpdate">수정</button>
				<button type="button" id="btnDelete">삭제</button>
			</c:if>
		 	<button type="button" id="btnList">목록</button>
		</div>
	</form>


</div> <!-- //container -->
</section> <!-- //main -->


<%@ include file ="../include/footer.jsp" %>
