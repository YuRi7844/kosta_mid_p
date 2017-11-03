<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>학생 조회</title>
</head>
<body>

<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>

<section>
<div class="leftside">
<p>
<h2>학생 정보 조회</h2>
</p>
<p>
<b>전체 학생</b>
		<form action="/sugang/findStudent" method="POST">
		<button type="submit">전체 학생 조회</button>
		</form>
</p>
<p>
<b>학번 조회</b>
<br>
		<form action="/sugang/findStudentById" method="post">
			<input type="number" name="studentId"/>
			<button type="submit">학번 조회</button>
			</form>
</p>
<p>
<b>이름 조회</b>
		<br>
		<form action="/sugang/findStudentByName" method="POST">
			<input type="text" name="studentName"/>
			<button type="submit">학생 이름 조회</button>
		</p>
</div>
</section>


</body>
</html>



