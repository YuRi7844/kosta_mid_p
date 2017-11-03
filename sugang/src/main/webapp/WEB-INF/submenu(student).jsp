<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<header>
<style>
.mainmenulink{
padding-top: 5px; 
padding-bottom: 0px;
}
.mainmenu{
height: 30px;
}
input[type="text"]{
border: 0px; 
background-color: #e2e2e2; 
padding: 2px 0px 2px 30px; 
border-radius: 4px;
}
.logoutlink{
padding-bottom: 3.5px; 
padding-top: 3.5px}

</style>
	<div class="top">
		<p style="margin-top: 5px; margin-bottom: 7px; text-align: right; padding-right: 50px">
			<strong style="font-size: 25px; padding-right: 100px; color: #ffff66">KOSTA 수강신청</strong> 
			<strong> 
				아이디: <input type="text" name="studentId" size="10" value="&nbsp;${sessionScope.loginStudent.studentId }" readonly>
				이름 : <input type="text" name="studentName" size="10" value="&nbsp;&nbsp;&nbsp;${sessionScope.loginStudent.studentName }"readonly>
				전공 : <input type="text" name="major" size="10" value="&nbsp;${sessionScope.loginStudent.major }" readonly>
				수강 가능 학점 : <input type="text" name="maxCredit" size="4.5" value="&nbsp;${sessionScope.loginStudent.maxCredit }" readonly>
				<a class="logoutlink" href="/sugang/logout">로그아웃</a>
		</p>
	</div>
			<nav>
				<ul class="mainmenu">
					<li class="mainmenuList">
						<a class="mainmenulink" href="/sugang/login_student.jsp">메인으로</a></li>
					<li class="mainmenuList">
						<a class="mainmenulink" href="/sugang/notice.jsp">공지사항</a></li>
					<li class="mainmenuList">
						<a class="mainmenulink" href="/sugang/subject/request_subject_list.jsp">수강신청</a></li>
					<li class="mainmenuList">
						<a class="mainmenulink" href="">수강신청조회</a>
					</li>
				</ul>
			</nav>

</header>