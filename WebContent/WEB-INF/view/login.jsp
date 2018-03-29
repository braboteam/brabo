<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 14px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button4 {
    background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

</style>
<title>로그인</title>
</head>
<body>
	<!-- 로그인 세션없음 -->
	<c:if test="${sessionError != null }">
		<script>
			window.alert("${sessionError}");
		</script>
	</c:if>

	<h3>로그인</h3>
	<small>ID와 패스워드를 정확히 입력해 주세요</small>
	<form class="w3-container  w3-light-white"
		action="<%=request.getContextPath()%>login" autocomplete="off"
		method="post">
		<h3>로그인</h3>
	    <small>ID와 패스워드를 정확히 입력해 주세요</small>
		<p>
			ID(*)<br> <input class="w2-input w3-border w3-round" type="text"
				style="width: 30%;" pattern="[a-zA-Z]+" name="id" /><br />
		</p>
		<p>
			비밀번호(*)<br> <input class="w2-input w3-border w3-round" type="text" style="width: 30%;" name="pass" /><br />
			비밀번호(*)<br> <input class="w2-input w3-border w3-round"
				type="text" style="width: 300px;" name="pass" /><br />
		</p>
		<button class="button button4" type="submit">로그인</button>
	</form>
	<p>
	</p>