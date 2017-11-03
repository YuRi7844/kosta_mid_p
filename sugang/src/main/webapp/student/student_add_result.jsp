<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#add_result{
	margin: 0 auto;
	margin-top: 100px;
    text-align: center;
    border: 1px solid black;
    width: fit-content;
    padding: 5%;
    font-size: 30px;
    font-weight: bold;
    border-left: 20px solid black;
    border-right: 20px solid black;
    
}

</style>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle.css">
<meta charset="UTF-8">
<title>학생 등록</title>
</head>
<body>
<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>

<div id="add_result">
${sessionScope.result }
</div>

</body>
</html>