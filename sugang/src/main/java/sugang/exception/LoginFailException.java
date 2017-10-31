package sugang.exception;

public class LoginFailException extends Exception{
	//private static final long serialVersionUID = 1L;
		
		public LoginFailException() {}
		public LoginFailException(String failMessage) {
			super(failMessage);
		}
}
