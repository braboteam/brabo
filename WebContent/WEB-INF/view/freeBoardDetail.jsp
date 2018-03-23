<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<!-- 디테일게시 -->
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
					<font color="orangered">${board[0].ID }</font>
				</h3>${board[0].BOARD_DATE }
			</td>
			<!-- 하트댓글표시 -->
			<td align="right" style="width: 45%;"><font size="5px;">
					<!-- 하트 --> <c:choose>
						<c:when test="${board[0].LIKE == null }">
							<a href="javascript:like('${board[0].BOARD_ID }','t');"> <span
								class="glyphicon glyphicon-heart-empty"></span>
							</a>
						</c:when>
						<c:otherwise>
							<!-- 색있는 하트 -->
							<a href="javascript:like('${board[0].BOARD_ID }','f');"> <span
								class="glyphicon glyphicon-heart"></span></a>
						</c:otherwise>
					</c:choose>${board[0].COUNT } <!-- 댓글 --> <a href="#"> <span
						class="glyphicon glyphicon-user"></span>
				</a>0
			</font></td>
		</tr>
		<tr>
			<!-- 내용 -->
			<td colspan="2"><br /> ${board[0].COMMENTS }<br /> <br /></td>
		</tr>
		<tr>
			<!-- 이미지 -->
			<td colspan="2" align="left"><c:if
					test="${board[0].BOARD_IMAGE !=null }">
					<c:forEach var="i" items="${board }">
						<img src="/board/${i.DETAIL_IMAGE }"
							style="width: 90%; height: 40%; border-radius: 5%;">
						<br />
						<br />
					</c:forEach>
				</c:if></td>
		</tr>
	</table>
	<!-- 댓글 -->
	<h3 align="left" style="width: 55%;">
		댓글 <font color="pistachio">12</font>
	</h3>
	<hr style="width: 55%;" />
	<div class="w3-container" style="width: 58%;">
		<ul class="w3-ul w3-hoverable" align="left">
			<li>Jill</li>
			<li>Eve</li>
			<li>Adam</li>
		</ul>
	</div>
</div>
<br />

<script>
	function like(pk) {
		console.log("like()" + pk);
		/* $.get("02ajax.jsp", {
			"word" : "ajax",
			"front" : [ "java", "jsp", "css", "jquery" ]
		}, function(rst) {
			window.alert("rst = " + rst);
		}); */
	}
</script>