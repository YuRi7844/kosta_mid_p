package sugang.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sugang.vo.Student;

public interface StudentDao {

   /**
    * 한 회원 정보를 insert 처리하는 메소드.
    * 등록된 row 수를 리턴한다.
    * @param session
    * @param student
    * @return
    */
   int insertStudent(SqlSession session, Student student);
   
   /**
    * 한 회원정보를 update하는 메소드. 
    * id가 일치하는 행의 다른 속성값들을 update
    * update한 row수를 리턴.
    * @param session
    * @param student
    * @return
    */
   int updateStudentById(SqlSession session, Student student);
   
   /**
    * 회원 id로 회원을 삭제
    * 삭제된 row수를 리턴
    * @param session
    * @param studentId
    * @return
    */
   int deleteStudentById(SqlSession session, int studentId);
   
   /**
    * 전체 회원정보를 조회하는 메소드
    * @param session
    * @return
    */
   List<Student> selectAllStudent(SqlSession session);
   
   /**
    * 학생id로 학생조회
    * @param session
    * @return
    */
   Student selectStudentById(SqlSession session, int studentId);
   /**
    * 매개변수로 받은 학생의 이름으로 조회
    * 
    * @param session
    * @param studentName
    * @return
    */
   List<Student> selectStudentByName(SqlSession session, String studentName);
}