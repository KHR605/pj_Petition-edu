<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*"%>
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
<jsp:useBean id="control" class="controller.Controller" />
<%
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	
	
	
	BoardDTO dto = new BoardDTO();
	
	String seq = request.getParameter("seq");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String view = "0";
	String today = sf.format(now);
	
	
	dto.setSeq(seq);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setView(view);
	dto.setDate(today);
	
	
	int cnt = control.insertBoard(dto);
	if(cnt == 0){
		out.println("실패");
	}else{
		out.println("<script>");
		out.println("alert('입력 성공.');");
		out.println("location.href='board.fkr';");
		out.println("</script>");		
	}
%>
</body>
</html>