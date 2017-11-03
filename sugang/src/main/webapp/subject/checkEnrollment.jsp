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
<jsp:include page="/subject/popup.jsp" />
</head>
<body>
	<div class="title">
		<c:choose>
			<c:when test="${requestScope.message == null}"> 
					수강신청 완료!
			</c:when>
			<c:otherwise>
					${requestScope.message}
				</c:otherwise>
		</c:choose>
		<button onclick="Ev_onbeforeunload();">닫기</button>
	</div>
</body>
</html>