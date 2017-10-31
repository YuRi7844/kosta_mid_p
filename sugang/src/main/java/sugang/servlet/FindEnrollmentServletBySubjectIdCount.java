package sugang.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.service.impl.EnrollmentServiceImpl;
import sugang.vo.Enrollment;

/**
 * Servlet implementation class FindEnrollmentServletBySubjectIdCount
 */
@WebServlet("/findEnrollmentBySubjectCount")
public class FindEnrollmentServletBySubjectIdCount extends HttpServlet {
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
		//1. 요청파라미터 조회
		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		String subjectId = request.getParameter("subjectId");
		int subjectid = Integer.parseInt(subjectId);
		
		EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
		int count = service.findEnrollmentBySubjectCount(subjectid);
		
		//2. 응답
		//처리결과를 requestScope에 저장
		request.setAttribute("count", count);
		
		//요청디스패치방식 - /enrollment/findbystudentId.jsp
		request.getRequestDispatcher("/enrollment/findEnrollmentbySubjectCount.jsp").forward(request, response);
	}
}
