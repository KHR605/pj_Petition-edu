<%@page import="model.PageInfo"%>
<%@page import="model.AnsweredDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변된 청원</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<style>
.peti_ing{
	display: inline-block;
	text-align: center;
	float: left;
	font-size: 15pt;
	border-bottom: 1px solid gray;
	width: 49.999%;
	height: 45px;
}


.peti_end{
	display: inline-block;
	border-bottom: 1px solid gray;
	float: right;
	width: 49.999%;
	font-weight: bold;
	font-size: 15pt;
	text-align: center;
	height: 45px;
}

.tab{
	margin-top: 15px;
}

.tab .peti_end{
	background-image: url('img/sub_line.jpg');
	background-repeat: no-repeat;
}

.tab div:hover{
	border-bottom: 4px solid navy;
	color: black;
}

.tab div a:hover{
	color: black;
}

.peti_ing-a{
	text-decoration: none;
	font-size: 16pt;
	color: #aaa;
	font-weight: bold;
	text-align: center;
	display: inline-block;
	width: 776px;
	height: 46px;
}

.peti_end-a{
	text-decoration: none;
	font-size: 16pt;
	color: black;
	font-weight: bold;
	text-align: center;
	display: inline-block;
	width: 776px;
	height: 46px;
}

section{
	width: 1280px;
	overflow:hidden;
	margin: 0 auto;
	padding: 150px 0 130px 0;
}

section a:link, section a:visited {
	text-decoration: none;
}

.answer_info li{
	float:left;
	padding: 0 40px 0 50px;
	letter-spacing: -0.5px;
}

section .answer a {
	color : #1b2259;
	margin-bottom : 30px;
	display: block;
}

.answer_pic_box{
	width: 480px;
    height: 270px;
    border-radius: 10px;
    overflow: hidden;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 50% 50%;
}

.answer_list{
	display: inline-block;
    width: 100%;
    position: relative;
    margin-bottom: 70px;
    padding-bottom: 70px;
    border-bottom: 1px dashed #ccc;
}

.answer_title h3{
	color: #fff; 
	font-size: 16px;
	background-color: #1b2259;
	display: inline-block; 
	padding: 8px 15px; 
	font-weight: 400;
	margin-bottom: 12px;
    border-radius: 4px;
}

.answer_info{
	font-size: 16px; color: #767676; text-align: center; display: inline-block; width: 94%; padding: 0 3%;
}

</style>
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
				<li class="logo"><a href="index.fkr"><img src="img/logo.jpg" width="105" height="65"></a></li>
		</ul>
		<div>
		<h3 style="position: relative;
				    color: white;
				    text-shadow: 1px 2px 2px rgb(0 0 0);
				    font-size: 45px;
				    left: 500px;
				    top: 250px;
				    width: 500px;
				    margin: 0 auto;">
				답변된 청원
				</h3>
		</div>
	</div>

</header>
<div class="tab">
		<div class="peti_ing"><a href="index.jsp" class="peti_ing-a">진행중인 청원 목록</a></div>
		<div id="peti_end" class="peti_end" style="border-bottom: 4px solid navy"><a href="answerPetition.fkr" class="peti_end-a">답변된 청원 목록</a></div>
</div>
<!-- End of header -->
<!-- End of header -->
<!--  side  -->
<div class="quickmenu">
	<ul>
		<li style="color: black; height: 30px; line-height: 30px; font-size: 9.5pt;">Remote</li>
 		<li><a href='writePetition.jsp'>지금 청원하기</a></li>
 		<li><a href='myPetition.fkr'>내 청원보기</a></li>
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

<!-- section -->
<%
	ArrayList<AnsweredDTO> list = (ArrayList<AnsweredDTO>)request.getAttribute("answeredpetitionList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	AnsweredDTO dto = null;
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<section>
<%
if(list != null){
	for(int i = 0; i<list.size(); i++){
		 dto = list.get(i);
		 
%>

	<article class="answer_list">
		<table style="width: 100%; border-collapse: collapse; border-spacing: 0;">
			<tr>
				<td style="width: 60%;">
					<div class="answer">
						<div class="answer_title">
							<h3>청원답변 <%=i+1 %>호</h3>
    						<h2><a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>"><%=dto.getPetitioin_title() %></a></h2>
						</div>
						<ol class="answer_info">
							<li style="padding-left: 0; background-image: url(img/ans_icon_arrow.png); background-repeat: no-repeat; background-position: right 32px;">
								<img src="img/ans_icon1.png" >
								<p style="color:#9e9e9e;">청원시작</p>
								<p style="line-height: 21px;font-weight: bold;color: #9e9e9e;">[<%=dto.getPetition_registration_day() %>]</p>	
							</li>							
							<li style="background-image: url(img/ans_icon_arrow2.png); background-repeat: no-repeat; background-position: right 32px;">
								<img src="img/ans_icon2.png" >
								<p style="color:#6d80a0;">청원마감</p>
								<p style="line-height: 21px; font-weight: bold; color: #6d80a0;">[<%=dto.getPetition_expire_day() %>]</p>
							</li>
							<li style="background-image: url(img/ans_icon_arrow3.png); background-repeat: no-repeat; background-position: right 32px;">
								<img src="img/ans_icon3.png" >
								<p style="color:#34558e;">동의인원</p>
								<p class="count_num" style="line-height: 21px; font-weight: bold;color: #34558e;">[<%=dto.getAgree_no() %>]</p>
							</li>
							<li>
								<img src="img/ans_icon4.png" >
								<p style="color:#144daf;">답변일</p>
								<p style="line-height: 21px; font-weight: bold;color:#144daf;">[<%=dto.getAnswer_day() %>]</p>
							</li>
						</ol>
					</div>	
				</td>
				
				<td style="width:40%;">
					<div class="answer_pic" style="position: relative; float:right;">
						<div class="answer_pic_box" style = "background-image: url(img/thumb_nail_<%=i+1%>.PNG)">
						<p style="position: absolute;top: 40%;width: 82px;left: 50%;margin-left: -41px;">
							<a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>">
								<img src="img/b_youtube_play.png" style="width: 100%; height: auto; border-radius: 10px;">
							</a>
						</p>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</article>
	<%
			}
		}
	%>
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

</html>