<%@page import="sugang.vo.Student"%>
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
List<Student> result = (List<Student>) request.getAttribute("result");

for (int i = 0; i < result.size(); i++) {
%>

<Input type='text' value='<%=result.get(i).getStudentName()%>'>
<Input type='number' value='<%=result.get(i).getStudentId()%>'>
<Input type='text' value='<%=result.get(i).getMajor()%>'>
<Input type='number' value='<%=result.get(i).getGrade()%>'>
<Input type='number' value='<%=result.get(i).getMaxCredit()%>'>
<br>



<%
}
%>
<%
if(result.isEmpty()){
%>
없는이름입니다.
<%} %>



</body>
</html>
