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
<form action="/sugang/findSubjectByCompletion" method="post">
	<div class="scroll">
		<select  name="completion">
			<option>전공필수</option>
			<option>전공선택</option>
			<option>교양필수</option>
			<option>교양선택</option>
		</select>
		<button type="submit">조회</button>
		<table class="table">
			<thead>
				<tr>
					<th class="th">이수구분으로 조회</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty requestScope.result }">
						<c:forEach items="${requestScope.result }" var="result">
							<tr>
								<td class="td">
									${result } <button class="loginbutton" type="submit">신청</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td">조회된 과목이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</form>
<form action="/sugang/getSubjectEnrollmentList">
	<div class="scroll">
		<table class="table">
			<thead>
				<tr>
					<th class="th">이수구분으로 조회</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty requestScope.list }">
						<c:forEach items="${requestScope.list }" var="result">
							<tr>
								<td class="td">
									${result } <button class="loginbutton" type="submit">신청</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td">조회된 과목이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	
	</div>
</form>
<jsp:include page="/WEB-INF/foot.jsp"></jsp:include>
</body>
</html>

