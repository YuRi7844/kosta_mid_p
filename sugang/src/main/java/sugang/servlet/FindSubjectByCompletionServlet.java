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
 * Servlet
 * 이수구분별 강좌조회, 학생이 현재 신청한(등록된) 목록 조회
 * 수강신청에 대한 요청도 받는다. 단 처리하지 않고 addEnrollmentServlet으로 전달한다.
 */
@WebServlet("/findSubjectByCompletion")
public class FindSubjectByCompletionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 1. 요청파라미터 조회
	 * 	- Session에서 학생아이디를 조회한다.
	 * 	- 요청파라미터 조회를 통해 수강신청 요청이 있는지 확인한다.
	 * 2. Business Service 호출
	 * 	- 이수구분별 강좌 목록과 수강신청 목록을 조회하는 service를 호출한다.
	 * 3. 응답
	 * 	- 수강신청 요청이 있다면 addEnrollmentServlet으로 전달한다.
	 * 	- 수강신청 요청이 없었다면 호출된 곳으로 응답한다.
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청파라미터 조회
		HttpSession session = request.getSession();
		int studentId = ((Student)session.getAttribute("loginStudent")).getStudentId();
		String completion = request.getParameter("completion");
		int addSubjectId = 0;
		String reg = request.getParameter("addSubjectId");
		if(reg != null) {
				addSubjectId = Integer.parseInt(reg);
				request.setAttribute("addSubjectId", addSubjectId);
				System.out.println("add 0 아님  "+addSubjectId);
		}

		// 2. Business Service 호출
		SubjectServiceImpl service = SubjectServiceImpl.getInstance();
		List<Subject> subCompletion = service.findSubjectByCompletion(completion);
		List<Subject> enoList = service.getStudentByEnrollmentSubjectList(studentId);
		
		// 3. 응답
		request.setAttribute("subCompletion", subCompletion);
		request.setAttribute("enoList", enoList);
		if(addSubjectId != 0) {
			request.getRequestDispatcher("/addEnrollment").forward(request, response);
		}else {
			request.getRequestDispatcher("/subject/get_subject_by_completion.jsp").forward(request, response);
		}	}

}
