<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = (String)session.getAttribute("SessionUserId");
	int birthYear = 0;
	int birthMonth = 0;
	int birthDay = 0;
	String tongsinsa = "";
	String phone = "";
	String address = "";
	String address_detail = "";
	String email = "";
	String email_detail = "";
	String gender = "";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pj?characterEncoding=utf8", "root", "1234");
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from users where user_id = '"+id+"'");

		if(rs.next()){
		birthYear = rs.getInt("birth_year");
		birthMonth = rs.getInt("birth_month");
		birthDay = rs.getInt("birth_day");
		tongsinsa = rs.getString("tongsinsa");
		phone = rs.getString("phone");
		address = rs.getString("address");
		address_detail = rs.getString("address_detail");
		email = rs.getString("email");
		email_detail = rs.getString("email_2");
		gender = rs.getString("gender");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>내 정보</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>	
	<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
	<link rel="stylesheet" type="text/css" href="css/mypage.css?ver=1">
	
	<script type="text/javascript" src="js/mypage.js?ver=2" charset="utf-8"></script>
	
</head>
<body>
<header>
	<div class="headerInner">
		<div class="topmenu">
			<li>
				<select>
				<option>고객센터</option>
				<option>공지사항</option>
				<option>자주하는 질문</option>
				<option>1:1 문의</option>
				</select>
			</li>
			<li>
				<%
				String session_id = (String)session.getAttribute("SessionUserId");
				if(session_id == null){
				%>
					<a href="login.jsp" style="color: black;">로그인 | </a>
				<%
				}else{
				%>
					<a href="logout.jsp" style="color: black;">로그아웃 | </a><a href="mypage.jsp" style="color:black; font-size: 10pt; ">내정보 |</a> 
				<%
				}
				%>
			</li>
			<li><a href="Register.jsp" style="color: black;">회원가입 | </a></li>
		</div>
		<ul class="mainmenu">
				<li class="search menu_list"><a href='#'>검색</a></li>
				<li class="menu_list end_peti"><a href='endPetitionList.fkr'>만료된 청원</a>
					<ul class="level2 end_peti_sub">
						<li><a href='satisfied.fkr'>성립된 청원</a></li>
						<li><a href='dissatisfied.fkr'>미성립된 청원</a></li>
					</ul>
				</li>
				<li class="menu_list ing_peti" style="width: 200px;"><a href='ingPetitionList.do?param=select'>진행중인 청원</a>
					<ul class="level2 ing_peti_sub">
					
					</ul>
				</li>
				<li class="menu_list intro_peti"><a href='#'>청원 안내</a>
					<ul class="level2 intro_peti_sub">
						<li><a href='#'>청원 소개</a></li>
						<li><a href='#'>청원 처리절차</a></li>
						<li><a href='board.fkr'>공지사항</a></li>
					</ul>
				</li>
				<li class="logo"><a href="index.fkr"><img src="img/logo.jpg" width="105" height="65"></a></li>
		</ul>
	</div>

</header>
<!-- End of header -->


<!--  side  -->
<div class="quickmenu">
	<ul>
		<li style="color: black; height: 30px; line-height: 30px; font-size: 9.5pt;">Remote</li>
 		<li><a href='writePetition.jsp'>지금 청원하기</a></li>
 		<li><a href='#'>내 청원보기</a></li>
 		<li><a href='scrapList.fkr'>관심청원 보기</a></li>
 	</ul>
</div>

<div class="chat"><li>+</li></div>
	<ul class="chat-list">
		<li style="font-weight: bold;">채팅</li>
		<li><a href='#'>채팅하기</a></li>
		<li><a href='#'>관리자 문의</a></li>
	</ul>
<!-- End of side -->

<section>
	<h1 style="font-size: 20pt;">내정보</h1>
	<nav class="nav_list">
		<ul>
			<li><a href='myPetition.fkr'>내가 쓴 글</a></li>
			<li><a href='#'>답변된 글</a></li>
			<li><a href='scrapList.fkr'>관심청원 보기</a></li>
			<li><a href='#'>회원 탈퇴</a></li>
		</ul>
	</nav>

	<article class="infoMain">
		<ul>
			<li>
			아이디 : <%= session_id %>
			</li>
			<li>생년월일 : <%= birthYear%> / <%= birthMonth%> / <%= birthDay%> </li>
			<li>통신사 : <%= tongsinsa %></li>
			<li>핸드폰 번호 : <%= phone%></li>
			<li>주소 : <%= address %> / <%= address_detail%></li>
			<li>이메일 : <%= email%> @ <%= email_detail%></li>
			<li>성별 : <%= gender %></li>
		</ul>
		<div class="update_btn">
			<input type="button" id="updateBtn" name="update" value="수정하기" style="background-color: #eeeeee; border-radius: 6px; width: 100px; height: 40px; border: 1px solid #aaaaaa; cursor: pointer;">
		</div>
	</article>	
</section>

<footer>
	<div class="footer_wrap">
		<div class="footer_logo">
			<img src="img/logo.jpg" width="150" height="100">
		</div>
		<div class="footer_info">
			<h4 style="color: white;">CONTACT INFO</h4>
				<ul>
				<li>tel : (+82) 02-111-111</li>
				<li>e-mail : sbafmfhs123@naver.com</li>
				<li>주소 : 05050 서울특별시 광진구 자양로</li>
				</ul>
		</div>
		<div class="footer_menu">
			<ul>
				<li>개인정보처리방침 |</li>&nbsp;
				<li>저작권 정책 |</li>&nbsp;
				<li>패밀리 사이트</li>
			</ul>
			<div style="color: rgba(220,220,220,207); position: relative; bottom: -80px; font-size: 10pt;">Copyright© All rights reserved.</div>
		</div>
	</div>
</footer>
	<!-- End of footer -->
</body>
<script type="text/javascript">
	
</script>
</html>