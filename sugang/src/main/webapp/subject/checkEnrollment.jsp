<%@page import="sugang.vo.Subject"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/sugang/css/framestyle_subject.css">
<meta charset="UTF-8">
<title>수강신청</title>
<jsp:include page="/subject/popup.jsp" />
</head>
<body>
	<div class="poptitle">
		<c:choose>
			<c:when test="${sessionScope.message == null}"> 
				<% session.removeAttribute("message"); %>
					수강신청 완료!<br>
			</c:when>
			<c:otherwise>
					${sessionScope.message}<br>
					<% session.removeAttribute("message"); %>
			</c:otherwise>
		</c:choose>
		<button class="popbutton" onclick="Ev_onbeforeunload();">닫기</button>
	</div>
</body>
</html>