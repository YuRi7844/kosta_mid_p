package sugang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sugang.exception.StudentNotFoundException;
import sugang.service.StudentService;
import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class StudentRemoveServlet
 */
@WebServlet("/removeStudent")
public class RemoveStudentServlet extends HttpServlet {
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
		StudentService service = StudentServiceImpl.getInstance();
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		try {
			service.removeStudentById(studentId);
			String result = String.format("%d 학번 학생정보를 삭제했습니다.", studentId);
			request.setAttribute("result", result);
			request.getRequestDispatcher("/student/studentDeleteSuccess.jsp").forward(request, response);
			

		} catch (StudentNotFoundException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/student/testStudentDelete.jsp").forward(request, response);
		}
	}

}
