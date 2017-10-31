package sugang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.impl.SubjectServiceImpl;
import sugang.vo.Subject;

/**
 * Servlet implementation class SubjectFindServlet
 */
@WebServlet("/findSubjectById")
public class FindSubjectByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청파라미터 조회
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
//		System.out.println(subjectId);

		// 2. Business Service 호출
		SubjectServiceImpl service = SubjectServiceImpl.getInstance();
		Subject result = service.findSubjectById(subjectId);
//		System.out.println(result);
		// 3. 응답
		request.setAttribute("result", result);
		request.getRequestDispatcher("/subject/get_subject_by_id.jsp").forward(request, response);
	}

}
