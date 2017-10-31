package sugang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.exception.StudentNotFoundException;
import sugang.service.StudentService;
import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class StudentUpdateServlet
 */
@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentService service = StudentServiceImpl.getInstance();
		//1. 요청파라미터 조회
		
		try {
			int studentId = Integer.parseInt(request.getParameter("studentId"));
			String studentName = request.getParameter("studentName");
			String major = request.getParameter("major");
			String studentPw = request.getParameter("studentPw");
			int grade = Integer.parseInt(request.getParameter("grade"));
			int maxCredit = Integer.parseInt(request.getParameter("maxCredit"));
			//TODO: 최종떄는 JSP 파일을 아이디 입력하는 페이지 만들어서 => 학생 존재 여부 체크
			//TODO: 존재하면 나머지 정보 입력할 수 있는 페이지 작성 => service.updateStudent() 호출.
			//Student 객체 생성 후 서비스 호출
			Student student = new Student(studentId, studentName, major, studentPw, grade, maxCredit);
			service.updateStudent(student);
			String result = String.format("%d 학번 학생의 정보가 수정되었습니다.", studentId);
			request.setAttribute("result", result);
			request.getRequestDispatcher("/student/updateStudentSuccess.jsp").forward(request, response);
		}catch(StudentNotFoundException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/student/testStudentUpdate.jsp").forward(request, response);
		}
		
		
		
	}

}
