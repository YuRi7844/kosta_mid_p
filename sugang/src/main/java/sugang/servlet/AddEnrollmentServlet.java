package sugang.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*//1. 요청파라미터 조회
		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		int result;
		try {
			int id = (int)request.getAttribute("studentId");
			
			EnrollmentServiceImpl service = EnrollmentServiceImpl.getInstance();
			result = service.findEnrollmentByStudentId(id);//TODO 나중에 서비스에 있는 메소드와 이름 일치하는지 확인
			
		//2. 응답
			//처리결과를 requestScope에 저장
			request.setAttribute("result", result);
			//Redirect방식으로 xxx.jsp로 이동
			response.sendRedirect("");//TODO 이동할 url - xxx.jsp
		}catch(Exception e){//TODO
			request.setAttribute("error_message", "");
			
		}*/
				
	}

}
