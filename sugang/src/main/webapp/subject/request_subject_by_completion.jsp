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
<jsp:include page="/WEB-INF/submenu(student).jsp"/>
<form action="/sugang/findSubjectByCompletion" method="post">
	<div class="find">
		<h2>이수구분으로 조회
		<select name="completion">
			<option>전공필수</option>
			<option>전공선택</option>
			<option>교양필수</option>
			<option>교양선택</option>
		</select>
	<button type="submit">조회</button>
	</h2>
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
