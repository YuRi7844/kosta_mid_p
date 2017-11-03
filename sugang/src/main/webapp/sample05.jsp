<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>

	<section>
			<p>
			<center><h2>학생 정보 조회</h2></center>
			</p>
			<p>
			<table style="border-collapse:collapse;" padding="10px;" align="center" >
				<tr>
				<th class="th2"><b>전체 학생</b></th>
				<th class="th2"><b>학번 조회</b></th>
				<th class="th2"><b>이름 조회</b></th>
				</tr>
				<tr>
			<th class="th2"><form action="/sugang/findStudent" method="POST">
				<button type="submit">전체 학생 조회</button>
			</form></th>
			<th class="th2"><form action="/sugang/findStudentById" method="post">
				<input type="number" name="studentId" />
				<button type="submit">학번 조회</button>
			</form>
			</th>
			<th class="th2">
			<form action="/sugang/findStudentByName" method="POST">
				<input type="text" name="studentName"/>
				<button type="submit">이름 조회</button>
				</p></form>
				</th>
				</tr>
				</table>
	</section>
	<p>
	<p>
	<p>
	
	
<section>
	<table
		style="border-collapse:collapse;" align="center" border="1">
		<thead>
			<tr>
				<td>학생 정보</td>
			</tr>
			
			
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty requestScope.result }">
					<c:forEach var="result" items="${requestScope.result }">
						<tr>
							<td>${result }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>조회할 학생이 없습니다.</td>
					</tr>
				</c:otherwise>


			</c:choose>
		</tbody>

	</table>
	</section>

<div class="footer">
<jsp:include page="/WEB-INF/foot.jsp"></jsp:include>
</body>
</html>
