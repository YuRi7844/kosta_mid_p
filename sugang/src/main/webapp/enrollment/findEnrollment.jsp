
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
<jsp:include page="/WEB-INF/sugangtop.jsp"/>
<% 
 List<Enrollment> list = (List<Enrollment>)request.getAttribute("result");
 
 for(int i=0; i<list.size(); i++){
 %>
  <form method="Post" action="/sugang/removeEnrollment">
 <Input type='text' value='<%=list.get(i).getStudentId() %>' name="studentId"  readonly>
 <Input type='text' value='<%=list.get(i).getSubjectId() %>' name="subjectId"  readonly>
 <button type="submit"> 삭제 </button><br>
  </form>
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