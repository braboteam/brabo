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

#titleTr {
	height:160px;
}
.td1 {
	width: 500px;
	vertical-align:bottom;
}

.td2 {
	width:100px;
	vertical-align:bottom;
}

.photoBt {
	height:50px;
}

.imgBt {
	height:40px;
}


</style>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div align="center">
	<form class="w3-container  w3-light-white"
		action="${pageContext.request.contextPath }/recipe/input"
		method="post" enctype="multipart/form-data">
		<table >
			<tr>
				<td><h4>Recipe</h4></td>
			</tr>
			<tr>
				<td><p>나만의 레시피를 공유하세요.</p></td>
			</tr>


			<tr id="titleTr">
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
						<div id="ipreview">
							<img src="/photoAdd.png" class="photoBt" id="ipbt">
						</div>
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
							<option value="밑반찬">밑반찬</option>
							<option value="메인반찬">메인반찬</option>
							<option value="국/탕">국/탕</option>
							<option value="찌개">찌개</option>
							<option value="디저트">디저트</option>
							<option value="면/만두">면/만두</option>
							<option value="밥/죽/떡">밥/죽/떡</option>
							<option value="퓨전음식">퓨전음식</option>
							<option value="김치/젓갈/장류">김치/젓갈/장류</option>
							<option value="양념/소스/잼">양념/소스/잼</option>
							<option value="양식">양식</option>
							<option value="샐러드">샐러드</option>
							<option value="스프">스프</option>
							<option value="빵">빵</option>
							<option value="과자">과자</option>
							<option value="차/음료/술">차/음료/술</option>
							<option value="기타">기타</option>
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
					<img src="/plus.png" class="imgBt" id="plus">
					<img src="/minus.png" class="imgBt" id="minus">
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
						placeholder="밀가루를 반죽합니다."></textarea> 
					
				</td>
				<td class="td2">
					<input type="hidden"
					name="step" value="1" /> <input type="file" name="dphoto"
					id="photo1" class="photos" />
					<div id="preview1">
						<img src="/photoAdd.png" class="photoBt" id="pbt1">
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
				</td>
			</tr>
		</table>
		<div id="details"></div>
		<div>
			<img src="/plus.png" id="detailP" class="imgBt"><img src="/minus.png" id="detailM" class="imgBt">
		</div>
		
		<table>
			<tr>
				<td class="td1">
					<div>
						<b>완성된 사진</b><br/>
						<small class="info">완성된 요리 사진을 첨부해주세요!</small>
						<input type="file" id="fphoto" name="fphoto" class="photos" multiple />
						<p id="finalView">
						<img src="/photoAdd.png" class="photoBt" id="finalBt">
						</p>
					</div>	
				</td>
				<td class="td2">
					
				</td>
			</tr>
		</table>
	
		<p align="center">
			<button class="w3-button w3-white w3-border w3-round-large"
				type="submit" style="width: 300px">레시피등록</button>
		</p>
	</form>
</div>	


	<script>
		var i = 1;
		// 재료기입 추가 
		$("#plus").click(function(){
			var out = "<p id=\"item\"><input class=\"w2-input w3-border w3-round-large\" name=\"item\" type=\"text\" >";
				out += " <input class=\"w2-input w3-border w3-round-large\" name=\"item\" type=\"text\" ></p>"
			$("#items").append(out);
		});

		// 재료기입 삭제
		$("#minus").click(function() {
			$("#item").remove();
		});

		// 요리순서 기입칸 추가
		$("#detailP").click(function() {
			i++;
			var out = "<table id=\"detail"+i+"\"><tr><td class=\"td1\"><div>Step#"+ i + "</div>";
				out += "<textarea class=\"w3-textarea w3-border w3-round-large\" name=\"recipe\" rows=\"10\" cols=\"50\" style=\"resize:none;\"></textarea>";
				out += "<input type=\"hidden\" name=\"step\" value=\""+i+"\" /></td>";
				out += "<td class=\"td2\"><input type=\"file\" name=\"dphoto\" id=\"photo"+i+"\" class=\"photos\"/>";
				out += "<div id=\"preview"+i+"\" ><img src=\"/photoAdd.png\" class=\"photoBt\" id=\"pbt"+i+"\"></div></td></tr><table>";
				
				
			$("#details").append(out);

			// 추가된 폼에 대한 사진추가 & 미리보기 스크립트
			$("#pbt" + i).click(function() {
				//console.log($(this).attr('id'));
				// console.log("#pbt" + i);
				$(this).parent().prev().click();
			});
			$("#photo" + i).change(function(){
				var target = $(this).next();
				console.log($(this).attr('id'));
				var files = this.files;
				
				$(target).html("");
				var reader = new FileReader();
				reader.readAsDataURL(files[0]);
				reader.onload = function() {
					$(target).html("<img src=\""+this.result+ "\" style=\"width:100px; height:100px;\"/>");
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
				$("#preview1").append("<img src=\""+this.result+ "\" style=\"width:100px; height:100px;\"/>");
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
		
		// 완성된 사진 추가
		$("#finalBt").click(function(){
			$("#fphoto").click();
		});
		
		// 완성된 사진 미리보기 
		$("#fphoto").change(function(){
			var files = this.files;
			$("#finalView").html("");
			for(var i =0; i< files.length; i++) {
				var reader = new FileReader();
				reader.readAsDataURL(files[i]);
				reader.onload = function() {
					$("#finalView").append("<img src=\""+this.result+ "\" style=\"width:70px; height:70px; margin:5px;\"/>");
				}
			}
		});
		
		
		
		
		
		
	</script>

</body>
</html>