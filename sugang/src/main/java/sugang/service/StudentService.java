package sugang.service;

import java.util.List;

import sugang.vo.Student;

public interface StudentService {
	
	/**
	 * 한명의 학생 추가
	 * 기본흐름
	 * 	1. 매개변수로 추가할 회원정보를 받는다.
	 * 	2. 회원정보를 DB에 저장한다.(DAO객체에게 시킨다)
	 * 예외흐름
	 * 	2-a. studentId 중복
	 * @param student
	 */
	void addStudent(Student student);
	
	/**
	 * studentId를 인자로 받아 해당 학생 삭제
	 * 기본흐름
	 * 	1. 매개변수로 id를 받는다.
	 * 	2. 해당 id의 학생을 DB에서 삭제한다.
	 * 예외흐름
	 * 	2-a. 삭제하려는 학생이 없는경우 
	 * @param id
	 */
	void removeStudentById(String id);
	
	/**
	 * 수정할 학생을 매개변수로 받는다.
	 * 받은 학생의 ID를 제외한 나머지 정보를 수정한다.
	 * 기본흐름
	 * 	1. 매개변수로 수정할 학생을 받는다.
	 * 	2. id를 제외한 나머지 정보를 수정한다.
	 * 예외흐름
	 * 	2-a. 수정하려는 학생이 없는경우 
	 * @param student
	 */
	void updateStudent(Student student);
	
	/**
	 * 학생 전체조회
	 * 기본흐름
	 * 	1. 저장된 모든 학생을 List에 담아 리턴한다.
	 * @return
	 */
	List<Student> getStudentList();
	
	/**
	 * studentId로 학생 조회
	 * 기본흐름
	 * 	1. 조회할 학생 id를 매개변수로 받는다.
	 * 	2. 해당 학생을 조회하여 리턴한다.
	 * @param id
	 * @return
	 */
	Student findStudentById(String id);
}
