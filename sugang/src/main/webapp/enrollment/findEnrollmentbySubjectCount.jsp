<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int count = (int)request.getAttribute("count");
	
%>
<%=count %>

<a href="/sugang/enrollment/view.jsp">초기화면으로
</body>
</html>