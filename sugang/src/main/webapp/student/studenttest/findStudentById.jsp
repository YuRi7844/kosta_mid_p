<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>findStudentById</h2>
<form action="/sugang/findStudentById" method="post">
	<h2>학번으로 조회</h2>
	<input type="number" name="studentId"/>
	<button type="submit">조회</button>
</form>
</body>
</html>