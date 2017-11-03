<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
<jsp:include page="/WEB-INF/submenu(student).jsp"></jsp:include>

<form action="/sugang/getSubjectList" method="post">
	<div class="find" >
		<h4 style="margin-bottom: 0px;">강좌 전체 조회</h4><br>
		<button type="submit">조회</button>
	</div>
</form>
</body>
</html>