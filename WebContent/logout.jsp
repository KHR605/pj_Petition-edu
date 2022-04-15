<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	session.removeAttribute("SessionUserId");
	session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	location.replace("index.fkr");
</script>