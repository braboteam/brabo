<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body, html {
	height: 100%;
	margin: 0;
}

.hero-image {
	background-image: url("Desert.jpg");
	height: 30%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.hero-text {
	text-align: center;
	position: absolute;
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
</head>
<body>
	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 50px">Cook Talk</h1>
			<p>I'm a chef</p>
			<button>Writing</button>
		</div>
	</div>
	<br />
	<div align="center">
		<table border="1" style="width: 80%;">
			<tr>
				<td rowspan="3" valign="top" style="width: 20%;">프로필사진</td>
				<td style="width: 40%;">아이디</td>
				<!-- 하트 -->
				<td align="right" style="width: 40%;"><a href="#"> <span
						class="glyphicon glyphicon-heart-empty"></span>
				</a>0 <!-- 댓글 --> <a href="#"> <span
						class="glyphicon glyphicon-user"></span>
				</a>0</td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">사진</td>
			</tr>
			<tr>
				<td colspan="3"><hr /></td>
			</tr>
		</table>
	</div>

</body>
</html>

