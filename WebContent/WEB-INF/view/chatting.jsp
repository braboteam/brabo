<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 대화창 스타일  -->
<style>
.container {
	border: 2px solid #dedede;
	background-color: #f1f1f1;
	border-radius: 5px;
	padding: 10px;
	margin: 10px 0;
}

.darker {
	border-color: #ccc;
	background-color: #ddd;
}

.container::after {
	content: "";
	clear: both;
	display: table;
}

.container img {
	float: left;
	max-width: 60px;
	width: 100%;
	margin-right: 20px;
	border-radius: 50%;
}

.container img.right {
	float: right;
	margin-left: 20px;
	margin-right: 0;
}

.time-right {
	float: right;
	color: #aaa;
}

.time-left {
	float: left;
	color: #999;
}
</style>
<!--  -->
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
<!--  -->
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>

<!-- 컨텐츠시작  -->
<div class="hero-image">
	<div class="hero-text">
		<h1 style="font-size: 50px">Chatting</h1>
		<p>오픈 채팅 및 현재 접속중인 유저와 1:1대화가 가능합니다.</p>
	</div>
</div>
<br />
<!-- 헤더 끝 -->
<!-- 사이드바 -->
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-3 sidenav">
			<h4>현재 접속 : ${member.size() }</h4>
			<br />
			<ul class="nav nav-pills nav-stacked">
				<li class="active select" onclick="selectBar(this)"><a
					style="text-align: center; text-decoration: none;"> <span
						class="glyphicon glyphicon-comment"></span> Open Chat
				</a></li>
				<c:forEach var="i" items="${member }">
					<li class="select" onclick="selectBar(this)"><a
						style="text-decoration: none;"><font color="black"><b><img
									src="${i.PROFILE }"
									style="width: 30px; height: 30px; border-radius: 100%;">
									${i.NICK} ( ${i.ID } ) <c:choose>
										<c:when test="${i.FID != null }">
											<font color="green"> follow </font>
										</c:when>
										<c:otherwise>
											<font color="red"> not follow </font>
										</c:otherwise>
									</c:choose> <span class="glyphicon glyphicon-comment w3-right"></span></b></font></a></li>
				</c:forEach>
			</ul>
			<br>
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search Blog..">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
		<!-- 사이드바 끝 -->
		<!-- 대화창 -->
		<div class="col-sm-9"
			style="overflow: scroll; height: 30%; width: 60%;">
			<h2>Chat Messages</h2>

			<div class="container" style="width: 80%;">
				<img src="${member[0].PROFILE }" alt="Avatar" style="width: 100%;">
				<b>아이디</b>
				<p>Hello. How are you today?</p>
				<span class="time-right">11:00</span>
			</div>

			<div class="container darker" style="width: 80%;">
				<img src="/Desert.jpg" alt="Avatar" class="right"
					style="width: 100%;">
				<p>Hey! I'm fine. Thanks for asking!</p>
				<span class="time-left">11:01</span>
			</div>

			<div class="container" style="width: 80%;">
				<img src="/w3images/bandmember.jpg" alt="Avatar"
					style="width: 100%;">
				<p>Sweet! So, what do you wanna do today?</p>
				<span class="time-right">11:02</span>
			</div>
			<c:forEach var="i" step="1" begin="1" end="100">
				<div class="container darker" style="width: 80%;">
					<img src="/w3images/avatar_g2.jpg" alt="Avatar"
						style="width: 100%;">
					<p>Nah, I dunno. Play soccer.. or learn more coding perhaps?</p>
					<span class="time-left">11:05</span>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	function selectBar(bar) {
		$(".select").removeClass("active");
		$(bar).addClass("active");
	}
</script>