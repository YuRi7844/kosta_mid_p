<%@page import="sugang.vo.Subject"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
	<jsp:include page="/WEB-INF/sugangtop.jsp" />
	<jsp:include page="/subject/subget_enrollment_list.jsp" />
	<form action="/sugang/findSubjectByName">
		<div class="find">
			<h4>
				과목 이름별 조회
				<button>과목이름</button>
				<input type="text" name="subjectName" />
				<button type="submit">조회</button>
			</h4>
		</div>
	</form>
	<div class="scroll">
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
					<c:when test="${!empty requestScope.subName }">
						<%
							List<Subject> subName = (List<Subject>) request.getAttribute("subName");
									for (int i = 0; i < subName.size(); i++) {
						%>
						<tr>
							<td class="td"><%=subName.get(i).getSubjectId()%></td>
							<td class="td"><%=subName.get(i).getSubjectName()%></td>
							<td class="td"><%=subName.get(i).getSubjectCredit()%></td>
							<td class="td"><%=subName.get(i).getCompletion()%></td>
							<td class="td"><%=subName.get(i).getMaxStudent()%></td>
							<td class="td"><%=subName.get(i).getDay()%></td>
							<td class="td"><%=subName.get(i).getSubjectTime()%></td>
							<td>
								<form action="/sugang/findSubjectByName" method="post">
									<input type="hidden" name="addSubjectId"
										value="<%=subName.get(i).getSubjectId()%>">
									<button class="sugangbutton" type="submit">신청</button>
								</form>
							</td>
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
