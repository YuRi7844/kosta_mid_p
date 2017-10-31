
<%@page import="java.util.List"%>
<%@page import="sugang.vo.Enrollment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
 List<Enrollment> list = (List<Enrollment>)request.getAttribute("result");
 
 for(int i=0; i<list.size(); i++){
	 
 %>
 <Input type='text' value='<%=list.get(i).getStudentId() %>'>
 <Input type='text' value='<%=list.get(i).getSubjectId() %>'><br>
 <%
 }
 %>
 <%
 if(list.isEmpty()){	
 %>
 죄송하네요.
 <%} %>
 
 
</body>
</html>