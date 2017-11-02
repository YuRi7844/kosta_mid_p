<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<thead>
		<tr>
			<th>강좌 번호로 조회</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<c:choose>
				<c:when test="${!empty requestScope.result }">
					<td>${requestScope.result }</td>
				</c:when>
				<c:otherwise>
					<td>조회된 과목이 없습니다.</td>
				</c:otherwise>
			</c:choose>
			
		</tr>
	</tbody>
	<a href="/sugang/enrollment/view.jsp">초기화면으로
</table>
</body>
</html>