package sugang.servlet;

import java.io.IOException;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.exception.DuplicatedStudentException;
import sugang.exception.DuplicatedSubjectException;
import sugang.exception.MaxSubjectEnrollmentException;
import sugang.service.EnrollmentService;
import sugang.service.impl.EnrollmentServiceImpl;
import sugang.vo.Enrollment;

/**
 * Servlet implementation class EnrollmentInputServlet
 */
@WebServlet("/addEnrollment")
public class AddEnrollmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청파라미터 조회
		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		String studentId = request.getParameter("studentId");
		int studentid = Integer.parseInt(studentId);
		String subjectId = request.getParameter("subjectId");
		int subjectid = Integer.parseInt(subjectId);
		
		Enrollment enrollment = new Enrollment(studentid, subjectid);
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();

		try {
			service.addEnrollment(enrollment);
		
		} catch (DuplicatedSubjectException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		} catch (MaxSubjectEnrollmentException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		} catch (LoginException e) {
			request.setAttribute("message", e.getMessage());
			e.printStackTrace();
		} 
		
		request.getRequestDispatcher("/enrollment/addEnrollment.jsp").forward(request, response);

	}

}
