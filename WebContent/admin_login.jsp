<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
</head>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	
	section{
		width: 600px;
		margin: 200px auto;
		
	}
	
	
	article{
		text-align: center;
		border: 1px solid black;
		padding-top: 20px;
    background-color: #eee;
	}
	
	table{
	width:350px;
		margin: 0 auto;
		text-align: left;
	}
	
	form{
		padding-top: 10px;
	}
	
	input[type=submit]{
		    width: 100px;
		    height: 43px;
		    position: relative;
		    left: 140px;
		    bottom: 45px;
	}
</style>
<body>
<section>
	<article>
	<h1>관리자 로그인</h1>
		<form action="admin_loginPro.jsp" method="POST" name="form">
		<table>
			<tr>
			<td>아이디 : <input type="text" name="id" style="left: 16px;
    position: relative;"></td>
			</tr>

			<tr>	
			<td>비밀번호 : <input type="password" name="pw"></td>
			</tr>
		</table>
		<input type="submit" value="로그인" onclick="login_chk(); return false;">
		</form>
	</article>
</section>
</body>
<script type="text/javascript">
	function login_chk(){
		if(document.form.id.value==""){
			alert("아이디를 입력해주세요.");
			document.form.id.focus();
			return false;
		}
		if(document.form.pw.value==""){
			alert("비밀번호를 입력해주세요.");
			document.form.pw.focus();
			return false;
		}

		document.login_form.submit();
	}
		
</script>
</html>