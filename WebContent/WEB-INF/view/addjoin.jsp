<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<title>회원정보 등록</title>
</head>
<body>
	<form class="w3-container  w3-light-white" action="<%=request.getContextPath()%>join" autocomplete="off"
		method="post" enctype="multipart/form-data">
		<h3>회원정보 등록</h3>
	<small>모든 정보는 필수 정보이며, 부적절한 데이터 설정 시 처리되지 않습니다.</small>
		<p>
			ID(*)<br> <input class="w2-input w3-border w3-round" type="text"
				style="width: 300px;" name="id" /><br />
		</p>
		<p>
			닉네임(*)<br> <input placeholder="한글로 입력해 주세요" class="w2-input w3-border w3-round" type="text" style="width: 300px;" name="nick" /><br />
		</p>
		<p>
			비밀번호(*)<br> <input class="w2-input w3-border w3-round" type="text" style="width: 300px;" name="pass" /><br />
		</p>
		<p>
			E-mail<br> <input class="w2-input w3-border w3-round" type="text" style="width: 300px;"
				name="email"/><br />
		</p>
		<p>
			프로필&nbsp;<small>(등록 하고자 하는 사진을 선택바랍니다.)</small><br> <input class="w2-input w3-border w3-round" type="file" style="width: 300px;"
				name="profile" />
		</p>
		<button type="submit">처리요청</button>
	</form>