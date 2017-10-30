package sugang.service;

import java.util.List;

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
    */
   void addEnrollment(Enrollment enrollment);
   
   /**
    * enrollment 정보를 강좌 id로 삭제하는 메소드
    * 
    * @param id
    */
   
   void removeEnrollmentBySubjectId(int id);
   
   
   /**
    * enrollment 정보를 학생 id로 삭제하는 메소드
    * 
    * @param id
    */
   
   void removeEnrollmentByStudentId(int id);
   
   
   
   List<Enrollment> getEnrollmentList();
   
   List<Enrollment> findEnrollmentByStudentId(int id);
   
   int findEnrollmentBySubjectCount(int id);
   
}