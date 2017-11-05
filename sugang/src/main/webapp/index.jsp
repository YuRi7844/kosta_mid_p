<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
#studentinfo{
	float: right;
}
</style>
<meta charset="UTF-8">

<title>수강신청</title>

</head>
<body>

	<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
	<c:if test="${sessionScope.loginStudent != null }">
		<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.loginStudent == null }">
		<section>
		<p>
			${requestScope.errorMessage }
		</p>
			<div
				style="width: 400px; margin: 0 auto; margin-top: 100px; margin-bottom: 100px;">
				<p
					style="text-align: center; background-color: lightgrey; font-size: 18px; border-left: 10px solid black; margin-bottom: 2px; height: 40px;">
					수강 신청 로그인</p>
				<form action="/sugang/login" method="POST"
					style="padding: 14px; border: 1px solid black; height: 165px;">
					<p style="text-align: left;">
						학번: <input style="float: right; height: 20px; width: 250px;"
							type="number" name="studentId" autofocus>
					</p>
					<p style="text-align: left;">
						비밀번호: <input style="float: right; height: 20px; width: 250px;"
							type="password" name="studentPw">
					</p>


					<button class="loginbutton" type="submit">로그인</button>
				</form>
			</div>
		</section>
	</c:if>
	<jsp:include page="/WEB-INF/foot.jsp"></jsp:include>
</body>
</html>


