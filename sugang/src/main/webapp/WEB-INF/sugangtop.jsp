<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<header>

	<div class="top">
		<p style="font-size: 27px; padding-left: 20px; margin-top: 10px; margin-bottom: 10px; text-align: center;">
			<strong>수강신청</strong>
		</p>
		<p
			style="margin-top: 5px; margin-bottom: 7px; text-align: right; padding-right: 50px">
			<strong> 아이디: <input type="text" name="studentId" size="10"
				value="&nbsp;${sessionScope.loginStudent.studentId }" readonly
				style="border: 0px; background-color: #e2e2e2; padding: 2px 0px 2px 30px; border-radius: 4px;">
				이름 : <input type="text" name="studentName" size="10"
				value="&nbsp;&nbsp;&nbsp;${sessionScope.loginStudent.studentName }"
				readonly
				style="border: 0px; background-color: #e2e2e2; padding: 2px 0px 2px 30px; border-radius: 4px;">
				전공 : <input type="text" name="major" size="10"
				value="&nbsp;${sessionScope.loginStudent.major }" readonly
				style="border: 0px; background-color: #e2e2e2; padding: 2px 0px 2px 30px; border-radius: 4px;">

				<a class="logoutlink" href="/sugang/logout"
				style="padding-bottom: 3.5px; padding-top: 3.5px">로그아웃</a>
		</p>
	</div>
			<nav>
				<ul class="mainmenu" style="height: 30px;">
					<li class="mainmenuList">
					<a class="mainmenulink" href="/sugang/login_student.jsp" style="padding-top: 5px; padding-bottom: 0px;">메인으로</a></li>
					<li class="mainmenuList">
					<a class="mainmenulink" href="/sugang/notice.jsp" style="padding-top: 5px; padding-bottom: 0px;">공지사항</a></li>
					<li class="mainmenuList">
					<a class="mainmenulink" href="/sugang/subject/request_subject_list.jsp" style="padding-top: 5px; padding-bottom: 0px;">수강신청</a></li>
					<li class="mainmenuList">
					<a class="mainmenulink" href="" style="padding-top: 5px; padding-bottom: 0px;">수강신청조회</a>
					</li>
				</ul>
			</nav>
	<nav>
		<ul class="submenu" style="height: 30px;">
			<li class="submenuList"><a class="submenulink"
				href="/sugang/subject/get_subject_by_day.jsp"
				style="height: 20px; padding-right: 10px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; font-size: 13px;">요일별조회</a></li>
			<li class="submenuList"><a class="submenulink"
				href="/sugang/subject/get_subject_by_completion.jsp"
				style="height: 20px; padding-right: 10px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; font-size: 13px;">이수구분별조회</a></li>
			<li class="submenuList"><a class="submenulink"
				href="/sugang/subject/get_subject_by_name.jsp"
				style="height: 20px; padding-right: 10px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; font-size: 13px;">강좌이름별조회</a></li>
			<li class="submenuList"><a class="submenulink"
				href="/sugang/subject/get_subject_by_id.jsp"
				style="height: 20px; padding-right: 10px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; font-size: 13px;">강좌번호별조회</a></li>
			<li class="submenuList"><a class="submenulink"
				href="/sugang/subject/get_subject_list.jsp"
				style="height: 20px; padding-right: 10px; padding-left: 10px; padding-bottom: 0px; padding-top: 0px; font-size: 13px;">강좌전체조회</a></li>
		</ul>
	</nav>

</header>