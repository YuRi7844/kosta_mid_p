<%@page import="sugang.vo.Student"%>
<%@page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<style>
#studentinfo{
	text-align: right;
}
</style>
<meta charset="UTF-8">
<title>학생 조회</title>
</head>
<body>

<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>


<br>
<div class="stScroll">
<jsp:include page="/studentSearch.jsp"></jsp:include>
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

