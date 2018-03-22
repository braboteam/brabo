<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body id="myPage">

	<c:if test="${success != null}">
		<script>
			window.alert("${success}");
		</script>
	</c:if>

	<c:if test="${err != null}">
		<script>
			window.alert("${err}");
		</script>
	</c:if>
	<!-- Sidebar on click -->
	<nav
		class="w3-sidebar w3-bar-block w3-white w3-card w3-animate-left w3-xxlarge"
		style="display: none; z-index: 2" id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()"
			class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
			<i class="fa fa-remove"></i>
		</a> <a href="#" class="w3-bar-item w3-button">Link 1</a> <a href="#"
			class="w3-bar-item w3-button">Link 2</a> <a href="#"
			class="w3-bar-item w3-button">Link 3</a> <a href="#"
			class="w3-bar-item w3-button">Link 4</a> <a href="#"
			class="w3-bar-item w3-button">Link 5</a>
	</nav>

	<!-- 타이틀바 -->
	<tiles:insertAttribute name="title"></tiles:insertAttribute>

	<!-- 바디 -->
	<tiles:insertAttribute name="body"></tiles:insertAttribute>

	<!-- 스크립트 -->
	<script>
		// Script for side navigation
		function w3_open() {
			var x = document.getElementById("mySidebar");
			x.style.width = "300px";
			x.style.paddingTop = "10%";
			x.style.display = "block";
		}

		// Close side navigation
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}

		// Used to toggle the menu on smaller screens when clicking on the menu button
		function openNav() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>

</body>
</html>
