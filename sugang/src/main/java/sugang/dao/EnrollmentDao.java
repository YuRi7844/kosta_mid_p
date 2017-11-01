package sugang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sugang.vo.Enrollment;

public interface EnrollmentDao {
 
		
		/**
		 * 수강신청 → StudentClass에 Subject 삽입
		 * @param session
		 * @param studentClass
		 * @return
		 */
		int insertEnrollment(SqlSession session, Enrollment enrollment);
			
		
		/**
		 * StudentClass에 있는 강의 전체 삭제
		 * @param session
		 * @param studentClass
		 * @return
		 */
		int deleteEnrollmentByStudentId(SqlSession session, int studentId);
		
		/**
		 * 강의 코드로 수강신청현황 테이블의 row 삭제
		 * @param session
		 * @param subjectId
		 * @return
		 */
		
		int deleteEnrollmentBySubjectId(SqlSession session, int subjectId);
		

		/**
		 * 수강신청 테이블 전체 조회
		 * @param session
		 * @param subjectName
		 * @return
		 */
		List<Enrollment> selectEnrollment(SqlSession session);
		
		/**
		 * 강의 코드로 수강신청 테이블에 들어간 강의 select
		 * @param session
		 * @param sujectId
		 * @return
		 */
		int selectEnrollmentBySubjectIdCount(SqlSession session, int sujectId);

		/**
		 * 강의 id로 조회
		 * @param session
		 * @param subjectId
		 * @return
		 */
		public List<Enrollment> selectEnrollmentBySubjectId(SqlSession session, int subjectId);
		
		/**
		 * 학생 id로 조회
		 * @param session
		 * @param studentId
		 * @return
		 */
		public List<Enrollment> selectEnrollmentByStudentId(SqlSession session, int studentId);
		
		/**
		 * 학생id, 강의id로 조회
		 * @param session
		 * @param sujectId
		 * @param studnetId
		 * @return
		 */
		Enrollment selectEnrollmentBySubjectIdAndStudentId(SqlSession session, int sujectId, int studnetId);

		

}