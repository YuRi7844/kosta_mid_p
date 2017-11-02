<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
		<div class="top">
			<p id="title">
				<strong>수강신청</strong>
			</p>
		<c:if test="${sessionScope.loginStudent != null }">
			<p id="studentinfo">
				<strong>아이디: ${sessionScope.loginStudent.studentId } |</strong>
				<strong>| 이름: ${sessionScope.loginStudent.studentName } |</strong>
				<c:choose>
					<c:when test="${sessionScope.loginStudent.studentPw != 'admin' }">
						<strong>| 전공: ${sessionScope.loginStudent.major } </strong>
					</c:when>
					<c:otherwise>
						<strong>| 담당 부서: ${sessionScope.loginStudent.major } </strong>
					</c:otherwise>
				</c:choose>
				
				<a class="logoutlink" href="/sugang/logout">로그아웃</a>
			</p>
			
		</c:if>
		
		</div>
</header>