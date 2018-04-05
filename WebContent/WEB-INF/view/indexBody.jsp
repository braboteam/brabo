<%@page import="service.socket.SocketService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  -->
<style>
/*  */
body {
	font-family: Arial;
}

* {
	box-sizing: border-box;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}
/*  */
body, html {
	height: 100%;
	margin: 0;
}

.hero-image {
	background-image: url("/Desert.jpg");
	height: 300px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.hero-text {
	text-align: center;
	position: relative;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

.hero-text button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 10px 25px;
	color: black;
	background-color: #ddd;
	text-align: center;
	cursor: pointer;
}

.hero-text button:hover {
	background-color: #555;
	color: white;
}
</style>
<!--  -->
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

		// 로그인 후 소켓이 저장된 후에 모든 유저들에게 메시지전달
		$.get("${pageContext.request.contextPath}/onlinealert", {
			"onid" : "${param.success}"
		}, function(rst) {
			if (rst) {
				console.log("소켓저장성공 (모든 소켓으로 메시지 전달)");
			} else {
				console.log("소켓저장실패 (소켓메시지 전달불가)");
			}
		});
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

<c:if test="${param.join != null}">
	<script>
		window.alert("${param.join}");
	</script>
</c:if>
<div class="hero-image">
	<div class="hero-text">
		<h1 style="font-size: 50px">Foods & Co</h1>
		<p>누구나 집에서 쉽게 요리를</p>
	</div>
</div>
<div align="center" style="margin-top: 40px;">
	<div style="width: 840px">
		<div style="width: 800px">
			<hr />
			<c:forEach var="i" items="${cateChk }">
				<div class="content">
					<table>
						<tr>
							<th class="th">${i.cateChk }</th>
							<th></th>
							<th></th>
							<th></th>
							<th><a
								href="${pageContext.request.contextPath }/recipe/list?s=${i.cateChk}">
									<button class="w3-button w3-white w3-border w3-round-large">more</button>
							</a></th>
						</tr>
						<tr>
							<c:set var="c" value="0" />
							<c:forEach var="j" begin="0" end="${fn:length(all) }"
								varStatus="vs">
								<c:if test="${i.cateChk == all[j].CATE }">
									<c:set var="c" value="${c+1 }" />
									<c:choose>
										<c:when test="${c <5 }">
											<td>
												<div>
													<table>
														<tr>
															<td class="thumb"><a
																href="${pageContext.request.contextPath }/recipe/list/${all[j].NO}"
																class="link"> <img
																	src="${pageContext.request.contextPath }/iphoto/${all[j].ID}/${all[j].IPHOTO}"
																	class="img">
															</a></td>
														</tr>
														<tr>
															<td>
																<table style="width: 100%">
																	<tr>
																		<td class="ment"><b>${all[j].TITLE }</b></td>
																	</tr>
																	<tr>
																		<td class="ment grayMent"><small>by
																				${all[j].ID }</small></td>
																	</tr>
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
				<hr />
			</c:forEach>
		</div>
	</div>