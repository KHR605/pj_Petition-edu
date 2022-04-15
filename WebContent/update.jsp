<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update logic</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="control" class="controller.Controller" />
<%
	UserDTO dto = new UserDTO();
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String tongsinsa = request.getParameter("tongsinsa");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String address_detail = request.getParameter("address_detail");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String email_2 = request.getParameter("email_2");
	
	dto.setUserId(id);
	dto.setUserPw(pw);
	dto.setTongsinsa(tongsinsa);
	dto.setPhone(phone);
	dto.setAddress(address);
	dto.setAddress_detail(address_detail);
	dto.setYear(year);
	dto.setMonth(month);
	dto.setDay(day);
	dto.setGender(gender);
	dto.setEmail(email);
	dto.setEmail_2(email_2);
	
	int cnt = control.update(dto);
	if(cnt == 0){
		out.println("실패");
	}else{
		out.println("<script>");
		out.println("alert('수정 성공.');");
		out.println("location.href='mypage.jsp';");
		out.println("</script>");
		
	}
%>
</body>
</html>