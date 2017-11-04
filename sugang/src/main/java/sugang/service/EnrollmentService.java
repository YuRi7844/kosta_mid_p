package sugang.service;

import java.io.IOException;
import java.util.List;

import javax.naming.TimeLimitExceededException;
import javax.security.auth.login.LoginException;

import sugang.exception.DuplicatedStudentException;
import sugang.exception.DuplicatedSubjectException;
import sugang.exception.MaxSubjectEnrollmentException;
import sugang.exception.StudentNotFoundException;
import sugang.exception.SubjectNotFoundException;
import sugang.vo.Enrollment;

public interface EnrollmentService {
   /**
    * 한명의 학생이 강좌를 추가하는 메소드
    * 기본흐름
    *    1. 매개변수로 추가할 enrollment의 정보를 받는다
    *    2. enrollment의 정보를 저장소에 추가
    * 
    * 예외흐름
    *    2a. 기존 저장된 enrollment와 같은 값이 있으면 추가하지 않는다.
    * @param enrollment 
 * @throws DuplicatedSubjectException 
 * @throws IOException 
 * @throws MaxSubjectEnrollmentException 
 * @throws LoginException 
 * @throws TimeLimitExceededException 
    */
   void addEnrollment(Enrollment enrollment) throws DuplicatedSubjectException, IOException, MaxSubjectEnrollmentException, TimeLimitExceededException;
   
   /**
    * enrollment 정보를 강좌 id로 삭제하는 메소드
    * 
    * @param id
 * @throws DuplicatedSubjectException 
    */
   void removeEnrollmentByEnrollment(Enrollment enrollment);
   
   
   void removeEnrollmentBySubjectId(int id) throws SubjectNotFoundException;
   
   
   /**
    * enrollment 정보를 학생 id로 삭제하는 메소드
    * 
    * @param id
 * @throws DuplicatedStudentException 
    */
   
   void removeEnrollmentByStudentId(int id) throws StudentNotFoundException;
   
   
   
   List<Enrollment> getEnrollmentList();
   
   List<Enrollment> findEnrollmentByStudentId(int id);
   
   int findEnrollmentBySubjectCount(int id);
   
}