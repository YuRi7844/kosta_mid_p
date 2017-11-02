<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${sessionScope.loginStudent.studentPw != 'admin' }">
		<nav>
			<ul class="mainmenu">
				<li class="mainmenuList">
					<a class="mainmenulink" href="">수강신청조회</a>
				</li>
				<li class="mainmenuList">
				<a class="mainmenulink" href="">수강신청</a>
				</li>
				<li class="mainmenuList">
				<a class="mainmenulink" href="">공지사항</a>
				</li>
				<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/login_student.jsp">메인으로</a>
			</li>
			</ul>
		</nav>
	</c:when>
	<c:otherwise>
		
		<nav>
			<ul class="mainmenu">
				<li class="mainmenuList">
					<a class="mainmenulink" href="">학생관리</a>
				</li>
				<li class="mainmenuList">
					<a class="mainmenulink" href="">공지사항</a>
				</li>
				<li class="mainmenuList">
					<a class="mainmenulink" href="/sugang/login_sess.jsp">메인으로</a>
				</li>
			</ul>
		</nav>
	</c:otherwise>
</c:choose>
