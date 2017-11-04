package sugang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.exception.DuplicatedSubjectException;
import sugang.exception.StudentNotFoundException;
import sugang.exception.SubjectNotFoundException;
import sugang.service.impl.EnrollmentServiceImpl;

/**
 * Servlet implementation class EnrollmentRemoveServlet
 */
@WebServlet("/removeEnrollmentbySubject")
public class RemoveEnrollmentServletBySubjectId extends HttpServlet {
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
		int subjectId = Integer.parseInt(request.getParameter("removeSubjectId"));
		
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
		try {
			service.removeEnrollmentBySubjectId(subjectId);
		} catch (SubjectNotFoundException e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		}

		
		request.getRequestDispatcher("/subject/checkRemoveEnrollment.jsp").forward(request, response);
	
	}

}
