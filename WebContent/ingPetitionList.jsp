<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="model.PetitionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중인 청원 목록</title>
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
				진행중인 청원
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

<!-- section -->
<section>
	<article>
<div class="contentListWrap">
	<div class="tab">
		<ul>
			<li class="latest_sort">최신 순</li>
			<li class="maximum_sort">최다 동의 순</li>
			<li class="expire_sort" style="background:url('img/sub_line.jpg') no-repeat 2px;">만료 임박 순</li>
		</ul>
	</div>
<iframe src="latestIngpetition.do?param=latest" id="iframe" width=1080 height=650 frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vscpace=0>
</iframe>
	</div>
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
<script>
$(function(){
	$('.latest_sort').click(function(){
		$('#iframe').attr('src', 'latestIngpetition.do?param=latest');
		$(this).css({"color":"white", "background":"none", "background-color":"rgb(129,169,219)"});
		$('.maximum_sort').css({"color":"black", "background-color":"white"})
		$('.expire_sort').css({"background":"url('img/sub_line.jpg') no-repeat 2px"});
	});
	
	
	$('.maximum_sort').click(function(){
		$('#iframe').attr('src', 'maximumSort.do?param=maximum');
		$(this).css({"color":"white", "background":"none", "background-color":"rgb(129,169,219)"});
		$('.latest_sort').css({"color":"black", "background-color":"white"})
		$('.expire_sort').css({"background":"none"});
	});

	
});
</script>
</html>