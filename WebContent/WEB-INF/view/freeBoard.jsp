<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<div style="background-color: #F6F6F6;">
	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 50px">Cook Talk</h1>
			<p>I'm a chef</p>
			<button>Writing</button>
		</div>
	</div>
	<br />
	<!-- 게시글 -->
	<div align="center">
		<table border="0" style="width: 80%; background-color: white;">
			<tr>
				<td rowspan="3" valign="top" align="center" style="width: 10%;"><br />
					<img src="/Desert.jpg"
					style="border-radius: 100%; width: 120px; height: 120px;"></td>
				<td style="width: 45%;">
					<h3>아이디</h3>
				</td>
				<td align="right" style="width: 45%;"><font size="50px;">
						<!-- 하트 --> <a href="#"> <span
							class="glyphicon glyphicon-heart-empty"></span>
					</a>0 <!-- 댓글 --> <a href="#"> <span
							class="glyphicon glyphicon-user"></span>
					</a>0
				</font></td>
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
	<br />
	<div align="center">
		<table border="0" style="width: 80%; background-color: white;">
			<tr>
				<td rowspan="3" valign="top" align="center" style="width: 10%;"><br />
					<img src="/Desert.jpg"
					style="border-radius: 100%; width: 120px; height: 120px;"></td>
				<td style="width: 45%;">
					<h3>아이디</h3>
				</td>

				<td align="right" style="width: 45%;"><font size="50px;">
						<!-- 하트 --> <a href="#"> <span
							class="glyphicon glyphicon-heart-empty"></span>
					</a>0 <!-- 댓글 --> <a href="#"> <span
							class="glyphicon glyphicon-user"></span>
					</a>0
				</font></td>
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
	<br />
	<div align="center">
		<table border="0" style="width: 80%; background-color: white;">
			<tr>
				<td rowspan="3" valign="top" align="center" style="width: 10%;"><br />
					<img src="/Desert.jpg"
					style="border-radius: 100%; width: 120px; height: 120px;"></td>
				<td style="width: 45%;">
					<h3>아이디</h3>
				</td>
				<!-- 하트 -->
				<td align="right" style="width: 45%;"><a href="#"> <span
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

</div>


