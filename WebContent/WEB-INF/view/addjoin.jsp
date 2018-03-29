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

.button2 {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 2px 7px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
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

.button4:hover {
	background-color: #e7e7e7;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}

.button1:hover {
	background-color: #e7e7e7;
}

div.card {
  width: 420px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: left;
  margin-right: auto;margin-left: auto;margin-top: auto;margin-bottom: auto;
}

div.header {
    background-color: #ffffff;
    color: gray;
    padding: 10px;
    font-size: 12px;
}
</style>
<title>회원정보 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<p></p>
<div class="card">
  <div class="header">
	<form class="w3-container  w3-light-white"
		action="<%=request.getContextPath()%>join" autocomplete="off"
		method="post" enctype="multipart/form-data">
		<h3>회원정보 등록</h3>
		<small>모든 정보는 필수 정보이며, 부적절한 데이터 설정 시 처리되지 않습니다.</small>
		<p>
			ID(*)&nbsp;<span id="checkMsg"></span><br /> <input
				class="w2-input w3-border w3-round" placeholder="영어로 입력해 주세요"
				type="text" style="width: 80%;" pattern="[a-zA-Z]+" name="id"
				id="id" />
			<button type="button" id="jungbock" class="button2 button1">중복ID</button>
			<br />
		</p>

		<p>
			닉네임(*)&nbsp;<span id="nickMsg"></span><br> <input
				placeholder="한글로 입력해 주세요" class="w2-input w3-border w3-round"
				type="text" style="width: 80%;" pattern="[가-힣]+" name="nick"
				id="nick" /><br />
		</p>

		<p>
			비밀번호<br> <input class="w2-input w3-border w3-round"
				type="password" style="width: 80%;" name="pass" /><br />
		</p>

		<p>
			E-mail&nbsp;<span id="emailMsg"></span><br> <input
				class="w2-input w3-border w3-round"
				placeholder="O@O.OO으로 입력해 주시기 바랍니다." type="text" style="width: 80%;"
				pattern="^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+"
				name="email" id="email" /><br />
		</p>

		<p>
			프로필&nbsp;<small>(등록 하고자 하는 사진을 선택바랍니다.)</small><br> <input
				class="w2-input w3-border w3-round" type="file" style="width: 80%;"
				name="profile" />
		</p>

		<button class="button button4" type="submit">등록</button>
	</form>
	<p></p>
	</div>
</div>
<p></p>	
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#jungbock').click(function() {
								$.ajax({
									type : 'POST',
									url : '/idcheck',
									data : {
										"id" : $('#id').val()
									},
									success : function(data) {
										if (data == null) {
											window.alert("사용 가능한 ID 입니다.");
										} else {
											window.alert("중복 ID 입니다.");
										}
									}
								}); //end ajax    
							}); //end on
							$('#id')
							.focus(
									function() {

										$('#checkMsg')
												.html(
														'<span style="color:red"><small>ID를 입력해 주십시오.</small></span>');
									});
					$('#id')
							.keyup(
									function() {
										console.log($(this).val());
										var id = $("#id").val();
										var result3 = /^[a-zA-Z]+$/.test($(
												this).val());
										console.log(result3);
										if (id == "") {
											$('#checkMsg')
													.html(
															'<span style="color:red"><small>ID를 입력해 주십시오.</small></span>');
										} else {
											if (result3) {

												$('#checkMsg')
														.html(
																'<span style="color:red"><small>ID 입력이 가능합니다.</small></span>');
											} else {
												$('#checkMsg')
														.html(
																'<span style="color:red"><small>ID 입력이 불가능합니다.</small></span>');
											}
										}

									}); //end on
							$('#nick')
									.focus(
											function() {

												$('#nickMsg')
														.html(
																'<span style="color:red"><small>닉네임을 입력해 주십시오.</small></span>');
											});
							$('#nick')
									.keyup(
											function() {
												console.log($(this).val());
												var nick = $("#nick").val();
												var result = /^[가-힣]+$/.test($(
														this).val());
												console.log(result);
												if (nick == "") {
													$('#nickMsg')
															.html(
																	'<span style="color:red"><small>닉네임을 입력해 주십시오.</small></span>');
												} else {
													if (result) {

														$('#nickMsg')
																.html(
																		'<span style="color:red"><small>닉네임 입력이 가능합니다.</small></span>');
													} else {
														$('#nickMsg')
																.html(
																		'<span style="color:red"><small>닉네임 입력이 불가능합니다.</small></span>');
													}
												}

											}); //end on	
							$('#email')
									.focus(
											function() {

												$('#emailMsg')
														.html(
																'<span style="color:red"><small>email을 입력해 주십시오.</small></span>');
											});
							$('#email')
									.keyup(
											function() {
												console.log($(this).val());
												var email = $("#email").val();
												var result2 = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
														.test($(this).val());
												console.log(result2);
												if (email == "") {
													$('#emailMsg')
															.html(
																	'<span style="color:red"><small>email을 입력해 주십시오.</small></span>');
												} else {
													if (result2) {

														$('#emailMsg')
																.html(
																		'<span style="color:red"><small>email 입력이 가능합니다.</small></span>');
													} else {
														$('#emailMsg')
																.html(
																		'<span style="color:red"><small>email 입력이 불가능합니다.</small></span>');
													}
												}
											}); //end on
						});
	</script>