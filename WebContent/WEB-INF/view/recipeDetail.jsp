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
									<c:if test="${i.DPHOTO } != default">
										<td><img src="${pageContext.request.contextPath }/dphoto/${info.ID}/${i.DPHOTO}" class="dphoto"></td>
									</c:if>
							</tr>
						</c:forEach>
					</table>
					
					
				</div>
			</div>
			
			<div class="w3-card card">
				<div class="c">
					<div style="text-align:left">댓글 <span class="info">${fn:length(reply)} </span> 평점 
						<span class="info"><fmt:formatNumber pattern="0.00" value="${rate.AVG }" /></span></div><hr/>
					<div id="replyShow">
						<c:forEach var="i" items="${reply }">
							<div><img src="${pageContext.request.contextPath }${i.PROFILE}"  style="width:20%">  ${i.NICK }  ${i.CONTENT }  ${i.RATE } ${i.REDATE }</div>
						</c:forEach>
					</div>
					<form>
						<c:forEach var="i" begin="1" end="5">
							${i }<input type="radio" name="rate" class="rate" value="${i }"/>
 						</c:forEach>
 						<br/>
						<textarea class="w3-textarea w3-border w3-round-large" name="content"
							rows="5" cols="50" style="resize: none;"  id="re"
							placeholder="요리의 후기나 궁금하신 점을 댓글로 남겨주세요!"></textarea>

						<button class="w3-button w3-white w3-border w3-round-large" id="rbt"
							type="button" style="width: 100px; height:100px">등록</button>
					</form>
				
				</div>
			</div>
			
		</div>
	</div>
	
	<script>
		// 로그인 하지 않았을 경우 로그인으로 유도...
		//$("#re").click(function(){
			//if(${sessionScope.logon} != null) {
				
			//} else {
				//window.alert("로그인 후에 사용해주세요.");
			//}
		//});
		
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
					out += "<div>"+obj[i].WRITER + obj[i].CONTENT + obj[i].RATE + obj[i].AVG+"</div>";
				}
				$("#replyShow").html(out);
			});
		};
		
		
		
	</script>
</body>
