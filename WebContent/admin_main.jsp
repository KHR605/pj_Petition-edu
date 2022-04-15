<%@page import="model.PageInfo"%>
<%@page import="model.PetitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<style>
	a{
		text-decoration:none;
	}
	
	iframe{
		display:none;
	}
</style>
<body>
<jsp:useBean id="answer" class="dao.AnswerDAO"/>
<%
	ArrayList<PetitionDTO> list = (ArrayList<PetitionDTO>)request.getAttribute("toAnswerList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	PetitionDTO dto = null;
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<section>
<article>
<h2 style="text-align: center;">답변대기 청원 리스트</h2>
<table border="1" style="margin: 50px auto; border-collapse: collapse;">
 	
	<tr style="text-align:center;">
		<td style="width:20%;">번호 </td><td style="width:50%;">제목</td><td style="width:23%;">만료날짜</td><td style="width:65px;">답변여부</td>
	</tr>
	<%
		if(list != null){
			for(int i = 0; i<list.size(); i++){
			dto = list.get(i);
			String seq = dto.getPetition_seq();

	%>
	<tr style="text-align:center; height: 40px;">
		<td><%=i+1 %></td><td><a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>"><%=dto.getPetition_title() %></a></td><td><%=dto.getPetition_expire_day() %></td>
		<%
			boolean flag = answer.answerDuplicate(dto.getPetition_seq().toString());
			if(flag){
		%>
		<td style="width:60px;"><a href="javascript:popup(<%=seq%>)">답변</a></td>
		<%
			}else{
		%>
		<td style="width:60px;">답변함</td>
		<%
			}
		%>
	</tr>

	<%
			}
		}
	%>
</table>
</article>
<article class="pageList" style="text-align: center;">
		<%
			if(nowPage <= 1){ 
		%>
		<span>[Prev]</span>
		<%
			}else{
		%>
		<a href="admin_main.fkr?page=<%=nowPage-1 %>" style="text-decoration: none;">[Prev]</a>
		<%
			}
		%>
		
		<%
			for(int i = startPage; i<=endPage; i++){
				if(i == nowPage){
		%>
		<span style="font-weight: bold; color: skyblue;">[<%=i %>]</span>
		<%
		}else{ 
		%>
		<a href="admin_main.fkr?page=<%=i %>" style="text-decoration: none;">[<%=i %>]</a>
		<%
				}
			}
			if(nowPage>=maxPage){
		%>
		<span>[Next]</span>
		<%
			}else{
		%>
		<a href="admin_main.fkr?page=<%=nowPage+1 %>" style="text-decoration: none;">[Next]</a>
		<%
			}
		%>
	</article>
</section>
</body>
<script>
	function popup(seq){
		var url = "writeAnswer.jsp?seq="+seq+"";
		var name = "popup";
		var option = "width = 800, height = 500 location = no"
		window.open(url, name, option);
		
	}
</script>
</html>