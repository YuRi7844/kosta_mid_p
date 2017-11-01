<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<table border="1">
	<thead>
		<tr>
			<th>강좌 이름으로 조회</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
				<c:when test="${!empty requestScope.result }">
					<c:forEach items="${requestScope.result }" var="result">
						<tr>
							<td>${result }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>조회된 과목이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
	</tbody>
</table>
</body>
</html>