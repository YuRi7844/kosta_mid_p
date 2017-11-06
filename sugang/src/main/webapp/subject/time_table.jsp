<%@page import="sugang.vo.Subject"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/sugang/css/framestyle_subject.css">
<meta charset="UTF-8">
<title>수강신청</title>
<jsp:include page="/subject/popup.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/time_table_top.jsp" />
	<div class="timescroll">
		<form action="/sugang/getSubjectEnrollmentList" method="post">
			<div class="find">
				<strong>현재 수강 강좌 보기

					<button>조회</button>

				</strong>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th>과목코드</th>
					<th>과목이름</th>
					<th>학점수</th>
					<th>이수구분</th>
					<th>수강최대인원</th>
					<th>요일</th>
					<th>시간</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty requestScope.enoList }">
						<%
							List<Subject> enoList = (List<Subject>) request.getAttribute("enoList");
									for (int i = 0; i < enoList.size(); i++) {
						%>
						<tr>
							<td class="td"><%=enoList.get(i).getSubjectId()%></td>
							<td class="td"><%=enoList.get(i).getSubjectName()%></td>
							<td class="td"><%=enoList.get(i).getSubjectCredit()%></td>
							<td class="td"><%=enoList.get(i).getCompletion()%></td>
							<td class="td"><%=enoList.get(i).getMaxStudent()%></td>
							<td class="td"><%=enoList.get(i).getDay()%></td>
							<td class="td"><%=enoList.get(i).getSubjectTime()%></td>
						</tr>
						<%
							}
						%>
					</c:when>
					<c:otherwise>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>조회된 과목이 없습니다.</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>

