package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.EnrollmentService;
import sugang.service.impl.EnrollmentServiceImpl;
import sugang.vo.Enrollment;

/**
 * Servlet implementation class EnrollmentFindServlet
 */
@WebServlet("/findEnrollmentByStudent")
public class FindEnrollmentServletByStudentId extends HttpServlet {
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
		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		String studentId = request.getParameter("studentId");
		int studentid = Integer.parseInt(studentId);
		
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
		List<Enrollment> list = service.findEnrollmentByStudentId(studentid);
		
		//2. 응답
		//처리결과를 requestScope에 저장
		request.setAttribute("result", list);
		
		//요청디스패치방식 - /enrollment/findbystudentId.jsp
		request.getRequestDispatcher("/enrollment/findEnrollmentbyStudentId.jsp").forward(request, response);
	}

}
