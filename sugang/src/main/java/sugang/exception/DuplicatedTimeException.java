package sugang.exception;

public class DuplicatedTimeException extends Exception{

	//수강신청 시 시간중복
	public DuplicatedTimeException() {}
	public DuplicatedTimeException(String failMessage) {
		super(failMessage);
	}
}
