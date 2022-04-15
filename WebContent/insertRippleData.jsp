<%@page import="model.ConsenterDTO"%>
<%@page import="model.PetitionDTO"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.RippleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="aa" class="controller.Controller" />
<%
	RippleDTO dto = new RippleDTO();
	BoardDTO dt = new BoardDTO();
	PetitionDTO pdto = new PetitionDTO();
	ConsenterDTO cdto = new ConsenterDTO();

	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	
	String today = sf.format(now);
	
	
	String writer = request.getParameter("writer");
	String petition_seq = request.getParameter("petition_seq");
	String ripple = request.getParameter("reply_txt");
	
	dto.setPetition_seq(petition_seq);
	dto.setRipple_content(ripple);
	dto.setWriter(writer);
	
	cdto.setPetition_seq(petition_seq);
	cdto.setConsenter(writer);
	
	boolean flag = aa.checkAgreeDuplicate(petition_seq, writer);
	
	if(flag){
		int count = aa.updateAgreeNum(petition_seq);
		int count2 = aa.insertConsenter(cdto);
		int cnt = aa.insertRipple(dto);
		if(cnt == 0){
			out.println("댓글 입력 실패");
		}else if(count == 0){
			out.println("동의수 증가 실패");
		}else if(count2 == 0){
			out.println("동의자 입력 실패");
		}
		else{
			out.println("<script>");
			out.println("alert('동의하였습니다.');");
			out.println("location.href='ingpetiView.jsp?seq="+petition_seq+"';");
			out.println("</script>");
		}
	}else{
		out.println("<script>");
		out.println("alert('이미 동의한 청원입니다.');");
		out.println("location.href='ingpetiView.jsp?seq="+petition_seq+"';");
		out.println("</script>");
	}	
	
%>