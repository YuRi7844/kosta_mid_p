package sugang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import sugang.vo.Subject;

public interface SubjectDao {
	/**
	 * 강좌 전체조회
	 * @param session
	 * @return
	 */
	List<Subject> selectAllSubject(SqlSessionFactory session);
	
	/**
	 * 강좌 과목코드조회
	 * @param session
	 * @param subjectId
	 * @return
	 */
	Subject selectSubjectById(SqlSessionFactory session, int subjectId);
	
	/**
	 * 강좌 과목이름조회
	 * @param session
	 * @param subjectName
	 * @return
	 */
	List<Subject> selectSubjectByName(SqlSessionFactory session, String subjectName);

	/**
	 * 강좌 요일로 조회
	 * @param session
	 * @param day
	 * @return
	 */
	List<Subject> selectSubjectByDay(SqlSessionFactory session, String day);
	
	/**
	 * 강좌 이수구분으로 조회
	 * @param session
	 * @param completion
	 * @return
	 */
	List<Subject> selectSubjectByCompletion(SqlSessionFactory session, String completion);
}
