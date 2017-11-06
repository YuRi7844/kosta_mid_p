package sugang.servlet;

import java.io.IOException;

import javax.naming.TimeLimitExceededException;
import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sugang.exception.DuplicatedStudentException;
import sugang.exception.DuplicatedSubjectException;
import sugang.exception.MaxSubjectEnrollmentException;
import sugang.service.EnrollmentService;
import sugang.service.impl.EnrollmentServiceImpl;
import sugang.vo.Enrollment;
import sugang.vo.Student;

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
		HttpSession session = request.getSession();
		int studentId = ((Student)session.getAttribute("loginStudent")).getStudentId();
		//int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		int subjectId = (Integer)request.getAttribute("addSubjectId");
		
		
		Enrollment enrollment = new Enrollment(studentId, subjectId);
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();

		try {
			service.addEnrollment(enrollment);
		
		} catch (DuplicatedSubjectException e) {
			e.printStackTrace();
			session.setAttribute("message", e.getMessage());
		} catch (MaxSubjectEnrollmentException e) {
			e.printStackTrace();
			session.setAttribute("message", e.getMessage());
		} catch (TimeLimitExceededException e) {
			session.setAttribute("message", e.getMessage());
			e.printStackTrace();
		}  
		
		response.sendRedirect("/sugang/subject/checkEnrollment.jsp");
		//request.getRequestDispatcher("/subject/checkEnrollment.jsp").forward(request, response);
	}

}
