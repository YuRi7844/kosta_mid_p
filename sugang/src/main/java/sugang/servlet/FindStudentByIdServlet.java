package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.impl.StudentServiceImpl;
import sugang.service.impl.SubjectServiceImpl;
import sugang.vo.Student;
import sugang.vo.Subject;

/**
 * Servlet implementation class StudentFindServlet
 */
@WebServlet("/findStudentById")
public class FindStudentByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentServiceImpl service = StudentServiceImpl.getInstance();
		//1. 요청파라미터 조회 //studentId 조회
//		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		
		//Student result = (Student)(service.findStudentById(Integer.parseInt(studentId)));
		//2. 비즈니스 로직 처리 //학번으로 학생정보 호출
	    Student result = service.findStudentById(studentId);
	    
		//3. 응답
		//처리결과를 requestScope에 저장 (String key, Object value)
		request.setAttribute("result", result);
		//요청디스패치방식
		request.getRequestDispatcher("/student/studenttest/findStudentByIdResult.jsp").forward(request, response);
		
	
	}

}





