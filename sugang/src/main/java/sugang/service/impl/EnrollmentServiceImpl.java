package sugang.service.impl;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import sugang.dao.EnrollmentDao;
import sugang.dao.SubjectDao;
import sugang.dao.impl.EnrollmentDaoImpl;
import sugang.service.EnrollmentService;
import sugang.util.SqlSessionFactoryManager;
import sugang.vo.Enrollment;

public class EnrollmentServiceImpl implements EnrollmentService{
   private static EnrollmentServiceImpl instance;

   private SqlSessionFactory factory;
   private EnrollmentDao dao;
   private SubjectDao subjectdao;

   private EnrollmentServiceImpl() throws IOException{
      factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
      dao = EnrollmentDaoImpl.getInstance();
      //subjectdao = subjectdao.getInstance();
   }

   public static EnrollmentServiceImpl getInstance() throws IOException {
      if (instance == null) {
         instance = new EnrollmentServiceImpl();
      }
      return instance;
   }
   
   
   @Override
   public void addEnrollment(Enrollment enrollment) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         // TODO 전체 수강인원 체크
         if(dao.selectEnrollmentByStudentId(session, enrollment.getStudentId()) != null) {
            if(dao.selectEnrollmentBySubjectId(session, enrollment.getSubjectId()) != null) {
               // 익셉션!!!
            }else{
               dao.insertEnrollment(session, enrollment);
            }
         }else {
            dao.insertEnrollment(session, enrollment);
         }
      session.commit();
      }finally {
         session.close();
      }
   
   }
   
   @Override
   public void removeEnrollmentBySubjectId(int id) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         if(dao.selectEnrollmentBySubjectId(session, id)==null) {
            //익셉션
         }
         dao.deleteEnrollmentBySubjectId(session, id);
         session.commit();
      }finally {
         session.close();
      }
   }

   @Override
   public void removeEnrollmentByStudentId(int id) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         if(dao.selectEnrollmentByStudentId(session, id)==null) {
            //익셉션
         }
         dao.deleteEnrollmentByStudentId(session, id);
         session.commit();
      }finally {
         session.close();
      }
   }

   @Override
   public List<Enrollment> getEnrollmentList() {
      SqlSession session = null;
      try {
         session = factory.openSession();
         return dao.selectEnrollment(session);
      }finally {
         session.close();
      }
   }

   @Override
   public int findEnrollmentBySubjectCount(int id) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         return dao.selectEnrollmentBySubjectIdCount(session, id);
      }finally {
         session.close();
      }
   }

   @Override
   public List<Enrollment> findEnrollmentByStudentId(int id) {
      SqlSession session = null;
      try {
         session = factory.openSession();
         return dao.selectEnrollmentByStudentId(session, id);
      }finally{
         session.close();
      }
   }

}