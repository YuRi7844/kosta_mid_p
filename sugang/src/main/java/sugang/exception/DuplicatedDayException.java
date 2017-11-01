package sugang.exception;

public class DuplicatedDayException extends Exception{

	//수강신청 시 시간중복
	public DuplicatedDayException() {}
	public DuplicatedDayException(String failMessage) {
		super(failMessage);
	}
}
