package sugang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sugang.vo.Subject;


public interface SubjectDao {
	/**
	 * 강좌 전체조회
	 * @param session
	 * @return
	 */
	List<Subject> selectAllSubject(SqlSession session);
	
	/**
	 * 강좌 과목코드조회
	 * @param session
	 * @param subjectId
	 * @return
	 */
	Subject selectSubjectById(SqlSession session, int subjectId);
	
	/**
	 * 강좌 과목이름조회
	 * @param session
	 * @param subjectName
	 * @return
	 */
	List<Subject> selectSubjectByName(SqlSession session, String subjectName);

	/**
	 * 강좌 요일로 조회
	 * @param session
	 * @param day
	 * @return
	 */
	List<Subject> selectSubjectByDay(SqlSession session, String day);
	
	/**
	 * 강좌 이수구분으로 조회
	 * @param session
	 * @param completion
	 * @return
	 */
	List<Subject> selectSubjectByCompletion(SqlSession session, String completion);
	
	/**
	 * 과목코드에 해당하는 강좌를 찾아서 해당 강좌의 최대 수강인원을 return
	 * @param session
	 * @param subjectId
	 * @return
	 */
	int selectSubjectMaxStudent(SqlSession session, int subjectId);
	
	/**
	 * 과목코드에 해당하는 강좌를 찾아서 해당 강좌의 요일과 시간을 return
	 * @param session
	 * @param subjectId
	 * @return
	 */
	String selectSubjectDay(SqlSession session, int subjectId);
	
	
	String selectSubjectTime(SqlSession session, int subjectId);
}
