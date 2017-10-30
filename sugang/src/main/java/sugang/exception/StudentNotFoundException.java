package sugang.exception;

public class StudentNotFoundException extends Exception{
	
	//학생 찾을 수 없는
	
	private static final long serialVersionUID = 1L;
	
	private int failStudentId;
	public StudentNotFoundException(){}
	public StudentNotFoundException(String message){
		super(message);
	}
	public StudentNotFoundException(String message, int failStudentId) {
		super(message);
		this.failStudentId = failStudentId;
	}
	public int getFailStudentId() {
		return failStudentId;
	}
	
}

/*
 * 수강신청/학생 등록시 중복체크
 * 학생 수정/삭제시 학생이 존재하지 않는 경우
 * 강의가 없을 경우
*/
//byId → subjectId, studentId 둘 다 Primary Key

