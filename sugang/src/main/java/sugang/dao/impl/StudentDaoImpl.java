package sugang.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sugang.dao.StudentDao;
import sugang.vo.Student;

public class StudentDaoImpl implements StudentDao {
   private static StudentDaoImpl instance;

   private StudentDaoImpl() {

   }

   public static StudentDaoImpl getInstance() {
      if (instance == null)
         instance = new StudentDaoImpl();
      return instance;
   }

   public String makeSqlId(String id) {
      return "sugang.config.mapper.studentMapper." + id;
   }

   @Override
   public int insertStudent(SqlSession session, Student student) {
      return session.insert(makeSqlId("insertStudent"), student);
   }

   @Override
   public int updateStudentById(SqlSession session, Student student) {
      return session.update(makeSqlId("updateStudentById"), student);
   }

   @Override
   public int deleteStudentById(SqlSession session, int studentId) {
      return session.delete(makeSqlId("deleteStudentById"), studentId);
   }

   @Override
   public List<Student> selectAllStudent(SqlSession session) {
      return session.selectList(makeSqlId("selectAllStudent"));
   }

   @Override
   public Student selectStudentById(SqlSession session, int studentId) {
      return session.selectOne(makeSqlId("selectStudentById"), studentId);
   }

   @Override
   public List<Student> selectStudentByName(SqlSession session, String studentName) {
      return session.selectList(makeSqlId("selectStudentByName"), studentName);
   }
   

}