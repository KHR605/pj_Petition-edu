package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.AnswerDTO;
import model.PetitionDTO;

public class ToAnswerPetitionDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static ToAnswerPetitionDAO toAnswerPetitionDAO;
	
	
	public static ToAnswerPetitionDAO getInstance(){
		if(toAnswerPetitionDAO == null){
			toAnswerPetitionDAO = new ToAnswerPetitionDAO();
		}
		return toAnswerPetitionDAO;
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
	
	
	// 硫붿냼�뱶
	public int selectListToAnswerPeitionCount() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where agree_no >= 1000");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 媛� 諛섑솚
			}
		}catch(Exception ex){
			System.out.println("selectListToAnswerPeitionCount Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	
	public ArrayList<PetitionDTO> selectToAnswerpetitionList(int page, int limit){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where agree_no >= 1000 and petition_seq not in(select petition_seq from petition_answer) limit ?,10";
		int startrow=(page-1)*10;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PetitionDTO dto = new PetitionDTO();
				dto.setPetition_seq(rs.getString("petition_seq"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPetition_title(rs.getString("petition_title"));
				dto.setPetition_content(rs.getString("petition_content"));
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setAgree_no(rs.getString("agree_no"));
				articleList.add(dto);	
			}
		}catch(Exception e) {
			System.out.println("selectToAnswerpetitionList Error:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	public PetitionDTO selectPetitionContent(String petition_seq) {
		connect();
		PetitionDTO dto = new PetitionDTO();
		try {
			String sql = String.format("select petition_content from petition where petition_seq = '"+petition_seq+"'"); 
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setPetition_content(rs.getString("petition_content"));
			}
		}catch(Exception e){
			System.out.println("selectPetitionContent:" +e);
		}
		
		return dto;
	}
	
	public ArrayList<PetitionDTO> selectWaitForAnswerpetitionList(){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where agree_no >= 1000 and petition_seq not in(select petition_seq from petition_answer)";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PetitionDTO dto = new PetitionDTO();
				dto.setPetition_seq(rs.getString("petition_seq"));
				dto.setPetition_title(rs.getString("petition_title"));
				dto.setPetition_content(rs.getString("petition_content"));
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setAgree_no(rs.getString("agree_no"));
				articleList.add(dto);	
			}
		}catch(Exception e) {
			System.out.println("selectWaitForAnswerpetitionList Error:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
}
