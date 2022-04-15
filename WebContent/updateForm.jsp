<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>	
	<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
	<link rel="stylesheet" type="text/css" href="css/updateForm.css?ver=1">
	<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<body>
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
				<li class="logo"><a href="index.jsp"><img src="img/logo.jpg" width="105" height="65"></a></li>
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
 		<li><a href='#'>관심청원 보기</a></li>
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
			<li><a href='#'>내가 쓴 글</a></li>
			<li><a href='#'>답변된 글</a></li>
			<li><a href='#'>내 정보 관리</a></li>
			<li><a href='#'>회원 탈퇴</a></li>
		</ul>
	</nav>

<jsp:useBean id="control" class="controller.Controller" />
<%
	UserDTO dto = control.userInfo(session_id);
%>

	<article class="infoMain">
	<form action="update.jsp" method="post">
		<ul>
			<li>
			아이디 : <input type="text" name="id" value=<%=session_id %>>
			</li>
			<li>
			비밀번호 : <input type="text" name="pw" value=<%=dto.getUserPw() %>>
			</li>
			<li>
			생년월일 : <input type="text" name="year" style="width:100px;" value=<%=dto.getYear() %>>년 &nbsp; 
					<input type="text" name="month" style="width:100px;" value=<%=dto.getMonth() %>>월 &nbsp; 
					<input type="text" name="day" style="width:100px;" value=<%=dto.getDay() %>>일 &nbsp;
			</li>
			<li>
			통신사 : <select name="tongsinsa">
					<option value="<%=dto.getTongsinsa() %>" selected><%=dto.getTongsinsa() %> (기존통신사)</option>
					<option value="skt">SKT</option>
					<option value="kt">KT</option>
					<option value="lg">LG U+</option>
				  </select>
			</li>
			<li>
			핸드폰 번호 : <input type="text" name="phone" value=<%=dto.getPhone() %>>
			</li>
			<li>
			주소 : <input type="text" name="address" style="width:250px;" value="<%=dto.getAddress() %>"> / <input type="text" name="address_detail" style="width:70px;"  value=<%=dto.getAddress_detail() %>>
			</li>
			<li>
			이메일 : <input type="text" name="email" value=<%=dto.getEmail() %>> @ <input type="text" name="email_2" value=<%=dto.getEmail_2() %>>
			</li>
			<li>
			성별 : <select name="gender">
					<option value="<%=dto.getGender() %>" selected><%=dto.getGender() %> (기존성별)</option>
					<option value="여성">여성</option>
					<option value="남성">남성</option>
					<option value="선택안함">선택안함</option>
				  </select>
			</li>
		</ul>
		<div class="update_btn">
			<input type="submit" id="updateBtn_do" name="update" value="수정하기" style="background-color: #eeeeee; border-radius: 6px; width: 100px; height: 40px; border: 1px solid #aaaaaa; cursor: pointer;">
		</div>
	</form>
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
</body>
</html>