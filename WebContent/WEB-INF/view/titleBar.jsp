<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="">
	<div class="w3-bar w3-theme-d2 w3-left-align">
		<a
			class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2"
			href="javascript:void(0);" onclick="openNav()"><i
			class="fa fa-bars"></i></a> <a
			href="${pageContext.request.contextPath }/index"
			class="w3-bar-item w3-button w3-teal"><i
			class="fa fa-home w3-margin-right"></i>Home</a> <a href="#team"
			class="w3-bar-item w3-button w3-hide-small w3-hover-white">Team</a> <a
			href="#work"
			class="w3-bar-item w3-button w3-hide-small w3-hover-white">Work</a> <a
			href="#pricing"
			class="w3-bar-item w3-button w3-hide-small w3-hover-white">Price</a>
		<a href="${pageContext.request.contextPath }/freeboard"
			class="w3-bar-item w3-button w3-hide-small w3-hover-white">FreeBoard</a>
		<!-- <div class="w3-dropdown-hover w3-hide-small">
			<button class="w3-button" title="Notifications">
				Dropdown <i class="fa fa-caret-down"></i>
			</button>
			<div class="w3-dropdown-content w3-card-4 w3-bar-block">
				<a href="#" class="w3-bar-item w3-button">Link</a> <a href="#"
					class="w3-bar-item w3-button">Link</a> <a href="#"
					class="w3-bar-item w3-button">Link</a>
			</div>
		</div> -->
		<c:choose>
			<c:when test="${logon != null}">

				<div class="w3-dropdown-hover w3-hide-small w3-right">
					<button class="w3-button" title="Notifications">
						<i class="fa fa-search"> 내정보</i> <i class="fa fa-caret-down"></i>
					</button>
					<div class="w3-dropdown-content w3-card-4 w3-bar-block">
						<a href="${pageContext.request.contextPath }/logout" class="w3-bar-item w3-button">logout</a> <a href="#"
							class="w3-bar-item w3-button">Link</a> <a href="#"
							class="w3-bar-item w3-button">Link</a>
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
	</div>