<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<!-- Alert -->
<c:if test="${msg !=null }">
	<script>
		window.alert("${msg}");
		location.href = "/freeboard";
	</script>
</c:if>
<div style="background-color: silver;">
	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 50px">Cook Talk</h1>
			<p>I'm a chef</p>
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}boardwriting'">Writing</button>
		</div>
	</div>
	<!-- 필터 -->
	<div class="w3-container">
		<div class="w3-section w3-bottombar w3-padding-16" align="center">
			<button class="w3-button w3-black c_button" onclick="allBoard();"
				id="default">
				<i class="fa fa-map-pin w3-margin-right"></i>All
			</button>
			<button class="w3-button w3-white c_button" onclick="followOnly();"
				id="green">
				<i class="fa fa-diamond w3-margin-right"></i>Follow Only
			</button>
		</div>
	</div>
	<!-- 필터끝 -->
	<!-- 게시글 -->
	<c:forEach var="i" items="${board }">
		<div align="center">
			<table border="0"
				style="width: 55%; background-color: white; border-radius: 2%;">
				<tr>
					<!-- 프로필사진 -->
					<td rowspan="3" valign="top" align="center" style="width: 18%;"><br />
						<c:choose>
							<c:when test="${logon != i.ID }">
								<a
									href="${pageContext.request.contextPath }/followinfo?id=${i.ID}">
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/mypage">
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test="${i.PROFILE != null}">
								<img src="${i.PROFILE }"
									style="border-radius: 100%; width: 120px; height: 120px;">
							</c:when>
							<c:otherwise>
								<img src="/default_profile.jpg"
									style="border-radius: 100%; width: 120px; height: 120px;">
							</c:otherwise>
						</c:choose> </a></td>
					<!-- 아이디 -->
					<td style="width: 45%;"><c:choose>
							<c:when test="${logon != i.ID }">
								<a
									href="${pageContext.request.contextPath }/followinfo?id=${i.ID}"
									style="text-decoration: none;">
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/mypage"
									style="text-decoration: none;">
							</c:otherwise>
						</c:choose>
						<h3>
							<font color="orangered"> ${i.NICK } ( ${i.ID } )</font>
						</h3> </a>${i.BOARD_DATE }</td>
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
								</c:choose></span> <span id="count${i.BOARD_ID }">${i.COUNT }</span> <!-- 댓글 --> <a
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
							<c:out value="${i.COMMENTS }" /> <br /> <br /></a></td>
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
					<td colspan="3"><hr /></td>
				</tr>
			</table>
		</div>
		<br />
	</c:forEach>

	<script>
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
										window.alert("좋아요 하였습니다.");
										$("#heart" + pk)
												.html(
														"<a href=\"javascript:like('"
																+ pk
																+ "','f');\"> <span class='glyphicon glyphicon-heart'></span></a>");
										$("#count" + pk).html(
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
										window.alert("좋아요를 취소하였습니다.");
										$("#heart" + pk)
												.html(
														"<a href=\"javascript:like('"
																+ pk
																+ "','t');\"> <span class='glyphicon glyphicon-heart-empty'></span></a>");
										$("#count" + pk).html(
												JSON.parse($("#count" + pk)
														.html()) - 1);
										//location.href = "";
									} else {
										window.alert("[Error] 좋아요 취소실패")
									}
								});
			}
		}
		function allBoard() {
			location.href = "${pageContext.request.contextPath}/freeboard";
		}
		function followOnly() {
			location.href = "${pageContext.request.contextPath}/onlyfollowboard";
		}
	</script>
	<!-- 게시글끝 -->
</div>


