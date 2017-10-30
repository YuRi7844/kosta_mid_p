package sugang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.EnrollmentService;
import sugang.service.impl.EnrollmentServiceImpl;

/**
 * Servlet implementation class EnrollmentFindServlet
 */
@WebServlet("/findEnrollment")
public class FindEnrollmentServlet extends HttpServlet {
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
		/*//1. 요청파라미터 조회
		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		int studentId = (int)request.getAttribute("studentId");
		
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
		int result = service.findEnrollmentByStudentId(studentId);
		
		//2. 응답
		//처리결과를 requestScope에 저장
		request.setAttribute("result", result);
		//요청디스패치방식
		request.getRequestDispatcher("").forward(request, response);*/
	}

}
