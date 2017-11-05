package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sugang.service.EnrollmentService;
import sugang.service.impl.EnrollmentServiceImpl;
import sugang.vo.Enrollment;
import sugang.vo.Student;

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
		HttpSession session = request.getSession();
		int studentId = ((Student)session.getAttribute("loginStudent")).getStudentId();
		
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
		List<Enrollment> list = service.findEnrollmentByStudentId(studentId);
		
		//2. 응답
		//처리결과를 requestScope에 저장
		request.setAttribute("enoList", list);
		
		//요청디스패치방식 - /enrollment/findbystudentId.jsp
		request.getRequestDispatcher("/subject/time_table.jsp").forward(request, response);
	}

}
