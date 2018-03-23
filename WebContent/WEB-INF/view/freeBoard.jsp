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
	<br />

	<!-- 게시글 -->
	<c:forEach var="i" items="${board }">
		<div align="center">
			<table border="0" style="width: 55%; background-color: white;">
				<tr>
					<!-- 프로필사진 -->
					<td rowspan="3" valign="top" align="center" style="width: 18%;"><br />
						<img src="/Desert.jpg"
						style="border-radius: 100%; width: 120px; height: 120px;"></td>
					<!-- 아이디 -->
					<td style="width: 45%;">
						<h3>
							<font color="orangered">${i.ID }</font>
						</h3>${i.BOARD_DATE }
					</td>
					<!-- 하트댓글표시 -->
					<td align="right" style="width: 45%;"><font size="5px;">
							<!-- 하트 --> <span id="heart${i.BOARD_ID }"> <c:choose>
									<c:when test="${i.LIKE == null }">
										<a href="javascript:like('${i.BOARD_ID }','t');"> <span
											class="glyphicon glyphicon-heart-empty"></span>
										</a>
									</c:when>
									<c:otherwise>
										<!-- 색있는 하트 -->
										<a href="javascript:like('${i.BOARD_ID }','f');"> <span
											class="glyphicon glyphicon-heart"></span></a>
									</c:otherwise>
								</c:choose></span> <span id="count${i.BOARD_ID }">${i.COUNT }</span> <!-- 댓글 --> <a
							href="#"> <span class="glyphicon glyphicon-user"></span>
						</a> 0
					</font></td>
				</tr>
				<tr>
					<!-- 내용 -->
					<td colspan="2"><a
						href="${pageContext.request.contextPath }/boarddetail?pk=${i.BOARD_ID}"
						style="text-decoration: none; color: black; font-size: 15px;"><br />
							${i.COMMENTS }<br /> <br /></a></td>
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
										window.alert("좋아요완료");
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
										window.alert("좋아요실패완료");
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
	</script>
	<!-- 게시글끝 -->
</div>


