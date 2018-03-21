<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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

.btn {
	border: 2px solid black;
	background-color: white;
	color: black;
	padding: 14px 28px;
	font-size: 16px;
	cursor: pointer;
}

/* Green */
.success {
	border-color: #4CAF50;
	color: green;
}

.success:hover {
	background-color: #4CAF50;
	color: white;
}

/* Blue */
.info {
	border-color: #2196F3;
	color: dodgerblue
}

.info:hover {
	background: #2196F3;
	color: white;
}

/* Orange */
.warning {
	border-color: #ff9800;
	color: orange;
}

.warning:hover {
	background: #ff9800;
	color: white;
}

/* Red */
.danger {
	border-color: #f44336;
	color: red
}

.danger:hover {
	background: #f44336;
	color: white;
}

/* Gray */
.default {
	border-color: #e7e7e7;
	color: black;
}

.default:hover {
	background: #e7e7e7;
}
</style>

<!-- 헤더 사진 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<div class="hero-image">
	<div class="hero-text">
		<h1 style="font-size: 50px">Cook Talk</h1>
		<p>I'm a chef</p>
		<button
			onclick="location.href='${pageContext.request.contextPath}boardwriting'">Writing</button>
	</div>
</div>
<br />
<!-- 폼 -->
<div class="w3-container w3-teal">
	<h2>Cook talk writing</h2>
</div>

<form class="w3-container"
	action="${pageContext.request.contextPath}/boardwriting" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="id" value="${logon }">
	<p>
		<textarea class="w3-input" placeholder="내용" rows="10" cols="10"
			name="comments"></textarea>
	</p>
	<p>
		<label>사진</label> <input class="w3-input" type="file"
			multiple="multiple" onchange="miri(this)" name="image">
	</p>
	<!-- 사진미리보기 -->
	<div id="imgs" align="center"></div>
	<p align="center">
		<button class="btn success" type="submit">등록</button>
		<button class="btn default" type="button"
			onclick="location.href='${pageContext.request.contextPath}freeboard'">취소</button>
	</p>
</form>

<script>
	function miri(fs) {
		var img = "";
		for (var i = 0; i < fs.files.length; i++) {
			var reader = new FileReader();
			reader.readAsDataURL(fs.files[i]);
			reader.onload = function() {
				img = "<img src='"
						+ this.result
						+ "' style='width:100px; height:100px; border-radius:20%;'/>'  ";
				$("#imgs").html($("#imgs").html() + img);
			}
		}
	}
</script>
<br />
