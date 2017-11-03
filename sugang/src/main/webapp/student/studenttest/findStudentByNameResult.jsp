<%@page import="sugang.vo.Student"%>
<%@page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>학생 조회</title>
</head>
<body>

<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>
<jsp:include page="/studentSearch.jsp"></jsp:include>

<br>
<div class="scroll">
		<table class="table">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>전공</th>
					<th>학년</th>
					<th>최대수강학점</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty requestScope.result }">
						<c:forEach var="result" items="${requestScope.result }">
						<%
							List<Student> result = (List<Student>)request.getAttribute("result");
							for(int i =0; i < result.size(); i++)
							{ 
						%>
						
					<tr class="tr">
								<td class="td">
									<%=result.get(i).getStudentId() %>
								</td>
								<td class="td">
									<%=result.get(i).getStudentName() %>
								</td>
								<td class="td">
									<%=result.get(i).getMajor() %>
								</td>
								<td class="td">
									<%=result.get(i).getGrade() %>
								<td class="td">
									<%=result.get(i).getMaxCredit() %>
								</td>
							</tr>
							<%} %>
							</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td">조회된 학생이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		</div>
	


</body>
</html>