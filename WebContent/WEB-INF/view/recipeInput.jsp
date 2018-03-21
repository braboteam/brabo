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
	action="${pageContext.request.contextPath }/recipe/input" method="post">
  <h4>Recipe</h4>
  <p>나만의 레시피를 공유하세요.</p>

  <p><label><b>제목</b></label></p>
  <div>
  	<input class="w3-input w3-border w3-round-large" name="last" type="text"
  	placeholder="페퍼로니 피자 만들기">
   </div>  
   
  <p><b>요리 정보</b></p>
  <div>
	  종류
	  <select class="w2-select w2-border" name="option">
	    <option value="" disabled selected>종류선택</option>
	    <option value="1">Option 1</option>
	    <option value="2">Option 2</option>
	    <option value="3">Option 3</option>
	  </select>   
   
	  인원
	  <select class="w1-select w1-border" name="option">
	    <option value="" disabled selected>인원선택</option>
	    <option value="1">1인분</option>
	    <option value="2">2인분</option>
	    <option value="3">3인분</option>
	    <option value="4">4인분</option>
	    <option value="5">5인분</option>
	    <option value="6">6인분 이상</option>
	  </select>     
	  시간 
	  <select class="w1-select w1-border" name="option">
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
  <input class="w2-input w3-border w3-round-large" name="last" type="text"
  	placeholder="밀가루">
  	 <input class="w2-input w3-border w3-round-large" name="last" type="text"
  	placeholder="300g">
  	<button class="w2-button w2-circle w2-black" type="button" id="plus">+</button>
  	<button class="w2-button w2-circle w2-black" type="button" id="minus">-</button>
  	<div id="items"></div>
  	
  	<p>
		<b>요리순서</b><br/>
		<small class="info">
			요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.<br/>
			예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.
		</small>
  	</p>
  	<textarea class="w3-textarea w3-border w3-round-large" name="last" rows="10" cols="50" style="resize:none;" 
  		placeholder="밀가루를 반죽합니다."></textarea>
  	
</form>


<script>
	$("#plus").click(function(){
		var out = "<div id=\"item\"><input class=\"w2-input w3-border w3-round-large\" name=\"last\" type=\"text\" placeholder=\"밀가루\">";
			out +=" <input class=\"w2-input w3-border w3-round-large\" name=\"last\" type=\"text\" placeholder=\"300g\"></div>"
		$("#items").append(out);
	});
	
	$("#minus").click(function(){
		$("#item").remove();
	});
	
	
	


</script>

</body>
</html>