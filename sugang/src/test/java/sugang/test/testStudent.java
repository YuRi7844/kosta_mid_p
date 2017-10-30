package sugang.test;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.StudentDao;
import sugang.dao.impl.StudentDaoImpl;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Student;

public class testStudent {
	private SqlSessionFactory factory;

	public testStudent() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();

	}

	public void studentService() {
		SqlSession session = null;
		try {
			session = factory.openSession();
			StudentDao dao = StudentDaoImpl.getInstance();
/*			System.out.println("=====학생 등록 조회===");
			Student student = new Student(148, "안녕", "qwe", "1234", 2, 16);
			int flag = dao.insertStudent(session, student);
			System.out.println(flag);

			System.out.println("====삭제-=====");
			System.out.println(student.getStudentId());
			int flag2 = dao.deleteStudentById(session, student.getStudentId());
			System.out.println(flag2);*/

			System.out.println("=====조회====");
			
			Student newSd = new Student(20120001, "바꿨다", "이거", "매개변수시발", 3, 12);
			int flag123 = dao.updateStudentById(session, newSd);
			System.out.printf("%d명 바뀜", flag123);
			

/*			System.out.println("===전체 회원 조회====");
			List<Student> list = dao.selectAllStudent(session);
			for (Student s : list) {
				System.out.println(s);
			}

			System.out.println("====id로회원 조회======");
			Student who = dao.selectStudentById(session, 99);

			System.out.println("=====이름으로 회원 조회=====");
			String studentName = "이거";
			list = dao.selectStudentByName(session, studentName);
			for (Student s : list) {
				System.out.println(s);
			}*/
			session.commit();
		} finally {
			session.close();
		}

	}

	public static void main(String[] args) throws IOException {
		testStudent test = new testStudent();
		test.studentService();
	}
}
