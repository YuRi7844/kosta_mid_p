<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<meta charset="UTF-8">
<title>학생 조회</title>
</head>
<body>

<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<form action="/sugang/findStudentById" method="post">
	<div class="find">
		<h2>학번 조회</h2>
	<button type="submit" name="studentId">조회</button>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th class="th">이수구분으로 조회</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="true">
				<tr>
					<td style="text-align: center;class: td;">조회된 과목이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</form>



</body>
</html>