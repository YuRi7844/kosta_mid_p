<%@page import="sugang.vo.Subject"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
	<jsp:include page="/WEB-INF/sugangtop.jsp" />
	<form action="/sugang/getSubjectList">
		<div class="scroll">
			<h5>
				수강신청 완료 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit">확인</button>
			</h5>
		</div>
	</form>
</body>
</html>