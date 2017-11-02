<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>학생 조회</title>
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
			<table>
				<tr>
				<th><b>전체 학생</b></th>
				<th><b>학번 조회</b></th>
				<th><b>이름 조회</b></th>
				</tr>
				<tr>
			<th><form action="/sugang/findStudent" method="POST">
				<button type="submit">전체 학생 조회</button>
			</form></th>
			<th><form action="/sugang/findStudentById" method="post">
				<input type="number" name="studentId" />
				<button type="submit">학번 조회</button>
			</form>
			</th>
			<th>
			<form action="/sugang/findStudentByName" method="POST">
				<input type="text" name="studentName" />
				<button type="submit">이름 조회</button>
				</p></form>
				</th>
				</tr>
				</table>
	</section>

		<div class="footer">
			<jsp:include page="/WEB-INF/foot.jsp"></jsp:include>
		</div>
</body>
</html>


