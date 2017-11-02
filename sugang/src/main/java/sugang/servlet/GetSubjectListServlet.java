package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.impl.EnrollmentServiceImpl;
import sugang.service.impl.SubjectServiceImpl;
import sugang.vo.Enrollment;
import sugang.vo.Subject;

/**
 * Servlet implementation class GetSubjectListServlet
 */
@WebServlet("/getSubjectList")
public class GetSubjectListServlet extends HttpServlet {
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
		//1. Business Service 호출	
		
		SubjectServiceImpl service = SubjectServiceImpl.getInstance();
	
		List<Subject> list = service.getSubjectList();
		
		//2. 응답
		request.setAttribute("result", list);
		request.getRequestDispatcher("/subject/get_subject_list.jsp").forward(request, response);
	}

}
