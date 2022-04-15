<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%!
	int count;
%>
<%


	String userid = request.getParameter("id");
	//System.out.println(userid);
	Connection conn = null;
	Statement stmt = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count(*) cnt from users where user_id = '"+userid+"'");
		rs.next();

		count = rs.getInt("cnt");
		
	
}finally{
	try{
	stmt.close();
}catch(Exception ignored){
	
}try{
	conn.close();
}
catch(Exception ignored){
	
}
}
%>
<%
if(count == 0){
%>
<span id='str' style='color:green;'>사용가능 합니다 !</span>
<%
}else{
%>
<span id='str' style='color:red;'>중복된 아이디입니다.</span>
<%
}
%>
