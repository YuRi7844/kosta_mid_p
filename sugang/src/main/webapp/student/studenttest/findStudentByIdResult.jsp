<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>학번으로 조회</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<c:choose>
				<c:when test="${!empty requestScope.result }">
					<td>${requestScope.result }</td>
				</c:when>
				<c:otherwise>
					<td>없는 학번 입니다.</td>
				</c:otherwise>
			</c:choose>
			
		</tr>
	</tbody>
</table>
</body>
</html>