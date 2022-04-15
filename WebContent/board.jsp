<%@page import="model.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="css/bbs.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<body>
<%
	ArrayList<BoardDTO> articleList = (ArrayList<BoardDTO>)request.getAttribute("articleList"); 
	//System.out.println(articleList.size());
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	//System.out.println("nowPage: " + nowPage);
	//System.out.println("maxPage: " + maxPage);
	//System.out.println("startPage: " + startPage);
	//System.out.println("endPage: " + endPage);
	String session_id = (String)session.getAttribute("SessionUserId");
%>
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


<!-- section -->
<section>
<div class="main_wrap">
	<nav class="navi">
		<ul>
			<li>공지사항</li>
			<li>FAQ</li>
			<li>1:1 문의하기</li>
		</ul>
	</nav>
	<article>
		
			<div class="title">공지사항</div>
			<table>
			<tbody>
				<tr>
					<th style="width:5%">번호</th>
					<th style="width:70%">제목</th>
					<th style="width:10%">작성일</th>
					<th style="width:20%">조회수</th>
				</tr>
				<% 
					if(articleList != null && listCount > 0){
					for(int i=0; i<articleList.size(); i++){
				%>
				<%
					BoardDTO dto = articleList.get(i);
				%>
	
				<tr>
					<td>[공지]</td>
					<td><a href="view.jsp?seq=<%=dto.getSeq()%>&page=<%=nowPage%>"><%= dto.getTitle() %></a></td>
					<td><%= dto.getDate() %></td>
					<td><%= dto.getView() %></td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
			</table>
			<%
			if("admin1".equals(session_id)){
			%>
			<input type="button" style="float: right; width:150px; height:40px; margin-top:10px; background-color: rgb(129,169,219); color:white; border: 1px solid skyblue; cursor: pointer;" name="writeBtn" value="글쓰기" 
			onclick="edong()">
			<%
			}
			 %>
		<form action="board.fkr" method="post" name="form">
		<div class="search_wrap"><input type="text" name="boardSearch"><input type="submit" value="검색"></div>
		</form>
	</article>
	
	<article class="pageList">
		<%
			if(nowPage <= 1){ 
		%>
		<span>[Prev]</span>
		<%
			}else{
		%>
		<a href="board.fkr?page=<%=nowPage-1 %>" style="text-decoration: none;">[Prev]</a>
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
		<a href="board.fkr?page=<%=i %>" style="text-decoration: none;">[<%=i %>]</a>
		<%
				}
			}
			if(nowPage>=maxPage){
		%>
		<span>[Next]</span>
		<%
			}else{
		%>
		<a href="board.fkr?page=<%=nowPage+1 %>" style="text-decoration: none;">[Next]</a>
		<%
			}
		%>
		
	</article>
	
	<div class="quickmenu">
	<ul>
		<li style="color: black; height: 30px; line-height: 30px; font-size: 9.5pt;">Remote</li>
 		<li><a href='writePetition.jsp'>지금 청원하기</a></li>
 		<li><a href='#'>내 청원보기</a></li>
 		<li><a href='#'>관심청원 보기</a></li>
 	</ul>
	</div>
</div>
<div class="chat"><li>+</li></div>
	<ul class="chat-list">
		<li style="font-weight: bold;">채팅</li>
		<li><a href='#'>채팅하기</a></li>
		<li><a href='#'>관리자 문의</a></li>
	</ul>
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
<script>
	function edong(){
		window.location.href="writeBoard.jsp";
	}
</script>
</html>