package sugang.service;

import java.util.List;

import sugang.vo.Subject;

public interface SubjectService {
	
	/**
	 * 강좌 전체 조회
	 * @return
	 */
	List<Subject> getSubjectList();
	
	/**
	 * 과목코드로 강좌조회
	 * @param studentId
	 * @return
	 */
	Subject findSubjectById(int studentId);
	
	/**
	 * 과목이름을 인자로 받아 
	 * 해당 인자값을 이름에 포함하는 강좌들을 조회
	 * @param studentName
	 * @return
	 */
	List<Subject> findSubjectByName(String studentName);
	
	/**
	 * 요일에 대한 값을 인자로 받아 해당 요일에 수업이 있는 강좌들을 조회
	 * @param day
	 * @return
	 */
	List<Subject> findSubjectByDay(String day);
	
	/**
	 * 이수구분에 대한 값을 인자로 받아 해당하는 강좌들을 조회
	 * @param completion
	 * @return
	 */
	List<Subject> findSubjectByCompletion(String completion);
	
	/**
	 * 과목코드로 강좌를 조회하여 해당강좌가 가지는 최대수강가능인원 값을 리턴
	 * @param studentId
	 * @return
	 */
	int findSubjectMaxStudent(int subjectId);
}
