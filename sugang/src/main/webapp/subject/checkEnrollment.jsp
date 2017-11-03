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
	
	<form action="/sugang/getSubjectList" style="padding-top: 180px">
		<div class="find">
			<c:choose>
				<c:when test="${requestScope.message == null}"> 
					수강신청 완료!
			</c:when>
				<c:otherwise>
					${requestScope.message}
				</c:otherwise>
			</c:choose>
			
			<br><button type="submit">확인</button>
		</div>
	</form>
</body>
</html>