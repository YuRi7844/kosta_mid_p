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
<jsp:include page="/subject/popup.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/sugangtop.jsp" />
	<jsp:include page="/subject/subget_enrollment_list.jsp" />
	<form action="/sugang/findSubjectByCompletion">
		<div class="find">
			<h4>
				신청강좌 전체 조회 <select name="completion">
					<option>전공필수</option>
					<option>전공선택</option>
					<option>교양필수</option>
					<option>교양선택</option>
				</select>
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
					<c:when test="${!empty requestScope.subCompletion }">
						<%
							List<Subject> subCompletion = (List<Subject>) request.getAttribute("subCompletion");
									for (int i = 0; i < subCompletion.size(); i++) {
						%>
						<tr>
							<td class="td"><%=subCompletion.get(i).getSubjectId()%></td>
							<td class="td"><%=subCompletion.get(i).getSubjectName()%></td>
							<td class="td"><%=subCompletion.get(i).getSubjectCredit()%>
							</td>
							<td class="td"><%=subCompletion.get(i).getCompletion()%></td>
							<td class="td"><%=subCompletion.get(i).getMaxStudent()%></td>
							<td class="td"><%=subCompletion.get(i).getDay()%></td>
							<td class="td"><%=subCompletion.get(i).getSubjectTime()%></td>
							<td>
								<form action="/sugang/findSubjectByCompletion" method="post">
									<input type="hidden" name="addSubjectId"
										value="<%=subCompletion.get(i).getSubjectId()%>">
								</form>
								<button class="sugangbutton" onclick="getSubjectByCompletion(<%=subCompletion.get(i).getSubjectId()%>)">신청</button>
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

