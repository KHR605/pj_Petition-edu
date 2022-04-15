package model;

public class AnswerDTO {
	private String answer_seq;
	private String petition_seq;
	private String answer_content;
	private String answer_day;
	
	public String getAnswer_seq() {
		return answer_seq;
	}
	public void setAnswer_seq(String answer_seq) {
		this.answer_seq = answer_seq;
	}
	public String getPetition_seq() {
		return petition_seq;
	}
	public void setPetition_seq(String petition_seq) {
		this.petition_seq = petition_seq;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getAnswer_day() {
		return answer_day;
	}
	public void setAnswer_day(String answer_day) {
		this.answer_day = answer_day;
	}
	
	
}
