<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="">
		<thead>
			<tr>
				<th>강좌 번호로 조회</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.result }" var="result">
				<tr>
					<td>${result }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>