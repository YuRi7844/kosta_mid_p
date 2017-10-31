package sugang.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
	
	public String makeSqlId(String id) {
		return "sugang.config.mapper.subjectMapper." + id;
	}

	@Override
	public List<Subject> selectAllSubject(SqlSession session) {
		return session.selectList(makeSqlId("selectAllSubject"));
	}

	@Override
	public Subject selectSubjectById(SqlSession session, int subjectId) {
		return session.selectOne(makeSqlId("selectSubjectById"), subjectId);
	}

	@Override
	public List<Subject> selectSubjectByName(SqlSession session, String subjectName) {
		return session.selectList(makeSqlId("selectSubjectByName"), subjectName);
	}

	@Override
	public List<Subject> selectSubjectByDay(SqlSession session, String day) {
		return session.selectList(makeSqlId("selectSubjectByDay"), day);
	}

	@Override
	public List<Subject> selectSubjectByCompletion(SqlSession session, String completion) {
		return session.selectList(makeSqlId("selectSubjectByCompletion"), completion);
	}

	@Override
	public int selectSubjectMaxStudent(SqlSession session, int subjectId) {
		return session.selectOne(makeSqlId("selectSubjectMaxStudent"), subjectId);
	}
}
