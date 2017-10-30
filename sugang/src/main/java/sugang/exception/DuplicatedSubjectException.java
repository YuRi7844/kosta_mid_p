package sugang.exception;

public class DuplicatedSubjectException extends Exception {

	// 수강신청시 수업 중복

	private static final long serialVersionUID = 1L;

	private int duplicatedSubjectId;

	public DuplicatedSubjectException() {
	}

	public DuplicatedSubjectException(String message) {
		super(message);
	}

	public DuplicatedSubjectException(String message, int duplicatedSubjectId) {
		super(message);
		this.duplicatedSubjectId = duplicatedSubjectId;
	}

	public int getDuplicatedId() {
		return duplicatedSubjectId;
	}

}
