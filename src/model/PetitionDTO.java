package model;

public class PetitionDTO {
	private String petition_seq;
	private String user_id;
	private String petition_title;
	private String petition_content;
	private String petition_registration_day;
	private String petition_expire_day;
	private String agree_no;
	public String getPetition_seq() {
		return petition_seq;
	}
	public void setPetition_seq(String petition_seq) {
		this.petition_seq = petition_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPetition_title() {
		return petition_title;
	}
	public void setPetition_title(String petition_title) {
		this.petition_title = petition_title;
	}
	public String getPetition_content() {
		return petition_content;
	}
	public void setPetition_content(String petition_content) {
		this.petition_content = petition_content;
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
	
	
	
	
}
