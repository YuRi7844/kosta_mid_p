<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>enrollment 전체조회</h1>
	<form action="/sugang/findEnrollment">
		<input type="submit" value="enrollment전체조회">
	</form>

	<h1>Enrollment 학생 아이디로 조회</h1>
	<form action="/sugang/findEnrollmentByStudent" method="post">
		<input type="number" name="studentId">
		<button type="submit">조회</button>
	</form>
	
	<h1>Enrollment 강좌 코드 전체 수강인원 조회</h1>
	<form action="/sugang/findEnrollmentBySubjectCount" method="post">
		<input type="number" name="subjectId">
		<button type="submit">조회</button>
	</form>
	
	<h1>Enrollment 학생 아이디로 삭제</h1>
	<form action="/sugang/removeEnrollmentbyStudent" method="post">
		<input type="number" name="studentId">
		<button type="submit">삭제</button>
	</form>
	
		<h1>Enrollment 강좌 아이디로 삭제</h1>
	<form action="/sugang/removeEnrollmentbySubject" method="post">
		<input type="number" name="subjectId">
		<button type="submit">삭제</button>
	</form>

	<h1>Enrollment 등록</h1>
	<form action="/sugang/addEnrollment" method="post">
		<input type="number" name="studentId">
		<input type="number" name="subjectId">
		<button type="submit">등록</button>
	</form>

</body>
</html>