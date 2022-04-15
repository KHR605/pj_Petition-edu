<%@page import="model.BoardDTO"%>
<%@page import="model.PetitionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합검색</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/jquery.mark.min.js'></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<style>
.search_menu li{
	float:left;
}

.search_sort li{
	margin-right : 25px;
	color: lightslategray;
}

input[type=date]{
	border: 1px solid lightslategray;
	color: lightslategray;
	padding: 8px 10px;
}

input[type=date] span{
	color: lightslategray;
}

.search_content{
	width: 1200px;
	margin: 0 auto;
	margin-top: 100px;
}

.search_title{
	font-size: 32px;
    letter-spacing: -1px;
    margin-bottom: 20px;
    font-weight: 500;
    line-height: normal;
    text-align: left;
    color: #333;
}

.search_content a{
	text-decoration : none;
}

.search_content a:hover{
	text-decoration : underline;
}

.text-red{
	color: red;
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
			<div style="position: relative;color: white;text-shadow: 1px 2px 2px rgb(0 0 0);font-size: 45px; top:160px; width: 575px;margin: 0 auto;">
			<h3 style="text-align:center; color:#6b9fdd;">통합검색</h3>
			<%
			PageInfo search = (PageInfo)request.getAttribute("search");
			String item = search.getSearch();
			%>
			<form action="search.fkr" method="post" name="form">
					<input type="text" id="search_txt" name="search" <%if(item != null){ %>value="<%=item %>" <%} %>style="width: 560px; height: 44px; border: 4px solid #0c396f; padding-left: 5px; font-size: 17px;color: #6d6d6d;" /> 
					<input type="image" id="search_img" src="img/search_btn.jpg" onclick="return check()" style="position: absolute; right: -47px; bottom: 0px;"/>
			
			
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
<div class="search_wrap" style="overflow: hidden;width: 100%; height: 60px; border-bottom: 1px solid #7f7f7f;">
	<div class="search_menu" style=" width: 1000px; padding-top: 20px; margin: 0 auto; ">
		<div class="search_sort" style="float:left; margin-right: 175px;">
		<h4 style="float:left; margin-right: 25px; font-size: 20px; letter-spacing: -2px; line-height: 19px; color: gray;">검색대상</h4>
			<ul style="float:left">
			<%
				String radiovalue = (String)request.getAttribute("radioVal");
				//System.out.println("jsp radioval: " + radiovalue);
			%>
			<%
				if(radiovalue == null){
			%>
				<li><input type="radio" name="radio_menu" value="1" checked>&nbsp;전체</li>
				<li><input type="radio" name="radio_menu" value="2">&nbsp;제목</li>
				<li><input type="radio" name="radio_menu" value="3">&nbsp;내용</li>
			<%
				}else if(radiovalue.equals("1")){
			%>
				<li><input type="radio" name="radio_menu" value="1" checked>&nbsp;전체</li>
				<li><input type="radio" name="radio_menu" value="2">&nbsp;제목</li>
				<li><input type="radio" name="radio_menu" value="3">&nbsp;내용</li>
			<%
				}else if(radiovalue.equals("2")){
			%>
				<li><input type="radio" name="radio_menu" value="1" >&nbsp;전체</li>
				<li><input type="radio" name="radio_menu" value="2" checked>&nbsp;제목</li>
				<li><input type="radio" name="radio_menu" value="3">&nbsp;내용</li>
			<%
				}else if(radiovalue.equals("3")){
			%>
				<li><input type="radio" name="radio_menu" value="1" >&nbsp;전체</li>
				<li><input type="radio" name="radio_menu" value="2" >&nbsp;제목</li>
				<li><input type="radio" name="radio_menu" value="3" checked>&nbsp;내용</li>
			<%
				}
			%>
			</ul>
		</div>
		
		<div class="search_date" style="float:right;">
		<h4 style="float:left; margin-right: 25px; font-size: 20px; letter-spacing: -2px; line-height: 19px; color: gray;">검색기간</h4>
			<ul style="float:left; position:relative; top: -8px;">
				<li><input type="date" name="StartDate" min="2021-10-05">&nbsp;<span>~</span>&nbsp;</li>
				<li><input type="date" name="EndDate" min="2021-10-05"></li>
			</ul>
		</div>
		</form>
	</div>
</div>

<div class="search_content">
	
<%
	ArrayList<PetitionDTO> endpetilist =  (ArrayList<PetitionDTO>)request.getAttribute("endArticle");
	ArrayList<PetitionDTO> ingpetilist =  (ArrayList<PetitionDTO>)request.getAttribute("ingArticle");
	ArrayList<BoardDTO> boardlist =  (ArrayList<BoardDTO>)request.getAttribute("boardArticle");
	PageInfo allListCount = (PageInfo)request.getAttribute("allListcount");
	PageInfo endListCount = (PageInfo)request.getAttribute("endListcount");
	PageInfo ingListCount = (PageInfo)request.getAttribute("ingListcount");
	PageInfo boardListCount = (PageInfo)request.getAttribute("boardListcount");
	
	int alllistCount = allListCount.getListCount();
	int endlistCount = endListCount.getEndpetiCount();
	int inglistCount = ingListCount.getIngpetiCount();
	int boardlistCount = boardListCount.getBoardlistCount();
	
	
	//System.out.println("endpetilist.size: "+endpetilist.size());
	//System.out.println("boardlist.size: "+boardlist.size());
	//System.out.println("inglistCount.size: "+ingpetilist.size());
	//System.out.println("alllistCount: "+alllistCount);
	//System.out.println("endlistCount: "+endlistCount);
	//System.out.println("inglistCount: "+inglistCount);
	//System.out.println("boardlistCount: "+boardlistCount);
%>

	<%
		if(endpetilist.size() <= 0 && ingpetilist.size() <= 0 && boardlist.size() <= 0 && alllistCount <= 0  && inglistCount <= 0 && endlistCount <= 0 && boardlistCount <= 0  ){
	%>
	<div class="search_title">검색어<span style="color:#1d5daa;"><%if(item == null){ %>""<%}else{ %>"<%=item %>"<%} %></span>에 대한 검색 결과입니다. <span style="color:#d64e4e;">(0건)</span></div>
	<div style="padding-top: 120px; text-align:center; font-size: 16pt; color: gray;">검색된 결과가 없습니다.</div>
	<%
		}else{
	%>
	<div class="search_title">검색어<span style="color:#1d5daa;">"<%=item %>"</span>에 대한 검색 결과입니다. <span style="color:#d64e4e;">(<%=alllistCount %>건)</span></div>
	<div class="search_list" style="padding: 25px 30px 15px 30px; border-bottom: 1px solid #e1e1e1; position: relative; text-align: left;">
		<h3 style="background-color: #f0f0f0; line-height: 28px; padding: 10px 26px; margin-bottom: 35px; color: #333; font-size: 20px;">
		<span style="position: relative; right: 10px;">*</span>진행중인 청원(<%=inglistCount %>건)
		</h3>
		<div class="more" style="position:absolute; right: 60px; top: 40px; color: #737373;">더보기</div>
		<%
			if(ingpetilist.size() > 0 && inglistCount > 0){
				if(ingpetilist.size() < 3){
			for(int i =0; i<ingpetilist.size(); i++){
				PetitionDTO ingDTO = ingpetilist.get(i);
		%>
		<div class="content_search_list" style="margin-bottom: 50px;">
			<a href="ingpetiView.jsp?seq=<%=ingDTO.getPetition_seq() %>">
				<h2 style="font-size: 28px; margin-bottom: 25px;color: #333; line-height: normal;"><%=ingDTO.getPetition_title() %>
				<small style="font-size: 0.6em;color: #808080;">[<%=ingDTO.getPetition_registration_day() %>]</small>
			</h2>
				<p style="font-size: 18px;color: #777;height: 48px; line-height: 23px; margin-bottom: 25px; overflow: hidden; white-space:
				 normal;display: -webkit-box;-webkit-line-clamp: 2; -webkit-box-orient: vertical;">
					<%=ingDTO.getPetition_content() %>
				</p>
			</a>
		</div>
		<%
					}
				}else{
					for(int j = 0; j<3; j++){
						PetitionDTO ingDTO = ingpetilist.get(j);
		%>
			<div class="content_search_list" style="margin-bottom: 50px;">
			<a href="ingpetiView.jsp?seq=<%=ingDTO.getPetition_seq() %>">
				<h2 style="font-size: 28px; margin-bottom: 25px;color: #333; line-height: normal;"><%=ingDTO.getPetition_title() %>
				<small style="font-size: 0.6em;color: #808080;">[<%=ingDTO.getPetition_registration_day() %>]</small>
			</h2>
				<p style="font-size: 18px;color: #777;height: 48px; line-height: 23px; margin-bottom: 25px; overflow: hidden; white-space:
				 normal;display: -webkit-box;-webkit-line-clamp: 2; -webkit-box-orient: vertical;">
					<%=ingDTO.getPetition_content() %>
				</p>
			</a>
		</div>
		<%
					}
				}
			}else{
		%>
		<div style="padding-bottom: 20px; text-align:center; font-size: 16pt; color: gray;">검색된 결과가 없습니다.</div>
		<%
			}
		%>
	</div>
	 
	<div class="search_list" style="padding: 25px 30px 15px 30px; border-bottom: 1px solid #e1e1e1; position: relative; text-align: left;">
		<h3 style="background-color: #f0f0f0; line-height: 28px; padding: 10px 26px; margin-bottom: 35px; color: #333; font-size: 20px;">
		<span style="position: relative; right: 10px;">*</span>만료된 청원(<%=endlistCount %>건)
		</h3>
	<div class="more" style="position:absolute; right: 60px; top: 40px; color: #737373;">더보기</div>
	<%
	if(endpetilist.size() > 0 && endlistCount > 0){
		if(endpetilist.size() < 3){
			for(int i =0; i<endpetilist.size(); i++){
				PetitionDTO endDTO = endpetilist.get(i);
	%>
		<div class="content_search_list" style="margin-bottom: 50px;">
			<a href="ingpetiView.jsp?seq=<%=endDTO.getPetition_seq() %>">
				<h2 style="font-size: 28px; margin-bottom: 25px;color: #333; line-height: normal;"><%=endDTO.getPetition_title() %>
				<small style="font-size: 0.6em;color: #808080;">[<%=endDTO.getPetition_registration_day() %>]</small>
			</h2>
				<p style="font-size: 18px;color: #777;height: 48px; line-height: 23px; margin-bottom: 25px; overflow: hidden; white-space:
				 normal;display: -webkit-box;-webkit-line-clamp: 2; -webkit-box-orient: vertical;">
					<%=endDTO.getPetition_content() %>
				</p>
			</a>
		</div>
	<%
				}
			}else{
				for(int j = 0; j<3; j++){
					PetitionDTO endDTO = endpetilist.get(j);
	%>
	<div class="content_search_list" style="margin-bottom: 50px;">
			<a href="ingpetiView.jsp?seq=<%=endDTO.getPetition_seq() %>">
				<h2 style="font-size: 28px; margin-bottom: 25px;color: #333; line-height: normal;"><%=endDTO.getPetition_title() %>
				<small style="font-size: 0.6em;color: #808080;">[<%=endDTO.getPetition_registration_day() %>]</small>
			</h2>
				<p style="font-size: 18px;color: #777;height: 48px; line-height: 23px; margin-bottom: 25px; overflow: hidden; white-space:
				 normal;display: -webkit-box;-webkit-line-clamp: 2; -webkit-box-orient: vertical;">
					<%=endDTO.getPetition_content() %>
				</p>
			</a>
		</div>
	<%
				}
			}
		}else{
	%>
	<div style="padding-bottom: 20px; text-align:center; font-size: 16pt; color: gray;">검색된 결과가 없습니다.</div>
	<%
		}
	%>
	</div>
	
	<div class="search_list" style="padding: 25px 30px 15px 30px; border-bottom: 1px solid #e1e1e1; position: relative; text-align: left;">
		<h3 style="background-color: #f0f0f0; line-height: 28px; padding: 10px 26px; margin-bottom: 35px; color: #333; font-size: 20px;">
		<span style="position: relative; right: 10px;">*</span>공지사항(<%=boardlistCount %>건)
		</h3>
		<div class="more" style="position:absolute; right: 60px; top: 40px; color: #737373;">더보기</div>
		<%
	if(boardlist.size() > 0 && boardlistCount > 0){
			for(int i =0; i<boardlist.size(); i++){
				BoardDTO boardDTO = boardlist.get(i);
	%>
		<div class="content_search_list" style="margin-bottom: 50px;">
			<a href="view.jsp?seq=<%=boardDTO.getSeq() %>">
				<h2 style="font-size: 28px; margin-bottom: 25px;color: #333; line-height: normal;"><%=boardDTO.getTitle() %>
				<small style="font-size: 0.6em;color: #808080;">[<%=boardDTO.getDate() %>]</small>
			</h2>
				<p style="font-size: 18px;color: #777;height: 48px; line-height: 23px; margin-bottom: 25px; overflow: hidden; white-space:
				 normal;display: -webkit-box;-webkit-line-clamp: 2; -webkit-box-orient: vertical;">
					<%=boardDTO.getContent() %>
				</p>
			</a>
		</div>
	<%
			}
		}else{
	%>
	<div style="padding-bottom: 20px; text-align:center; font-size: 16pt; color: gray;">검색된 결과가 없습니다.</div>
	<%
		}
	%>
	</div>
	<%
		}
	 %>
</div>
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
	function check(){
		var item = document.getElementById('search_txt').value;
		if(item == ""){
			alert("검색어를 입력해주세요.");
			return false;
		}
		return true;
	}
	
	var word = $('#search_txt').val();
	$('.content_search_list').mark(word,{
		'element': 'span',
		'className': 'text-red'
	});
</script>
</html>