<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>사이트 회원가입 | Regist</title>
	<meta charset="utf-8">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css?ver=1">
	<script type="text/javascript" src="js/register.js?ver=2" charset="utf-8"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style type="text/css">

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
					<a href="logout.jsp" style="color: black;">로그아웃 | </a>
				<%
				}
				%>
			</li>
			<li><a href="Register.html" style="color: black;">회원가입 | </a></li>
			
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

	<div class="wrapper">	
			<h1>청원 사이트</h1>
		<div class="wrapper_form">
		<form action="insert.jsp" method="post" name="regist_form" onsubmit="return check()">
			<table>
			<tr>
				<td class="sub_title">
					가입 정보 입력 *
				</td>
			</tr>
			<tr>
				<td>
					<hr>
					<div class="id">
					아이디
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<input type="text" name="idtxt" id="idtxt" size="20" placeholder=" 아이디를 입력해주세요">
					<!-- <input type="button" name="idchk" value="아이디 확인" onclick="id_chk()"> -->
					<p style="display: inline-block;" id="idchk_box"></p>
					<!-- <input type="hidden" name="chk" value="0"> -->
					<p><span>*</span> 6-12자 영문 소문자와 숫자 조합</p>
				</td>
			</tr>

			<tr>
				<td>
					<div class="pw">
					비밀번호
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<input type="password" name="pwtxt" id="pwtxt" size="20" placeholder=" 비밀번호를 입력해주세요" >
					<p><span>*</span> 10자 이상 영문,숫자,특수문자 혼합</p>
				</td>
			</tr>

			<tr>
				<td>
					<div class="chkpw">
					비밀번호 재확인
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<input type="password" name="pwcktxt" id="pwcktxt" size="20" placeholder=" 비밀번호를 한번 더 입력해주세요">
					<p id="pwckShow" style="display: none;"></p>
				</td>
			</tr>

			<tr>
				<td>
					<div class="phonenum">
					핸드폰 번호
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<select name="tongsinsa" id="tongsinsa">
						<option value="0">통신사</option>
						<option value="skt">SKT</option>
						<option value="kt">KT</option>
						<option value="lg">LG U+</option>
					</select>
					<input type="text" name="phonetxt" id="phonetxt" size="20" placeholder=" 숫자만 입력" style="width: 280px;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"/>
				</td>
			</tr>

			<tr>
				<td>
					<span style="font-weight: bold; font-size: 10.5pt;">주소 입력</span>
					<input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				</td>
			</tr>

			<tr>
				<td>
					<input type="text" id="sample4_roadAddress" name="addresstxt" placeholder="도로명주소">
				</td>
			</tr>

			<tr>
				<td>
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				</td>
			</tr>

			<tr>
				<td>
					<div class="detailaddr">
					상세주소 입력
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<input type="text" id="sample4_detailAddress" name="address_txt" placeholder="상세주소">
				</td>
			</tr>
			
			<tr>
				<td>
					<div class="birth">
					생년월일
					</div>
				</td>
			</tr>

			<tr>
				<td class="birth">
					<select name ="yearselect" id="yearselect">
					<option>년</option>
					<option value="2016">2016</option>
					<option value="2015">2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
					<option value="2012">2012</option>
					<option value="2011">2011</option>
					<option value="2010">2010</option>
					<option value="2009">2009</option>
					<option value="2008">2008</option>
					<option value="2007">2007</option>
					<option value="2006">2006</option>
					<option value="2005">2005</option>
					<option value="2004">2004</option>
					<option value="2003">2003</option>
					<option value="2002">2002</option>
					<option value="2001">2001</option>
					<option value="2000">2000</option>
					<option value="1999">1999</option>
					<option value="1998">1998</option>
					<option value="1997">1997</option>
					<option value="1996">1996</option>
					<option value="1995">1995</option>
					<option value="1994">1994</option>
					<option value="1993">1993</option>
					<option value="1992">1992</option>
					<option value="1991">1991</option>
					<option value="1990">1990</option>
					<option value="1989">1989</option>
					<option value="1988">1988</option>
					<option value="1987">1987</option>
					<option value="1986">1986</option>
					<option value="1985">1985</option>
					<option value="1984">1984</option>
					<option value="1983">1983</option>
					<option value="1982">1982</option>
					<option value="1981">1981</option>
					<option value="1980">1980</option>
					<option value="1979">1979</option>
					<option value="1978">1978</option>
					<option value="1977">1977</option>
					<option value="1976">1976</option>
					<option value="1975">1975</option>
					<option value="1974">1974</option>
					<option value="1973">1973</option>
					<option value="1972">1972</option>
					<option value="1971">1971</option>
					<option value="1970">1970</option>
				</select>

				<select name ="monthselect" id="monthselect">
					<option>월</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>

				<select name ="dayselect" id="dayselect">
					<option>일</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
			</td>
		</tr>
			
			<tr>
				<td>
					<div class="gender">
					성별
					</div>
				</td>
			</tr>
			<tr>
				<td>
					여성<input type="checkbox" name="gender" id="femalecheck" class="genderCheckbox" value="여성">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
					남성<input type="checkbox"  name="gender" id="malecheck" class="genderCheckbox" value="남성">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					선택안함<input type="checkbox"  name="gender" id="notcheck" class="genderCheckbox" value="선택안함" checked>

				</td>
			</tr>

			<tr>
				<td>
					<div class="email">
					이메일
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="emailtxt_1" id="emailtxt_1" placeholder="이메일 입력"> @ 
					<input type="text" name="emailtxt_2" id="emailtxt_2" placeholder="직접 입력">
					<select name="email" onchange="change_mail(regist_form.email)">
						<option value="0">선택하세요</option>
						<option>naver.com</option>
						<option>google.com</option>
						<option>daum.net</option>
					</select>
					<hr style="margin-top: 20px;">
				</td>
			</tr>

			<tr>
				<td>
					<div class="service_agree">
					이용약관동의
					</div>
				</td>
			</tr>

				<tr>
					<td>
						<input type="checkbox" name="all_check" onclick="check_all(this)"> <span style="font-weight: bold;">전체 동의합니다.</span>
						<div style="font-size: 9pt; position: relative; bottom: 15px; left: 26px; ">위 항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</div>
					</td>
				</tr>

				<tr>
					<td>
						<ul class="service_list">
							<li><input type="checkbox" name="pilsoo" class="pilsoo"> 이용약관 동의 <span>(필수)</span> <strong class="view" id="view-1">약관보기 ></strong></li>
							<li><input type="checkbox" name="pilsoo" class="pilsoo"> 본인은 만 18세 이상입니다 <span>(필수)</span><strong class="view" id="view-2">약관보기 ></strong></li>
							<li><input type="checkbox" name="pilsoo" class="pilsoo"> 개인정보 수집, 이용 동의 <span>(필수)</span></li>
							<li><input type="checkbox" name="choice"> 정보 수신 동의 <span>(선택)</span></li>
						</ul>
						<hr>
					</td>
				</tr>

				<tr>
					<td>
						<div class="underline">
						<input type="submit" name="registbtn" value="가입하기">
						</div>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
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
</body>
<script>
	 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
  	
 
</script>
</html>