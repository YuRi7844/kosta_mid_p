<%@page import="sugang.vo.Student"%>
<%@page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/sugang/css/framestyle2.css">
<meta charset="UTF-8">
<title>학생 조회</title>
</head>
<body>

<jsp:include page="/WEB-INF/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/submenu(admin).jsp"></jsp:include>

<br>
<div class="stScroll">
<jsp:include page="/studentSearch.jsp"></jsp:include>
<<<<<<< HEAD
		<table class="table">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>전공</th>
					<th>학년</th>
					<th>최대수강학점</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty requestScope.result }">
						<%-- <c:forEach var="result" items="${requestScope.result }" > --%>
					<tr class="tr">
								<td class="td">
									${result.studentId }
								</td>
								<td class="td">
									${result.studentName }
								</td>
								<td class="td">
								${result.major }
								</td>
								<td class="td">
								${result.grade }
								<td class="td">
								${result.maxCredit }
								</td>
							</tr>
							<%-- </c:forEach> --%>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="td">조회된 학생이 없습니다.</td>
						</tr>
					</c:otherwise>
=======
    <table class="table">
         <thead>
            <tr>
               <th>학번</th>
               <th>이름</th>
               <th>전공</th>
               <th>학년</th>
               <th>최대수강학점</th>
            </tr>
         </thead>
         <tbody>
            <c:choose>
               <c:when test="${! empty requestScope.result }">
               <tr class="tr">
                        <td class="td">
                           ${requestScope.result.studentId }
                        </td>
                        <td class="td">
                           ${requestScope.result.studentName }
                        </td>
                        <td class="td">
                        ${requestScope.result.major }
                        </td>
                        <td class="td">
                        ${requestScope.result.grade }
                        <td class="td">
                        ${requestScope.result.maxCredit }
                        </td>
                     </tr>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td class="td">조회된 학생이 없습니다.</td>
                  </tr>
               </c:otherwise>
>>>>>>> branch 'master' of https://github.com/YuRi7844/kosta_mid_p.git

            </c:choose>
         </tbody>
      </table> 
   
   </div>
</body>
</html>
