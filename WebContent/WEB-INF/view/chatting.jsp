<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 대화창 위 스타일 -->
<style>
.chip {
	display: inline-block;
	padding: 0 25px;
	height: 50px;
	font-size: 16px;
	line-height: 50px;
	border-radius: 25px;
	background-color: #f1f1f1;
}

.chip img {
	float: left;
	margin: 0 10px 0 -25px;
	height: 50px;
	width: 50px;
	border-radius: 50%;
}
</style>

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
			<h4>
				현재 접속 : <b>${member.size() }</b>
			</h4>
			<br />
			<ul class="nav nav-pills nav-stacked">
				<li class="active select" onclick="selectBar(this)"><a
					href="javascript:openChat();"
					style="text-align: center; text-decoration: none;"
					onclick="changeFlag('0')"> <span
						class="glyphicon glyphicon-comment"></span> Open Chat
				</a></li>
				<c:forEach var="i" items="${member }">
					<li class="select" onclick="selectBar(this)"><a
						style="text-decoration: none;" onclick="changeFlag('${i.ID}')"><font
							color="black"><b><img src="${i.PROFILE }"
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
		<!-- 대화창 헤더 -->
		<div class="chip" id="head" style="background-color: silver;">
			<img src="/Desert.jpg" alt="Person" width="96" height="96"> <b
				style="color: green;">Open Chat</b><small><font color="red">
					( ※ 오픈채팅의 내용은 삭제될 수 있습니다. ) </font></small>
		</div>
		<br />
		<!-- 색필터 -->
		<div class="w3-section w3-bottombar w3-padding-16" style="width: 86%;">
			<span class="w3-margin-right">Filter:</span>
			<button class="w3-button w3-black c_button" onclick="color(this);"
				id="default">DEFAULT</button>
			<button class="w3-button w3-white c_button" onclick="color(this);"
				id="green">
				<i class="fa fa-diamond w3-margin-right"></i>PINK
			</button>
			<button class="w3-button w3-white w3-hide-small c_button"
				onclick="color(this);" id="blue">
				<i class="fa fa-photo w3-margin-right"></i>BLUE
			</button>
			<button class="w3-button w3-white w3-hide-small c_button"
				onclick="color(this);" id="yellow">
				<i class="fa fa-map-pin w3-margin-right"></i>YELLOW
			</button>
		</div>
		<!-- 색필터끝 -->
		<br />
		<!-- 대화창 -->
		<div class="col-sm-9" style="overflow: auto; height: 35%; width: 61%;"
			id="chatlist">
			<!-- 내글 형식 -->
			<div class="container" style="width: 30%;">
				<img src="${member[0].PROFILE }" alt="Avatar" style="width: 80%;">
				<p>
					<b>안녕 오늘어떄?</b>
				</p>
				<span class="time-right">11:00</span>
			</div>
			<!-- 상대방글 형식 -->
			<div align="right">
				<div class="container darker" style="width: 30%;" align="right">
					<img src="/Desert.jpg" alt="Avatar" class="right"
						style="width: 100%;">
					<p>
						<b>여어~ 난 좋아 물어봐줘서 고마워!</b>
					</p>
					<span class="time-left">11:01</span>
				</div>
			</div>
		</div>
		<!-- 대화창끝 -->
		<!-- 입력폼 -->
		<div class="input-group" style="width: 61%;">
			<span class="input-group-addon">SendMessage</span> <input id="msg"
				type="text" class="form-control" name="msg"
				onchange="sendMsg(this);" placeholder="Additional Info">
		</div>
		<!-- 입력폼끝 -->
	</div>
</div>
<script>
	flag = "0";

	openChat();

	// 현재 채팅 상대 변경
	function changeFlag(f) {
		flag = f;
		if (flag != "0") {
			oneChat();
		} else {
			openChat();
		}
		console.log("현재 flag :" + flag);
	}

	//사이바 선택
	function selectBar(bar) {
		$(".select").removeClass("active");
		$(bar).addClass("active");
	}

	// 오픈채팅방활성화
	// "msg","date","PROFILE","PASS","NICK","JOINDATE","RIGHT","ID","EMAIL"
	function openChat() {
		if (flag == "0") {
			$
					.get(
							"${pageContext.request.contextPath}/openchat",
							{

							},
							function(rst) {
								$("#head")
										.html(
												"<img src='/Desert.jpg' alt='Person' width='96' height='96'>"
														+ " <b style='color: green;'>Open Chat</b><small><font color='red'>"
														+ " ( ※ 오픈채팅의 내용은 삭제될 수 있습니다. ) </font></small>");
								var msg = "";
								for (var i = 0; i < rst.length; i++) {
									if ("${logon}" == rst[i].ID) { // 내글
										msg += "<div class='container' style='width: 30%;'>"
												+ " <img src='"
												+ rst[i].PROFILE
												+ "' alt='Avatar' style='width: 80%;'>"
												+ " <p><b>"
												+ rst[i].msg
												+ "</b></p>	<span class='time-right'>"
												+ rst[i].date + "</span></div>";
									} else { // 상대방글
										msg += "<div align='right'><div class='container darker' style='width: 30%;' align='right' >"
												+ " <img src='"
												+ rst[i].PROFILE
												+ "' alt='Avatar' class='right' style='width: 100%;'>"
												+ " <p><b>"
												+ rst[i].msg
												+ "</b></p>"
												+ "<span class='time-left'>"
												+ rst[i].date
												+ "</span></div></div>";
									}
								}
								$("#chatlist").html(msg);
								document.getElementById("chatlist").scrollTop = 100000000;
							});
		}
	}

	// 메시지보내기
	function sendMsg(msg) {
		if (flag == "0") {
			$.get("${pageContext.request.contextPath}/sendopenchat", {
				"msg" : $(msg).val(),
			}, function(rst) {
				if (rst) {
					openChat();
				} else {
					window.alert("메시지전송에 실패하였습니다.");
				}
			});
		} else {
			$.get("${pageContext.request.contextPath}/sendonechat", {
				"friend" : flag,
				"msg" : $(msg).val()
			}, function(rst) {
				if (rst) {
					// 일대일 채팅목록 갱신
					oneChat();
				} else {
					window.alert("메시지전송에 실패하였습니다.");
				}
			});
		}
		$(msg).val("");
	}

	// 일대일 채팅 활성화
	// ID FRIEND MSG DATE
	function oneChat() {
		if (flag != "0") {
			$
					.get(
							"${pageContext.request.contextPath}/onechat",
							{
								"friend" : flag
							},
							function(rst) {
								for (var i = 0; i < rst.length; i++) {
									if ("${logon}" != rst[i].ID) {
										$("#head")
												.html(
														"<a href='${pageContext.request.contextPath}/followinfo?id="
																+ rst[i].ID
																+ "' style='text-decoration:none;'><img src='"+rst[i].PROFILE+"' alt='Person' width='96' height='96'>"
																+ " <b style='color: green;'> "
																+ rst[i].NICK
																+ " ( "
																+ rst[i].ID
																+ " )</b></a>");
										break;
									}
								}
								var msg = "";
								for (var i = 0; i < rst.length; i++) {
									if ("${logon}" == rst[i].ID) { // 내글
										msg += "<div class='container' style='width: 30%;'>"
												+ " <img src='"
												+ rst[i].PROFILE
												+ "' alt='Avatar' style='width: 80%;'>"
												+ " <p><b>"
												+ rst[i].MSG
												+ "</b></p>	<span class='time-right'>"
												+ rst[i].DATE + "</span></div>";
									} else { // 상대방글
										msg += "<div align='right'><div class='container darker' style='width: 30%;' align='right' >"
												+ " <img src='"
												+ rst[i].PROFILE
												+ "' alt='Avatar' class='right' style='width: 100%;'>"
												+ " <p><b>"
												+ rst[i].MSG
												+ "</b></p>"
												+ "<span class='time-left'>"
												+ rst[i].DATE
												+ "</span></div></div>";
									}
								}
								$("#chatlist").html(msg);
								document.getElementById("chatlist").scrollTop = 100000000;
							});
		}
	}

	// 채팅창 배경필터
	function color(b) {
		$(".c_button").removeClass("w3-black");
		$(".c_button").addClass("w3-white");
		$(b).removeClass("w3-white");
		$(b).addClass("w3-black");
		if ($(b).attr("id") == "default") {
			$("#chatlist").css("background-color", "white");
		} else if ($(b).attr("id") == "green") {
			$("#chatlist").css("background-color", "#FFA7A7");
		} else if ($(b).attr("id") == "blue") {
			$("#chatlist").css("background-color", "#6799FF");
		} else if ($(b).attr("id") == "yellow") {
			$("#chatlist").css("background-color", "#FAED7D");
		}
		//#D1B2FF  #FAED7D #86E57F
	}
</script>