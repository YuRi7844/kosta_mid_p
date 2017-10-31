package sugang.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.EnrollmentDao;
import sugang.dao.SubjectDao;
import sugang.dao.impl.EnrollmentDaoImpl;
import sugang.exception.DuplicatedStudentException;
import sugang.exception.DuplicatedSubjectException;
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
	 * 저기 list에서 나온 두개의 값이 studentId == enrollment.studentid && subjectId =
	 * enrollment.subjectId
	 */
	@Override
	public void addEnrollment(Enrollment enrollment) throws DuplicatedSubjectException {
		SqlSession session = null;
		try {
			session = factory.openSession();
			Enrollment eno = dao.selectEnrollmentBySubjectIdAndStudentId(session, enrollment.getSubjectId(),
					enrollment.getStudentId());

			if (eno != null) {
				if (enrollment.getSubjectId() == eno.getSubjectId()
						&& enrollment.getStudentId() == eno.getStudentId()) {
					throw new DuplicatedSubjectException("이미 등록된 강좌입니다.", enrollment.getSubjectId());
				} else {
					dao.insertEnrollment(session, enrollment);
				}
			}
			dao.insertEnrollment(session, enrollment);
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
