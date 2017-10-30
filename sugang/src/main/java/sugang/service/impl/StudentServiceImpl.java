package sugang.service.impl;

import java.util.List;

import sugang.service.StudentService;
import sugang.vo.Student;

public class StudentServiceImpl implements StudentService{

	private static StudentServiceImpl instance;

	private StudentServiceImpl() {

	}

	public static StudentServiceImpl getInstance() {
		if (instance == null)
			instance = new StudentServiceImpl();
		return instance;
	}

	@Override
	public void addStudent(Student student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeStudentById(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStudent(Student student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Student> getStudentList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Student findStudentById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
