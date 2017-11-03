<%@page import="sugang.vo.Subject"%>
<%@page import="java.util.List"%>
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
<jsp:include page="/WEB-INF/sugangtop.jsp"/>
<jsp:include page="/subject/subget_enrollment_list.jsp"/>
<form action="/sugang/findSubjectByDay">
	<div class="find">
		<h4>요일별 조회 : ${requestScope.day }요일 &ensp;
			<select  name="day">
				<option value="월">월요일</option>
				<option value="화">화요일</option>
				<option value="수">수요일</option>
				<option value="목">목요일</option>
				<option value="금">금요일</option>
			</select>
			<button type="submit">조회</button>
		</h4>
	</div>
</form>
<form action="/sugang/findSubjectByDay" method="post">
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
					<c:when test="${!empty requestScope.subDay }">
						<%
								List<Subject> subDay = (List<Subject>)request.getAttribute("subDay");
								for(int i = 0; i < subDay.size(); i++){
						%>
							<tr>
								<td class="td">
									<%=subDay.get(i).getSubjectId() %>
								</td>		
								<td class="td">
									<%=subDay.get(i).getSubjectName() %>
								</td>
								<td class="td">
									<%=subDay.get(i).getSubjectCredit() %>
								</td>
								<td class="td">
									<%=subDay.get(i).getCompletion() %>
								</td>
								<td class="td">
									<%=subDay.get(i).getMaxStudent() %>
								</td>
								<td class="td">
									<%=subDay.get(i).getDay() %>
								</td>
								<td class="td">
									<%=subDay.get(i).getSubjectTime() %>
								</td>
								<td >
									<input type="hidden" name="addSubjectId" value="<%=subDay.get(i).getSubjectId() %>">
									<button class="sugangbutton" type="submit">신청</button>
								</td>
							</tr>
							<%} %>
					</c:when>
					<c:otherwise>
						<tr>
							<td></td><td></td><td></td>
							<td >조회된 과목이 없습니다.</td>
							<td></td><td></td><td></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</form>
</body>
</html>

