<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

input[type=text], select, textarea {
	width: 100%; /* Full width */
	padding: 12px; /* Some padding */
	border: 1px solid #ccc; /* Gray border */
	border-radius: 4px; /* Rounded borders */
	box-sizing: border-box;
	/* Make sure that padding and width stays in place */
	margin-top: 6px; /* Add a top margin */
	margin-bottom: 16px; /* Bottom margin */
	resize: vertical
		/* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
<!-- 댓글삽입 실패 -->
<c:if test="${insertFail != null }">
	<script>
		window.alert("${insertFail}");
	</script>
</c:if>

<!-- 댓글삽입 성공 -->
<c:if test="${msg != null }">
	<script>
		window.alert("${msg}");
	</script>
</c:if>

<!-- 디테일게시 -->
<div align="center">
	<table border="0" style="width: 55%; background-color: white;">
		<tr>
			<!-- 프로필사진 -->
			<td rowspan="3" valign="top" align="center" style="width: 18%;"><br />
				<c:choose>
					<c:when test="${logon != board[0].ID }">
						<a
							href="${pageContext.request.contextPath }/followinfo?id=${board[0].ID}">
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/mypage">
					</c:otherwise>
				</c:choose> <img src="${board[0].PROFILE }"
				style="border-radius: 100%; width: 120px; height: 120px;"></a></td>
			<!-- 아이디 -->
			<td style="width: 45%;"><c:choose>
					<c:when test="${logon != board[0].ID }">
						<a
							href="${pageContext.request.contextPath }/followinfo?id=${board[0].ID}"
							style="text-decoration: none;">
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/mypage"
							style="text-decoration: none;">
					</c:otherwise>
				</c:choose>
				<h3>
					<font color="orangered"> ${board[0].NICK} ( ${board[0].ID }
						)</font>
				</h3> </a>${board[0].BOARD_DATE }</td>
			<!-- 하트댓글표시 -->
			<td align="right" style="width: 45%;"><font size="5px;">
					<!-- 하트 --> <span id="heart"> <c:choose>
							<c:when test="${board[0].LIKE == null }">
								<c:choose>
									<c:when test="${logon == null }">
										<a
											href="${pageContext.request.contextPath }/login?sessionError=로그인 후 이용하시기 바랍니다.">
											<span class="glyphicon glyphicon-heart-empty"></span>
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:like('${board[0].BOARD_ID }','t');"> <span
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
										<a href="javascript:like('${board[0].BOARD_ID }','f');"> <span
											class="glyphicon glyphicon-heart"></span></a>
									</c:otherwise>
								</c:choose>

							</c:otherwise>
						</c:choose></span> <span id="count">${board[0].COUNT }</span> <!-- 댓글 --> <a
					href="${pageContext.request.contextPath }"> <span
						class="glyphicon glyphicon-user"></span>
				</a> <c:choose>
						<c:when test="${board[0].COMMENTS_COUNT == null}">
						0
						</c:when>
						<c:otherwise>
						${board[0].COMMENTS_COUNT}
						</c:otherwise>
					</c:choose> &nbsp;
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
		<!-- 삭제버튼 -->
		<c:if test="${logon == board[0].ID }">
			<tr>
				<td colspan="3" align="right"><br />
					<button type="button"
						onclick="deleteBoard('${board[0].BOARD_ID}');"
						style="font-size: 20px;" class="btn btn-danger">Delete</button></td>
			</tr>
		</c:if>
	</table>

	<!-- 댓글 목록-->
	<h3 align="left" style="width: 55%;">
		댓글 <font color="pistachio"><c:choose>
				<c:when test="${board[0].COMMENTS_COUNT == null}">
						0
						</c:when>
				<c:otherwise>
						${board[0].COMMENTS_COUNT}
						</c:otherwise>
			</c:choose> &nbsp;</font>
	</h3>
	<hr style="width: 55%;" />
	<div class="w3-container" style="width: 58%;">
		<c:if test="${comments != null }">
			<ul class="w3-ul w3-hoverable" align="left">
				<c:forEach var="i" items="${comments }">
					<li><table style="width: 100%;" border="0">
							<tr>
								<td rowspan="2" style="width: 10%;"><img
									src="${i.PROFILE }"
									style="border-radius: 100%; width: 50px; height: 50px;"
									onclick="info('${i.ID}');">&nbsp;</td>
								<td onclick="info('${i.ID}');"><font color="orangered"
									size="4px">${i.ID } ( ${i.NICK} )</font> &nbsp; <font
									color="silver">${i.COMMENTS_DATE }</font></td>
								<!-- 댓글삭제 -->
								<td align="right"><c:if test="${logon == i.ID }">
										<a href="javascript:deleteReply('${i.BOARD_COMMENTS_ID }');"
											onmouseover="$('#x${i.ID}').css('color', 'red');"
											onmouseout="$('#x${i.ID}').css('color', 'gray');"
											style="text-decoration: none;"><li class="w3-large"
											style="color: gray;" id="x${i.ID }"><i
												class="fa fa-close"></i></li></a>
									</c:if></td>
							</tr>
							<tr>
								<td colspan="2" onclick="info('${i.ID}');">${i.COMMENTS }</td>
							</tr>
						</table></li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	<br />
	<!-- 댓글달기 -->
	<form action="${pageContext.request.contextPath }/addcomments">
		<div style="width: 55%; text-align: left;">
			<label for="subject">댓글쓰기</label>
			<textarea id="comments" name="comments" placeholder="댓글내용작성"
				style="height: 150px"></textarea>
			<input type="hidden" name="board_id" value="${board[0].BOARD_ID }">
		</div>
		<div style="text-align: right; width: 55%;">
			<input type="submit" value="댓글달기">
		</div>
	</form>

</div>
<br />

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
									$("#heart")
											.html(
													"<a href=\"javascript:like('"
															+ pk
															+ "','f');\"> <span class='glyphicon glyphicon-heart'></span></a>");
									$("#count").html(
											JSON.parse($("#count").html()) + 1);
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
									$("#heart")
											.html(
													"<a href=\"javascript:like('"
															+ pk
															+ "','t');\"> <span class='glyphicon glyphicon-heart-empty'></span></a>");
									$("#count").html(
											JSON.parse($("#count").html()) - 1);
									//location.href = "";
								} else {
									window.alert("[Error] 좋아요 취소실패")
								}
							});
		}
	}

	function deleteBoard(pk) {
		if (window.confirm("해당 게시글을 삭제하시겠습니까?")) {
			$
					.get(
							"${pageContext.request.contextPath}/deleteboard",
							{
								"board_id" : pk,
							},
							function(rst) {
								if (rst) {
									window.alert("게시글이 삭제되었습니다.");
									location.href = "${pageContext.request.contextPath}/freeboard";
								} else {
									window.alert("게시글 삭제에 실패하였습니다.");
								}
							});
		}
	}
	function info(id) {
		if (id != "${logon}") {
			location.href = "${pageContext.request.contextPath}/followinfo?id="
					+ id;
		} else {
			location.href = "${pageContext.request.contextPath}/mypage";
		}
	}

	function deleteReply(comment) {
		if (window.confirm("해당 댓글을 삭제하시겠습니까?")) {
			$.get("${pageContext.request.contextPath}/deletecomments", {
				"board_comments_id" : comment
			}, function(rst) {
				if (rst) {
					window.alert("게시글이 삭제되었습니다.");
					location.href = "";
				} else {
					window.alert("게시글 삭제에 실패하였습니다.");
				}
			});
		}
	}
</script>