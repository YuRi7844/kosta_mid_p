<%@page import="sugang.vo.Enrollment"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
 List<Enrollment> list = (List<Enrollment>)request.getAttribute("result");
 
 for(int i=0; i<list.size(); i++){
	 
 %>
	<Input type='text' value='<%=list.get(i).getStudentId() %>'>
	<Input type='text' value='<%=list.get(i).getSubjectId() %>'>
	<br>
	<%
 }
 %>
<%
 if(list.isEmpty()){	
 %>
 죄송하네요.
 <%} %>
<a href="/sugang/enrollment/view.jsp">초기화면으로
</body>
</html>