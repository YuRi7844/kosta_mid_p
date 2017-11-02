<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<meta charset="UTF-8">
<title>수강신청 메인</title>
</head>
<body>
	
<jsp:include page="/WEB-INF/top.jsp"></jsp:include>


<section >
    <div style="width: 400px;
    margin: 0 auto;
    margin-top: 100px;
    margin-bottom: 100px;">
		<p style="text-align: center; background-color: lightgrey;
		font-size: 18px;border-left: 10px solid black;
		margin-bottom: 2px;height: 40px;">
		수강 신청 로그인
		</p>
		<form action="/sugang/login" method="POST" 
		style="padding: 14px;border: 1px solid black;
   		 height: 120px;    height: 150px;">
			<p style="text-align: left;">
				학번: <input style="float: right; size: a4;height: 20px;width: 250px;" type="number" name="Id" autofocus>
			</p>
			<p style="text-align: left;">
				비밀번호: <input style="float: right; size: a4;height: 20px;width: 250px;" type="password" name="Password">
			</p>
			<button class="loginbutton" type="submit">로그인</button>
		</form>
	</div>
</section>
<jsp:include page="/WEB-INF/foot.jsp"></jsp:include>
</body>
</html>