package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.PetitionDTO;

public class MypetitionDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static MypetitionDAO mypetitionDAO;
	
	
	public static MypetitionDAO getInstance(){
		if(mypetitionDAO == null){
			mypetitionDAO = new MypetitionDAO();
		}
		return mypetitionDAO;
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
	
	public int selectListMypetitonCount(String user_id) {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where user_id='"+user_id+"'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectLsitMypeitionCount Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	
	public ArrayList<PetitionDTO> selectMypetitionList(int page, int limit, String user_id){
		connect();
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where user_id = '"+user_id+"' limit ?,8";
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
			System.out.println("selectMypetitionList Error:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	public int deletePetition(String petition_seq) {
		connect();
		int deleteCount = 0;
		try {
			String sql = String.format("delete from petition where petition_seq = '"+petition_seq+"' "); // 留덉�留됲뻾 荑쇰━
			stmt = conn.createStatement();
			deleteCount = stmt.executeUpdate(sql);
		}catch(Exception e){
			System.out.println("deletePetition Error:" +e);
		}
		
		return deleteCount;
	}
}
