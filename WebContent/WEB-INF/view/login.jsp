<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<title>로그인</title>
</head>
<body>
	<form class="w3-container  w3-light-white" action="<%=request.getContextPath()%>login" autocomplete="off"
		method="post">
		<h3>로그인</h3>
	    <small>ID와 패스워드를 정확히 입력해 주세요</small>
		<p>
			ID(*)<br> <input class="w2-input w3-border w3-round" type="text"
				style="width: 300px;" name="id" /><br />
		</p>
		<p>
			비밀번호(*)<br> <input class="w2-input w3-border w3-round" type="text" style="width: 300px;" name="pass" /><br />
		</p>
		<button type="submit">로그인</button>
	</form>