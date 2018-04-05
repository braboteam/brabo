<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}
.thumb {
	width: 150x;
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
	style="z-index: 3; width: 300px;" id="mySidebar"> <br>
<div class="w3-container">
	<a href="#" onclick="w3_close()"
		class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey"
		title="close menu"> <i class="fa fa-remove"></i>
	</a> <img src="${member.PROFILE }" style="width: 45%;" class="w3-round"><br>
	<font color="blue"><b>팔로워 ${member.COUNT }</b></font><br /> <br />
	<h4>
		<b> ${member.NICK} ( ${member.ID } )</b>
	</h4>
	<p class="w3-text-grey">${member.EMAIL }</p>
	<br />
</div>
<div class="w3-bar-block">
	<!-- 정보수정링크  -->
	<a href="${pageContext.request.contextPath }/mypage"
		class="w3-bar-item w3-button w3-padding "
		style="text-decoration: none;"><i
		class="fa fa-user fa-fw w3-margin-right"></i><b>MyInfo</b></a>
	<!-- 내 게시물 -->
	<a href="${pageContext.request.contextPath }/myrecipe"
		class="w3-bar-item w3-button w3-padding w3-text-teal"
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
		class="w3-bar-item w3-button w3-padding "
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


<!-- 컨텐츠 -->
<div class="w3-main" style="margin-left: 300px;">
	<!-- 레시피 -->
	<div id="content1">
		<!-- Header -->
		<header id="portfolio"> <span
			class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey"
			onclick="w3_open()"><i class="fa fa-bars"></i></span>
		<div class="w3-container">
			<h1>
				<b>My Recipe</b>
			</h1>
			<div class="w3-section w3-bottombar w3-padding-16">
				<span class="w3-margin-right">Filter:</span>
				<button class="w3-button w3-black c_button" onclick="color(this);"
					id="default">DEFAULT</button>
				<button class="w3-button w3-white c_button" onclick="color(this);"
					id="green">
					<i class="fa fa-diamond w3-margin-right"></i>GREEN
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
		<div>
			<div class="content" align="center">
				<div style="width:800px;">
				<table id="table">
					<tr>
						<c:forEach var="i" items="${board }" varStatus="vs">
							<td >
								<table>
									<tr>
										<td class="thumb"><a
											href="${pageContext.request.contextPath }/recipe/list/${i.NO}"
											class="link"> <img
												src="${pageContext.request.contextPath }/iphoto/${i.ID}/${i.IPHOTO}"
												class="img"></a>
										</td>
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
			</div>
		</div>
	</div>
</div>
<script>
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

	
</script>
