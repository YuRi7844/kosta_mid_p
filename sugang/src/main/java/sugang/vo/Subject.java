package sugang.vo;

import java.io.Serializable;

public class Subject implements Serializable{
	private int subjectId; // 과목코드
	private String subjectName; // 과목이름
	private int subjectCredit; // 학점수
	private String completion; //이수구분
	private int maxStudent; //수강최대인원
	private String day; // 요일
	private String subjectTime; // 시간
}
