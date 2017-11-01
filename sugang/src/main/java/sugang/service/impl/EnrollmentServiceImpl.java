package sugang.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.EnrollmentDao;
import sugang.dao.SubjectDao;
import sugang.dao.impl.EnrollmentDaoImpl;
import sugang.dao.impl.SubjectDaoImpl;
import sugang.exception.DuplicatedStudentException;
import sugang.exception.DuplicatedSubjectException;
import sugang.exception.MaxSubjectEnrollmentException;
import sugang.service.EnrollmentService;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Enrollment;

public class EnrollmentServiceImpl implements EnrollmentService {
	private static EnrollmentServiceImpl instance;

	private SqlSessionFactory factory;
	private EnrollmentDao dao;
	private SubjectDao dao2;

	private EnrollmentServiceImpl() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		dao = EnrollmentDaoImpl.getInstance();
	}

	public static EnrollmentServiceImpl getInstance() throws IOException {
		if (instance == null) {
			instance = new EnrollmentServiceImpl();
		}
		return instance;
	}

	/**
	 * 기본흐름.
	 * 1. 신청한 강좌의 최대 수강인원 체크
	 *  - 1) max미만이면 2번으로
	 *  - 2) max이상이면 에러메세지 set
	 * 2. 중복수강신청 체크
	 *  - 1) 중복이 아니면 3번으로
	 *  - 2) 예외흐름
	 * 3. 중복 요일&&시간 체크
	 *  - 1) 중복이 아니면 수강신청 ok
	 *  - 2) 중복이면 에러메세지 set
	 * @throws IOException 
	 * @throws MaxSubjectEnrollmentException 
	 */
	@Override
	public void addEnrollment(Enrollment enrollment) throws DuplicatedSubjectException, IOException, MaxSubjectEnrollmentException {
		SqlSession session = null;
		String errorMessage = null;
		try {
			session = factory.openSession();
			Enrollment eno = dao.selectEnrollmentBySubjectIdAndStudentId(session, enrollment.getSubjectId(),
					enrollment.getStudentId());
			SubjectDaoImpl sub = SubjectDaoImpl.getInstance();
			System.out.println(eno+" "+sub);
			int maxCount = sub.selectSubjectMaxStudent(session, enrollment.getSubjectId());
			System.out.println("max : "+maxCount);
			int curr = findEnrollmentBySubjectCount(enrollment.getSubjectId());
			System.out.println("max : "+maxCount+"curr : "+curr);
			System.out.println(curr);
			if(maxCount > curr) {
				if (eno != null) {
						throw new DuplicatedSubjectException("이미 등록된 강좌입니다.", enrollment.getSubjectId());
				}else{
							dao.insertEnrollment(session, enrollment);
				}
			}else {
				throw new MaxSubjectEnrollmentException("수강 최대 인원 초과입니다.");
			}
			
			session.commit();
		} finally {
			session.close();
		}

	}

	@Override
	public void removeEnrollmentBySubjectId(int id) throws DuplicatedSubjectException {
		SqlSession session = null;
		try {
			session = factory.openSession();
			if (dao.selectEnrollmentBySubjectId(session, id).isEmpty()) {
				throw new DuplicatedSubjectException("없는 강좌코드입니다 ", id);
			}
			dao.deleteEnrollmentBySubjectId(session, id);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public void removeEnrollmentByStudentId(int id) throws DuplicatedStudentException {
		SqlSession session = null;
		try {
			session = factory.openSession();

			if (dao.selectEnrollmentByStudentId(session, id).isEmpty()) {
				throw new DuplicatedStudentException("없는 학생입니다.", id);
			}
			dao.deleteEnrollmentByStudentId(session, id);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Enrollment> getEnrollmentList() {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectEnrollment(session);
		} finally {
			session.close();
		}
	}

	@Override
	public int findEnrollmentBySubjectCount(int id) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectEnrollmentBySubjectIdCount(session, id);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Enrollment> findEnrollmentByStudentId(int id) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectEnrollmentByStudentId(session, id);
		} finally {
			session.close();
		}
	}

}
