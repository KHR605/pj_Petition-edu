package model;

public class AnsweredDTO {
	private String petition_seq;
	private String petitioin_title;
	private String petition_registration_day;
	private String petition_expire_day;
	private String agree_no;
	private String answer_seq;
	private String answer_day;
	public String getPetition_seq() {
		return petition_seq;
	}
	public void setPetition_seq(String petition_seq) {
		this.petition_seq = petition_seq;
	}
	public String getPetitioin_title() {
		return petitioin_title;
	}
	public void setPetitioin_title(String petitioin_title) {
		this.petitioin_title = petitioin_title;
	}
	public String getPetition_registration_day() {
		return petition_registration_day;
	}
	public void setPetition_registration_day(String petition_registration_day) {
		this.petition_registration_day = petition_registration_day;
	}
	public String getPetition_expire_day() {
		return petition_expire_day;
	}
	public void setPetition_expire_day(String petition_expire_day) {
		this.petition_expire_day = petition_expire_day;
	}
	public String getAgree_no() {
		return agree_no;
	}
	public void setAgree_no(String agree_no) {
		this.agree_no = agree_no;
	}
	public String getAnswer_seq() {
		return answer_seq;
	}
	public void setAnswer_seq(String answer_seq) {
		this.answer_seq = answer_seq;
	}
	public String getAnswer_day() {
		return answer_day;
	}
	public void setAnswer_day(String aswer_day) {
		this.answer_day = aswer_day;
	}
}
