package sugang.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sugang.dao.EnrollmentDao;
import sugang.vo.Enrollment;

public class EnrollmentDaoImpl implements EnrollmentDao{
	
	private static EnrollmentDaoImpl instance;

	private EnrollmentDaoImpl() {
	}

	public static EnrollmentDaoImpl getInstance() {
		if (instance == null)
			instance = new EnrollmentDaoImpl();
		return instance;
	}

	private String makeSqlId(String id) {
		return "sugang.config.mapper.enrollmentMapper"+id;
	}
	
	@Override
	public int insertEnrollment(SqlSession session, Enrollment enrollment) {
		return session.insert(makeSqlId("insertEnrollment"), enrollment);
	}

	@Override
	public int deleteEnrollmentByStudentId(SqlSession session, int studentId) {
		return session.delete(makeSqlId("deleteEnrollmentByStudentId"), studentId);
	}

	@Override
	public int deleteEnrollmentBySubjectId(SqlSession session, int subjectId) {
		return session.delete(makeSqlId("deleteEnrollmentBySubjectId"), subjectId);
	}

	@Override
	public List<Enrollment> selectEnrollment(SqlSession session) {
		return session.selectList(makeSqlId("selectEnrollment"));
	}

	@Override
	public Enrollment selectEnrollmentBySubjectIdCount(SqlSession session, int subjectId) {
		return session.selectOne(makeSqlId("selectEnrollmentBySubjectIdCount"), subjectId);
	}

}