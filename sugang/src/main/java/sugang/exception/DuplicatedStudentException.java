package sugang.exception;

public class DuplicatedStudentException extends Exception{

	//수강신청시 학생 중복
	
	private static final long serialVersionUID = 1L;
	
	private int duplicatedStudentId; 
	public DuplicatedStudentException(){}
	public DuplicatedStudentException(String message){
		super(message);
	}
	public DuplicatedStudentException(String message, int duplicatedStudentId) {
		super(message);
		this.duplicatedStudentId = duplicatedStudentId;
	}
	public int getDuplicatedStudentId() {
		return duplicatedStudentId;
	}
}
