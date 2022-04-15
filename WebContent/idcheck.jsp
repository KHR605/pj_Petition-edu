<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%


	String userid = request.getParameter("userid");
	Connection conn = null;
	Statement stmt = null;
	int cnt;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count(*) cnt from users where user_id = '"+userid+"'");
		rs.next();

		cnt =rs.getInt("cnt");
	
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style type="text/css">
	body{
		background-color: #eeeeee;
		text-align: center;
	}

	input[name='use']{
		margin-left: 10px;
	}

	input[name='no_use']{
		margin-top: 10px;
	}
</style>
<body>
<%
	if(cnt == 0){
	out.print("사용 가능한 아이디입니다.");
	out.print("<input type=button name='use' value='사용하기'> ");
	out.print("<br>");
	out.print("<input type='button' name='no_use' value='닫기''>");
%>
	<script type="text/javascript">
		$('input[name="use"]').click(function(){
		opener.document.regist_form.chk.value="1";
		window.close();
		$(opener.document).find('#idtxt').attr('readonly', true); // attr(disable)은 값넘길 때 아무고토 못넘김 -> null
	});
		$('input[name=no_use]').click(function(){
			window.close();
		});
	</script>
<%
}else{
	out.print("이미 사용중인 아이디입니다.");
%>
	<script type="text/javascript">
		opener.document.regist_form.chk.value="0";
	</script>
 
<%
	}
%>

</body>
</html>