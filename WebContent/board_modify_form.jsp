<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/view.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<body>
<%
	BoardDTO dto = (BoardDTO)request.getAttribute("article"); 
%>
<header>
	<div class="headerInner">
		<div class="topmenu">
			<li>
				<select style="font-size: 12px;">
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
				<li class="menu_list end_peti"><a href='#'>만료된 청원</a>
					<ul class="level2 end_peti_sub">
						<li><a href='#'>성립된 청원</a></li>
						<li><a href='#'>미성립된 청원</a></li>
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

<!-- section -->
<section>
	<form class="form" action="BoardModifyPro.fkr" method="POST">
		<div class="title_wrap">
		<div class="title">공지사항 수정</div>	
		<p class="sub_title">청원에 대한 공지를 수정합니다</p>
		</div>
		<table>
			<input type="hidden" name="seq" value="<%=dto.getSeq() %>" />
			<tr><td style="background-color: #eeeeee; width:10%;'">제목</td><td><input type="text" name="title" value="<%= dto.getTitle() %>"></td></tr>
			<tr><td style="background-color: #eeeeee;">작성자</td><td><%= dto.getWriter() %></td></tr>
			<tr>
			<td style="background-color: #eeeeee;">작성일</td><td><%=dto.getDate() %></td>
			<td style="background-color: #eeeeee; width:10%;">조회수</td><td><%=dto.getView() %></td>
			</tr>
		</table>
		<div class="content">
		<textarea name="content" rows="33" cols="141"><%= dto.getContent() %></textarea>
		</div>
	
	<div class="goList"><input type="button" name="goList" value="취소" onclick="edong()"></div>
	<%
	if("admin1".equals(session_id)){
	%>
	<div class="modifyBtn">
		<input type="submit" name="modify" value="수정" style="width: 100%; background-color: rgba(22,160,93,86); border: 0; line-height: 30px; color: white; cursor: pointer;">
	</div>
	<%
	}
	%>
	</form>
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

</section>
<!-- End of section -->



<!-- footer -->
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
function edong(){
	history.go(-1);
}
</script>
</html>