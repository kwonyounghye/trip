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
	$("#btnSave").click(function(){
		var title = document.form1.title.value;
		var contents = document.form1.contents.value;
		if(title ==""){
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		document.form1.action="/board/insert.do";
		document.form1.submit();
	});
	$("#btnList").click(function(){
		location.href="/board/list.do";
	});
});	
</script>

</head>

<body class="no-sidebar is-preload">
	<div id="page-wrapper">
		<%@ include file="../include/menu.jsp"%>

<section id="main">
<div class="container">
	<h2>문의 사항 작성</h2><br>
<form id="form1" name="form1" method="post" enctype="multipart/form-data">
	<div>
		제목 : <input  id="title" name="title" size="80" placeholder="제목을 입력하세요">
	</div>
	<div style="width:800px">
		내용 : 
		<textarea rows="5" cols="80" id="contents" name="contents" placeholder="내용을 입력하세요"></textarea>
		<!-- ckeditor 적용(id가 contents인 태그를 스마트에디터로 변경 ) -->	
		<script>
			CKEDITOR.replace("contents", {
				filebrowserUploadUrl: "/imageUpload.do"
			});
		</script>
	</div>
	<div style="width:700px; text-align:cneter;">
		<button type="button" id="btnSave">확인</button>
		<button type="button" id="btnList">목록</button>
	</div>
</form>

</div>
</section>


<%@ include file ="../include/footer.jsp" %>


