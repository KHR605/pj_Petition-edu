package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.BoardDTO;
import model.PetitionDTO;

public class SearchDAO {

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static SearchDAO searchDAO;
	
	
	public static SearchDAO getInstance(){
		if(searchDAO == null){
			searchDAO = new SearchDAO();
		}
		return searchDAO;
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
	
	public int selectListEndPetiSearchCount(String search) {
		connect();
	
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_expire_day < now() and (petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%')");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("selectListEndPetiSearchCount Error: "+ ex);
		}
		
		
		return listCount;
	}
	
	public int selectListEndPetiSearchCount(String search, String radioCk) {
		connect();
	
		int listCount= 0;
		String sql = "select count(*) from petition where petition_expire_day < now() and (petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%')";
		String sql2 = "select count(*) from petition where petition_expire_day < now() and petition_title LIKE '%"+search+"%'";
		String sql3 = "select count(*) from petition where petition_expire_day < now() and  petition_content LIKE '%"+search+"%'";
		try{
			
			if(radioCk.equals("1") || radioCk == null) {
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1);
				}
			}else if(radioCk.equals("2")) {
				pstmt=conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1);
				}
			}
			else if(radioCk.equals("3")) {
				pstmt=conn.prepareStatement(sql3);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1);
				}
			}
		}catch(Exception ex){
			System.out.println("selectListEndPetiSearchCount Error: "+ ex);
		}
		
		
		return listCount;
	}
	
	public int searchEverythingCount(String search, String radioCk) {
		connect();
		System.out.println("searchDAO: " + radioCk);
		
		int listCount= 0;
		try{
			String sql = "select sum(cnt) from (select count(*) as cnt from petition where petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%' "
					     + "UNION ALL select count(*) as cnt from board where board_title LIKE '%"+search+"%' or board_content LIKE '%"+search+"%') as countAll";
			
			String sql2 = "select sum(cnt) from (select count(*) as cnt from petition where petition_title LIKE '%"+search+"%' "
					+ "UNION ALL select count(*) as cnt from board where board_title LIKE '%"+search+"%') as countAll";
			
			String sql3 = "select sum(cnt) from (select count(*) as cnt from petition where petition_content LIKE '%"+search+"%' "
					+ "UNION ALL select count(*) as cnt from board where board_content LIKE '%"+search+"%') as countAll";
					
			if(radioCk.equals("1") || radioCk == null) {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				if(rs.next()){
					listCount=rs.getInt(1);
					}
			}else if(radioCk.equals("2")) {
				pstmt=conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();

				if(rs.next()){
					listCount=rs.getInt(1);
					}
			}else if(radioCk.equals("3")) {
				pstmt=conn.prepareStatement(sql3);
				rs = pstmt.executeQuery();

				if(rs.next()){
					listCount=rs.getInt(1);
					}
			}
		}catch(Exception ex){
			System.out.println("searchEverythingCount Error: "+ ex);
		}
		
		
		return listCount;
	}
	
	
	public ArrayList<PetitionDTO> selectEndPetitionSearchList(int page, int limit, String search){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_expire_day < now() and petition_title LIKE '%"+search+"%' limit ?,8";
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
			System.out.println("selectEndPetitionSearchList Error:" + e);
		}
		

		
		return articleList;
	}
	
	public ArrayList<PetitionDTO> selectIngPetitionSearchList(String search, String radioCk){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_expire_day > now() and (petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%')";
		String sql2 = "select * from petition where petition_expire_day > now() and petition_title LIKE '%"+search+"%'";
		String sql3 = "select * from petition where petition_expire_day > now() and petition_content LIKE '%"+search+"%'";
		try {
			
			if(radioCk.equals("1") || radioCk == null) {
				pstmt = conn.prepareStatement(sql);
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
			}else if(radioCk.equals("2")) {
				pstmt = conn.prepareStatement(sql2);
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
			}else if(radioCk.equals("3")) {
				pstmt = conn.prepareStatement(sql3);
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
			}
		}catch(Exception e) {
			System.out.println("selectIngPetitionSearchList Error:" + e);
		}
		

		
		return articleList;
	}
	
	
	public ArrayList<PetitionDTO> selectEndPetitionSearchList(String search, String radioCk){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_expire_day < now() and (petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%')";
		String sql2 = "select * from petition where petition_expire_day < now() and petition_title LIKE '%"+search+"%'";
		String sql3 = "select * from petition where petition_expire_day < now() and petition_content LIKE '%"+search+"%'";
	
		try {
			
			if(radioCk.equals("1") || radioCk == null) {
				pstmt = conn.prepareStatement(sql);
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
			}else if(radioCk.equals("2")) {
				pstmt = conn.prepareStatement(sql2);
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
			}else if(radioCk.equals("3")) {
				pstmt = conn.prepareStatement(sql3);
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
			}
		}catch(Exception e) {
			System.out.println("selectEndPetitionSearchList Error:" + e);
		}
		

		
		return articleList;
	}
	
	public ArrayList<BoardDTO> selectBoardSearchList(String search){
		connect();
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		String sql = "select * from board where board_title LIKE '%"+search+"%' or board_content LIKE '%"+search+"%' order by registration_day desc ,board_seq desc";
	
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("board_seq"));
				dto.setTitle(rs.getString("board_title"));
				dto.setContent(rs.getString("board_content"));
				dto.setDate(rs.getString("registration_day"));
				dto.setView(rs.getString("views"));
				articleList.add(dto);		
			}
		}catch(Exception e) {
			System.out.println("searchBoardList Error:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	public ArrayList<BoardDTO> selectBoardSearchList(String search, String radioCk){
		connect();
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		String sql = "select * from board where board_title LIKE '%"+search+"%' or board_content LIKE '%"+search+"%' order by registration_day desc ,board_seq desc";
		String sql2 = "select * from board where board_title LIKE '%"+search+"%' order by registration_day desc ,board_seq desc";
		String sql3 = "select * from board where board_content LIKE '%"+search+"%' order by registration_day desc ,board_seq desc";
		try {
			
			if(radioCk.equals("1") || radioCk == null) {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setSeq(rs.getString("board_seq"));
					dto.setTitle(rs.getString("board_title"));
					dto.setContent(rs.getString("board_content"));
					dto.setDate(rs.getString("registration_day"));
					dto.setView(rs.getString("views"));
					articleList.add(dto);		
				}
			}else if(radioCk.equals("2")) {
				pstmt = conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setSeq(rs.getString("board_seq"));
					dto.setTitle(rs.getString("board_title"));
					dto.setContent(rs.getString("board_content"));
					dto.setDate(rs.getString("registration_day"));
					dto.setView(rs.getString("views"));
					articleList.add(dto);		
				}
			}else if(radioCk.equals("3")) {
				pstmt = conn.prepareStatement(sql3);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setSeq(rs.getString("board_seq"));
					dto.setTitle(rs.getString("board_title"));
					dto.setContent(rs.getString("board_content"));
					dto.setDate(rs.getString("registration_day"));
					dto.setView(rs.getString("views"));
					articleList.add(dto);		
				}
			}
		}catch(Exception e) {
			System.out.println("searchBoardList Error:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
}
