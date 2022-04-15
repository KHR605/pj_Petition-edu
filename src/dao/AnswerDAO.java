package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.AnswerDTO;
import model.AnsweredDTO;
import model.ConsenterDTO;
import model.PetitionDTO;
import model.ScrapDTO;



public class AnswerDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static AnswerDAO answerDAO;
	
	
	public static AnswerDAO getInstance(){
		if(answerDAO == null){
			answerDAO = new AnswerDAO();
		}
		return answerDAO;
	}
	
	public void connect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
			if(conn == null)
				throw new Exception("�뜲�씠�꽣踰좎씠�뒪�뿉 �뿰寃고븷 �닔 �뾾�뒿�땲�떎.");
			
	}catch(Exception e){
		System.out.println("connect Error: " +e);
	}
  }
	
	public void disconnect() {
		try {
				stmt.close();
				conn.close();
		}catch(Exception e) {
			System.out.println("disconnect Error: " +e);
		}
	}
	
	
	public int insertAnswer(AnswerDTO dto) {
		int cnt = 0;
		connect();
	
		try {
			String sql = String.format("insert into petition_answer values(default, '"+dto.getPetition_seq()+"','"+dto.getAnswer_content()+"' ,NOW());");
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql); 
		}catch(Exception e) {
			System.out.println("insertAnswer Error:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public boolean answerDuplicate(String petition_seq) {
		connect();
		int cnt = 0;
		boolean flag = false;
		try {
			String sql="select count(*) from petition_answer where petition_seq = '"+petition_seq+"' ";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			if(cnt < 1) {
				flag = true;
			}
		}catch(Exception e) {
			System.out.println("answerDuplicate Error:" + e);
		}
		
		disconnect();
		return flag;
	}
	
	public AnswerDTO selectAnswerContent(String petition_seq) {
		connect();
		AnswerDTO dto = new AnswerDTO();
		try {
			String sql = String.format("select answer_content from petition_answer where petition_seq = '"+petition_seq+"'"); 
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setAnswer_content(rs.getString("answer_content"));
			}
		}catch(Exception e){
			System.out.println("selectAnswerContent:" +e);
		}
		
		return dto;
	}
	
	public ArrayList<AnsweredDTO> selectAnsweredPetitionList(int page, int limit) {
		connect();
		ArrayList<AnsweredDTO> articlelist = new ArrayList<AnsweredDTO>();
		String sql = "select * from petition join petition_answer on petition.petition_seq = petition_answer.petition_seq"
				     + " where petition_answer.answer_seq is not null limit ?,8";
		int startrow = (page-1)*8;
		try {	 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
		    rs = pstmt.executeQuery();
			while(rs.next()) {
				AnsweredDTO dto = new AnsweredDTO();
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setAgree_no(rs.getString("agree_no"));
				dto.setPetitioin_title(rs.getString("petition_title"));
				dto.setAnswer_seq(rs.getString("answer_seq"));
				dto.setAnswer_day(rs.getString("answer_day"));
				dto.setPetition_seq(rs.getString("petition_seq"));
				articlelist.add(dto);
			}
		}catch(Exception e){
			System.out.println("selectAnsweredPetitionList Error: " +e);
		}
		disconnect();
		
		return articlelist;
	}
	
	public int selectAnsweredPetitionListCount() {
		connect();
		int cnt = 0;
		
		try {
			String sql = String.format("select count(*) from petition join petition_answer on petition.petition_seq = petition_answer.petition_seq where petition_answer.answer_seq is not null"); 
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println("selectAnsweredPetitionListCount:" +e);
		}
		return cnt;
	}
}
