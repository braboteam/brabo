<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
<div style="background-color: silver;">
	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 50px">Cook Talk</h1>
			<p>I'm a chef</p>
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}boardwriting'">Writing</button>
		</div>
	</div>
	<br />
	<!-- 게시글 -->
	<div align="center">
		<table border="0" style="width: 60%; background-color: white;">
			<tr>
				<td rowspan="3" valign="top" align="center" style="width: 15%;"><br />
					<img src="/Desert.jpg"
					style="border-radius: 100%; width: 120px; height: 120px;"></td>
				<td style="width: 45%;">
					<h3>
						<font color="orangered">아이디</font>
					</h3>
				</td>
				<td align="right" style="width: 45%;"><font size="5px;">
						<!-- 하트 --> <a href="#"> <span
							class="glyphicon glyphicon-heart-empty"></span>
					</a>0 <!-- 댓글 --> <a href="#"> <span
							class="glyphicon glyphicon-user"></span>
					</a>0
				</font></td>
			</tr>
			<tr>
				<td colspan="2"><b>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</b><br />
					<br /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><img src="/Desert.jpg"
					style="width: 30%; border-radius: 10%;"> <img
					src="/Desert.jpg" style="width: 30%; border-radius: 10%;"></td>
			</tr>
			<tr>
				<td colspan="3"><hr /></td>
			</tr>
		</table>
	</div>
	<br />

	<c:forEach var="i" items="${board }">
	${i }
	</c:forEach>


</div>


