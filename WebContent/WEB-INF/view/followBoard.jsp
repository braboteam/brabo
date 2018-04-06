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


<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
</style>

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
		<c:choose>
			<c:when test="${member.NOTSESSION == null }">
				<c:choose>
					<c:when test="${member.FRIEND == null }">
						<button type="button" class="btn btn-success" onclick="follow();">팔로우신청</button>
					</c:when>
					<c:otherwise>
						<font color="green"><b> follower </b></font>
						<button type="button" class="btn btn-danger"
							style="font-size: 1px;" onclick="followCancle();">Cancle</button>
					</c:otherwise>
				</c:choose>
			</c:when>
		</c:choose>
		<br /> <br />
	</div>
	<!-- 해당 유저 접속중체크 -->
	<div>
		&nbsp;&nbsp;
		<c:choose>
			<c:when test="${member.logon != null }">
				<span class="glyphicon glyphicon-ok-sign" style="color: green;"></span>
				<b style="color: green">온라인</b>
			</c:when>
			<c:otherwise>
				<span class="glyphicon glyphicon-remove-sign" style="color: red;"></span>
				<b style="color: red"> 오프라인 </b>
			</c:otherwise>
		</c:choose>
	</div>
	<br />
	<!--  -->
	<div class="w3-bar-block">
		<a
			href="${pageContext.request.contextPath }/followinfo?id=${member.ID}"
			class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-th-large fa-fw w3-margin-right"></i><b>레시피목록<c:choose>
					<c:when test="${member.RECIPE_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.RECIPE_COUNT }</font> )
			</c:otherwise>
				</c:choose></b></a> <a
			href="${pageContext.request.contextPath }/freeboard/${member.ID }"
			class="w3-bar-item w3-button w3-padding w3-text-teal"
			style="text-decoration: none;"><i
			class="fa fa-user fa-fw w3-margin-right"></i><b>요리톡목록<c:choose>
					<c:when test="${member.BOARD_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.BOARD_COUNT }</font> )
			</c:otherwise>
				</c:choose></b></a> <a href="javascript:c();" class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-envelope fa-fw w3-margin-right"></i>대화신청</a>
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
	<!-- 레시피 -->
	<div id="content1">
		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<div class="w3-container">
				<h1>
					<b>Cook Talk</b>
				</h1>
				<div class="w3-section w3-bottombar w3-padding-16">
					<span class="w3-margin-right">Filter:</span>
					<button class="w3-button w3-black c_button" onclick="color(this);"
						id="default">DEFAULT</button>
					<button class="w3-button w3-white c_button" onclick="color(this);"
						id="green">
						<i class="fa fa-diamond w3-margin-right"></i>WHITE
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
			</div>
		</header>

		<!-- 게시글 -->
		<c:forEach var="i" items="${board }">
			<div align="center">
				<table border="0"
					style="width: 55%; border-radius: 2%; background-color: silver;"
					class="table">
					<tr>
						<!-- 프로필사진 -->
						<td rowspan="3" valign="top" align="center" style="width: 18%;"><br />
							<a
							href="${pageContext.request.contextPath }/followinfo?id=${i.ID}">
								<c:choose>
									<c:when test="${i.PROFILE != null}">
										<img src="${i.PROFILE }"
											style="border-radius: 100%; width: 100px; height: 100px;">
									</c:when>
									<c:otherwise>
										<img src="/default_profile.jpg"
											style="border-radius: 100%; width: 100px; height: 100px;">
									</c:otherwise>
								</c:choose>
						</a></td>
						<!-- 아이디 -->
						<td style="width: 45%;">
							<h3>
								<font color="orangered"> ${i.NICK } ( ${i.ID } )</font>
							</h3>${i.BOARD_DATE }
						</td>
						<!-- 하트댓글표시 -->
						<td align="right" style="width: 45%;"><font size="5px;">
								<!-- 하트 --> <span id="heart${i.BOARD_ID }"> <c:choose>
										<c:when test="${i.LIKE == null }">
											<c:choose>
												<c:when test="${logon == null }">
													<a
														href="${pageContext.request.contextPath }/login?sessionError=로그인 후 이용하시기 바랍니다.">
														<span class="glyphicon glyphicon-heart-empty"></span>
													</a>
												</c:when>
												<c:otherwise>
													<a href="javascript:like('${i.BOARD_ID }','t');"> <span
														class="glyphicon glyphicon-heart-empty"></span>
													</a>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${logon == null }">
													<a
														href="${pageContext.request.contextPath }/login?sessionError=로그인 후 이용하시기 바랍니다.">
														<span class="glyphicon glyphicon-heart-empty"></span>
													</a>
												</c:when>
												<c:otherwise>
													<!-- 색있는 하트 -->
													<a href="javascript:like('${i.BOARD_ID }','f');"> <span
														class="glyphicon glyphicon-heart"></span></a>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose></span> <span id="count${i.BOARD_ID }">${i.COUNT }</span> <!-- 댓글 -->
								<a
								href="${pageContext.request.contextPath }/boarddetail?pk=${i.BOARD_ID}">
									<span class="glyphicon glyphicon-user"></span>
							</a> <c:choose>
									<c:when test="${i.COMMENTS_COUNT == null }">
						0
						</c:when>
									<c:otherwise>
						${i.COMMENTS_COUNT }
						</c:otherwise>
								</c:choose> &nbsp;
						</font></td>
					</tr>
					<tr>
						<!-- 내용 -->
						<td colspan="2"><a
							href="${pageContext.request.contextPath }/boarddetail?pk=${i.BOARD_ID}"
							style="text-decoration: none; color: black; font-size: 15px;"><br />
								<c:out value="${i.COMMENTS }" /><br /> <br /></a></td>
					</tr>
					<tr>
						<!-- 이미지 -->
						<td colspan="2" align="left"><c:if
								test="${i.BOARD_IMAGE !=null }">
								<a
									href="${pageContext.request.contextPath }/boarddetail?pk=${i.BOARD_ID}"
									style="text-decoration: none;"><img
									src="/board/${i.BOARD_IMAGE }"
									style="width: 90%; height: 40%; border-radius: 5%;"></a>
							</c:if></td>
					</tr>
					<tr>
						<td colspan="3"><br /></td>
					</tr>
				</table>
			</div>
			<br />
		</c:forEach>
	</div>
</div>

<script>
	// Script to open and close sidebar
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("myOverlay").style.display = "block";
	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("myOverlay").style.display = "none";
	}

	function follow() {
		if (window.confirm("팔로우 하시겠습니까?")) {
			$.get("${pageContext.request.contextPath}/follow", {
				"friend" : "${member.ID}",
			}, function(rst) {
				location.href = "";
			});
		}
	}

	function followCancle() {
		if (window.confirm("팔로우를 취소하시겠습니까?")) {
			$.get("${pageContext.request.contextPath}/followcancle", {
				"friend" : "${member.ID}",
			}, function(rst) {
				location.href = "";
			});
		}
	}

	function color(b) {
		$(".c_button").removeClass("w3-black");
		$(".c_button").addClass("w3-white");
		$(b).removeClass("w3-white");
		$(b).addClass("w3-black");
		if ($(b).attr("id") == "default") {
			$(".table").css("background-color", "silver");
		} else if ($(b).attr("id") == "green") {
			$(".table").css("background-color", "white");
		} else if ($(b).attr("id") == "blue") {
			$(".table").css("background-color", "#6799FF");
		} else if ($(b).attr("id") == "yellow") {
			$(".table").css("background-color", "#FAED7D");
		}
		//#D1B2FF  #FAED7D #86E57F
	}

	function like(pk, b) {
		if (b == 't') {
			$
					.get(
							"${pageContext.request.contextPath}/like",
							{
								"board_id" : pk,
							},
							function(rst) {
								if (rst == true) {
									window.alert("좋아요");
									$("#heart" + pk)
											.html(
													"<a href=\"javascript:like('"
															+ pk
															+ "','f');\"> <span class='glyphicon glyphicon-heart'></span></a>");
									$("#count" + pk)
											.html(
													JSON.parse($("#count" + pk)
															.html()) + 1);
									//location.href = "";
								} else {
									console.log("[Error] 좋아요 실패")
								}
							});
		} else {
			$
					.get(
							"${pageContext.request.contextPath}/likecancel",
							{
								"board_id" : pk,
							},
							function(rst) {
								if (rst == true) {
									window.alert("좋아요취소");
									$("#heart" + pk)
											.html(
													"<a href=\"javascript:like('"
															+ pk
															+ "','t');\"> <span class='glyphicon glyphicon-heart-empty'></span></a>");
									$("#count" + pk)
											.html(
													JSON.parse($("#count" + pk)
															.html()) - 1);
									//location.href = "";
								} else {
									window.alert("[Error] 좋아요 취소실패")
								}
							});
		}
	}
</script>
