<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>삭제되었니?</h1>
<%=request.getAttribute("message") %>

<%-- <% if(request.getAttribute("message") != null){
%> <%=request.getAttribute("message") %>
<%}else{ %>
삭제완료!
<%} %> --%>


</body>
</html>