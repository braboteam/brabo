<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<style>
.grayInfo {
	color:gray;
}
.link {
	text-decoration: none;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<div align="center" style="margin-top:50px; ">
		<div style="width:800px;">
			<div class="w3-container" >
				<table class="w3-table w3-bordered">
					<tr>
						<th>번호</th> <th>제목</th> <th>작성자</th> <th>승인/미승인</th>
					</tr>
					<c:forEach var="i" items="${recipe }">
						<tr>
							<td><span class="grayInfo">${i.NO }</span></td>
							<td>	<a href="${pageContext.request.contextPath}/recipe/list/${i.NO}" class="link">${i.TITLE }</a></td>
							<td>${i.ID }</td>
							<c:choose>
								<c:when test="${i.RIGHT } == 0">
									<td><span class="grayInfo">N</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="grayInfo">Y</span></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	
		<div id="pagination">
			<c:if test="${page != 1 }">
				<a href="${pageContext.request.contextPath }/admin/recipeAuth?p=${page-1}">&laquo;</a>
			</c:if>
			<c:forEach var="i" begin="1" end="${totalCnt }">
				<a href="${pageContext.request.contextPath }/admin/recipeAuth?p=${i}">${i }</a>
			</c:forEach>
			<c:if test="${page != totalCnt }">
						<a href="${pageContext.request.contextPath }/admin/recipeAuth?p=${page+1}">&raquo;</a>
					</c:if>	
		</div>

	</div>
	