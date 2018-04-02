<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.indexTable {
	background-color: white;
	width:70%;
}
</style>

		
<div align="center">
	<div>
		<c:forEach var="i" items="${list }">
			<table class="indexTable">
					<tr><td>한식</td></tr>	
					<tr>
						<td>
							<c:if test="${i.CATE == '한식' }">
								
							</c:if>						
						</td>
					</tr>
			</table>
		</c:forEach>
	</div>
</div>		