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

<a href="/sugang/enrollment/view.jsp">초기화면으로</a>
</body>
</html>