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
<body class="wrap">
	<div class="row_wrqp">
		<jsp:include page="/WEB-INF/sugangtop.jsp" />
	</div>
	<div class="row_container">
		<jsp:include page="/subject/subget_enrollment_list.jsp" />
		<form action="/sugang/findSubjectById">
			<div class="find" style="height: 25px">
				<strong>
					과목 코드별 조회
					<button>과목코드</button>
					<input type="number" name="subjectId" autofocus="autofocus"
						required="required" />
					<button type="submit">조회</button>
				</strong>
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
						<c:when test="${!empty requestScope.subId }">
							<%
								Subject subId = (Subject) request.getAttribute("subId");
							%>
							<tr>
								<td class="td"><%=subId.getSubjectId()%></td>
								<td class="td"><%=subId.getSubjectName()%></td>
								<td class="td"><%=subId.getSubjectCredit()%></td>
								<td class="td"><%=subId.getCompletion()%></td>
								<td class="td"><%=subId.getMaxStudent()%></td>
								<td class="td"><%=subId.getDay()%></td>
								<td class="td"><%=subId.getSubjectTime()%></td>
								<td>
									<form action="/sugang/findSubjectById" method="post">
										<input type="hidden" name="addSubjectId"
											value="<%=subId.getSubjectId()%>">
									</form>
									<button class="sugangbutton"
										onclick="getSubjectById(<%=subId.getSubjectId()%>)">신청</button>
								</td>
							</tr>
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
	</div>
</body>
<footer></footer>
</html>

