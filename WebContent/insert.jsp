<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String user_id = request.getParameter("idtxt");
	String pw = request.getParameter("pwtxt");
	String tongsinsa = request.getParameter("tongsinsa");
	String phone =request.getParameter("phonetxt");
	String address =request.getParameter("addresstxt");
	String address_detail =request.getParameter("address_txt");
	String birth_year =request.getParameter("yearselect");
	String birth_month =request.getParameter("monthselect");
	String birth_day =request.getParameter("dayselect");
	String[] gender =request.getParameterValues("gender");
	String sex =" ";
	for(int i = 0; i<gender.length; i++){
	sex += gender[i]+" ";
		}
	String email =request.getParameter("emailtxt_1");
	String email_2 =request.getParameter("emailtxt_2");

	Connection conn = null;
	Statement stmt = null;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		String command = String.format("insert into users" + "(user_id, pw, tongsinsa, phone, address, address_detail , birth_year, birth_month, birth_day , gender, email, email_2) values('%s','%s','%s', '%s', '%s', '%s', '%s', '%s', '%s' ,'%s', '%s', '%s');", user_id, pw, tongsinsa, phone, address, address_detail, birth_year, birth_month, birth_day, sex, email, email_2);

		stmt.executeUpdate(command);
	
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

</body>
<script type="text/javascript">
	alert("가입이 완료되었습니다.");
	location.replace('index.fkr');
</script>
</html>