<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${requestScope.errorMessage }
<form action="/sugang/removeStudent" method="POST">
지울 학생 아이디 입력해 :<input type="number" name="studentId">
<button type="submit">전송</button>
</form>
</body>
</html>