package sugang.test;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.EnrollmentDao;
import sugang.dao.impl.EnrollmentDaoImpl;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Enrollment;

public class testEnrollment {
	private SqlSessionFactory factory;
	public testEnrollment() throws IOException{
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		
	}
	public void enrollmentService() {
		SqlSession session = null;
		try {
			session = factory.openSession();
			EnrollmentDao dao = EnrollmentDaoImpl.getInstance();
			System.out.println("=====학생 등록 조회===");
			//Enrollment enrollment = new Enrollment(20120010,0010);
			int flag = dao.insertEnrollment(session,new Enrollment(20120010,6));
			System.out.println(flag);
			
			System.out.println("===== 학생 삭제 조회=====");
			int flag2 = dao.deleteEnrollmentByStudentId(session, 20120010);
			System.out.println(flag2);
			
			System.out.println("===== 강좌 삭제 조회=====");
			int flag3 = dao.deleteEnrollmentBySubjectId(session, 10);
			System.out.println(flag3);
			
			System.out.println("===== 전체 조회=====");
			List<Enrollment>list = dao.selectEnrollment(session);
			for(Enrollment enro : list) {
				System.out.printf("%d, %d %n", enro.getStudentId(), enro.getSubjectId());
			}

			System.out.println("==== 강좌 id가 1인 것 조회====");
			int id = 1;
			List<Enrollment>list2 = dao.selectEnrollmentBySubjectId(session, id);
			for(Enrollment enro : list2) {
				System.out.printf("%d, %d %n", enro.getStudentId(), enro.getSubjectId());
			}
			
			System.out.println("=== 강좌 id가 1인것 총 수강학생수 ===");
			System.out.println(dao.selectEnrollmentBySubjectIdCount(session, id));
			
			System.out.println("==== 학생 id가 1인 것 조회====");
			List<Enrollment>list3 = dao.selectEnrollmentByStudentId(session, 20120001);
			for(Enrollment enro : list3) {
				System.out.printf("%d, %d %n", enro.getStudentId(), enro.getSubjectId());
			}
			
			
			session.commit();
		}finally {
			session.close();
		}
		
}

	public static void main(String[] args) throws IOException {
		testEnrollment test = new testEnrollment();
		test.enrollmentService();
	}
}
