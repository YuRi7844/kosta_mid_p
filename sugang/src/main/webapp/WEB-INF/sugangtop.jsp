<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<header>
<style>
.submenu{
height: 30px;
}
.submenulink{
height: 20px; 
padding-right: 10px; 
padding-left: 10px; 
padding-bottom: 0px; 
padding-top: 0px; 
font-size: 13px;
}
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
            전공 : <input type="text" name="major" size="10" value="${sessionScope.loginStudent.major }" readonly style="text-align: left;">
            수강 가능 학점 : <input type="text" name="maxCredit" size="4.5" value="&nbsp;${sessionScope.loginStudent.maxCredit }" readonly>
            <a class="logoutlink" href="/sugang/logout">로그아웃</a>
            </strong>
      </p>
   </div>
	<nav>
		<ul class="mainmenu">
			<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/notice(student).jsp">메인으로</a></li>
			<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/notice(student).jsp">공지사항</a></li>
			<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/getSubjectList">수강신청</a></li>
			<li class="mainmenuList">
				<a class="mainmenulink" href="/sugang/subject/time_table.jsp">수강신청조회</a>
			</li>
		</ul>
	</nav>
	<nav>
		<ul class="submenu">
			<li class="submenuList">
				<a class="submenulink" href="/sugang/subject/get_subject_by_day.jsp">요일별조회</a></li>
			<li class="submenuList">
				<a class="submenulink" href="/sugang/subject/get_subject_by_completion.jsp">이수구분별조회</a></li>
			<li class="submenuList">
				<a class="submenulink" href="/sugang/subject/get_subject_by_name.jsp">강좌이름별조회</a></li>
			<li class="submenuList">
				<a class="submenulink" href="/sugang/subject/get_subject_by_id.jsp">강좌번호별조회</a></li>
			<li class="submenuList">
				<a class="submenulink" href="/sugang/subject/get_subject_list.jsp">강좌전체조회</a></li>
		</ul>
	</nav>
</header>
