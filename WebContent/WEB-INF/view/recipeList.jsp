<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: white;
}

/* Center website */
.main {
	max-width: 1000px;
	margin: auto;
}

h1 {
	word-break: break-all;
}

.row {
	margin: 10px -16px;
}

/* Add padding BETWEEN each column */
.row, .row>.column {
	padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
	float: left;
	width: 33.33%;
	display: none; /* Hide all elements by default */
}

/* Clear floats after rows */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Content */
.content {
	background-color: white;
	padding: 10px;
}

/* The "show" class is added to the filtered elements */
.show {
	display: block;
}

/* Style the buttons */
.btn {
	border: none;
	outline: none;
	padding: 12px 16px;
	background-color: white;
	cursor: pointer;
}

.btn:hover {
	background-color: #ddd;
}

.btn.active {
	background-color: #666;
	color: white;
}

.link {
	text-decoration: none;
}

.gination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}
.pagination a.active {
    background-color: dodgerblue;
    color: white;
}
.pagination a:hover:not(.active) {background-color: #ddd;}

.nick {
	color:gray;
}
}
</style>

<div class="w3-container"   >
	<!-- MAIN (Center website) -->
	<form  class="example"	action="${pageContext.request.contextPath }/recipe/list" method="get"> 
		<div class="main">
		
			<div id="myBtnContainer">
				<table>
					<tr>
						<td>
							<button class="btn active" onclick="filterSelection('all')">
								Show all</button>
						</td>
						<td>		
							<button class="btn" id="rateBt" type="submit" name="r" value="rate">Show rated</button>
						</td>
						<td>		
							<a href="${pageContext.request.contextPath }/recipe/input">
							<button class="btn" id="rateBt" type="button" >Register recipe</button></a>
						</td>
						<td>	
							<input class="w3-input w3-border"  name="c" type="text" style="height:100%">
						</td>
				 </table>
			</div>
			<!-- Portfolio Gallery Grid -->
			<div class="row">
	
				<c:forEach var="i" items="${list }">
					<div class="column">
						<div class="content">
	
							<div class="w3-card">
								<div>
								<a href="${pageContext.request.contextPath }/recipe/list/${i.NO}"
									class="link"> <img src="${pageContext.request.contextPath }/iphoto/${i.ID}/${i.IPHOTO}"
									style="width: 100%"></a>
								</div>	
								<div class="container">
									<h4>
										<b>${i.TITLE }</b>
									</h4>
									<small class="nick">by ${i.ID }</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
	
				<!-- END GRID -->
			</div>
			<div class="w3-center">
				<div class="w3-bar">
				 <c:if test="${page != 1 }">
					<a href="${pageContext.request.contextPath }/recipe/list?p=${page-1}">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="1" end="${totalCnt }">
					<a href="${pageContext.request.contextPath }/recipe/list?p=${i}">${i }</a>
				</c:forEach>
				<c:if test="${page != totalCnt }">
  					<a href="${pageContext.request.contextPath }/recipe/list?p=${page+1}">&raquo;</a>
  				</c:if>	
				</div>
		
			<!-- END MAIN -->
		</div>
		</div>
	</form>
</div>	
	<script>
	
	
		filterSelection("all")
		function filterSelection(c) {
			var x, i;
			x = document.getElementsByClassName("column");
			if (c == "all")
				c = "";
			for (i = 0; i < x.length; i++) {
				w3RemoveClass(x[i], "show");
				if (x[i].className.indexOf(c) > -1)
					w3AddClass(x[i], "show");
			}
		}

		function w3AddClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				if (arr1.indexOf(arr2[i]) == -1) {
					element.className += " " + arr2[i];
				}
			}
		}

		function w3RemoveClass(element, name) {
			var i, arr1, arr2;
			arr1 = element.className.split(" ");
			arr2 = name.split(" ");
			for (i = 0; i < arr2.length; i++) {
				while (arr1.indexOf(arr2[i]) > -1) {
					arr1.splice(arr1.indexOf(arr2[i]), 1);
				}
			}
			element.className = arr1.join(" ");
		}

		// Add active class to the current button (highlight it)
		var btnContainer = document.getElementById("myBtnContainer");
		var btns = btnContainer.getElementsByClassName("btn");
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener("click", function() {
				var current = document.getElementsByClassName("active");
				current[0].className = current[0].className.replace(" active",
						"");
				this.className += " active";
			});
		}
	</script>



