<%@page import="model.PageInfo"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="model.PetitionDTO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>청원 사이트</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  <script src="js/index.js"></script>
  <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<jsp:useBean id="control" class="controller.Controller"/>

<% 
	
	ArrayList<PetitionDTO> list = (ArrayList<PetitionDTO>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	//System.out.println(listCount);
	

	
	ArrayList<BoardDTO> Blist = control.selectAllBoard();
	//System.out.println(list.size());
%>
<div class="wrapper">
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
				<li class="search menu_list"><a href='search.fkr'>검색</a></li>
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
<div class="quickmenu">
	<ul>
		<li style="color: black; height: 30px; line-height: 30px; font-size: 9.5pt;">Remote</li>
 		<li><a href='writePetition.jsp'>지금 청원하기</a></li>
 		<li><a href='myPetition.fkr'>내 청원보기</a></li>
 		<li><a href='scrapList.fkr'>관심청원 보기</a></li>
 	</ul>
</div>
<div class="tab">
		<div class="peti_ing"><a href="index.jsp" class="peti_ing-a">진행중인 청원 목록</a></div>
		<div id="peti_end" class="peti_end"><a href="answerPetition.fkr" class="peti_end-a">답변된 청원 목록</a></div>
</div>
<section class="content_wrap">

	<article class="tab_2">
		<div class="bbs">
			<div></div>
			<h3 style="text-align: center; margin-top: 2px;"><a href="board.fkr" style="text-decoration: none;">[공지사항]</a></h3>
			<ul>
			<%
				if(Blist != null){
					for(int a =0; a<3; a++){
						BoardDTO dto2 = Blist.get(a);
			%>
			<li><a href="view.jsp?seq=<%=dto2.getSeq()%>"><%=dto2.getTitle() %></a></li>
			<%
					}
				}
			%>
			</ul>
		</div>
		<div class="FAQ">
			<img src="img/faq.png" width="200" height="180">
			<h3 style="text-align: center;">[FAQ]</h3>
			<ul>
			<li>질문1</li>
			<li>질문2</li>
			<li>질문3</li>
			</ul>
		</div>

		<div class="accordion_wrap" style="width: 1396px; clear: both; position: relative; margin: 0 auto;">
			<div id="accordion">
			  <h3 class="acc_title-1" style="font-weight: 700;"> 이런청원은 숨김 및 삭제 처리 될 수 있습니다.</h3>
			  <div>
			    <p class="acc_txt">
			 	<div class="txt_ex">동일한 내용으로 <span>중복 게시</span>된 청원은 최초 1개 청원만 남기고 '숨김' 처리 또는 삭제될 수 있습니다.</div>
			 	<div class="txt_ex"><span>욕설 및 비속어</span>를 사용한 청원은 관리자에 의해 삭제 또는 일부 내용 '숨김' 처리될 수 있습니다. <div id="more2-1" class="more2 more2-1">+</div>
			 	</div>
			 	<div id="showhideContent" style="display:none;">1234</div>
			 	<div><span>개인정보, 허위사실, 타인의 명예를 훼손</span>하는 내용이 포함된 청원은 관리자에 의해 삭제 또는 '숨김' 처리될 수 있습니다.<div class="more2 more2-2">+</div></div>
			    </p>
			  </div>
			  <h3 class="acc_title-2" style="font-weight: 700;"> 이런식의 답변은 청원이 어려울 수 있습니다.</h3>
			  <div>
			    <p>
			 	<div class="txt_ex"><span>재판이 진행 중이거나, 입법부 사법부의 고유 권한과 관련한 내용</span>으로 삼권분립의 정신을 훼손할 소지가 있는 청원에는 답변이 어려울 수 있습니다.<div class="more more-1">+</div></div>
			 	<div class="txt_ex"><span>청원 주요 내용이 허위사실로 밝혀진 경우</span> 답변이 어려울 수 있습니다.<div class="more more-2">+</div></div>
			 	<div><span>인종, 국적, 종교, 나이, 지역, 장애, 성별 등 특성과 관련 있는 개인, 집단에 대한 차별 및 비하</span> 등 위헌적 요소가 포함된 청원은 답변이 어려울 수 있습니다.<div class="more more-3">+</div></div>
			    </p>
			  </div>
			</div>
		</div>
	</article>

	<article class="list_wrap">
		
		<h2 style="display: inline; position: relative; top:15px;">전체 목록</h2>
		<div style="float: right; margin-bottom: 15px;">

		<input type="button" name="petition_btn" value="청원하기" onclick="gotoPetition()">

		<select class="main_sort">
			<option>최신순 보기</option>
			<option>동의순 보기</option>
		</select>
		
		</div>
		<table style="display: inline-table;">
			<thead>
				<tr>
					<th style="width: 100px;">
						번호
					</th>
					<th style="width: 900px;">
						제목
					</th>
					<th style="width: 200px;">
						청원만료일
					</th>
					<th style="width: 200px;">
						동의인원
					</th>
				</tr>	
			</thead>
			<tbody>
		<% 

			if(list != null){
				for(int i = 0; i<list.size(); i++){
					PetitionDTO dto = list.get(i);
		%>		
				<tr>
				<td><%= dto.getPetition_seq() %></td>
				<td><a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>"><%= dto.getPetition_title() %></a></td>
				<td><%= dto.getPetition_expire_day() %></td>
				<td><%= dto.getAgree_no() %>명</td>
				</tr>
		<%
				}
			}
		
		%>
			</tbody>
		</table>
		<form action="index.fkr" method="post">
		<div class="searchwrap">
		<input type="text" id="searchtxt" name="search_txt"> <input type="submit" name="search_btn" value="검색">
		</div>
		</form>
		
</article>
<article class="pageList" style="text-align:center; padding: 20px 0 20px 0;">
		<%
			if(nowPage <= 1){ 
		%>
		<span>[Prev]</span>
		<%
			}else{
		%>
		<a href="index.fkr?page=<%=nowPage-1 %>" style="text-decoration: none;">[Prev]</a>
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
		<a href="index.fkr?page=<%=i %>" style="text-decoration: none;">[<%=i %>]</a>
		<%
				}
			}
			if(nowPage>=maxPage){
		%>
		<span>[Next]</span>
		<%
			}else{
		%>
		<a href="index.fkr?page=<%=nowPage+1 %>" style="text-decoration: none;">[Next]</a>
		<%
			}
		%>
		
	</article>
<article class="peti_waiting_wrap">
		<h3>답변대기 목록</h3>
		<table>
			<thead>
				<tr>
					<th style="width: 100px;">
						번호
					</th>
					<th style="width: 900px;">
						제목
					</th>
					<th style="width: 200px;">
						청원만료일
					</th>
					<th style="width: 200px;">
						동의인원
					</th>
				</tr>	
			</thead>
			<tbody>
			<jsp:useBean id="answer" class="dao.ToAnswerPetitionDAO"/>
			<%
				ArrayList<PetitionDTO> alist = answer.selectWaitForAnswerpetitionList();
			//System.out.println(alist.size());
				if(alist != null){
					for(int a = 0; a<3; a++){
						PetitionDTO adto = alist.get(a);
			%>
				<tr>
				<td><%=a+1 %></td>
				<td><a href="ingpetiView?seq=<%=adto.getPetition_seq()%>"><%=adto.getPetition_title() %></a></td>
				<td><%=adto.getPetition_expire_day() %></td>
				<td><%=adto.getAgree_no() %>명</td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
	</article>
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
</div>
</body>
<script>

</script>
</html>