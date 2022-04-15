<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="control" class="controller.Controller"/>
<%
	String seq = request.getParameter("seq"); 
	BoardDTO dto = control.boardDelete(seq); 
	
	out.print("<script>");
	out.print("location.href='board.jsp';");
	out.print("</script>");
%>
</body>
</html>