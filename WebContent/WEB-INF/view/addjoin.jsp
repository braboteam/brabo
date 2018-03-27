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
<title>회원정보 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function(){
        $("#id").blur(function(){
            $.ajax({
                type: 'post',
                url: '/idcheck',
                data: {
                    "id" : $('#id').val()
                },
                success: function(data){
                    if($.trim(data) == 0){
                        $('#checkMsg').html('<p style="color:red">ID 사용가능</p>');
                    }
                    else{
                        $('#checkMsg').html('<p style="color:red">ID 사용불가능</p>');
                    }
                }
            });    //end ajax    
        });    //end on    
    });
    </script>
</head>
<body>
	<form class="w3-container  w3-light-white" action="<%=request.getContextPath()%>join" autocomplete="off"
		method="post" enctype="multipart/form-data">
		<h3>회원정보 등록</h3>
	    <small>모든 정보는 필수 정보이며, 부적절한 데이터 설정 시 처리되지 않습니다.</small>
		<p>
			ID(*)<div id="checkMsg"></div>
	    <br><input class="w2-input w3-border w3-round" type="text"
				style="width: 30%;" pattern="[a-zA-Z]+" name="id" id="id"/><br />
		</p>
		<p>
			닉네임(*)<br> <input placeholder="한글로 입력해 주세요" class="w2-input w3-border w3-round" type="text" style="width: 30%;" pattern="[ㄱ-ㅎ가-힣]+" name="nick" /><br />
		</p>
		<p>
			비밀번호<br> <input class="w2-input w3-border w3-round" type="password" style="width: 30%;" name="pass" /><br />
		</p>
		<p>
			E-mail<br> <input class="w2-input w3-border w3-round" type="text" style="width: 30%;"
				pattern="^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+" name="email"/><br />
		</p>
		<p>
			프로필&nbsp;<small>(등록 하고자 하는 사진을 선택바랍니다.)</small><br> <input class="w2-input w3-border w3-round" type="file" style="width: 30%;"
				name="profile" />
		</p>
		<button class="button button4" type="submit">처리요청</button>
	</form>
	<p>
	</p>
