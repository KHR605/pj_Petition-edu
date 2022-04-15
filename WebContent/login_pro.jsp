<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%

	Connection conn = null;
	Statement stmt = null;
	int cnt;
	String userid = request.getParameter("id_txt");
	String pw = request.getParameter("pw_txt");

try{
		if(userid == null || pw == null){
%>
<script type="text/javascript">
	alert("잘못된 접근");
</script>
<%
	return;
}
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count(*) cnt from users where user_id ='"+userid+"' and pw='"+pw+"'");
		rs.next();

		cnt = rs.getInt("cnt");
	
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
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%
	if(cnt == 0){
%>
	<script type="text/javascript">
		alert("로그인시스템에 등록되지 않은 정보입니다.");
		history.back();
	</script>
<%
	return;
}else{
	session.setAttribute("SessionUserId",userid);
}
%>
<script type="text/javascript">
	alert("<%=userid %>님 로그인 되었습니다.");
	location.replace('index.fkr');
</script>
</body>
</html>