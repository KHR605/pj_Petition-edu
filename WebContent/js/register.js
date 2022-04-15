

function check(){
		var id_txt = document.getElementById("idtxt");
		var pw_txt = document.getElementById("pwtxt");
		var all_txt = document.querySelectorAll("input[type=text");
		var pwchk_txt = document.getElementById("pwcktxt");
		var phone_txt = document.getElementById("phonetxt");
		var tongsinsa = document.getElementById("tongsinsa");
		var addr_txt1 = document.getElementById("sample4_roadAddress");
		var addr_txt2 = document.getElementById("sample4_detailAddress");
		var year = document.getElementById("yearselect");
		var month = document.getElementById("monthselect");
		var day = document.getElementById("dayselect");
		var email_1 = document.getElementById("emailtxt_1");
		var email_2 = document.getElementById("emailtxt_2");
		var gender = document.querySelectorAll(".genderCheckbox");
		var pilsoo = document.querySelectorAll(".pilsoo");
		

		//console.log(idChk);
		
		if(id_txt.value == '' || pw_txt.value == '' || pwchk_txt.value == ''|| phone_txt.value == '' || addr_txt1.value == '' || addr_txt2.value == '' || email_1.value == '' || email_2.value == ''){
			alert("빈칸을 입력해주세요.");
			return false;
		}
		
		else if(year.value == '년' || month.value == '월' || day.value == '일'){
			alert("생년월일을 선택해주세요.");
			return false;
		}
		else if(tongsinsa.value == '0'){
			alert("통신사를 선택해주세요.");
			return false;
		}

		else if(gender[0].checked == false && gender[1].checked == false && gender[2].checked == false){
			alert("성별을 선택해주세요.");
			return false;
		}

		else if(id_txt.value.length < 6 || id_txt.value.length > 12){
			alert("아이디는 6이상 12자 이하 영문 및 소문자와 숫자조합이여야 합니다.");
			return false;
		}
		else if(pw_txt.value.length < 10){
			alert("비밀번호는 10자 이상 영문,숫자,특수문자 혼합이여야 합니다.");
			return false;
		}
		else if(pw_txt.value != pwchk_txt.value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		else if((pilsoo[0].checked == false) || (pilsoo[1].checked == false) || (pilsoo[2].checked == false)){
			alert("필수항목은 반드시 체크하셔야 합니다.");
			return false;
		}
		else{
			var id = id_txt.value;
			var pw = pw_txt.value;
			var phone = phone_txt.value;
			var tongsinsa = '';
			var addr = addr_txt1.value + addr_txt2.value;
			var birth = year.value + '년' + month.value + '월' + day.value + '일';
			var showgender = '';
			var email = email_1.value + '@' + email_2.value;
			if(gender[0].checked == true){
				showgender += '여성';
			}
			else if(gender[1].checked == true){
				showgender += '남성';
			}
			else{
				showgender += '미정';
			}

			if(tongsinsa.value == 'skt'){
				tongsinsa += 'SKT';
			}
			else if(tongsinsa.value == 'kt'){
				tongsinsa += 'KT';
			}
			else{
				tongsinsa += 'LG U+';
			}
			alert('아이디: '+id+'\n'+'비밀번호: '+pw+'\n'+'연락처: '+phone+'\n'+'통신사: '+tongsinsa+'\n'+'주소: '+addr+'\n'+'생년월일: '+birth+'\n'+'성별: '+showgender+'\n'+ '이메일: ' +email);
		}
		return true;
	}

	function id_chk(){
		var userid = document.regist_form.idtxt.value;
		if(userid == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(userid.length < 6 || userid.length > 12){
			alert("아이디는 6자 이상 12자 이하여야 합니다.");
			return false;
		}

		//var url = "idcheck.jsp?userid="+userid;
		//var w = window.screen.width/2 - 150;
		//var h = window.screen.height/2 - 40;
		//window.open(url,"중복체크","location=no,width=300,height=80,left="+w+",top="+h);
	}

	function change_mail(email){
		if(email.options[1].selected){

			regist_form.emailtxt_2.value = "naver.com"
		}
		else if(email.options[2].selected){
			regist_form.emailtxt_2.value = "google.com"
		}
		else if(email.options[3].selected){
			regist_form.emailtxt_2.value = "daum.net"
		}
	}

	function check_all(all){
		if(all.checked){
			for(var i = 0; i<3;i++){
					regist_form.pilsoo[i].checked= true;
				}
			regist_form.choice.checked= true;
		}
		else{
			 for(var i = 0; i<3;i++){
					regist_form.pilsoo[i].checked= false;
				}
			regist_form.choice.checked=false;
		}
	}

	$(document).ready(function(){

		var menuoffset = $('.mainmenu').offset();
  	$(window).scroll(function(){
  		if($(document).scrollTop() > menuoffset.top){
  			$('.mainmenu').addClass('menuFixed');
  		}
  		else{
  			$('.mainmenu').removeClass('menuFixed');
  		}
  	});

  	$('.level2').hide();

	$('.intro_peti a').mouseover(function(){
		$('.intro_peti_sub').slideDown(100);
	});

	$('.ing_peti a').mouseover(function(){
		$('.ing_peti_sub').slideDown(100);
	});

	$('.end_peti a').mouseover(function(){
		$('.end_peti_sub').slideDown(100);
	});

	$('.intro_peti').mouseleave(function(){
		$('.intro_peti_sub').slideUp(500);
	});

	$('.ing_peti').mouseleave(function(){
		$('.ing_peti_sub').slideUp(500);
	});

	$('.end_peti').mouseleave(function(){
		$('.end_peti_sub').slideUp(500);
	});

	$('input[type="checkbox"][name="gender"]').click(function(){
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="gender"]').prop('checked',false);
			$(this).prop('checked', true);
		}
	});

	 $('#sample4_postcode').hide();
    $('#sample4_jibunAddress').hide();
    $('#sample4_extraAddress').hide();



$('#view-1').click(function(){
     	window.open('service-1.html', '약관', 'width=1000px, height=1200px');
     });

$('#view-2').click(function(){
     	window.open('service-2.html', '약관', 'width=1000px, height=1200px');
     });

  $('#pwcktxt').blur(function(){
			if($('#pwtxt').val() != $('#pwcktxt').val()){
				if($('#pwcktxt').val() != ''){
					$('#pwckShow').html("비밀번호가 일치하지 않습니다.");
					$("#pwckShow").css('display', '');
					$('#pwckShow').css('color', 'red');
					$('#pwcktxt').val('');
				}
			}else{
				if($('#pwcktxt').val() != ''){
				$('#pwckShow').html("일치합니다!");
				$('#pwckShow').css('color', 'green');
				}
			}
		});
  
  $('#idtxt').blur(function(){
		
	  	
		var id = $("#idtxt").val();
		if(id != ""){
			
		$.ajax({
			url:"idcheck_ajax.jsp?id="+id+"",
			type:"post",
			success : function(data){
					//console.log(data);
						$("#idchk_box").html(data);
						
					var checker = 1;
			}
		});
		}else{
			$("#idchk_box").html("아이디를 입력해주세요.");
			$("#idchk_box").css('color', 'red');
		}
		
	}); 

});
