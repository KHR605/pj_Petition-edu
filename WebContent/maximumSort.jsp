<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PageInfo"%>
<%@page import="model.PetitionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="js/common.js?ver=2" charset="utf-8"></script>
</head>
<style>
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
	right: 1px;
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
</style>
<body>
<% 
	
	List<PetitionDTO> list = (List<PetitionDTO>)request.getAttribute("petitionsortList");
	//System.out.println(list.size());
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
<form action="latestIngpetition.do?param=maximum" method="post" name="form">
		<div class="searchwrap">
			<input type="text" id="searchtxt" name="search_txt"><input type="submit" class="search_btn" name="search_btn" value="검색">
		</div>
	</form>
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
					
					String expireday = dto.getPetition_expire_day();
					
					Date Expireday = sf.parse(expireday);
					Date Today = sf.parse(today);
					
					long Dday = (Expireday.getTime() - Today.getTime())/(24*60*60*1000); // getTime() 밀리세컨드 단위로 계산되므로 *1000 해줌
			%>	
				<li>
					<div class="contentBox">
						<a href="ingpetiView.jsp?seq=<%=dto.getPetition_seq()%>" target="_top">
						<div class="title"><%=dto.getPetition_title() %></div>
						</a>
						
						<div class="agreeInfo">
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
								
								<div class="dDay">
									D-<span><%=Dday %></span>
								</div>
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
	<article class="pageList">
		<%
			if(nowPage <= 1){ 
		%>
		<span>[Prev]</span>
		<%
			}else{
		%>
		<a href="latestIngpetition.do?param=latest&page=<%=nowPage-1 %>" style="text-decoration: none;">[Prev]</a>
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
		<a href="latestIngpetition.do?param=latest&page=<%=i %>" style="text-decoration: none;">[<%=i %>]</a>
		<%
				}
			}
			if(nowPage>=maxPage){
		%>
		<span>[Next]</span>
		<%
			}else{
		%>
		<a href="latestIngpetition.do?param=latest&page=<%=nowPage+1 %>" style="text-decoration: none;">[Next]</a>
		<%
			}
		%>
	</article>
</body>
</html>