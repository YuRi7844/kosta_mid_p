package sugang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sugang.exception.DuplicatedStudentException;
import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class StudentInputServlet
 */
@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
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
//		request.setCharacterEncoding("UTF-8");// 요청 파라미터 한글처리. - TODO 나중에 필터처리
		StudentServiceImpl service = StudentServiceImpl.getInstance();
		HttpSession session = request.getSession();
		try {
			// 요청 파라미터로 넘어온 학생의 정보 요청 받기
			int studentId = Integer.parseInt(request.getParameter("studentId"));
			String studentName = request.getParameter("studentName");
			String major = request.getParameter("major");
			String studentPw = request.getParameter("studentPw");
			int grade = Integer.parseInt(request.getParameter("grade"));
			int maxCredit = Integer.parseInt(request.getParameter("maxCredit"));
			
			//Student 객체 생성 후 서비스 호출
			Student student = new Student(studentId, studentName, major, studentPw, grade, maxCredit);
			service.addStudent(student);
			
			//DB에 등록된 해당 학생의 id를 다시 조회하여 이름으로 결과 호출(requestScope에 저장)
			String result = String.format("%s 학생이 등록되었습니다.", service.findStudentById(student.getStudentId()).getStudentName());
			session.setAttribute("result", result);
			
			
		//2. 응답
			//Redirect방식으로 xxx.jsp로 이동
			response.sendRedirect("/sugang/student/addstudentresult.jsp");//TODO 이동할 url - xxx.jsp
		}catch(DuplicatedStudentException e){
			session.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/student/testaddstudent.jsp").forward(request, response);
		}
		
		
	}

}
