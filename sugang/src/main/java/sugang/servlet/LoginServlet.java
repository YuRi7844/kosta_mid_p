package sugang.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sugang.exception.LoginFailException;
import sugang.service.StudentService;
import sugang.service.impl.StudentServiceImpl;
import sugang.vo.Student;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		StudentService service = StudentServiceImpl.getInstance();
		int studentId = Integer.parseInt(request.getParameter("Id"));

		String studentPw = request.getParameter("Password");
		Student student = service.findStudentById(studentId);

		if (student != null) {

			if (studentPw.equals(student.getStudentPw())) {
				if (studentPw.equals("admin")) {
					HttpSession session = request.getSession();
					session.setAttribute("loginStudent", student);
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("loginStudent", student);
					request.getRequestDispatcher("/enrollment.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("errorMessage", "Password Error");
				request.getRequestDispatcher("/login/login.jsp").forward(request, response);
			}
		} else if (student == null) {
			request.setAttribute("errorMessage", "Id Error");
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);
		}
	}
}
