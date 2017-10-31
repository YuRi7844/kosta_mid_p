package sugang.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.SubjectDao;
import sugang.dao.impl.SubjectDaoImpl;
import sugang.service.SubjectService;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Subject;

public class SubjectServiceImpl implements SubjectService{
	private static SubjectDao dao;
	private SqlSessionFactory factory;
	private static SubjectServiceImpl instance;

	private SubjectServiceImpl() throws IOException {
		dao = SubjectDaoImpl.getInstance();
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
	}

	public static SubjectServiceImpl getInstance() throws IOException {
		if (instance == null)
			instance = new SubjectServiceImpl();
		return instance;
	}

	@Override
	public List<Subject> getSubjectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Subject findSubjectById(int subjectId) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectSubjectById(session, subjectId);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Subject> findSubjectByName(String subjectName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subject> findSubjectByDay(String day) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Subject> findSubjectByCompletion(String completion) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findSubjectMaxStudent(int subjectId) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectSubjectMaxStudent(session, subjectId);
		} finally {
			session.close();
		}
	}
}
