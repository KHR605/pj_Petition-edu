<%@page import="model.AnswerDTO"%>
<%@page import="model.RippleDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="model.PetitionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청원 세부사항</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<style>
	ul, li{
		list-style: none;
	}
	
	section{
		padding : 50px 0;
	}
	
	article{
		clear: both;
		width:1000px;
		border:1px solid #aaaaaa;
		border-radius: 4px;
		margin: auto;
		padding: 70px 30px 70px 30px;
	}
	
	.peti_state{
		width: 200px;
		margin: 0 auto 35px auto;
		font-size: 22pt;
	}
	
	.peti_title{
		font-size: 40px;
		line-height: 50px;
		width: 90%;
		margin : 0 auto 45px auto;
		text-align: center;
	}
	
	.agree_count{
		font-size: 26px;
		margin-bottom: 40px;
		text-align: center;
	}
	
	.petitionView_info{
		margin-bottom: 40px;
		text-align: center;
	}
	
	.petitionView_info_list{
		padding: 15px;
		border:1px solid gray;
		border-radius:4px;
		background-color: #f6f6f6;
	}
	
	.petitionView_info_list li{
		display: inline-block;
		font-size: 16px;
		margin: 0 60px 0 60px;
	}
	
	.petitionView_info_list li p{
		font-weight: 600;
		margin-right: 8px;
		float:left;
	}
	
	.petition_content{
		font-size: 16px;
		margin-bottom: 50px;
	}
	
	.petition_content_head{
		margin-bottom:10px;
		padding-bottom:10px;
		border-bottom: 1px solid #d1d1d1;
	}
	
	.reply_head{
		font-size: 20px;
		font-weight: 600;
		color: #5a5a5a;
	}
	
	.reply_write{
		 background-color: #f3f3f3;
	   	 border: 1px solid #dedede;
	     margin-bottom: 40px;
	     padding:20px;
	     margin-top: 5px;
	}
	
	input[type=text]{
		width:75%;
		border: 0;
		height: 45px;
		padding: 7px;
	}
	
	input[type=submit]{
		width: 16%;
		height: 60px;
		font-size: 16px;
		font-weight: 500;
		color: white;
		background-color:#02387b;
		cursor: pointer;
		border: 0;
		float:right;
	}
	.scrapWrap{
		 width: 1000px;
	    border: 0;
	    margin: 0 auto;
	    padding: 0;
	}
	
	.scrap{
		margin: auto;
		float: right;
		padding: 0 0 10px 0;
	}
	
	#rip_toggle{
	cursor: pointer;
    color: #2962ff;
	}
	
	#rip_toggle:hover{
		text-decoration:underline;
		
	}
	
	.answer_content{
		    font-size: 1em;
		    line-height: 1.6em;
		    border: 1px solid #dddddd;
		    background: #f6f7fb;
		    border-radius: 10px;
		    padding: 15px 20px;
		    margin-top: 20px;
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
<jsp:useBean id="control" class="controller.Controller" />
<jsp:useBean id="scrap" class="dao.ScrapDAO" />
<jsp:useBean id="answer" class="dao.AnswerDAO"/>
<%
	String seq = (String)request.getParameter("seq");
	PetitionDTO dto = control.selectOnepeti(seq);
	AnswerDTO answerDTO = answer.selectAnswerContent(seq);
	String agreeNo = dto.getAgree_no();
	String answerContent = answerDTO.getAnswer_content();
	//System.out.println(answerContent);
	boolean flag = scrap.scrapDuplicate(seq, session_id);
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
	Calendar cal = Calendar.getInstance();
	int yyyy = cal.get(Calendar.YEAR);
	int MM = cal.get(Calendar.MONTH);
	int dd = cal.get(Calendar.DATE);
	cal.set(yyyy,MM,dd);
	
	//System.out.println(dto.getPetition_expire_day());
	
	String expireday = dto.getPetition_expire_day();
	String today = sf.format(cal.getTime());
	
	Date Expireday = sf.parse(expireday);
	Date Today = sf.parse(today);
	//System.out.println(Expireday);
	//System.out.println(Today);
	
%>
	<article class="scrapWrap">
	<%
	if(flag){
	%>
	<a href="registScrap.fkr?seq=<%=seq%>"><div class="scrap">관심청원 등록</div></a>
	<%
	}else{
	%>
	<div class="scrap">*관심청원으로 등록된 청원입니다</div>
	<%
	}
	%>
	</article>
	
	<article>
		<%
			if(Expireday.getTime() > Today.getTime()){ // 오늘이 만료날보다 작을 경우 (만료가 되지 않았을 경우)
		%>	
		<div class="peti_state">- 청원진행중 -</div> <!-- 오늘날짜랑 만료날짜 비교해서 입력 값 다르게 할 것 -->
		<%
		}else if(answerContent != null){
		%>
		<div class="peti_state">- 답변완료 -</div>
		<% 
			}else{
		%>
		<div class="peti_state">- 청원만료 -</div>
		<%
		}
		%>
		<div class="peti_title"><h4><%=dto.getPetition_title() %></h4></div>
		<div class="agree_count">동의인원 : [<span class="count_num" style="color: #034497"><%=dto.getAgree_no() %></span>명]</div>
		<div class="petitionView_info">
		<ul class="petitionView_info_list">
		<li><p>청원시작</p> <%=dto.getPetition_registration_day() %></li> 
		<li><p>청원마감</p> <%=dto.getPetition_expire_day() %></li>
		<li><p>청원인</p> <%=dto.getUser_id() %></li>
		</ul>
		</div>
		<div class="petition_content">
			<div class="petition_content_head"><h4 style="font-size:22px;">청원내용</h4></div>
			<div>
			<%=dto.getPetition_content().replaceAll(" ", "&nbsp").replaceAll("\n", "<br>") %>
			</div>
		</div>
		
		<%
			if(answerContent != null) {
		%>
		<!-- answer -->
		<div class="answer_wrap">
			<span style="margin-top: 50px;
					    font-weight: 700;
					    font-size: 2em;
					    color: #000000;
					    padding: 0 15px;
					    border-left: 5px solid #162b46">답변</span>
			<div class="answer_content">
			<%=answerContent.replaceAll(" ", "&nbsp").replaceAll("\n", "<br>") %>
			</div>
		</div>
		<!-- End of answer -->
		<%
			}else if(answerContent == null){
		%>
		<div></div>
		<%
			}
		%>
		
		<div class="reply_head" style="margin-top: 50px;">
		댓글입력
		</div>
		<div class="reply_write">
			<form action="insertRippleData.jsp" method="POST" name="form" onsubmit="return check()">
			<%
				if(Expireday.getTime() > Today.getTime() && session_id != null){
			%>
			<input type="hidden" name="ripple_seq" />
			<input type="hidden" name="petition_seq" value="<%=seq%>"/>
			<input type="hidden" name="writer" value="<%=session_id%>">
			<input type="text" name="reply_txt" value="동의합니다.">
			<input type="submit" name="agree_btn" value="동의하기">
			<%
				}else{
			%>
			<input type="text" name="reply_txt2" placeholder="로그인 후 입력하실 수 있습니다. 또는 만료된 청원에는 동의하실 수 없습니다." readonly>
			<input type="submit" name="agree_btn" value="동의하기" disabled style="background-color:gray; cursor:not-allowed;">
			<%
				}
			%>
			</form>
		</div>
		댓글[<span id="rip_toggle" onclick="showHideRip()">보기</span>]
		<div id="rip_content" style="display:none;">
		<%
			ArrayList<RippleDTO> list = control.rippleInfo(seq);
			if(list != null){
				for(int i=0; i<list.size(); i++){
					RippleDTO rdto = list.get(i);
		%>
			<div style="border-top: 1px solid #eeeeee; padding-top: 8px; padding-bottom: 20px; font-size: 12px; color: gray; font-weight: 400; margin-top:5px;">
			<%=rdto.getRipple_content() %>
			</div>
		<%
				}
			}else{
		%>
			<div>등록된 댓글이 없습니다.</div>
		<%
			}
		%>
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

<script type="text/javascript">
	function showHideRip(){
		if(document.getElementById('rip_content').style.display === 'block'){
			document.getElementById('rip_content').style.display = 'none';
			document.getElementById('rip_toggle').textContent = '보기';
		}else{
			document.getElementById('rip_content').style.display = 'block';
			document.getElementById('rip_toggle').textContent = '숨기기';
		}
	}
	
	$({val : 0}).animate({val : <%=agreeNo%>}, { // 숫자 올라가는 애니메이션
		duration: 1500,
		step: function(){
			 var num = numberWithCommas(Math.floor(this.val));
			    $(".count_num").text(num);
		},
		complete: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".count_num").text(num);
		  }
	});
	
	function numberWithCommas(x) { //세번째 마다 콤마찍기
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	
</script>
</html>