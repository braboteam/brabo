<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body {
	background-color:#f1f1f1;
}

.c {
	margin-top:30px;
}
.card {
	background-color:white;
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

.fphoto {
	height:200px;
	border-radius: 3%;
}
.info {
	color:gray;
}
.infoMent {
	font-style: italic; 
}
.infoTable {
	width:300px;
}
.itemsTable{
	width:300px;
}
.itemsTd2{
	text-align:right;
	color: gray;
}
.numberTd{
	width:30px;
}

.stepTable{
	width: 450px;
}

.recipeTd {
	width:300px;
}

.reTable {
	width: 400px;
}

.reTd2{
	width:300px;
}

.avatar {
	width:90%;
	border-radius:3%
}


/*슬라이드 쇼 스타일 설정 */
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}


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
					<a href="${pageContext.request.contextPath }/followinfo?id=?${info.ID}"><small>by ${profile.NICK }</small></a>
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/iphoto/${profile.ID}/${info.IPHOTO}" class="iphoto dphoto"> 
					</div>
					<p class="info infoMent">
						${info.INFO }
					</p>
					<p class="info"></p>
					<table class="w3-table info infoTable">
						<tr><td>${info.CATE }</td>  <td>${info.PORTION }인분</td>  <td>${info.TIME }</td></tr>
					</table>
					
				</div>
			</div>
			
			<div class="w3-card card">
				<div class="c">
					<div>
						<p>재료 <small class="info infoMent">ingredients</small></p>
						<table class="w3-table w3-bordered itemsTable">
							
							<c:forEach var="i" begin="0" end="${fn:length(info.ITEMS)-1 }">
								<c:if test="${i==0 || i%2==0}">
									<tr>
									<td>${info.ITEMS[i] }</td> <td class="itemsTd2">${info.ITEMS[i+1] }</td>	
									</tr>
								</c:if>
							</c:forEach>
							
						</table>
					</div>
				</div>
			</div>
			
			<div class="w3-card card">
				<div class="c">
					<p>요리 <small class="info infoMent">steps</small></p>
					<table class="w3-table stepTable" >
						<c:forEach var="i" items="${detail }">
							<tr>
								<td class="numberTd">${i.STEP }.</td>  <td class="recipeTd">${i.RECIPE }</td> 
									
									<td><img src="${pageContext.request.contextPath }/dphoto/${info.ID}/${i.DPHOTO}" class="dphoto"></td>
								
							</tr>
						</c:forEach>
					</table>
					
					
				</div>
			</div>
			
			<c:if test="${fn:length(fphoto) >0 }">
				<div class="w3-card card" >
					<div class="c">
					<p>완성된 사진 </p>
					
					<div class="slideshow-container">
						<c:forEach var="i" begin="0" end="${fn:length(fphoto) -1}">
							<div class="mySlides fade">
							  <img src="${pageContext.request.contextPath }/fphoto/${info.ID}/${fphoto[i].FPHOTO}" class="fphoto">
							</div>
						</c:forEach>	  
						<br/>
						
						<div style="text-align:center">
							<c:forEach var="i" begin="0" end="${fn:length(fphoto) }">	
						  		<span class="dot" onclick="currentSlide(${i})"></span> 
							</c:forEach>
						 </div>
					</div>
				
					</div>
				</div>	
			</c:if>
				
			
			<div class="w3-card card">
				<div class="c">
					<div style="text-align:left">댓글 <span class="info">${fn:length(reply)} </span> 평점 
						<span class="info"><fmt:formatNumber pattern="0.00" value="${rate.AVG }" /></span>
					</div><hr/>
				<div id="replyShow">	
				<table class="reTable">
					<c:forEach var="i" items="${reply }">
						<tr>
							<td><img src="${pageContext.request.contextPath }${i.PROFILE}" class="avatar"></td>
							<td class="reTd2">
								<table>
									<tr><td><small>수정  삭제</small></td></tr>
									<tr><td>${i.CONTENT } </td></tr>
								</table>
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			
					</div>
					<form>
						<c:forEach var="i" begin="1" end="5">
							${i }<input type="radio" name="rate" class="rate" value="${i }"/>
 						</c:forEach>
 						<br/>
 						<table>
 							<tr>
	 							<td>
									<textarea class="w3-textarea w3-border w3-round-large" name="content"
										rows="5" cols="50" style="resize: none;"  id="re"
										placeholder="요리의 후기나 궁금하신 점을 댓글로 남겨주세요!"></textarea>
								</td>
								<td>
									<button class="w3-button w3-white w3-border w3-round-large" id="rbt"
										type="button" style="width: 117px; height:117px">등록</button> 
								</td>
							</tr>
						</table>
					</form>
				
				</div>
			</div>
			
		</div>
	</div>
	
	<script>
		// 로그인 하지 않았을 경우 로그인으로 유도...
		
		
		// 댓글 등록 ajax
		$("#rbt").click(function(){
			var reply = $("#re").val();
			var ino = ${info.NO}
			var rate = $(".rate:checked").val();
			$.get("${pageContext.request.contextPath}/recipe/replyInput",{
				"content":reply,
				"ino":ino,
				"rate":rate
			},function(obj){
				if(obj.rst == true) {
					window.alert("성공");
					replyGet();
					
				} else {
					window.alert("실패");
				}
			});
		});
		
		// 댓글 갱신 ajax
		function replyGet() {
			var ino = ${info.NO}
			$.get("${pageContext.request.contextPath}/recipe/replyGet",{
				"ino":ino
			},function(obj){
				var out = "";
				for(var i=0; i<obj.length; i++) {
					out += "<table class=\"reTable\"><tr><td><img src=\"${pageContext.request.contextPath }"+obj[i].PROFILE+"\" class=\"avatar\"></td>";
					out += "<td class=\"reTd2\"><table><tr><td><small>수정  삭제</small></td></tr><tr><td>"+obj[i].CONTENT+"</td></tr>";
					out += "</table></td></tr></table>";
				}
				$("#replyShow").html(out);
			});
		};
		
		// 슬라이드 쇼 스크립트 설정  
		var slideIndex = 1;
		showSlides(slideIndex);
		
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		
		function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  if (n > slides.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";  
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";  
		  dots[slideIndex-1].className += " active";
		}
		
	</script>
</body>



