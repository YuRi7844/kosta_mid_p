<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table
		style="border-collapse:collapse;" align="center" border="1">
		<thead>
			<tr>
				<td>학생 정보</td>
			</tr>
			
			
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty requestScope.result }">
					<c:forEach var="result" items="${requestScope.result }">
						<tr>
							<td>${result }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>조회할 학생이 없습니다.</td>
					</tr>
				</c:otherwise>


			</c:choose>
		</tbody>

	</table>



</body>
</html>
