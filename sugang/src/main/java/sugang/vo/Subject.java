package sugang.vo;

import java.io.Serializable;

public class Subject implements Serializable {
	private int subjectId; // 과목코드
	private String subjectName; // 과목이름
	private int subjectCredit; // 학점수
	private String completion; // 이수구분
	private int maxStudent; // 수강최대인원
	private String day; // 요일
	private String subjectTime; // 시간

	public Subject() {
	}

	public Subject(int subjectId, String subjectName, int subjectCredit, String completion) {
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.subjectCredit = subjectCredit;
		this.completion = completion;
	}

	public Subject(int subjectId, String subjectName, int subjectCredit, String completion, int maxStudent, String day,
			String subjectTime) {
		this.subjectId = subjectId;
		this.subjectName = subjectName;
		this.subjectCredit = subjectCredit;
		this.completion = completion;
		this.maxStudent = maxStudent;
		this.day = day;
		this.subjectTime = subjectTime;
	}

	//getter(), setter()
	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getSubjectCredit() {
		return subjectCredit;
	}

	public void setSubjectCredit(int subjectCredit) {
		this.subjectCredit = subjectCredit;
	}

	public String getCompletion() {
		return completion;
	}

	public void setCompletion(String completion) {
		this.completion = completion;
	}

	public int getMaxStudent() {
		return maxStudent;
	}

	public void setMaxStudent(int maxStudent) {
		this.maxStudent = maxStudent;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getSubjectTime() {
		return subjectTime;
	}

	public void setSubjectTime(String subjectTime) {
		this.subjectTime = subjectTime;
	}

	//toString
	@Override
	public String toString() {
		return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + ", subjectCredit=" + subjectCredit
				+ ", completion=" + completion + ", maxStudent=" + maxStudent + ", day=" + day + ", subjectTime="
				+ subjectTime + "]";
	}
	
	//equals(), hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((completion == null) ? 0 : completion.hashCode());
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + maxStudent;
		result = prime * result + subjectCredit;
		result = prime * result + subjectId;
		result = prime * result + ((subjectName == null) ? 0 : subjectName.hashCode());
		result = prime * result + ((subjectTime == null) ? 0 : subjectTime.hashCode());
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
		Subject other = (Subject) obj;
		if (completion == null) {
			if (other.completion != null)
				return false;
		} else if (!completion.equals(other.completion))
			return false;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		if (maxStudent != other.maxStudent)
			return false;
		if (subjectCredit != other.subjectCredit)
			return false;
		if (subjectId != other.subjectId)
			return false;
		if (subjectName == null) {
			if (other.subjectName != null)
				return false;
		} else if (!subjectName.equals(other.subjectName))
			return false;
		if (subjectTime == null) {
			if (other.subjectTime != null)
				return false;
		} else if (!subjectTime.equals(other.subjectTime))
			return false;
		return true;
	}
}
