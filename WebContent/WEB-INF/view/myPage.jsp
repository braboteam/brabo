<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box
}
/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	float: left;
	width: 50%;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #474e5d;
	padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: #f1f1f1;
}

.close:hover, .close:focus {
	color: #f44336;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}
</style>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>
<style>
.container {
	position: relative;
	width: 50%;
}

.image {
	display: block;
	width: 100%;
	height: auto;
}

.overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #008CBA;
	overflow: hidden;
	width: 100%;
	height: 100%;
	-webkit-transform: scale(0);
	transition: .3s ease;
}

.container:hover .overlay {
	transform: scale(1)
}

.text {
	color: white;
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
}
</style>
<!-- 정보수정에러  -->
<c:if test="${param.msg != null }">
	<script>
		window.alert("${param.msg}");
	</script>
</c:if>
<!-- 사이드바 메뉴 -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left"
	style="z-index: 3; width: 300px;" id="mySidebar">
	<br>
	<div class="w3-container">
		<a href="#" onclick="w3_close()"
			class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
			title="close menu"> <i class="fa fa-remove"></i>
		</a>
		<c:choose>
			<c:when test="${member.PROFILE != null}">
				<img src="${member.PROFILE }" style="width: 45%;" class="w3-round">
			</c:when>
			<c:otherwise>
				<img src="/default_profile.jpg" style="width: 45%;" class="w3-round">
			</c:otherwise>
		</c:choose>
		<br> <font color="blue"><b>팔로워 ${member.COUNT }</b></font><br />
		<br />
		<h4>
			<b> ${member.NICK} ( ${member.ID } )</b>
		</h4>
		<p class="w3-text-grey">${member.EMAIL }</p>
		<br />
	</div>
	<div class="w3-bar-block">
		<!-- 정보수정링크  -->
		<a href="${pageContext.request.contextPath }/mypage"
			class="w3-bar-item w3-button w3-padding w3-text-teal"
			style="text-decoration: none;"><i
			class="fa fa-user fa-fw w3-margin-right"></i><b>My Info</b></a>
		<!-- 내 게시물 -->
		<a href="${pageContext.request.contextPath }/myrecipe"
			class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-th-large fa-fw w3-margin-right"></i><b>My Recipe <c:choose>
					<c:when test="${member.RECIPE_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.RECIPE_COUNT }</font> )
			</c:otherwise>
				</c:choose></b></a>
		<!-- 스크랩게시물 링크 -->
		<a href="${pageContext.request.contextPath }/myscrap"
			class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-th-large fa-fw w3-margin-right"></i><b>스크랩한 게시물 <c:choose>
					<c:when test="${member.SCRAP_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.SCRAP_COUNT }</font> )
			</c:otherwise>
				</c:choose>
		</b></a>
		<!-- 내 톡 -->
		<a href="${pageContext.request.contextPath }/mycooktalk"
			class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-th-large fa-fw w3-margin-right"></i><b>My CookTalk <c:choose>
					<c:when test="${member.BOARD_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.BOARD_COUNT }</font> )
			</c:otherwise>
				</c:choose></b></a>
		<!-- 대화신청 -->
		<a href="javascript:c();" class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-envelope fa-fw w3-margin-right"></i><b>대화신청</b></a>
	</div>
	<div class="w3-panel w3-large">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
	</div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity"
	onclick="w3_close()" style="cursor: pointer" title="close side menu"
	id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left: 300px;">
	<div id="content1">
		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<h1>
					<b>My Infomation</b>
				</h1>
				<!--  -->
				<div id="id01" align="left;">
					<form class="modal-content"
						action="${pageContext.request.contextPath }/updatemember"
						method="post" enctype="multipart/form-data">
						<div class="container">
							<h1>회원정보수정</h1>
							<!-- 프로필 -->
							<div class="container" style="width: 60%; align-content: left;">
								<c:choose>
									<c:when test="${member.PROFILE != null}">
										<img src="${member.PROFILE }" alt="Avatar" class="image"
											style="width: 100%; height: 50%; border-radius: 5%;"
											id="image">
									</c:when>
									<c:otherwise>
										<img src="/default_profile.jpg" alt="Avatar" class="image"
											style="width: 100%; height: 50%; border-radius: 5%;"
											id="image">
									</c:otherwise>
								</c:choose>

								<div class="overlay"
									style="width: 100%; height: 100%; border-radius: 5%;"
									onclick="$('#img').trigger('click');">
									<div class="text">프로필 변경</div>
								</div>
							</div>
							<input type="file" id="img" style="display: none;"
								onchange="miri(this);" name="img"><br />
							<!-- 프로필끝 -->
							<!-- 아이디 -->
							<label><b>ID </b><small style="color: red;"> (
									수정불가 )</small></label> <input type="text" name="id" readonly
								value="${member.ID }">
							<!-- 닉네임 -->
							<label><b>NICK </b></label> <input type="text" name="nick"
								value="${member.NICK }">
							<!-- 이메일 -->
							<label for="email"><b>Email</b></label> <input type="text"
								placeholder="Enter Email" name="email" required
								value="${member.EMAIL }">
							<!-- 비밀번호  -->
							<label for="psw"><b>Password</b></label> <input type="password"
								placeholder="Enter Password" name="pass" required id="pass">
							<!-- 비밀번호확인 -->
							<label for="psw-repeat"><b>Repeat Password</b></label> <input
								type="password" placeholder="Repeat Password" name="repass"
								required id="repass">

							<div class="clearfix">
								<button type="reset" class="cancelbtn">취소</button>
								<button type="button" class="signupbtn" onclick="test(this);">수정</button>
							</div>
						</div>
					</form>
				</div>
				<!--  -->
			</div>
		</header>
	</div>
</div>
<script>
	//document.getElementById('id01').style.display = 'block'
	function test(button) {
		if ($("#pass").val() != $("#repass").val()) {
			window.alert("패스워드가 일치하지 않습니다.")
		} else if ($("#pass").val() == "" || $("#repass").val() == "") {
			window.alert("패스워드를 입력해 주십시오.");
		} else {
			$(button).attr("type", "submit");
			$(button).click();
		}
	}

	function miri(file) {
		var reader = new FileReader();
		reader.readAsDataURL(file.files[0]);
		reader.onload = function() {
			document.getElementById("image").src = this.result;
		}
	}
</script>
