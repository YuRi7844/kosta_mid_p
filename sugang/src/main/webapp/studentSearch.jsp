<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>
<center>
   <h2>학생 정보 조회</h2>
</center>
</p>
<p>
<table class="minifind">
   <!-- <div class="minifind"> -->
      <tr>
         <th><b>전체학생</b></th>
         <th><b>학번조회</b></th>
         <th><b>이름조회</b></th>
      </tr>
      <tr>
         <th><form action="/sugang/findStudent" method="POST">
               <button type="submit">전체 학생 조회</button>
            </form></th>
         <th><form action="/sugang/findStudentById" method="post">
               <input type="number" name="studentId" required/>
               <button type="submit">조회</button>
            </form></th>
         <th>
            <form action="/sugang/findStudentByName" method="POST">
               <input type="text" name="studentName" />
               <button type="submit">조회</button>
               <p>
            </form>
         </th>
      </tr>
</table>