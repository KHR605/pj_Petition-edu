<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PageInfo"%>
<%@page import="model.PetitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성립된 청원목록</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<style>
article{
	width:1080px;
	margin: 0 auto;
	padding-top: 30px;
}

a{
	text-decoration: none;
	color: black;	
}

.searchwrap{
	text-align: center;
	padding-top: 10px;
	padding-bottom: 15px;
    background-color: #f4f4f4f4;
    border: 1px solid #ccc;
 
}

input[name=search_btn]{
	width: 90px;
	height: 34px;
	position: relative;
	right: 7px;
	top: 2px;
	border: 1px solid black;
	background-color: #696969;
	color: white;
	font-weight: bold;
	font-size: 16px;
	cursor: pointer;
}

input[name=search_txt]{
	width: 300px;
	height: 30px;
	padding-left: 5px;
}

.pageList{
	width: 1000px;
	margin:0 auto;
	text-align:center;
	padding-top: 30px;
}

.contentList{
	overflow:hidden;
}

.contentList li{
	float: left;
	padding: 13px;
	width: 22.4%;
}


.contentBox{
	position: relative;
	border: 1px solid #a5a5a5;
	border-radius: 10px;
	box-shadow: 2px 3px 3px rgb(0 0 0 / 15%);
	width:100%;
}

.title{
	padding: 20px 14px 15px 15px;
	border-radius: 10px 10px 0 0;
    border-bottom: 1px solid #ddd;
    margin-bottom: 10px;
    height: 70px;
}

.contentBox a{
	text-decoration: none;
	color: black;
	font-weight: 700;
}

.contentBox a:hover{
	color: rgb(129,169,219);
}

.title:hover{
	background-color: #f9f9f9;
}

.agreeNum{
	overflow:hidden;
	padding: 0 10px;
	font-weight: bold;
}

.agreeNum li:nth-child(1){
	background: url(img/agree.png) no-repeat left 10px; 
	background-size: 22px auto;
	padding: 13px 0 0 24px;
	width:120px;
}

.agreeDate{
	overflow:hidden;
	padding: 5px 5px 10px 10px;
}

.agreeDate dl{
	float: left;
}

.agreeDate dl dt{
	height: 30px;
    font-size: 15px;
    font-weight: 500;
    background: url(img/calendar.png) no-repeat left 2px;
    background-size: 21px auto;
    padding: 3px 0 0 24px;
}

.agreeDate dd{
	font-weight: 700;
    padding-left: 1px;
    font-size: 13px;
}

.agreeDate dd span{
	color:#d84a4a;
}

.agreeInfo .commitList span{
	color: #d84a4a;
	font-weight: 700;
}

.agreeInfo .dDay{
	float: right;
	width: 60px;
	height: 60px;
	border-radius: 50%;
    background: #2b2b2b;
    color: #fff;
    font-size: 20px;
    font-weight: 600;
    text-align: center;
    line-height: 55px;
}

.agreeInfo .dDay span{
 	color: #65ff08;
}

.contentListWrap .tab{
	overflow: hidden;
	width: 100%;
	margin: 25px 0 35px 0;
}

.contentListWrap .tab li{
	float: left;
	width: 50%;
	text-align: center;
	cursor:pointer;
	position: relative;
	overflow:hidden;
	padding: 7px 0;
	font-size: 20px;
	border-top: 2px solid rgb(129,169,219);
	font-weight: bold;
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
			<div>
		<h3 style="position: relative;
				    color: white;
				    text-shadow: 1px 2px 2px rgb(0 0 0);
				    font-size: 45px;
				    left: 500px;
				    top: 250px;
				    width: 500px;
				    margin: 0 auto;">
				성립된 청원
				</h3>
		</div>
	</div>

</header>
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
<% 
	ArrayList<PetitionDTO> list = (ArrayList<PetitionDTO>)request.getAttribute("satisfiedList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	//System.out.println(listCount);
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
%>
<!-- section -->
<section>
	<article>
	<form action="satisfied.fkr" method="post">
	<div class="searchwrap">
		<input type="text" id="searchtxt" name="search_txt"> <input type="submit" name="search_btn" value="검색">
		</div>
		</form>
<div class="contentListWrap">
	<div class="tab">
		<ul>
			<li style="background-color: rgb(129,169,219);"><a href="satisfied.fkr" style="color: white;">성립된 청원</a></li>
			<li><a href="dissatisfied.fkr">미성립된 청원</a></li>
		</ul>
	</div>
	<div class="contentList">
			<ul>
			<% 
			if(list != null && listCount > 0){
				for(int i = 0; i<list.size(); i++){
					PetitionDTO dto = list.get(i);
					int per = (int)(((double)(Integer.parseInt(dto.getAgree_no()))/1000)*100);
					if(per > 100){
						per = 100;
					}
					Date endDay = sf.parse(dto.getPetition_expire_day());
					cal.setTime(endDay);
					cal.add(Calendar.DATE, 1);
					String Endday = sf.format(cal.getTime());
					//System.out.println(Endday);
			%>	
				<li>
					<div class="contentBox">
						<a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>">
						<div class="title"><%=dto.getPetition_title() %></div>
						</a>
						
						<div class="agreeInfo">
							<ul class="commitList" style="padding: 5px 15px;">
								<li style="float:none; font-weight:400; font-size:13px; width: 80%; background:url(img/dot.jpg) no-repeat 0 11px; padding: 5px 0 5px 7px;">청원종료일 : <span><%=Endday %></span> </li>
								<li style="float:none; font-weight:400; font-size:13px; width: 80%; background:url(img/dot.jpg) no-repeat 0 11px; padding: 5px 0 5px 7px;">청원결과 :
								
								
								  <span>청원성립 및 검토</span>
						
								 </li>
							</ul>
							<ul class="agreeNum">
								<li>
									<%=dto.getAgree_no() %>명
								</li>
								<li style="float:right; text-align:right;"><%=per%>%</li>
							</ul>
							<div style="width: 222px; margin:0 auto;">
							<progress value="<%=per %>" max="100" style="width:215px; height: 30px;" ></progress>
							</div>
							<div class="agreeDate">
								<dl>
									<dt>청원기간</dt>
									<dd>
										<%=dto.getPetition_registration_day() %> ~ <span><%=dto.getPetition_expire_day() %></span>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</li>
				<%
						}
					}else{
						System.out.println("null");
					}
				%>
			</ul>	
		</div>
	</div>
	</article>
	
	<article class="pageList">
		<%
			if(nowPage <= 1){ 
		%>
		<span>[Prev]</span>
		<%
			}else{
		%>
		<a href="satisfied.fkr?page=<%=nowPage-1 %>" style="text-decoration: none;">[Prev]</a>
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
		<a href="satified.fkr?page=<%=i %>" style="text-decoration: none;">[<%=i %>]</a>
		<%
				}
			}
			if(nowPage>=maxPage){
		%>
		<span>[Next]</span>
		<%
			}else{
		%>
		<a href="satisfied.fkr?page=<%=nowPage+1 %>" style="text-decoration: none;">[Next]</a>
		<%
			}
		%>
		
	</article>
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