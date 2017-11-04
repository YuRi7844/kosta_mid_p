package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class StudentFindServlet
 */
@WebServlet("/findStudentByName")
public class FindStudentByNameServlet extends HttpServlet {
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
		//1. 요청파라미터 조회
//		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		String studentName = request.getParameter("studentName");
		
		//이름으로 학생정보 List 호출
		List<Student> result = service.findStudentByName(studentName);
		
		//2. 응답
		//처리결과를 requestScope에 저장
		request.setAttribute("result", result);
		//요청디스패치방식
		request.getRequestDispatcher("/student/studenttest/findStudentByNameResult.jsp").forward(request, response);
	}

}
