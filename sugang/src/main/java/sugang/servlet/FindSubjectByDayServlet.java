package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sugang.service.impl.SubjectServiceImpl;
import sugang.vo.Student;
import sugang.vo.Subject;

/**
 * Servlet implementation class FindSubjectByDayServlet
 */
@WebServlet("/findSubjectByDay")
public class FindSubjectByDayServlet extends HttpServlet {
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
		// 1. 요청파라미터 조회
		HttpSession session = request.getSession();
		int studentId = ((Student)session.getAttribute("loginStudent")).getStudentId();
		String day = request.getParameter("day");
		int addSubjectId = 0;
		String reg = request.getParameter("addSubjectId");
		if(reg != null) {
				addSubjectId = Integer.parseInt(reg);
				request.setAttribute("addSubjectId", addSubjectId);
				System.out.println("add 0 아님  "+addSubjectId);
		}

		// 2. Business Service 호출
		SubjectServiceImpl service = SubjectServiceImpl.getInstance();
		List<Subject> subDay = service.findSubjectByDay(day);
		List<Subject> enoList = service.getStudentByEnrollmentSubjectList(studentId);
		// 3. 응답
		request.setAttribute("day", day);//사용자에게 자신이 선택한 요일을 보여주려고 저장.
		request.setAttribute("subDay", subDay);
		request.setAttribute("enoList", enoList);
		if(addSubjectId != 0) {
			request.setAttribute("sub","findSubDay");
			request.getRequestDispatcher("/addEnrollment").forward(request, response);
		}else {
			request.getRequestDispatcher("/subject/get_subject_by_day.jsp").forward(request, response);
		}	}

}
