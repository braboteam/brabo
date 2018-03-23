<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
    


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.c {
	margin-top:30px;
}
.card {
	width: 800px;
}
.iphoto {
	width:300px;
	border-radius:2%;
}
.dphoto {
	width:100px;
	border-radius: 3%;
}
.info {
	color:gray;
}
.infoMent {
	font-style: italic; 
}
</style>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<div align="center">
		<div class="w3-container">
		
			<div class="w3-card card">
				<div class="c">
					<div>
						<h3>${info.TITLE }</h3>
						<small>by ${profile.NICK }</small>
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/iphoto/${profile.ID}/${info.IPHOTO}" class="iphoto dphoto"> 
					</div>
					<p class="info infoMent">
						${info.INFO }
					</p>
					<p class="info">
						${info.CATE }  ${info.PORTION }인분  ${info.TIME }
					</p>
					
				</div>
			</div>
			
			<div class="w3-card card">
				<div class="c">
					<div>
						<p>재료</p>
						<p>
							<c:forEach var="i" begin="0" end="${fn:length(info.ITEMS)-1 }">
								<c:if test="${i==0 || i%2==0}">
									${info.ITEMS[i] } ${info.ITEMS[i+1] }
								</c:if>
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
			
			<div class="w3-card card">
				<div class="c">
					<p>요리순서</p>
					<c:forEach var="i" items="${detail }">
						<p>
							${i.STEP }  ${i.RECIPE } <img src="${pageContext.request.contextPath }/dphoto/${info.ID}/${i.DPHOTO}" class="dphoto">
						</p>
					</c:forEach>
					
					
					
				</div>
			</div>
		</div>
	</div>
</body>
