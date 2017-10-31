package sugang.vo;

public class Student {
   private int studentId;
   private String studentName;
   private String major;
   private String studentPw;
   private int grade;
   private int maxCredit;
   
   public Student() {}

   public Student(int studentId, String studentName, String major, String studentPw, int grade, int maxCredit) {
      this.studentId = studentId;
      this.studentName = studentName;
      this.major = major;
      this.studentPw = studentPw;
      this.grade = grade;
      this.maxCredit = maxCredit;
   }

   @Override
   public String toString() {
      return "Student [studentId=" + studentId + ", studentName=" + studentName + ", major=" + major + ", studentPw="
            + studentPw + ", grade=" + grade + ", maxCredit=" + maxCredit + "]";
   }

   public int getStudentId() {
      return studentId;
   }

   public void setStudentId(int studentId) {
      this.studentId = studentId;
   }

   public String getStudentName() {
      return studentName;
   }

   public void setStudentName(String studentName) {
      this.studentName = studentName;
   }

   public String getMajor() {
      return major;
   }

   public void setMajor(String major) {
      this.major = major;
   }

   public String getStudentPw() {
      return studentPw;
   }

   public void setStudentPw(String studentPw) {
      this.studentPw = studentPw;
   }

   public int getGrade() {
      return grade;
   }

   public void setGrade(int grade) {
      this.grade = grade;
   }

   public int getMaxCredit() {
      return maxCredit;
   }

   public void setMaxCredit(int maxCredit) {
      this.maxCredit = maxCredit;
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + grade;
      result = prime * result + ((major == null) ? 0 : major.hashCode());
      result = prime * result + maxCredit;
      result = prime * result + studentId;
      result = prime * result + ((studentName == null) ? 0 : studentName.hashCode());
      result = prime * result + ((studentPw == null) ? 0 : studentPw.hashCode());
      return result;
   }

   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      Student other = (Student) obj;
      if (grade != other.grade)
         return false;
      if (major == null) {
         if (other.major != null)
            return false;
      } else if (!major.equals(other.major))
         return false;
      if (maxCredit != other.maxCredit)
         return false;
      if (studentId != other.studentId)
         return false;
      if (studentName == null) {
         if (other.studentName != null)
            return false;
      } else if (!studentName.equals(other.studentName))
         return false;
      if (studentPw == null) {
         if (other.studentPw != null)
            return false;
      } else if (!studentPw.equals(other.studentPw))
         return false;
      return true;
   }

   
   
}