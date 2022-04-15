<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="css/login.css?ver=1">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
					<a href="logout.jsp" style="color: black;">로그아웃 | </a>
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
				<li class="logo"><a href="index.jsp"><img src="img/logo.jpg" width="105" height="65"></a></li>
		</ul>
	</div>
</header>
	<!-- End of header -->

	<div class="wrapper">
		<form name="login_form" method="post" action="login_pro.jsp">
			<div class="head">
				Login
			</div>
			<section class="login_form">
				<article class="id_wrap">
					<input type="text" name="id_txt" placeholder="아이디 입력">
				</article>
				<article class="pw_wrap">
					<input type="password" name="pw_txt" placeholder="비밀번호 입력">
				</article>
				<article class="login_btn">
					<input type="submit" name="login_btn" value="로그인" onclick="login_sub(); return false;">
				</article>
				<article class="login_menu">
					<ul>
						<li><a href="Register.jsp">회원가입</a></li> |
						<li><a href="#">아이디 찾기</a></li> |
						<li><a href="#">비밀번호 찾기</a></li>
					</ul>
				</article>
			</section>
		</form>
	</div>
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
</body>
<script type="text/javascript">
	function login_sub(){
		if(document.login_form.id_txt.value==""){
			alert("아이디를 입력해주세요.");
			document.login_form.id_txt.focus();
			return false;
		}
		if(document.login_form.pw_txt.value==""){
			alert("비밀번호를 입력해주세요.");
			document.login_form.pw_txt.focus();
			return false;
		}

		document.login_form.submit();
	}

	$('.level2').hide();

	$('.intro_peti a').mouseover(function(){
		$('.intro_peti_sub').slideDown(100);
	});

	$('.ing_peti a').mouseover(function(){
		$('.ing_peti_sub').slideDown(100);
	});

	$('.end_peti a').mouseover(function(){
		$('.end_peti_sub').slideDown(100);
	});

	$('.intro_peti').mouseleave(function(){
		$('.intro_peti_sub').slideUp(500);
	});

	$('.ing_peti').mouseleave(function(){
		$('.ing_peti_sub').slideUp(500);
	});

	$('.end_peti').mouseleave(function(){
		$('.end_peti_sub').slideUp(500);
	});

</script>
</html>