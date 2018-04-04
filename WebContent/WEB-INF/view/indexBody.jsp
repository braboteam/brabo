<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.indexTable {
	background-color: white;
	width: 70%;
}

.link {
	text-decoration: none;
}

.thumb {
	width: 200px;
	height: 200px;
}

.img {
	HEAD height: 150px;
	width: 180px;
	height: 180px;
}

.ment {
	text-align: center;
}

.grayMent {
	color: gray;
}


</style>
<c:if test="${param.success != null}">
	<script>
		window.alert("${param.success}");
	</script>
</c:if>

<c:if test="${err != null}">
	<script>
		window.alert("${err}");
	</script>
</c:if>

<c:if test="${param.logout != null}">
	<script>
		window.alert("${param.logout}");
	</script>
</c:if>

<c:if test="${join != null}">
	<script>
		window.alert("${join}");
	</script>
</c:if>
<div align="center" style="margin-top: 40px;">
	<div style="width:800px">
		<hr/>
		<c:forEach var="i" items="${cateChk }">
			<div class="content">
				
				<table>
					<tr>
						<th>${i.cateChk }</th>
						<th></th><th></th>
						<th><a href="${pageContext.request.contextPath }/recipe/list?s=${i.cateChk}">
						<button class="w3-button w3-white w3-border w3-round-large">more</button></a></th>
					</tr>
					<tr>	
						<c:set var="c" value="0"/>
						<c:forEach var="j" begin="0" end="${fn:length(all) }" varStatus="vs">
							<c:if test="${i.cateChk == all[j].CATE }"> 
								<c:set var="c" value="${c+1 }"/>
								<c:choose>
									<c:when test="${c <5 }">
								<td>
									<div>
										<table>
											<tr>
												<td class="thumb"><a href="${pageContext.request.contextPath }/recipe/list/${all[j].NO}" class="link"> 
													<img src="${pageContext.request.contextPath }/iphoto/${all[j].ID}/${all[j].IPHOTO}" class="img">
													</a>
												</td>
											</tr>
											<tr>
												<td >
													<table style="width:100%">
														<tr><td class="ment"><b>${all[j].TITLE }</b></td></tr>
														<tr><td class="ment grayMent"><small>by ${all[j].ID }</small></td></tr>
													</table>
												</td>
											</tr>
										</table>
										
									</div>
								</td>
								</c:when>
								</c:choose>
							</c:if>
						</c:forEach>			
					</tr>
				</table>
				
			</div>	
			<hr/>	
		</c:forEach>
	</div>
</div>	





