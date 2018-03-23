<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.info {
	color: gray;
}

.photos {
	display: none;
}

.td1 {
	width: 600px;
}

.td2 {
	
}
</style>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


	<form class="w3-container  w3-light-white"
		action="${pageContext.request.contextPath }/recipe/input"
		method="post" enctype="multipart/form-data">
		<table class="w3-table">
			<tr>
				<td><h4>Recipe</h4></td>
			</tr>
			<tr>
				<td><p>나만의 레시피를 공유하세요.</p></td>
			</tr>


			<tr>
				<td class="td1">
					<p>
						<label><b>제목</b></label>
					</p>
					<div>
						<input class="w3-input w3-border w3-round-large" name="title"
							style="width: 470px" type="text" placeholder="페퍼로니 피자 만들기" />
					</div>
				</td>
				<td class="td2">
					<div>
						<input type="file" name="iphoto" id="iphoto" class="photos" />
						<div id="ipreview"></div>
						<button class="w3-button w3-white w3-border w3-round-large"
							id="ipbt" type="button">사진추가</button>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td1">
					<p>
						<label><b>요리 소개</b></label>
					</p>
					<div>
						<textarea class="w3-textarea w3-border w3-round-large" name="info"
							rows="5" cols="50" style="resize: none;"
							placeholder="이 레시피의 탄생 배경을 적어주세요!"></textarea>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="td1">
					<p>
						<b>요리 정보</b>
					</p>
					<div>
						종류 <select class="w2-select w2-border" name="cate">
							<option value="" disabled selected>종류선택</option>
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="양식">양식</option>
							<option value="퓨전음식">퓨전음식</option>
						</select> 인원 <select class="w1-select w1-border" name="portion">
							<option value="" disabled selected>인원선택</option>
							<option value="1">1인분</option>
							<option value="2">2인분</option>
							<option value="3">3인분</option>
							<option value="4">4인분</option>
							<option value="5">5인분</option>
							<option value="6">6인분 이상</option>
						</select> 시간 <select class="w1-select w1-border" name="time">
							<option value="" disabled selected>시간선택</option>
							<option value="5분이내">5분이내</option>
							<option value="10분이내">10분이내</option>
							<option value="15분이내">15분이내</option>
							<option value="30분이내">30분이내</option>
							<option value="60분이내">60분이내</option>
							<option value="90분이내">90분이내</option>
							<option value="2시간이내">2시간이내</option>
							<option value="2시간이상">2시간이상</option>
						</select>
					</div>
					<p>
						<label><b>재료</b></label><br /> <small class="info">재료가
							남거나 부족하지 않도록, 정확한 계량정보를 적어주세요.</small>
					</p> <input class="w2-input w3-border w3-round-large" name="item"
					type="text" placeholder="밀가루"> <input
					class="w2-input w3-border w3-round-large" name="item" type="text"
					placeholder="300g">
					<button class="w3-circle w3-gray" type="button" id="plus">+</button>
					<button class="w3-circle w3-black" type="button" id="minus">
						<span style="font-size: 15px">x</span>
					</button>
					<div id="items"></div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td class="td1">
					<p>
						<b>요리순서</b><br /> <small class="info"> 요리의 맛이 좌우될 수 있는
							중요한 부분은 빠짐없이 적어주세요.<br /> 예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.
						</small>
					</p>
					<div>
						Step#<span id="step">1</span>
					</div> <textarea class="w3-textarea w3-border w3-round-large"
						name="recipe" rows="10" cols="50" style="resize: none;"
						placeholder="밀가루를 반죽합니다."></textarea> <input type="hidden"
					name="step" value="1" /> <input type="file" name="dphoto"
					id="photo1" class="photos" />
					<button class="w3-button w3-white w3-border w3-round-large"
						id="pbt1" type="button">사진추가</button>
					<div id="details"></div>
				</td>
				<td class="td2">
					<div id="preview1"></div>
					<div id="previews"></div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<button class="w2-circle w2-black" type="button" id="detailP">+</button>
						<button class="w2-button w2-circle w2-black" type="button"
							id="detailM">-</button>
					</div>
				</td>
			</tr>
		</table>

		<div align="center">
			<button class="w3-button w3-white w3-border w3-round-large"
				type="submit" style="width: 300px">레시피등록</button>
		</div>
	</form>



	<script>
		var i = 1;
		// 재료기입 추가 
		$("#plus").click(function(){
			var out = "<div id=\"item\"><input class=\"w2-input w3-border w3-round-large\" name=\"item\" type=\"text\" >";
				out += " <input class=\"w2-input w3-border w3-round-large\" name=\"item\" type=\"text\" ></div>"
			$("#items").append(out);
		});

		// 재료기입 삭제
		$("#minus").click(function() {
			$("#item").remove();
		});

		// 요리순서 기입칸 추가
		$("#detailP").click(function() {
			i++;
			var out = "<div id=\"detail"+i+"\" class=\"recipe\"><div>Step#"+ i + "</div> ";
				out += "<textarea class=\"w3-textarea w3-border w3-round-large\" name=\"recipe\" rows=\"10\" cols=\"50\" style=\"resize:none;\"></textarea>";
				out += "<input type=\"hidden\" name=\"step\" value=\""+i+"\" />";
				out += "<input type=\"file\" name=\"dphoto\" id=\"photo"+i+"\" class=\"photos\"/> <span id=\"preview"+i+"\"></span>";
				out += "<button class=\"w3-button w3-white w3-border w3-round-large\" id=\"pbt"+i+"\" type=\"button\">사진추가</button></div>";

			$("#details").append(out);

		// 추가된 폼에 대한 사진추가 & 미리보기 스크립트
			$("#pbt" + i).click(function() {
				$("#photo" + i).click();
			});
			$("#photo" + i).change(function(){
				var files = this.files;
				$("#preview" + i).html("");
				for (var idx = 0; idx < files.length; idx++) {
					var reader = new FileReader();
						reader.readAsDataURL(files[idx]);
						reader.onload = function() {
					$("#preview" + i).append("<img src=\""+this.result+ "\" style=\"width:70px; height:70px; margin:5px;\"/>");
					}
				}
			});
		});

		// 요리순서 기입칸 삭제
		$("#detailM").click(function() {
			$("#detail" + i).remove();
			i--;
		});

		// 요리 사진추가
		$("#pbt1").click(function() {
			$("#photo1").click();
		});

		// 요리 사진 미리보기
		$("#photo1").change(function(){ 
			var files = this.files;
			$("#preview1").html("");
			for (var i = 0; i < files.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(files[i]);
				reader.onload = function() {
				$("#preview1").append("<img src=\""+this.result+ "\" style=\"width:70px; height:70px; margin:5px;\"/>");
				}
			}
		});

		// 대표 사진 추가
		$("#ipbt").click(function() {
			$("#iphoto").click();
		});

		// 대표 사진 미리보기 
		$("#iphoto").change(function() {
			var files = this.files;
			$("#ipreview").html("");
			var reader = new FileReader();
			reader.readAsDataURL(files[0]);
			reader.onload = function() {
			$("#ipreview").append("<img src=\""+this.result+ "\" style=\"width:70px; height:70px; margin:5px;\"/>");
			}
		});
	</script>

</body>
</html>