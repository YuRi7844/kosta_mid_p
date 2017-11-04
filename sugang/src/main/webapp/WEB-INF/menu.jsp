<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.mainmenulink{
	-webkit-transition:1s;
	-webkit-transform:scale(1.0,1.0);
	transition:1s;
	transform:scale(1.0,1.0);
}
.mainmenulink:hover{
	-webkit-transition:1s;
	-webkit-transform:scale(1.1,1.1);
	transition:1s;
	transform:scale(1.1,1.1);
}
</style>
<c:choose>
	<c:when test="${sessionScope.loginStudent.studentPw != 'admin' }">
		<nav>
			<ul class="mainmenu">
				<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/notice(student).jsp">메인으로</a>
				</li>
				<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/notice(student).jsp">공지사항</a>
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
					<a class="mainmenulink" href="/sugang/notice(admin).jsp">공지사항</a>
				</li>
				<li class="mainmenuList">

					<a class="mainmenulink" href="/sugang/student/SMmain.jsp">학생관리</a>

				</li>
				
				
			</ul>
		</nav>
	</c:otherwise>
</c:choose>
