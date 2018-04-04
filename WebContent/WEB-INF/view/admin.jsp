<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<style>
.title {
	align-items: center;
}
.grayInfo {
	color:gray;
}
.link {
	text-decoration: none;
	color:black;
}
#th {
	text-align: center;
	
}
.auth {

}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<div align="center" style="margin-top:50px; ">
		<div style="width:800px;">
			<div class="w3-container" >
			<h4 class="title">레시피 승인</h4>
			<small class="title grayInfo">승인할 레시피를 선택해주세요.</small>
				<table class="w3-table w3-bordered" style="margin-top:30px;">
					<tr id="th">
						<th>번호</th> <th>제목</th> <th>작성자</th> <th>승인여부</th> <th>권한변경</th>
					</tr>
					<c:forEach var="i" items="${recipe }">
						<tr>
							<td><span class="grayInfo">${i.NO }</span></td>
							<td>	<a href="${pageContext.request.contextPath}/recipe/list/${i.NO}" class="link">${i.TITLE }</a></td>
							<td>${i.ID }</td>
							<c:choose>
								<c:when test="${i.RIGHT ==0 }">
									<td><span class="grayInfo">N</span></td>
								</c:when>
								<c:otherwise>
									<td><span class="grayInfo">Y</span></td>
								</c:otherwise>
							</c:choose>
							<td>
								<button type="button" class="auth" >변경</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div>
			<div align="center">
				<ul class="pagination">
					<c:if test="${page != 1 }">
						<li><a href="${pageContext.request.contextPath }/admin/recipeAuth?p=${page-1}">prev</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${totalCnt }">
						<li><a href="${pageContext.request.contextPath }/admin/recipeAuth?p=${i}">${i }</a></li>
					</c:forEach>
					<c:if test="${page != totalCnt }">
	 					<li><a href="${pageContext.request.contextPath }/admin/recipeAuth?p=${page+1}">next</a></li>
	 				</c:if>
	 			</ul>	
 			</div>
		</div>
	
	</div>
	
	<script>
		
		// 레시피 권한 변경 ajax
		$(".auth").click(function(){
			var no = $(this).parent().parent().children().first().children().first().html();
			var auth = $(this).parent().prev().children().first().html();
			console.log(no);
			console.log(auth);
			var c = window.confirm("이 레시피의 권한을 변경하시겠습니까?");
			if(c == true) {
				$.post("${pageContext.request.contextPath}/admin/recipeAuth",{
					"no":no
				},function(obj){
					if(obj.rst == true) {
						window.alert("변경되었습니다.");
						location.href = "${pageContext.request.contextPath}/admin/recipeAuth?p=${page}";
					} else {
						window.alert("변경 과정에서 오류가 발생했습니다.");
						location.href = "${pageContext.request.contextPath}/admin/recipeAuth?p=${page}";
					}
				});
			} 
			
		});
		
	
	</script>
	