<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.PageInfo"%>
<%@page import="model.PetitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 청원</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<style>
section{
		width: 1200px;
		margin: 0 auto;
		padding-top: 50px;
		overflow:hidden;
	}
	
	.nav_list{
		display:inline-block;
		float:left;
		padding-top: 30px;
	}
	
	.nav_list ul li{
		margin-bottom: 25px;
		font-size:14pt;
	}
	
	.nav_list ul li a{
		text-decoration: none;
		color: gray;
	}
	
	.contentList{
	overflow:hidden;
	padding-left: 60px;
	padding-top: 50px;
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
	width:237px;
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
	width:70px;
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
 	color: #65ffff;
}

.contentListWrap .tab{
	overflow: hidden;
	width: 100%;
	margin: 25px 0 35px 0;
}

.contentListWrap .tab li{
	float: left;
	width: 33.3%;
	text-align: center;
	cursor:pointer;
	position: relative;
	overflow:hidden;
	padding: 7px 0;
	font-size: 20px;
	border-top: 2px solid rgb(129,169,219);
	font-weight: bold;
}

.contentListWrap .tab li:nth-child(1){
	color:white;
	background-color: rgb(129,169,219);
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
				<li class="logo"><a href="index.jsp"><img src="img/logo.jpg" width="105" height="65"></a></li>
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
				내가 쓴 청원
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
<%
	ArrayList<PetitionDTO> list = (ArrayList<PetitionDTO>)request.getAttribute("mypetitionList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	Calendar cal = Calendar.getInstance();
	int yyyy = cal.get(Calendar.YEAR);
	int MM = cal.get(Calendar.MONTH);
	int dd = cal.get(Calendar.DATE);
	cal.set(yyyy,MM,dd);
	
	String today = sf.format(cal.getTime());
%>
<section>
	<article>
		<h1 style="font-size: 20pt;">내정보</h1>
		<nav class="nav_list">
			<ul>
				<li style="font-weight: bold;"><a href='myPetiton.fkr'>내가 쓴 글</a></li>
				<li><a href='#'>답변된 글</a></li>
				<li><a href='scrapList.fkr'>관심청원 보기</a></li>
				<li><a href='#'>회원 탈퇴</a></li>
			</ul>
		</nav>
	<div class="contentWrap">
	<div class="contentList">
			<ul>
			<% 
			if(list != null && listCount > 0){
				for(int i = 0; i<list.size(); i++){
					PetitionDTO dto = list.get(i);
					//System.out.println(((double)(Integer.parseInt(dto.getAgree_no()))/1000)*100);
					int per = (int)(((double)(Integer.parseInt(dto.getAgree_no()))/1000)*100);
					//System.out.println(per);
					if(per > 100){
						per = 100;
					}
					String expireday = dto.getPetition_expire_day();
					
					Date Expireday = sf.parse(expireday);
					Date Today = sf.parse(today);
					
					long Dday = (Expireday.getTime() - Today.getTime())/(24*60*60*1000); // getTime() 밀리세컨드 단위로 계산되므로 *1000 해줌
			%>	
	
				<li>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deletePetition.fkr?seq=<%=dto.getPetition_seq() %>" style="text-decoration: none; color:red;"><div style="text-align:right; margin-bottom: 2px;">삭제</div></a>
					<div class="contentBox">
						<a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>">
						<div class="title"><%=dto.getPetition_title() %></div>
						</a>
						
						<div class="agreeInfo">
							<ul class="agreeNum">
								<li>
									<%=dto.getAgree_no() %>명
								</li>
								<li style="float:right; text-align:right;"><%=per%>%</li>
							</ul>
							
							<%
								if(Dday > 0){
							%>
							<div class="agreeDate">
								<dl>
									<dt>청원기간</dt>
									<dd>
										<%=dto.getPetition_registration_day() %> ~ <span><%=dto.getPetition_expire_day() %></span>
									</dd>
								</dl>
								
								<div class="dDay">
									D-<span><%=Dday %></span>
								</div>
							</div>
							<%
								}else if(Dday < 0){
							%>
							<div class="agreeDate">
								<dl>
									<dt>만료된 청원
									<%
									if(per >= 100){ 
									%>
									<span style="font-weight:bold; font-size:12px; color:#4f719f">(성립)</span>
									<%
									}else{ 
									%>
									<span style="font-weight:bold; font-size:12px; color:#d84a4a">(미성립)</span>
									<%
									} 
									%></dt>
									<dd>
										<%=dto.getPetition_registration_day() %> ~ <span><%=dto.getPetition_expire_day() %></span>
									</dd>
								</dl>
								
								<div class="dDay">
									D-<span>X</span>
								</div>
							</div>
							<%
								}else{
							%>
							<div class="agreeDate">
								<dl>
									<dt>청원기간</dt>
									<dd>
										<%=dto.getPetition_registration_day() %> ~ <span><%=dto.getPetition_expire_day() %></span>
									</dd>
								</dl>
								
								<div class="dDay">
									D-<span>Day</span>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</li>
				<%
						}
					}else{
				%>
				<div>작성한 글이 없습니다.</div>
				<%
					}
				%>
			</ul>
	</div>
	</div>
	</article>
<article class="pageList" style="position: relative;
   								 left: 600px;
   								 margin-top: 25px;">
		<%
			if(nowPage <= 1){ 
		%>
		<span>[Prev]</span>
		<%
			}else{
		%>
		<a href="myPetition.fkr?page=<%=nowPage-1 %>" style="text-decoration: none;">[Prev]</a>
		<%
			}
		%>
		
		<%
			for(int a = startPage; a<=endPage; a++){
				if(a == nowPage){
		%>
		<span style="font-weight: bold; color: skyblue;">[<%=a %>]</span>
		<%
		}else{ 
		%>
		<a href="myPetition.fkr?page=<%=a %>" style="text-decoration: none;">[<%=a %>]</a>
		<%
				}
			}
			if(nowPage>=maxPage){
		%>
		<span>[Next]</span>
		<%
			}else{
		%>
		<a href="myPetition.fkr?page=<%=nowPage+1 %>" style="text-decoration: none;">[Next]</a>
		<%
			}
		%>
	</article>
</section>

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