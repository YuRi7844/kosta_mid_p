<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<span style="color:red"><h1>${requestScope.errorMessage}</h1></span>
<form action="/sugang/updateStudent" method="POST">
	학번:<input type="number" name="studentId"><br>
	이름:<input type="text" name="studentName"><br>
	전공:<input type="text" name="major"><br>
	비밀번호:<input type="password" name="studentPw"><br>
	학년 :<input type="number" name="grade"><br>
	최대학점:<input type="number" name="maxCredit"><br>
	<button type="submit">등록</button>
</form>
</body>
</html>