package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.StudentService;
import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class FindStudentServlet
 */
@WebServlet("/findStudent")
public class FindStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentService service = StudentServiceImpl.getInstance();
		//학생 전체리스트 조회 
		List<Student> list = service.getStudentList();
		
		//학생 리스트 속성으로 저장
		request.setAttribute("result", list);
		
		//결과 조회 페이지로 이동(요청 Dispatch)
		
		request.getRequestDispatcher("/student/studenttest/findStudentTestResult.jsp").forward(request, response);
	}

}
