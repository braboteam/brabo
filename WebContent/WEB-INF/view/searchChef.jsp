<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/*  */
body {
	font-family: Arial;
}

* {
	box-sizing: border-box;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}
/*  */
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
<div>
	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 50px">Search Chef</h1>
			<p>( 아이디 또는 닉네임으로 검색하실 수 있습니다. )</p>
		</div>
	</div>
	<br />
	<!-- 검색바 -->
	<form class="example" style="margin: auto; max-width: 300px">
		<input type="text" placeholder="Search.." onkeyup="search(this);"
			onchange="search(this);" id="searchBar">
		<button type="button" onclick="search($('#searchBar'));">
			<i class="fa fa-search"></i>
		</button>
		<input class="w3-check" type="checkbox" id="check"
			onclick="search($('#searchBar'));"> <label>Follow
			Only</label>
	</form>
	<br /> <br />
	<div>
		<table align="center" border="0" style="whidth: 70%;" id="content">
			<c:forEach var="i" items="${member }">
				<tr>
					<td style="width: 30%;" align="center">
						<!--  --> <c:choose>
							<c:when test="${logon != i.ID }">
								<a
									href="${pageContext.request.contextPath }/followinfo?id=${i.ID}">
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/mypage">
							</c:otherwise>
						</c:choose> <!--  --> <img src="${i.PROFILE }"
						style="width: 100px; height: 100px; border-radius: 100%;"></a>
					</td>
					<td style="width: 30%;"><p>
							<c:choose>
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
							<b style="color: orange; font-size: 20px;"> ${i.NICK } (
								${i.ID } )</b></a>
						</p>
						<p>${i.EMAIL }</p></td>
					<td style="width: 40%;" align="center"><c:if
							test="${logon != null }">
							<c:choose>
								<c:when test="${i.FID == null }">
									<button type="button" class="btn btn-success"
										onclick="follow('${i.ID}');">팔로우신청</button>
								</c:when>
								<c:otherwise>
									<font color="green"><b> follower </b></font>
									<button type="button" class="btn btn-danger"
										style="font-size: 1px;" onclick="followCancle('${i.ID}');">Cancle</button>
								</c:otherwise>
							</c:choose>
						</c:if></td>
				</tr>
				<tr>
					<td colspan="3"><hr /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<script>
	function follow(id) {
		if (window.confirm("팔로우 하시겠습니까?")) {
			$.get("${pageContext.request.contextPath}/follow", {
				"friend" : id,
			}, function(rst) {
				location.href = "";
			});
		}
	}

	function followCancle(id) {
		if (window.confirm("팔로우를 취소하시겠습니까?")) {
			$.get("${pageContext.request.contextPath}/followcancle", {
				"friend" : id,
			}, function(rst) {
				location.href = "";
			});
		}
	}

	function search(k) {
		$
				.get(
						"${pageContext.request.contextPath}/chefsearch",
						{
							"keyword" : $(k).val(),
							"check" : $("#check").prop("checked")
						},
						function(obj) {
							$("#content").html("");
							// 반복시작
							for (var i = 0; i < obj.length; i++) {
								var href = "";
								if ("${logon}" != obj[i].ID) {
									href = "${pageContext.request.contextPath }/followinfo?id="
											+ obj[i].ID;
								} else {
									href = "${pageContext.request.contextPath }/mypage";
								}
								var total = "<tr> <td style='width: 30%;' align='center'>"
										+ "<a href="+href+"><img src='"
										+ obj[i].PROFILE
										+ "' style='width: 100px; height: 100px; border-radius: 100%;'></a></td>"
										+ "<td style='width: 30%;'> <p><a href="+href+" style='text-decoration:none;'><b style='color: orange; font-size: 20px;'> "
										+ obj[i].NICK
										+ " ( "
										+ obj[i].ID
										+ " ) </b></a></p> <p> "
										+ obj[i].EMAIL
										+ " </p></td> <td style='width: 40%;' align='center'>";
								if ("${logon}" != "") {
									if (obj[i].FID == null) {
										total += "<button type='button' class='btn btn-success' onclick=\"follow('"
												+ obj[i].ID
												+ "');\">팔로우신청</button>";
									} else {
										total += "<font color='green'><b> follower </b></font><button type='button' class='btn btn-danger'"
												+ "style='font-size: 1px;' onclick=\"followCancle('"
												+ obj[i].ID
												+ "');\">Cancle</button>";
									}
									total += "</td></tr>";
								}
								total += "<tr> <td colspan='3'><hr /></td></tr>";
								// 컨텐츠
								$("#content")
										.html($("#content").html() + total);
							}
						});
	}
</script>
