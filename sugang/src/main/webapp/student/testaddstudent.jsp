<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<span style="color:red"><h1>${sessionScope.errorMessage}</h1></span>
<form action="/sugang/addStudent" method="POST">
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