package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import sugang.service.impl.EnrollmentServiceImpl;
import sugang.service.impl.SubjectServiceImpl;
import sugang.vo.Enrollment;
import sugang.vo.Student;
import sugang.vo.Subject;

/**
 * Servlet 
 * 강좌 목록 전체조회, 학생이 현재 신청한(등록된) 목록 조회
 * 수강신청에 대한 요청도 받는다. 단 처리하지 않고 addEnrollmentServlet으로 전달한다.
 */
@WebServlet("/getSubjectList")
public class GetSubjectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 1. 요청파라미터 조회
	 * 	- Session에서 학생아이디를 조회한다.
	 * 	- 요청파라미터 조회를 통해 수강신청 요청이 있는지 확인한다.
	 * 2. Business Service 호출
	 * 	- 강좌 전체 목록과 수강신청 목록을 조회하는 service를 호출한다.
	 * 3. 응답
	 * 	- 수강신청 요청이 있다면 addEnrollmentServlet으로 전달한다.
	 * 	- 수강신청 요청이 없었다면 호출된 곳으로 응답한다.
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//1. 요청파라미터 조회
		int studentId = ((Student)session.getAttribute("loginStudent")).getStudentId();
		int addSubjectId = 0;
		String reg = request.getParameter("addSubjectId"); // 수강신청 요청이 있었는지 확인할 변수
		if(reg != null) {// 수강신청 요청이 있었는지 확인 - 요청이 있는 경우에 해당.
				addSubjectId = Integer.parseInt(reg);
				request.setAttribute("addSubjectId", addSubjectId);
		}

		//2. Business Service 호출	
		SubjectServiceImpl service = SubjectServiceImpl.getInstance();
		List<Subject> subAllList = service.getSubjectList();
		List<Subject> enoList = service.getStudentByEnrollmentSubjectList(studentId);
		
		//3. 응답
		request.setAttribute("subAllList", subAllList);
		request.setAttribute("enoList", enoList);
		if(addSubjectId != 0) {// 수강신청 요청이 있는 경우에 해당.
			request.getRequestDispatcher("/addEnrollment").forward(request, response);
		}else {// 수강신청 요청이 없고 조회만 하는 경우에 해당. 
			request.getRequestDispatcher("/subject/get_subject_list.jsp").forward(request, response);
		}
	}

}
