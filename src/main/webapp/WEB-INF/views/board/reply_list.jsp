<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="width:700px">
<% pageContext.setAttribute("newLineChar","\n"); %>
<c:forEach var="row" items="${list}">
	<c:set var="str" value="${fn:replace(row.reply_text, ' ', '&nbsp;&nbsp;')}" />
	<c:set var="str" value="${fn:replace(str, newLineChar, '<br>') }" />
	<tr>
		<td>
			${row.name}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />)
			<br>${str}
			<c:if test="${sessionScope.adminid == row.replyer }">
				<input type="button" value="Modify" onclick="showModify('${row.reply_idx}')">
			</c:if>
		</td>
	</tr>
</c:forEach>

</body>
</html>