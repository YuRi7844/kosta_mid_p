<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(student).jsp"></jsp:include>

<form action="/sugang/getSubjectList" method="post">
	<div class="find">
		<h4>강좌 전체 조회 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">조회</button></h4>
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