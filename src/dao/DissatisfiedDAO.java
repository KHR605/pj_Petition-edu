package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.PetitionDTO;

public class DissatisfiedDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static DissatisfiedDAO dissatisfiedDAO;
	
	
	public static DissatisfiedDAO getInstance(){
		if(dissatisfiedDAO == null){
			dissatisfiedDAO = new DissatisfiedDAO();
		}
		return dissatisfiedDAO;
	}
	
	public void connect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
			if(conn == null)
				throw new Exception("DB connect Error.");
			
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
	
	public int selectListDissatisfiedCount() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_expire_day < now() and agree_no < 1000 ");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("selectListDissatisfiedCount Error: "+ ex);
		}
		
	
		
		return listCount;
	}
	
	
	public ArrayList<PetitionDTO> selectDissatisfiedPetitionList(int page, int limit){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_expire_day < now() and agree_no < 1000 limit ?,8";
		int startrow=(page-1)*8;
	
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
			System.out.println("selectDissatisfiedPetitionList Error:" + e);
		}
		
		
		
		return articleList;
	}
	
	public int selectListDissatisfiedCount(String search) {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_expire_day < now() and agree_no < 1000 and petition_title LIKE '%"+search+"%' ");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("selectListDissatisfiedCount Error: "+ ex);
		}
		
	
		
		return listCount;
	}
	
	
	public ArrayList<PetitionDTO> selectDissatisfiedPetitionList(int page, int limit, String search){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_expire_day < now() and agree_no < 1000 and petition_title LIKE '%"+search+"%' limit ?,8";
		int startrow=(page-1)*8;
	
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
			System.out.println("selectDissatisfiedPetitionList Error:" + e);
		}
		
		
		
		return articleList;
	}
}
