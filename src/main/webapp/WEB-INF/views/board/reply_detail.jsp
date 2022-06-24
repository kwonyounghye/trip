<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#btnReplyDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: "/reply/delete/${dto.reply_idx}",
				success: function(result){
					if(result == "success"){
						$("#modifyReply").css("visibility", "hidden");
						listReply("1");
					}
				}
			});	
		}
	});
	$("#btnReplyUpdate").click(function(){
		var reply_text = $("#detail_replytext").val();
		$.ajax({
			type : "post",
			url: "/reply/update/${dto.reply_idx}",
			headers : {"Content-Type":"application/json"},
			data : JSON.stringify({reply_text: reply_text}),
			dataType : "text",
			success : function(result){
				if(result == "success"){
					$("#modifyReply").css("visibility", "hidden");
					listReply("1");
				}
			}
		});
	});
	$("#btnReplyClose").click(function(){
		$("#modifyReply").css("visibility", "hidden");
	});
});
</script>
</head>
<body>
<textarea id="detail_replytext" rows="3" cols="40">${dto.reply_text}</textarea>
<div>
	<c:if test="${sessionScope.adminid == dto.replyer}">
		<button type="button" id="btnReplyUpdate">수정</button>
		<button type="button" id="btnReplyDelete">삭제</button>
	</c:if>
	<button id="btnReplyClose" type="button">닫기</button>
</div>
</body>
</html>