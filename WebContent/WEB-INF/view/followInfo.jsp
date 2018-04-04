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
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

.thumb {
	width: 150px;
	height: 150px;
}

.img {
	width: 150px;
	height: 150px;
}

.ment {
	text-align: center;
}

.grayMent {
	color: gray;
}

#table{
	border-spacing: 10px;
	border-collapse: separate;
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
		</a> <img src="${member.PROFILE }" style="width: 45%;" class="w3-round"><br>
		<font color="blue"><b>팔로워 ${member.COUNT }</b></font> <br /> <br />
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
			class="w3-bar-item w3-button w3-padding w3-text-teal"
			style="text-decoration: none;"><i
			class="fa fa-th-large fa-fw w3-margin-right"></i><b>레시피목록 <c:choose>
					<c:when test="${member.RECIPE_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.RECIPE_COUNT }</font> )
			</c:otherwise>
				</c:choose>
		</b></a> <a href="${pageContext.request.contextPath }/freeboard/${member.ID }"
			class="w3-bar-item w3-button w3-padding"
			style="text-decoration: none;"><i
			class="fa fa-user fa-fw w3-margin-right"></i><b>요리톡목록 <c:choose>
					<c:when test="${member.BOARD_COUNT == null }">
			( <font color="green">0</font> )
			</c:when>
					<c:otherwise>
			( <font color="green">${member.BOARD_COUNT }</font> )
			</c:otherwise>
				</c:choose></b></a> <a href="javascript:c();" class="w3-bar-item w3-button w3-padding"
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
	<!-- 레시피 -->
	<div id="content1">
		<!-- Header -->
		<header id="portfolio">
			<span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<h1>
				<b>Recipe</b>
			</h1>
			<div class="w3-section w3-bottombar w3-padding-16">
				<span class="w3-margin-right">Filter:</span>
				<button class="w3-button w3-black">ALL</button>
				<button class="w3-button w3-white">
					<i class="fa fa-diamond w3-margin-right"></i>Design
				</button>
				<button class="w3-button w3-white w3-hide-small">
					<i class="fa fa-photo w3-margin-right"></i>Photos
				</button>
				<button class="w3-button w3-white w3-hide-small">
					<i class="fa fa-map-pin w3-margin-right"></i>Art
				</button>
			</div>
		</header>
		<div>
			<hr />
			<div class="content" align="center">
			
				<table id="table">
					<tr>
						<c:forEach var="i" items="${board }" varStatus="vs">
						<td>
							<table style="border-spacing: 10px;">
								<tr>
									<td class="thumb"><a
										href="${pageContext.request.contextPath }/recipe/list/${i.NO}"
										class="link"> <img
											src="${pageContext.request.contextPath }/iphoto/${i.ID}/${i.IPHOTO}"
											class="img">
									</a></td>
								</tr>
								<tr>
									<td>
										<table style="width: 100%">
											<tr>
												<td class="ment"><b>${i.TITLE }</b></td>
											</tr>
											<tr>
												<td class="ment grayMent"><small>by ${i.ID }</small></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
						<c:if test="${vs.count % 4 ==0 }">
							</tr><tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
			<hr />
		</div>
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
</script>