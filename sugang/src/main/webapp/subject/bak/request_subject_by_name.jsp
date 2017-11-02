<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/sugang/findSubjectByName" method="post">
	<h2>강좌 이름으로 조회</h2>
	<input type="text" name="subjectName"/>
	<button type="submit">조회</button>
</form>
</body>
</html>