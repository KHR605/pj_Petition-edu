<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    String admin_id = (String)request.getParameter("id");
	String admin_pw = (String)request.getParameter("pw");
    
    if(admin_id.equals("adminpeti") && admin_pw.equals("a1234")){
%>
<script>
	window.location.href="admin_main.fkr";
</script>
<%
    }else{
    	if(!admin_id.equals("adminpeti")){  
%>
<script>
	alert("아이디가 틀립니다.");
	history.back(-1);
</script>
<%
    	}else{
%>
<script>
	alert("비밀번호가 틀립니다.");
	history.back(-1);
</script>
<%
    	}
    }
%>    
