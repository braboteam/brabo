<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.info {
		color:gray;
	}
</style>
<body>
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<form class="w3-container  w3-light-white"
	action="${pageContext.request.contextPath }/recipe/input" method="post" enctype="multipart/form-data">
  <h4>Recipe</h4>
  <p>나만의 레시피를 공유하세요.</p>

  <p><label><b>제목</b></label></p>
  <div>
  	<input class="w3-input w3-border w3-round-large" name="title" type="text"
  	placeholder="페퍼로니 피자 만들기">
   </div>  
   
  <p><b>요리 정보</b></p>
  <div>
	  종류
	  <select class="w2-select w2-border" name="cate">
	    <option value="" disabled selected>종류선택</option>
	    <option value="1">한식</option>
	    <option value="2">중식</option>
	    <option value="3">일식</option>
	  </select>   
   
	  인원
	  <select class="w1-select w1-border" name="portion">
	    <option value="" disabled selected>인원선택</option>
	    <option value="1">1인분</option>
	    <option value="2">2인분</option>
	    <option value="3">3인분</option>
	    <option value="4">4인분</option>
	    <option value="5">5인분</option>
	    <option value="6">6인분 이상</option>
	  </select>     
	  시간 
	  <select class="w1-select w1-border" name="time">
	    <option value="" disabled selected>시간선택</option>
	    <option value="1">5분이내</option>
	    <option value="2">10분이내 </option>
	    <option value="3">15분이내</option>
	    <option value="4">30분이내 </option>
	    <option value="5">60분이내</option>
	    <option value="6">90분이내</option>
	    <option value="7">2시간이내</option>
	    <option value="8">2시간이상</option>
	  </select>
  </div>
   <p>
	  <label><b>재료</b></label><br/>
	  <small class="info">재료가 남거나 부족하지 않도록, 정확한 계량정보를 적어주세요.</small>
  </p>
  <input class="w2-input w3-border w3-round-large" name="item" type="text"
  	placeholder="밀가루">
  	 <input class="w2-input w3-border w3-round-large" name="item" type="text"
  	placeholder="300g">
  	<button class="w3-circle w3-gray" type="button" id="plus">+</button>
  	<button class="w3-circle w3-black" type="button" id="minus"><span style="font-size:15px">x</span></button>
  	<div id="items"></div>
  	
  	<p>
		<b>요리순서</b><br/>
		<small class="info">
			요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.<br/>
			예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.
		</small>
  	</p>
  	<div>
	  	<div style="float:left;">Step#<span id="step">1</span></div>
	  	<input type="hidden" name="step" value="1" /> 
	  	<textarea class="w3-textarea w3-border w3-round-large" name="recipe" rows="10" cols="50" style="resize:none;" 
	  		placeholder="밀가루를 반죽합니다."></textarea>
	  	<input type="file" name="dphoto" id="photo" multiple  hidden=""/>	
	  	<span id="preview"></span>
	  	<button class="w3-button w3-white w3-border w3-round-large pbt" type="button">사진추가</button>
	  	</div>
	  	<div id="details"></div>
	  	<div>
		  	<button class="w2-circle w2-black" type="button" id="detailP">+</button>
		  	<button class="w2-button w2-circle w2-black" type="button" id="detailM"> - </button>
  		</div>
  		
  	<div align="center">
  		<div style="width:300px">
  		<button class="w3-button w3-white w3-border w3-round-large" type="submit" style="width:300px">레시피등록</button>
  		</div>
  	</div>	
</form>

<script>
	var i= 1;
	// 재료기입 추가 
	$("#plus").click(function(){
		var out = "<div id=\"item\"><input class=\"w2-input w3-border w3-round-large\" name=\"item\" type=\"text\" >";
			out +=" <input class=\"w2-input w3-border w3-round-large\" name=\"item\" type=\"text\" ></div>"
		$("#items").append(out);
	});
	
	// 재료기입 삭제
	$("#minus").click(function(){
		$("#item").remove();
	});
	
	// 요리순서 기입칸 추가
	$("#detailP").click(function(){
		i ++;
		var out = "<div id=\"detail\"><div style=\"float:left;\">Step#"+i+"</div> ";
			out += "<input type=\"hidden\" name=\"step\" value=\""+i+"\" />";
			out += "<textarea class=\"w3-textarea w3-border w3-round-large\" name=\"recipe\" rows=\"10\" cols=\"50\" style=\"resize:none;\"></textarea>";
			out += "<input type=\"file\" name=\"dphoto\" id=\"photo\" multiple hidden=\"\"/>  <button class=\"w3-button w3-white w3-border w3-round-large pbt\" type=\"button\">사진추가</button></div>";
			out += "<span id=\"preview\"></span>";		
		$("#details").append(out);
		
		$(".pbt").click(function(){
			$("#photo").click();
		});
		
	});
		
	
	// 요리순서 기입칸 삭제
	$("#detailM").click(function(){
		$("#detail").remove();
		i--;
	});
	
	// 사진추가
	$(".pbt").click(function(){
		$("#photo").click();
	});
	
	// 미리보기
	$("#photo").change(function(){
		var files = this.files;
		$("#preview").html("");
		for(var i =0; i<files.length; i++) {
			var reader = new FileReader();
			reader.readAsDataURL(files[i]);
			reader.onload = function(){
				$("#preview").append("<img src=\""+this.result+ "\" style=\"width:70px; height:70px; margin:5px;\"/>");
			}
		}
	});
		
	
	
	


</script>

</body>
</html>