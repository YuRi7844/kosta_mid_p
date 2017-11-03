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
	<form action="/sugang/getSubjectList">
		<div class="find">
			<h5>
				강좌 전체 조회 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit">조회</button>
			</h5>
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
					<c:when test="${!empty requestScope.subAllList }">
						<%
							List<Subject> subList = (List<Subject>) request.getAttribute("subAllList");
									for (int i = 0; i < subList.size(); i++) {
						%>
						<tr>
							<td class="td"><%=subList.get(i).getSubjectId()%></td>
							<td class="td"><%=subList.get(i).getSubjectName()%></td>
							<td class="td"><%=subList.get(i).getSubjectCredit()%></td>
							<td class="td"><%=subList.get(i).getCompletion()%></td>
							<td class="td"><%=subList.get(i).getMaxStudent()%></td>
							<td class="td"><%=subList.get(i).getDay()%></td>
							<td class="td"><%=subList.get(i).getSubjectTime()%></td>
							<td>
								<form action="/sugang/getSubjectList" method="post">
									<input type="hidden" name="addSubjectId"
										value="<%=subList.get(i).getSubjectId()%>">
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

