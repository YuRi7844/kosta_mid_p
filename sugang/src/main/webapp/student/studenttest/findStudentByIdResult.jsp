<%@page import="sugang.vo.Student"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>학생 조회</title>
<script type="text/javascript">
function moveToRemove(id){
	var address = "/sugang/removeStudent?studentId="+id;
	location.reload();
	window.open(address, "newWin","width=600, height=400");
}
function moveToUpdate(id){
	var address = "/sugang/student/student_update_form.jsp?studentId="+id;
	window.open(address, "newWin", "width=600, height=400");
}
</script>
<style type="text/css">
#studentinfo{
	text-align: right;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>


	<br>
	<div class="stScroll">
		<jsp:include page="/studentSearch.jsp"></jsp:include>
		<table class="table">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>전공</th>
					<th>학년</th>
					<th>최대수강학점</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${! empty requestScope.result }">
						<tr class="tr2">
							<td class="td">${requestScope.result.studentId }</td>
							<td class="td">${requestScope.result.studentName }</td>
							<td class="td">${requestScope.result.major }</td>
							<td class="td">${requestScope.result.grade }
							<td class="td">${requestScope.result.maxCredit }</td>
							<td>
								<form action="/sugang/student/student_update_form.jsp"
									method="POST">
									<input type="hidden" name="studentId"
										value="${result.studentId }">
								</form>
								<button onclick="moveToUpdate(${result.studentId })">수정</button>
								<form action="/sugang/removeStudent" method="POST">
									<input type="hidden" name="studentId"
										value="${result.studentId }">
								</form>
								<button onclick="moveToRemove(${result.studentId })">삭제</button>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td" colspan="5">조회된 학생이 없습니다.</td>
						</tr>
					</c:otherwise>

				</c:choose>
			</tbody>
		</table>

	</div>
</body>
</html>
