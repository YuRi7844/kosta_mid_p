package sugang.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.SubjectDao;
import sugang.vo.Subject;

public class SubjectDaoImpl implements SubjectDao{
	
	private static SubjectDaoImpl instance;

	private SubjectDaoImpl() {

	}

	public static SubjectDaoImpl getInstance() {
		if (instance == null)
			instance = new SubjectDaoImpl();
		return instance;
	}

	@Override
	public List<Subject> selectAllSubject(SqlSessionFactory session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Subject selectSubjectById(SqlSessionFactory session, int subjectId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subject> selectSubjectByName(SqlSessionFactory session, String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subject> selectSubjectByDay(SqlSessionFactory session, String day) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subject> selectSubjectByCompletion(SqlSessionFactory session, String completion) {
		// TODO Auto-generated method stub
		return null;
	}
}
