<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getAttribute("message") %>

등록성공

<a href="/sugang/enrollment/view.jsp">초기화면으로
<a href="/sugang/findEnrollment"> 등록조회
</body>
</html>