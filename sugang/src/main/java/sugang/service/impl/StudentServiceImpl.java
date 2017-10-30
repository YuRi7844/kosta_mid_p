package sugang.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.StudentDao;
import sugang.dao.impl.StudentDaoImpl;
import sugang.service.StudentService;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Student;

public class StudentServiceImpl implements StudentService{
   private StudentDao dao;
   private SqlSessionFactory factory;
   private static StudentServiceImpl instance;

   private StudentServiceImpl() throws IOException {
      dao = StudentDaoImpl.getInstance();
      factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
   }

   public static StudentServiceImpl getInstance() throws IOException {
      if (instance == null)
         instance = new StudentServiceImpl();
      return instance;
   }

   @Override
   public void addStudent(Student student) {
      //TODO: Exception 만들이지면 수정.
      SqlSession session = null;
      try {
         session = factory.openSession();
         if (dao.selectStudentById(session, student.getStudentId()) != null) {
            //TODO: 예외 던지기(Duplicated)
         }
         dao.insertStudent(session, student);
         session.commit();
      } finally {
         session.close();
      }
   }

   @Override
   public void removeStudentById(int studentId){
      SqlSession session = null;
      try {
         session = factory.openSession();
         if(dao.selectStudentById(session, studentId) != null) {
            //TODO: 예외 던지기(NotFound)
         }
         dao.deleteStudentById(session, studentId);
      }finally {
         session.close();
      }
   }

   @Override
   public void updateStudent(Student student) {
      //TODO: Exception 정해지면 바꾸기
      
      SqlSession session = null;
      try {
         session = factory.openSession();
         if(dao.selectStudentById(session, student.getStudentId()) != null) {
            //TODO: 예외 던지기(NotFound)
         }
         dao.updateStudentById(session, student);
      }finally {
         session.close();
      }
   }

   @Override
   public List<Student> getStudentList() {
      SqlSession session = null;
      try {
         session = factory.openSession();
         return dao.selectAllStudent(session);
      }finally {
         session.close();
      }
   }

   @Override
   public Student findStudentById(int studentId) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         return dao.selectStudentById(session, studentId);
         
      }finally {
         session.close();
         
      }
   }

   @Override
   public List<Student> findStudentByName(String studentName) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         return dao.selectStudentByName(session, studentName);
      }finally {
         session.close();
      }
   }
}
   
