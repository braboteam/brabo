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
  	<input class="w3-input w3-border w3-round-large" name="last" type="text"
  	placeholder="페퍼로니 피자 만들기">
   </div>  
   
  <p><b>요리 정보</b></p>
  <div>
	  종류
	  <select class="w2-select w2-border" name="option">
	    <option value="" disabled selected>종류선택</option>
	    <option value="1">한식</option>
	    <option value="2">중식</option>
	    <option value="3">일식</option>
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
  	<div>
	  	<div style="float:left;">Step#<span id="step">1</span></div> 
	  	<textarea class="w3-textarea w3-border w3-round-large" name="last" rows="10" cols="50" style="resize:none;" 
	  		placeholder="밀가루를 반죽합니다."></textarea>
	  	<input type="file" name="photo" id="photo" multiple  hidden=""/>	
	  	<button type="button" id="pbt">사진추가</button>
	  	<button class="w2-button w2-circle w2-black" type="button" id="detailP">+</button>
	  	<button class="w2-button w2-circle w2-black" type="button" id="detailM">-</button>
	  	<div id="details"></div>
  	</div>
  	
</form>


<script>
	// 재료기입 추가 
	$("#plus").click(function(){
		var out = "<div id=\"item\"><input class=\"w2-input w3-border w3-round-large\" name=\"last\" type=\"text\" >";
			out +=" <input class=\"w2-input w3-border w3-round-large\" name=\"last\" type=\"text\" ></div>"
		$("#items").append(out);
	});
	
	// 재료기입 삭제
	$("#minus").click(function(){
		$("#item").remove();
	});
	
	// 요리순서 기입칸 추가
	$("#detailP").click(function(){
		var step = 2;
		var out = "<div id=\"detail\"><div style=\"float:left;\">Step#"+step+"</div> ";
			out += "<textarea class=\"w3-textarea w3-border w3-round-large\" name=\"last\" rows=\"10\" cols=\"50\" style=\"resize:none;\"></textarea>";
			out += "<input type=\"file\" name=\"photo\" id=\"photo\" multiple  hidden=\"\" /><button type=\"button\" id=\"pbt\">사진추가</button></div>";
		$("#details").append(out);
	});
	
	// 요리순서 기입칸 삭제
	$("#detailM").click(function(){
		$("#detail").remove();
	})
	
	
	
	


</script>

</body>
</html>