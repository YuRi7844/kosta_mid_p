<%@page import="sugang.vo.Subject"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="topscroll">
	<div class="find" style="height: 25px">
		<strong>현재 수강 강좌 보기</strong>
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
						<td>
							<form action="/sugang/removeEnrollmentbySubject" method="post">
								<input type="hidden" name="removeSubjectId"
									value="<%=enoList.get(i).getSubjectId()%>">
							</form>
							<button class="sugangbutton"
								onclick="removeEnrollment(<%=enoList.get(i).getSubjectId()%>)">삭제</button>
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
<p>
<hr>
