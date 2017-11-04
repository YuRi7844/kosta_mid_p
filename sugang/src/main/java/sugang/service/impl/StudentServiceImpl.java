package sugang.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.StudentDao;
import sugang.dao.impl.StudentDaoImpl;
import sugang.exception.DuplicatedStudentException;
import sugang.exception.StudentNotFoundException;
import sugang.service.StudentService;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Student;

public class StudentServiceImpl implements StudentService {
	private StudentDao dao;
	private SqlSessionFactory factory;
	private static StudentServiceImpl instance;

	private StudentServiceImpl() throws IOException {
		dao = StudentDaoImpl.getInstance();
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
	}

	public static StudentServiceImpl getInstance() throws IOException {
		if (instance == null)
			instance = new StudentServiceImpl();
		return instance;
	}

	@Override
	public void addStudent(Student student) throws DuplicatedStudentException {
		SqlSession session = null;
		try {
			session = factory.openSession();
			if (dao.selectStudentById(session, student.getStudentId()) != null) {
				throw new DuplicatedStudentException("해당 학번의 학생이 이미 존재합니다.");
			}
			dao.insertStudent(session, student);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public void removeStudentById(int studentId) throws StudentNotFoundException {
		SqlSession session = null;
		try {
			session = factory.openSession();
			if (dao.selectStudentById(session, studentId) == null) {
				throw new StudentNotFoundException("해당 학번의 학생은 존재하지 않습니다.");
			}
			dao.deleteStudentById(session, studentId);
			dao.deleteEnrollmentByStudentId(session, studentId);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public void updateStudent(Student student) throws StudentNotFoundException {

		SqlSession session = null;
		try {
			session = factory.openSession();
			if (dao.selectStudentById(session, student.getStudentId()) == null) {
				throw new StudentNotFoundException("수정할 학생이 존재하지 않습니다.");
			}
			dao.updateStudentById(session, student);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public List<Student> getStudentList() {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectAllStudent(session);
		} finally {
			session.close();
		}
	}

	@Override
	public Student findStudentById(int studentId) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectStudentById(session, studentId);

		} finally {
			session.close();

		}
	}



	@Override
	public List<Student> findStudentByName(String studentName) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			return dao.selectStudentByName(session, studentName);
		} finally {
			session.close();
		}
	}
}
