package sugang.exception;

public class SubjectNotFoundException extends Exception{

	private static final long serialVersionUID = 1L;
	
	private int failSubjectId;
	
	public SubjectNotFoundException() {}
	public SubjectNotFoundException(String message) {
		super(message);
	}
	
	public SubjectNotFoundException(String message, int failSubjectId) {
		super(message);
		this.failSubjectId = failSubjectId;
	}
	
	public int getFailSubjectId() {
		return failSubjectId;
	}
	
}
