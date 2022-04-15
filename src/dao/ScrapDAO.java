package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ConsenterDTO;
import model.PetitionDTO;
import model.ScrapDTO;



public class ScrapDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static ScrapDAO scrapDAO;
	
	
	public static ScrapDAO getInstance(){
		if(scrapDAO == null){
			scrapDAO = new ScrapDAO();
		}
		return scrapDAO;
	}
	
	public void connect(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
			if(conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			
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
	
	
	public int selectListScrapCount() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from scrap");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListScrapCount Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	
	public ArrayList<PetitionDTO> selectScrapList(int page, int limit, String petition_seq, String user_id){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_seq in(select petition_seq from scrap where user_id='"+user_id+"') limit ?,10";
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
			System.out.println("selectScrapList Error:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	public int insertScrap(ScrapDTO dto) {
		int cnt = 0;
		connect();
	
		try {
			String sql = String.format("insert into scrap values(default, '"+dto.getUser_id()+"','"+dto.getPetition_seq()+"' ,NOW());");
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql); 
		}catch(Exception e) {
			System.out.println("inserScrap Error:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public boolean scrapDuplicate(String petition_seq, String user) {
		connect();
		int cnt = 0;
		boolean flag = false;
		try {
			String sql="select count(*) from scrap where petition_seq='"+petition_seq+"' and user_id='"+user+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			if(cnt < 1) {
				flag = true;
			}
		}catch(Exception e) {
			System.out.println("scrapDuplicate Error:" + e);
		}
		
		disconnect();
		return flag;
	}
	
	public int deleteScrap(String petition_seq) {
		connect();
		int deleteCount = 0;
		try {
			String sql = String.format("delete from scrap where petition_seq = '"+petition_seq+"' "); // 留덉�留됲뻾 荑쇰━
			stmt = conn.createStatement();
			deleteCount = stmt.executeUpdate(sql);
		}catch(Exception e){
			System.out.println("deletePetition Error:" +e);
		}
		
		return deleteCount;
	}
}
