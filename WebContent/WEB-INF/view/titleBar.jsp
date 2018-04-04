<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 알림바 -->
<div class="alert" style="display: none;" id="alertBar">
	<span class="closebtn"
		onclick="this.parentElement.style.display='none';">&times;</span> <strong>[
		채팅알림 ] </strong><br /> <span id="chatAlert">Indicates a dangerous or
		potentially negative action.</span>
</div>
<!-- 알림바스타일 -->
<style>
.alert {
	padding: 20px;
	background-color: #FF00DD;
	color: white;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}
</style>

<!-- 상단메뉴 -->
<div class="w3-bar w3-theme-d2 w3-left-align">
	<a
		class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
		href="javascript:void(0);" onclick="openNav()"><i
		class="fa fa-bars"></i></a>
	<c:choose>
		<c:when test="${memberRight == 1}">
			<a href="${pageContext.request.contextPath }/index"
				class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a>
			<a href="${pageContext.request.contextPath }/admin/recipeAuth"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white"><i
				class="fa fa-search"></i>admin</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath }/index"
				class="w3-bar-item w3-button w3-teal"><i
				class="fa fa-home w3-margin-right"></i>Home</a>
			<a href="${pageContext.request.contextPath }/recipe/list"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white"><span
				class="glyphicon glyphicon-cutlery"></span> Recipe </a>
			<a href="${pageContext.request.contextPath }/freeboard"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white"><span
				class="glyphicon glyphicon-cloud"></span> Cook Talk </a>
			<a href="${pageContext.request.contextPath }/chatting"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white"><span
				class="glyphicon glyphicon-comment"></span> Chatting </a>
			<a href="${pageContext.request.contextPath }/cheflist"
				class="w3-bar-item w3-button w3-hide-small w3-hover-white"><i
				class="fa fa-search"> Search Chef </i></a>
		</c:otherwise>
	</c:choose>


	<!-- 로그인 메뉴 -->
	<c:choose>
		<c:when test="${logon != null}">

			<div class="w3-dropdown-hover w3-hide-small w3-right">
				<button class="w3-button" title="Notifications">
					<i class="fa fa-search"> My Info </i> <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-card-4 w3-bar-block">
					<a href="${pageContext.request.contextPath }/mypage"
						class="w3-bar-item w3-button" style="text-decoration:none;">MyPage</a>
					<a href="${pageContext.request.contextPath }/logout"
						class="w3-bar-item w3-button" style="text-decoration:none;">logout</a>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath }/join"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Search"> Joining </a>
			<a href="${pageContext.request.contextPath }/login"
				class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
				title="Search"> Login </a>

		</c:otherwise>
	</c:choose>
	<!-- <a href="#"
			class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-teal"
			title="Search"><i class="fa fa-search"> 내정보</i></a> -->
		
	<c:if test="${sessionScope.logon != null }">	
		<c:if test="${cookie.recipeAuth.value eq 'sessionScope.logon' }">
			<script>
				window.alert("등록하신 레시피가 승인처리 되었습니다.");
				document.cookie = "recipeAuth="+null;
			</script>		
		</c:if>
	</c:if>	
</div>
<!--  -->
<script>
	var flag;
	var ws = new WebSocket("ws:/${pageContext.request.serverName}/socket");

	//연결이 됬을때
	ws.onopen = function() {
		console.log("연결");
	}

	//메시지가 들어올 때
	ws.onmessage = function(obj) {
		var msg = JSON.parse(obj.data);
		if (msg.sessionOut != null) {
			window.alert(msg.sessionOut);
			location.href = "${pageContext.request.contextPath}/index";
		}
		if (msg.openmsg != null && flag == 0) { // 오픈채팅 메시지가 오고, 오픈채팅방에 있을때만
			openChat();
		}
		if (msg.id != null) {
			if (msg.id == flag) {
				oneChat();
			} else {
				$("#chatAlert").html(" " + msg.id + " : " + msg.msg);
				$("#alertBar").css("display", "");
			}
		}
	}

	//연결이 끊길 때 ( 서버가 꺼질 때 )
	ws.onclose = function() {
		console.log("연결해제");
	}
</script>
