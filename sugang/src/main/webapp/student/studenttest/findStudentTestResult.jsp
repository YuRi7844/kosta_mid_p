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
				<td>전체 학생 조회</td>
			</tr>
		</thead>
		<tbody>
			
				<c:forEach var="result" items="${requestScope.result }">
				<tr>
					<td>${result }</td>
				</tr>
				</c:forEach>
			
		</tbody>
	</table>
</body>
</html>