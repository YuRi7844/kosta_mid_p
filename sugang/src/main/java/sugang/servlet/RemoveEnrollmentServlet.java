package sugang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.exception.DuplicatedStudentException;
import sugang.service.impl.EnrollmentServiceImpl;
import sugang.vo.Enrollment;

/**
 * Servlet implementation class EnrollmentRemoveServlet
 */
@WebServlet("/removeEnrollment")
public class RemoveEnrollmentServlet extends HttpServlet {
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
		String subjectId = request.getParameter("subjectId");
		int subjectid = Integer.parseInt(subjectId);
		
		
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
		service.removeEnrollmentByEnrollment(new Enrollment(studentid, subjectid));
		

		request.getRequestDispatcher("/enrollment/removeStudentId.jsp").forward(request, response);
	
	
	}

}
