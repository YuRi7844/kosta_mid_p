<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${sessionScope.loginStudent.studentPw != 'admin' }">
		<nav>
			<ul class="mainmenu">
				<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/login_student.jsp">메인으로</a>
				</li>
				<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/notice.jsp">공지사항</a>
				</li>
				<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/subject/request_subject_list.jsp">수강신청</a>
				</li>
				<li class="mainmenuList">
					<a class="mainmenulink" href="">수강신청조회</a>
				</li>
				
				
				
			</ul>
		</nav>
	</c:when>
	<c:otherwise>
		
		<nav>
			<ul class="mainmenu">
				<li class="mainmenuList">
					<a class="mainmenulink" href="/sugang/notice.jsp">공지사항</a>
				</li>
				<li class="mainmenuList">
					<a class="mainmenulink" href="/sugang/student/SMmain.jsp">학생관리</a>
				</li>
				
				
			</ul>
		</nav>
	</c:otherwise>
</c:choose>
