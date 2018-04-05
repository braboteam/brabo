<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body {
	background-color:white;
	font-family: "Raleway", sans-serif;
}

.c {
	margin-top:30px;
	margin-bottom:30px;
}
.card {
	background-color:white;
	width: 800px;
}
.iphoto {
	margin-top:70px;
	height:300px;
	border-radius:2%;
}

.infoTd {
	text-align: center;
}

#scrap {
	width:75px;
}

#chat {
	width:75px;
}

#sbt {
	display: none;
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
	width:350px;
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
	width: 550px;
    border-collapse: collapse;
}
.reTd1 {
	border-bottom: 1px solid silver;
    padding: 10px;
}
.reTd2{
	width:450px;
}

.avatar {
	width:70px;
	height:70px;
	border-radius:100%
}

.link {
	text-decoration:none;
	color:gray;
}

.no {
	display:none;
}

#reInfo {
	margin-top:30px;
}

#reInputTable{
	border-spacing: 5px;
	border-collapse: separate;
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

/* 댓글 더보기 버튼 스타일 설정  */
.btn {
  border: 2px solid black;
  border-radius: 5px;
  background-color: white;
  color: black;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
}
.default {
  border-color: #e7e7e7;
  color: black;
}

.default:hover {
  background: #e7e7e7;
}


</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<div align="center">
		<div class="w3-container">
		
			<div class="w3-card card">
				<div class="c">
					<p>
						<img src="${pageContext.request.contextPath }/iphoto/${profile.ID}/${info.IPHOTO}" class="iphoto"> 
					</p>
					<div>
						<h3>${info.TITLE }</h3>
					<a href="${pageContext.request.contextPath }/followinfo?id=${info.ID}" class="link">
					<img src="${pageContext.request.contextPath}${profile.PROFILE}" class="avatar"></a>
			
					<p style="margin-top:5px;">by ${profile.NICK } (${profile.ID })</p>
					</div>
					<p class="info infoMent">
						❝ <br/>
						${info.INFO }
					</p>
					<p class="info"></p>
					<table class="info infoTable">
						<tr>
							<td class="infoTd">${info.CATE }</td>  <td class="infoTd">${info.PORTION }인분</td>  <td class="infoTd">${info.TIME }</td>
						</tr>
					</table>	
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>
											<a href="#" data-toggle="scrapTip" title="스크랩 하기"> 
											<img src="/clip.png" id="scrap"></a>
										</td>
									</tr>
									<tr><td class="infoTd info">${fn:length(scrap) }</td></tr>
								</table>	
								
							</td>
							<td>
								<table>
									<tr>
										<td>
											<a href="#" data-toggle="chatTip" title="댓글 갯수">
											<img src="/chat.png" id="chat"></a>
										</td>
									</tr>
									<tr><td class="infoTd info">${fn:length(reply) }</td></tr>
								</table>		
							</td>
						</tr>
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
									<c:if test="${i.DPHOTO }!= null">
										<td><img src="${pageContext.request.contextPath }/dphoto/${info.ID}/${i.DPHOTO}" class="dphoto"></td>
									</c:if>
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
						<c:forEach var="i" items="${fphoto }">
							<div class="mySlides fade">
							  <img src="${pageContext.request.contextPath }/fphoto/${info.ID}/${i.FPHOTO}" class="fphoto">
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
				<div style="width:550px;">
					<table class="w3-table"  style="text-align:left">
						<tr>
							<td>
								댓글 <span class="info">${fn:length(reply)}</span> &nbsp;
								평점 <span class="info"><fmt:formatNumber pattern="0.00" value="${rate.AVG }" /></span>
							</td>
						</tr>
					</table>
				</div>
				<div id="replyShow">	
				<table class="reTable">
					<c:forEach var="i" items="${reply }" varStatus="var">
						<c:choose>
							<c:when test="${var.count <4 }">
							<tr>
								<td class="reTd1"><img src="${pageContext.request.contextPath }${i.PROFILE}" class="avatar"></td>
								<td class="reTd1 reTd2">
									<table>
										<tr><td><b>${i.NICK }</b> <small class="info">수정  
											<a href="${pageContext.request.contextPath }/recipe/replyDel?rno=${i.NO}" class="link">삭제</a>
											&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${i.REDATE }"/></small></td></tr>
										<tr><td>${i.CONTENT } </td></tr>
									</table>
								</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr style="display:none;" class="more">
								<td class="reTd1"><img src="${pageContext.request.contextPath }${i.PROFILE}" class="avatar"></td>
								<td class="reTd1 reTd2">
									<table>
										<tr><td><b>${i.NICK }</b> <small class="info">수정  
										<a href="${pageContext.request.contextPath }/recipe/replyDel?rno=${i.NO}" class="link">삭제</a>
										&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${i.REDATE }"/></small></td></tr>
										<tr><td>${i.CONTENT } </td></tr>
									</table>
								</td>
							</tr>	
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				<c:if test="${fn:length(reply) > 3 }">
					<p style="margin-top:10px;"><button class="w3-button w3-white w3-border w3-round-large" id="showMore">more</button></p>
					<script>
						$("#showMore").click(function(){
							$(".more").toggle();
						});
					</script>
				</c:if>
				</div>
			
					</div>
					<form>
						<div style="width:550px;">
							<p style="text-align:left;">
								평점선택  &nbsp;  
								<c:forEach var="i" begin="1" end="5">
									${i }<input type="radio" name="rate" class="rate" value="${i }"/>
		 						</c:forEach>
	 						</p>
 						</div>
 						<table id="reInputTable">
 							<tr>
	 							<td>
									<textarea class="w3-textarea w3-border w3-round-large" name="content"
										rows="5" cols="50" style="resize: none;"  id="re"
										placeholder="요리의 후기나 궁금하신 점을 댓글로 남겨주세요!"></textarea>
								</td>
								<td style="vertical-align:top;">
									<button class="w3-button w3-white w3-border w3-round-large" id="rbt"
										type="button" style="width: 115px; height:100px; margin-top:5px;">등록</button> 
								</td>
							</tr>
						</table>
					</form>
				
				</div>
			</div>
			
		</div>
	
	<script>
			
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
				if(obj.rst == "yy") {
					window.alert("댓글이 등록되었습니다.");
					replyGet();
					// location.href= "${pageContext.request.contextPath}/recipe/list/"+${info.NO};
				} else {
					if(obj.rst == "login") {
						window.alert("로그인 후 사용해주세요.");
					} else if(obj.rst == "rate") {
						window.alert("평점을 입력해주세요.");	
					} else {
						window.alert("내용을 입력해주세요.");
					}
				}	
			});
			$("#re").html("");
		});
	
		// 댓글 갱신 ajax - 3개 초과 시, 더보기 출력 
		function replyGet() {
			var ino = ${info.NO}
			$.get("${pageContext.request.contextPath}/recipe/replyGet",{
				"ino":ino
			},function(obj){
				var out = "";
				for(var i=0; i<obj.length-2; i++) {
					if(i < 3) {
						out += "<table class=\"reTable\"><tr><td class=\"reTd1\"><img src=\"${pageContext.request.contextPath }"+obj[i].PROFILE+"\" class=\"avatar\"></td>";
						out += "<td class=\"reTd1 reTd2\"><table><tr><td><b>"+obj[i].NICK+"</b>  <small class=\"info\">수정  ";
						out += "<a href=\"${pageContext.request.contextPath }/recipe/replyDel?rno="+obj[i].NO+"\" class=\"link\">삭제</a>";
						out += ""+obj[i].REDATE+"</small></td></tr>";
						out += "<tr><td>"+obj[i].CONTENT+"</td></tr>";
						out += "</table></td></tr></table>";	
					} else {
						out += "<table class=\"reTable\"><tr style=\"display:none;\" class=\"more\">";
						out += "<td class=\"reTd1\"><img src=\"${pageContext.request.contextPath }"+obj[i].PROFILE+"\" class=\"avatar\"></td>";
						out += "<td class=\"reTd1 reTd2\"><table><tr><td><b>"+obj[i].NICK+"</b>  <small class=\"info\">수정 ";  
						out += "	<a href=\"${pageContext.request.contextPath }/recipe/replyDel?rno="+obj[i].NO+"\" class=\"link\">삭제</a>";
						out += ""+obj[i].REDATE+"</small></td></tr>";
						out += "<tr><td>"+obj[i].CONTENT+"</td></tr>";
						out += "</table></td></tr></table>";
					}				
				}
				if(obj.length > 5) {
					out += "<p style=\"margin-top:10px\"><button class=\"w3-button w3-white w3-border w3-round-large\" id=\"showMore\">more</button></p>";
				}					
				$("#replyShow").html(out);
				$("#showMore").click(function(){
					$(".more").toggle();
				});
			});
		};
		
		// 레시피 스크랩 ajax
		$("#scrap").click(function(){
			var no = ${info.NO}
			$.get("${pageContext.request.contextPath}/scrapGet/recipe",{
				"no":no
			},function(obj){
				if(obj.rst == "login") {
					window.alert("로그인 후 사용해주세요.");
				} else {
					if(obj.rst == "yy") {
						window.alert("스크랩 되었습니다.");
						// location.href = "${pageContext.request.contextPath}/recipe/list/"+${info.NO};
					} else if(obj.rst == "double") {
						window.alert("이미 스크랩 된 레시피입니다.");
					}
				}
			
			});	
		});
		
		
		
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
	