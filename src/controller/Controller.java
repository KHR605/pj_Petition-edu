package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.BoardDTO;
import model.ConsenterDTO;
import model.PetitionDTO;
import model.RippleDTO;
import model.UserDTO;


public class Controller {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private static Controller controller;
	
	
	public static Controller getInstance(){
		if(controller == null){
			controller = new Controller();
		}
		return controller;
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
	
	public int selectListCount() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListCount Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int selectListCountpeti() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListCountpeti Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int selectListCountpeti(String search) {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_title LIKE '%"+search+"%'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListCountpeti Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int selectListCountIngpeti() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_expire_day > now()");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListCountpeti Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int selectListCountIngpeti(String search) {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_expire_day > now() and petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListCountIngpeti Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int selectListCountIngpeti(String search, String radioCk) {
		connect();
		
		int listCount= 0;
		String sql = "select count(*) from petition where petition_expire_day > now() and (petition_title LIKE '%"+search+"%' or petition_content LIKE '%"+search+"%')";
		String sql2 =  "select count(*) from petition where petition_expire_day > now() and petition_title LIKE '%"+search+"%'";
		String sql3 =  "select count(*) from petition where petition_expire_day > now() and petition_content LIKE '%"+search+"%'";
		try{
			if(radioCk.equals("1") || radioCk == null) {
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
				}
			}else if(radioCk.equals("2")) {
				pstmt=conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
				}
			}else if(radioCk.equals("3")) {
				pstmt=conn.prepareStatement(sql3);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
				}
			}
		}catch(Exception ex){
			System.out.println("selectListCountIngpeti Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int selectListCountEndpeti() {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_expire_day < now()");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("selectListCountpeti Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int searchBoardCountList(String search) {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from board where board_title LIKE '%"+search+"%' or board_content LIKE '%"+search+"%'");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("searchBaordCountList Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int searchBoardCountList(String search, String radioCk) {
		connect();
		
		int listCount= 0;
		
		String sql = "select count(*) from board where board_title LIKE '%"+search+"%' or board_content LIKE '%"+search+"%'";
		String sql2 = "select count(*) from board where board_title LIKE '%"+search+"%'";
		String sql3 = "select count(*) from board where board_content LIKE '%"+search+"%'";
		try{
			if(radioCk.equals("1") || radioCk == null) {
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
				}
			}else if(radioCk.equals("2")) {
				pstmt=conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
				}
			}else if(radioCk.equals("3")) {
				pstmt=conn.prepareStatement(sql3);
				rs = pstmt.executeQuery();
	
				if(rs.next()){
					listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
				}
			}
		}catch(Exception ex){
			System.out.println("searchBaordCountList Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public int searchPetitionCountList(String search) {
		connect();
		
		int listCount= 0;
		
		try{
			pstmt=conn.prepareStatement("select count(*) from petition where petition_title LIKE '%"+search+"%' and petition_expire_day > now()");
			rs = pstmt.executeQuery();

			if(rs.next()){
				listCount=rs.getInt(1); // 占쏙옙占쏙옙占� 占쌍다몌옙 占쏙옙 占쏙옙占쏙옙 listCount占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙
			}
		}catch(Exception ex){
			System.out.println("searchPetitionCountList Error: "+ ex);
		}
		
		disconnect();
		
		return listCount;
	}
	
	public ArrayList<BoardDTO> searchBoardList(int page, int limit, String search){
		connect();
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		String sql = "select * from board where board_title LIKE '%"+search+"%' order by registration_day desc ,board_seq desc limit ?,10";
		int startrow=(page-1)*10;
		
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			
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
			System.out.println("searchBoardList �삁�쇅:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	
	public ArrayList<BoardDTO> selectAll(int page, int limit){
		connect();
		
		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();
		String sql = "select * from board order by registration_day desc ,board_seq desc limit ?,10";
		int startrow=(page-1)*10;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("board_seq"));
				dto.setTitle(rs.getString("board_title"));
				dto.setContent(rs.getString("board_content"));
				dto.setDate(rs.getString("registration_day"));
				dto.setView(rs.getString("views"));
				articleList.add(dto);
			//	dao.id = rs.getString("id");
			//	dao.pw = rs.getString("passwd");
			//	dao.name = rs.getString("name");
			//	dao.year = rs.getInt("year");
			//	dao.snum = rs.getString("snum");
			//	dao.depart = rs.getString("depart");
			//	dao.mobile1 = rs.getString("mobile1");
			//	dao.mobile2 = rs.getString("mobile2");
			//	dao.address = rs.getString("address");
			//	dao.email = rs.getString("email");		
			}
		}catch(Exception e) {
			System.out.println("selectAll �삁�쇅:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	
	
	public ArrayList<PetitionDTO> selectAllPeti(int page, int limit){
		connect();
		ArrayList<PetitionDTO> arr = new ArrayList<PetitionDTO>();
		String sql = "select * from petition order by petition_registration_day asc limit ?,10";
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
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setAgree_no(rs.getString("agree_no"));
				arr.add(dto);
			//	dao.id = rs.getString("id");
			//	dao.pw = rs.getString("passwd");
			//	dao.name = rs.getString("name");
			//	dao.year = rs.getInt("year");
			//	dao.snum = rs.getString("snum");
			//	dao.depart = rs.getString("depart");
			//	dao.mobile1 = rs.getString("mobile1");
			//	dao.mobile2 = rs.getString("mobile2");
			//	dao.address = rs.getString("address");
			//	dao.email = rs.getString("email");		
			}
		}catch(Exception e) {
			System.out.println("selectAllPeti Error:" + e);
		}
		
		disconnect();
		
		return arr;
	}
	
	public ArrayList<PetitionDTO> selectAllPeti(int page, int limit, String search){
		connect();
		ArrayList<PetitionDTO> arr = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_title LIKE '%"+search+"%' order by petition_registration_day asc limit ?,10";
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
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setAgree_no(rs.getString("agree_no"));
				arr.add(dto);	
			}
		}catch(Exception e) {
			System.out.println("selectAllPeti Error:" + e);
		}
		
		disconnect();
		
		return arr;
	}
	
	
	public ArrayList<PetitionDTO> selectAllPeti_sortMaximum(){
		ArrayList<PetitionDTO> arr = new ArrayList<PetitionDTO>();
		connect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from petition where petition_expire_day > now() order by agree_no desc, petition_expire_day desc limit 0,8");
			while(rs.next()) {
				PetitionDTO dto = new PetitionDTO();
				dto.setPetition_seq(rs.getString("petition_seq"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPetition_title(rs.getString("petition_title"));
				dto.setPetition_content(rs.getString("petition_content"));
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setAgree_no(rs.getString("agree_no"));
				arr.add(dto);
			//	dao.id = rs.getString("id");
			//	dao.pw = rs.getString("passwd");
			//	dao.name = rs.getString("name");
			//	dao.year = rs.getInt("year");
			//	dao.snum = rs.getString("snum");
			//	dao.depart = rs.getString("depart");
			//	dao.mobile1 = rs.getString("mobile1");
			//	dao.mobile2 = rs.getString("mobile2");
			//	dao.address = rs.getString("address");
			//	dao.email = rs.getString("email");		
			}
		}catch(Exception e) {
			System.out.println("selectAllPeti Error:" + e);
		}
		
		disconnect();
		
		return arr;
	}
	
	
	public ArrayList<BoardDTO> selectAllBoard(){
		ArrayList<BoardDTO> arr = new ArrayList<BoardDTO>();
		connect();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from board order by registration_day asc");
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("board_seq"));
				dto.setTitle(rs.getString("board_title"));
				dto.setContent(rs.getString("board_content"));
				dto.setDate(rs.getString("registration_day"));
				dto.setView(rs.getString("views"));
				arr.add(dto);
			//	dao.id = rs.getString("id");
			//	dao.pw = rs.getString("passwd");
			//	dao.name = rs.getString("name");
			//	dao.year = rs.getInt("year");
			//	dao.snum = rs.getString("snum");
			//	dao.depart = rs.getString("depart");
			//	dao.mobile1 = rs.getString("mobile1");
			//	dao.mobile2 = rs.getString("mobile2");
			//	dao.address = rs.getString("address");
			//	dao.email = rs.getString("email");		
			}
		}catch(Exception e) {
			System.out.println("selectAllBoard �삁�쇅:" + e);
		}
		
		disconnect();
		
		return arr;
	}
	
	public BoardDTO selectOne(String seq) {
		connect();
		BoardDTO dto = new BoardDTO();
		try {
			String sql = String.format("select * from board where board_seq = '"+seq+"' "); // �꽆寃� 諛쏆� seq媛믪쑝濡� 湲� 李얠쓣 荑쇰━
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setSeq(rs.getString("board_seq"));
				dto.setTitle(rs.getString("board_title"));
				dto.setContent(rs.getString("board_content"));
				dto.setDate(rs.getString("registration_day"));
				dto.setView(rs.getString("views"));
				dto.setWriter(rs.getString("writer"));
			}
		}catch(Exception e){
			System.out.println("selectOne �삁�쇅:" +e);
		}
		
		return dto;
	}
	
	public PetitionDTO selectOnepeti(String seq) {
		connect();
		PetitionDTO dto = new PetitionDTO();
		try {
			String sql = String.format("select * from petition where petition_seq = '"+seq+"' "); // �꽆寃� 諛쏆� seq媛믪쑝濡� 湲� 李얠쓣 荑쇰━
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setPetition_seq(rs.getString("petition_seq"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPetition_title(rs.getString("petition_title"));
				dto.setPetition_content(rs.getString("petition_content"));
				dto.setPetition_registration_day(rs.getString("petition_registration_day"));
				dto.setPetition_expire_day(rs.getString("petition_expire_day"));
				dto.setAgree_no(rs.getString("agree_no"));
			}
		}catch(Exception e){
			System.out.println("selectOne �삁�쇅:" +e);
		}
		
		return dto;
	}
	
	public int insertBoard(BoardDTO dto) {
		int cnt = 0;
		connect();
	
		try {
			String sql = String.format("insert into board values('"+dto.getSeq()+"', '"+dto.getTitle()+"', '"+dto.getContent()+"', '"+dto.getDate()+"', '"+dto.getView()+"', '"+dto.getWriter()+"');");
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql); 
		}catch(Exception e) {
			System.out.println("insert �삁�쇅:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public UserDTO userInfo(String userId) {
		connect();
		UserDTO dto = new UserDTO();
		try {
			String sql = "select * from users where user_id = '"+userId+"'";
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setUserSeq(rs.getString("user_seq"));
				dto.setUserId(rs.getString("user_id"));
				dto.setUserPw(rs.getString("pw"));
				dto.setTongsinsa(rs.getString("tongsinsa"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress_detail(rs.getString("address_detail"));
				dto.setYear(rs.getString("birth_year"));
				dto.setMonth(rs.getString("birth_month"));
				dto.setDay(rs.getString("birth_day"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				dto.setEmail_2(rs.getString("email_2"));
			}
		}catch(Exception e) {
			System.out.println("userInfo �삁�쇅: " +e);
		}
		return dto;
	}
	
	public int update(UserDTO dto) {
		int cnt = 0;
		connect();
		//System.out.println(dto.getId());
		//System.out.println(dto.getName());
		//System.out.println(dto.getPhone());
		//System.out.println(dto.getAddress());
		//System.out.println(dto.getGrade());
		//System.out.println(dto.getCitycode());
		
		try {
			String sql = String.format("update users set user_id = '"+dto.getUserId()+"', pw='"+dto.getUserPw()+"', tongsinsa='"+dto.getTongsinsa()+"', phone = '"+dto.getPhone()+"', address='"+dto.getAddress()+"', address_detail = '"+dto.getAddress_detail()+"', birth_year = '"+dto.getYear()+"', birth_month = '"+dto.getMonth()+"', birth_day = '"+dto.getDay()+"', gender = '"+dto.getGender()+"',"
					+ "email = '"+dto.getEmail()+"', email_2 = '"+dto.getEmail_2()+"' where user_id ='"+dto.getUserId()+"';");        
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql);
		}catch(Exception e) {
			System.out.println("update �삁�쇅:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public BoardDTO search() {
		BoardDTO dto = new BoardDTO();
		connect();
		try {
			String sql = String.format("select board_seq from board order by board_seq desc limit 1"); // 留덉�留됲뻾 荑쇰━
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setSeq(rs.getString("board_seq"));
			}
		}catch(Exception e){
			System.out.println("search �삁�쇅:" +e);
		}
		
		return dto;
	}
	
	public PetitionDTO searchPeti() {
		PetitionDTO dto = new PetitionDTO();
		connect();
		try {
			String sql = String.format("select petition_seq from petition order by petition_seq desc limit 1"); // 留덉�留됲뻾 荑쇰━
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				dto.setPetition_seq(rs.getString("petition_seq"));
			}
		}catch(Exception e){
			System.out.println("searchPeti �삁�쇅:" +e);
		}
		
		return dto;
	}
	
	public BoardDTO boardDelete(String seq) {
			BoardDTO dto = new BoardDTO();
		connect();
		try {
			String sql = String.format("delete from board where board_seq = '"+seq+"' "); // 留덉�留됲뻾 荑쇰━
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		}catch(Exception e){
			System.out.println("boarddelete �삁�쇅:" +e);
		}
		return dto;
	}
	
	public int boardUpdate(BoardDTO article) {
		connect();
		int updateCount = 0;
		String sql="update board set board_title=?,board_content=? where board_seq=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3, article.getSeq());
			updateCount = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("boardUpdate Error: " + e);
		}
		disconnect();
		return updateCount;
	}
	
	public ArrayList<PetitionDTO> selectEndPeti(int page, int limit){
		connect();
		
		ArrayList<PetitionDTO> articleList = new ArrayList<PetitionDTO>();
		String sql = "select * from petition where petition_expire_day < now() order by petition_expire_day desc ,petition_seq desc limit ?,8";
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
			System.out.println("selectEndPeti �삁�쇅:" + e);
		}
		
		disconnect();
		
		return articleList;
	}
	
	public int insertRipple(RippleDTO dto) {
		int cnt = 0;
		connect();
	
		try {
			String sql = String.format("insert into ripple values(default, '"+dto.getPetition_seq()+"', NOW(), '"+dto.getRipple_content()+"', '"+dto.getWriter()+"');");
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql); 
		}catch(Exception e) {
			System.out.println("insertRiple �삁�쇅:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public int insertConsenter(ConsenterDTO dto) {
		int cnt = 0;
		connect();
	
		try {
			String sql = String.format("insert into consenter values(default, '"+dto.getConsenter()+"','"+dto.getPetition_seq()+"' ,NOW());");
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql); 
		}catch(Exception e) {
			System.out.println("insertConsenter Error:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public ArrayList<RippleDTO> rippleInfo(String num) {
		ArrayList<RippleDTO> arr = new ArrayList<RippleDTO>();
		connect();
		try {
			String sql = String.format("select * from ripple where petition_seq ='"+num+"'"); //�꽆�뼱�삩 num媛믪뿉 �빐�떦�븳 �쉶�썝�젙蹂� 媛��졇�샂
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				RippleDTO dto = new RippleDTO();
				dto.setRipple_seq(rs.getString("ripple_seq"));
				dto.setRipple_day(rs.getString("ripple_day"));
				dto.setRipple_content(rs.getString("ripple_content"));
				dto.setWriter(rs.getString("writer"));
				arr.add(dto);
			}
		}catch(Exception e) {
			System.out.println("rippleinfo �삁�쇅:" + e);
		}
		
		return arr;
	}
	
	public int updateAgreeNum(String petition_seq) {
		int cnt = 0;
		connect();
		try {
			String sql="update petition set agree_no = agree_no+1 where petition_seq='"+petition_seq+"'";
			stmt = conn.createStatement();
			cnt = stmt.executeUpdate(sql);
		}catch(Exception e) {
			System.out.println("plusAgreeNum �삁�쇅:" + e);
		}
		
		disconnect();
		return cnt;
	}
	
	public boolean checkAgreeDuplicate(String petition_seq, String user_id) {
		connect();
		int cnt = 0;
		boolean flag = false;
		try {
			String sql="select count(*) from consenter "
					   + "where petition_seq='"+petition_seq+"'"
					   + " and consenter='"+user_id+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			if(cnt < 1) {
				flag = true;
			}
		}catch(Exception e) {
			System.out.println("checkAgreeDuplicate Error:" + e);
		}
		
		disconnect();
		return flag;
	}
}

