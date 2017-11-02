<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
*{
	text-decoration: none;
}
div.container {
	font-family: sans-serif;
	border: 2px, grey;
}

body {
	margin: 0 auto;
	text-align: center;
}

header {
	background-color: black;
	color: white;
	height: 130px;
	width: 100%;
}

.title {
	font-size: 40px;
	letter-spacing: 10px;
	text-align: center;
}

.studentinfo {
	font-size: 20px;
	text-align: right;
}

div.topMenuArea {
	height: 35px;
	background-color: light grey;
	color: white;
}

#topMenu {
	margin-left:280px;
	text-align: center;
	height: 40px;
	width: 850px;
}

#topMenu ul {

	list-style: none;
	vertical-align: middle;
}

#topMenu ul li {
	color: white;
	background-color: #2D2D2D;
	float: left;
	line-height: 40px;
	text-align: center;
	position: relative;
}

.menuLink {
	display: block;
	width: 200px;
	font-size: 15px;
	font-weight: bold;
	font-family: sans-serif;
	color: white;
}

.topMenuLi:hover .menuLink {
	color: tomato;
	background-color: light grey;
}

.loginArea {
	background-color: light grey;
	align: "center";
	border: 1px solid black;
	margin-top: 200px;
	margin-left: 580px;
	width: 300px;
	height: 200px;
}

p {
	text-align: "center";
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<header>
			<h1 class="title">
				<strong>수강신청</strong>
			</h1>
			<p class="studentinfo"> 
			 아이디 : <c:out value="${sessionScope.loginStudent.studentId}"/> ,
			 이름 : <c:out value="${sessionScope.loginStudent.studentName}"/> ,
			 담당 부서 : <c:out value="${sessionScope.loginStudent.major}"/> 
			</p>
		</header>
		<nav id="topMenu">
			<ul>
				<li class="topMenuLi"><a class="menuLink" href="">메인으로</a></li>
				<li class="topMenuLi"><a class="menuLink" href="">학생정보</a></li>
				<li class="topMenuLi"><a class="menuLink" href="">강좌정보</a></li>
				<li class="topMenuLi"><a class="menuLink" href="">수강신청결과</a></li>
			</ul>
		</nav>
		<article>
			
		</article>
	</div>
	
			<a href="/sugang/logout">로그아웃</a>
</body>
</html>