<%@page import="sugang.vo.Student"%>
<%@page import="java.util.List" %>
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
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>

<form action="/sugang/findStudent" method="post">
	<div class="scroll">
	<div class="find">
		<h4>학생 전체 조회 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">조회</button></h4>
		&nbsp;
		
	</div>
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
						<%-- <c:forEach items="${requestScope.subAllList }" var="result"> --%>
						<%
								List<Student> list = (List<Student>)request.getAttribute("result");
								for(int i = 0; i < list.size(); i++){
						%>
							<tr class="tr">
								<%-- <td class="td">
									${result } <button class="loginbutton" type="submit">신청</button>
								</td> --%>
								
								<td class="td">
									<%=list.get(i).getStudentId() %>
								</td>		
								<td class="td">
									<%=list.get(i).getStudentName() %>
								</td>
								<td class="td">
									<%=list.get(i).getMajor() %>
								</td>
								<td class="td">
									<%=list.get(i).getGrade() %>
								</td>
								<td class="td">
									<%=list.get(i).getMaxCredit() %>
								</td>
							</tr>
							<%} %>
						<%-- </c:forEach> --%>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td">학생이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</form>

</body>
</html>

