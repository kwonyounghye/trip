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
	$("#btnList").click(function(){//게시판 목록으로
		location.href="/board/list.do";
	});
	listReply("1");
	$("#btnUpdate").click(function(){//게시글 수정
		document.form1.action="/board/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){//게시글 삭제
		reply_check();
	});
	$("#btnReply").click(function(){//댓글 쓰기
		reply();
	});
	
});
function reply_check(){//댓글 갯수 체크
	if(${dto.cnt}>=1){
		alert("댓글이 있으면 삭제할 수 없습니다");	
		return;
	}else {
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="/board/delete.do";
			document.form1.submit();	
		}
	}
}

function reply(){//댓글 등록
	var reply_text = $("#reply_text").val();
	if(reply_text==""){
		alert("댓글 내용을 입력하세요");
		return;
	}
	var board_idx="${dto.board_idx}";
	var params={"reply_text":reply_text, "board_idx":board_idx};
	
	$.ajax({
		type:"post",
		url:"/reply/insert.do",
		data:params,
		success: function(){
			alert("댓글이 등록되었습니다");
			listReply("1");
		}
	});
}
function listReply(num){
	$.ajax({
		url:"/reply/list.do?board_idx=${dto.board_idx}&curPage="+num,
		success : function(result) {
			$("#listReply").html(result);
		}
	});
}
function showModify(reply_idx){
	$.ajax({
		url:"/reply/detail/"+reply_idx,
		success : function(result) {
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility", "visible");
		}
	});
}
</script>

</head>

<body class="no-sidebar is-preload">
	<div id="page-wrapper">
	
	<%@ include file="../include/menu.jsp"%>

<section id="main">
	<div class="container">
	<h2 style="text-align: center;">문의 사항 상세내용</h2><br>
<form id="form1" name="form1" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	
		<tr>
			<td>${dto.board_idx}</td>
			<td>${dto.name}</td>	
			<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>	
			<td>${dto.hit}</td>
		</tr>
		<tr>
			
		
			<td colspan="4">
			제목 : 
			<c:choose>
				<c:when test="${sessionScope.id == dto.writer}">
					<input type="text" name="title" value="${dto.title}">
				</c:when>
				<c:otherwise>
					${dto.title}
				</c:otherwise>
			</c:choose>
			</td>	
		</tr>

		<tr>
			<td colspan="4">
			 내용 : 
			<c:choose>
				<c:when test="${sessionScope.id == dto.writer}">		 	
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
		<tr>
			<td colspan="4">
				<input type="hidden" name="board_idx" value="${dto.board_idx}" >
				<!-- 문의사항 작성자 혹은 관리자만 수정 및 삭제 가능 -->
				<c:if test="${sessionScope.id == dto.writer || sessionScope.adminid != null}"> 
					<button type="button" id="btnUpdate">수정</button>
					<button type="button" id="btnDelete">삭제</button>
				</c:if>
		<button type="button" id="btnList">목록</button>
			</td>
		</tr>
	</table>
</form>
<hr>
<!-- 댓글 작성화면 영역 -->
<div id="writeReplay" style="width:700px;" >
<!-- 문의사항 댓글은 관리자만 작성 가능 -->
<c:if test="${sessionScope.adminid != null }">
	<textarea rows="5" cols="80" id="reply_text" placeholder="댓글을 작성하세요"></textarea>
	<button type="button" id="btnReply">댓글쓰기</button>
</c:if>
</div>

<!-- 댓글 리스트 영역 -->
<div id="listReply"></div>
<!-- 댓글 수정화면 영역 -->
<div id="modifyReply"></div>

</div><!-- //main -->
</section><!-- //container -->


<%@ include file ="../include/footer.jsp" %>
