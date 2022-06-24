<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 페이지 구분 -->
<div align="center">
	<c:if test="${map.page_info.curBlock >1}">
		<a href="javascript:list('1')">[처음]</a>
	</c:if>
	<c:if test="${map.page_info.curBlock >1}">
		<a href="javascript:list('${map.page_info.prevPage}')">[이전]</a>
	</c:if>
	<c:forEach var="num" begin="${map.page_info.blockBegin}" end="${map.page_info.blockEnd}">
		<c:choose>
			<c:when test="${num == map.page_info.curPage}">
				<span style="color:red">${num}</span>&nbsp;
			</c:when>
			<c:otherwise>
				<a href="javascript:list('${num}')">${num}</a>&nbsp;
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${map.page_info.curBlock <= map.page_info.totBlock}">
		<a href="javascript:list('${map.page_info.nextPage}')">[다음]</a>
	</c:if>
	<c:if test="${map.page_info.curPage <= map.page_info.totPage}">
		<a href="javascript:list('${map.page_info.totPage}')">[끝]</a>
	</c:if>
</div>