<%@page import="model.PetitionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String petition_seq = (String)request.getParameter("seq");   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 작성</title>
</head>
<body>
<jsp:useBean id="control" class="dao.ToAnswerPetitionDAO" />
<%
	PetitionDTO content = control.selectPetitionContent(petition_seq);
%>
<form action="insertAnswer.fkr" method="post" name="form">
<input type="hidden" name="seq" value="<%=petition_seq %>">
청원내용<br>
<textarea name="originContent" cols="100" rows="20">
<%=content.getPetition_content() %>
</textarea><br>
<%=petition_seq %> 번 글에 대한 답변 작성<br>
<textarea name="content" cols="100" rows="20">
</textarea>
<input type="submit" value="답변 작성 완료">
</form>
</body>

</html>