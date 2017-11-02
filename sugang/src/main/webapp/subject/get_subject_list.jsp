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
<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<form action="/sugang/getSubjectList" method="post">
	<div class="scroll">
	<div class="find">
		<h4>강좌 전체 조회 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">조회</button></h4>
	</div>
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
						<%-- <c:forEach items="${requestScope.subAllList }" var="result"> --%>
						<%
								List<Subject> subList = (List<Subject>)request.getAttribute("subAllList");
								for(int i = 0; i < subList.size(); i++){
						%>
							<tr class="tr">
								<%-- <td class="td">
									${result } <button class="loginbutton" type="submit">신청</button>
								</td> --%>
								
								<td class="td">
									<%=subList.get(i).getSubjectId() %>
								</td>		
								<td class="td">
									<%=subList.get(i).getSubjectName() %>
								</td>
								<td class="td">
									<%=subList.get(i).getSubjectCredit() %>
								</td>
								<td class="td">
									<%=subList.get(i).getCompletion() %>
								</td>
								<td class="td">
									<%=subList.get(i).getMaxStudent() %>
								</td>
								<td class="td">
									<%=subList.get(i).getDay() %>
								</td>
								<td class="td">
									<%=subList.get(i).getSubjectTime() %>
								</td>
								<td >
									<button class="sugangbutton" type="submit">신청</button>
								</td>
							</tr>
							<%} %>
						<%-- </c:forEach> --%>
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
<form action="/sugang/">
	<div class="scroll">
		<div class="find">
			<h4>신청강좌 전체 조회</h4>
		</div>
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
								List<Subject> enoList = (List<Subject>)request.getAttribute("enoList");
								for(int i = 0; i < enoList.size(); i++){
						%>
							<tr>
								<td class="td">
									<%=enoList.get(i).getSubjectId() %>
								</td>
								<td class="td">
									<%=enoList.get(i).getSubjectName() %>
								</td>
								<td class="td">
									<%=enoList.get(i).getSubjectCredit() %>
								</td>
								<td class="td">
									<%=enoList.get(i).getCompletion() %>
								</td>
								<td class="td">
									<%=enoList.get(i).getMaxStudent() %>
								</td>
								<td class="td">
									<%=enoList.get(i).getDay() %>
								</td>
								<td class="td">
									<%=enoList.get(i).getSubjectTime() %>
								</td>
								<td >
									<button class="sugangbutton" type="submit">신청</button>
								</td>
							</tr>
						<%} %>
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

