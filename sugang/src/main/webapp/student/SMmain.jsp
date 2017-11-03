<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<style>
#sub{
	width: 350px;
    margin: 0 auto;
    margin-top: 100px;
}
.submenu{
	width: 350px;
}
.submenuList{
	float:none;
	width: 350px;
    margin: 0px;
}
.submenulink{
	width: 300px;
    height: 40px;
    font-size: 24px;
}
.submenulink:hover{
	
}
</style>
<meta charset="UTF-8">
<title>학생관리 메인</title>
</head>
<body>
<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>




</body>
</html>