function gotoPetition(){
	window.location.href="writePetition.jsp";
}	

	$(document).ready(function(){

    $(function(){
      $("#accordion").accordion();
    });

    $('.peti_ing').css('border-bottom', '4px solid navy');

   

  	var currentPosition = parseInt($(".quickmenu").css("top")); 
  	$(window).scroll(function(){ 
  		var position = $(window).scrollTop(); 
  		$(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500); 
  	});


  	var menuoffset = $('.mainmenu').offset();
  	$(window).scroll(function(){
  		if($(document).scrollTop() > menuoffset.top){
  			$('.mainmenu').addClass('menuFixed');
  		}
  		else{
  			$('.mainmenu').removeClass('menuFixed');
  		}
  	});

  	$('.acc_title-2').click(function(){
  		$('.more2').hide();
  		$('.more').fadeIn(1000);
  	});

  	$('.acc_title-1').click(function(){
  		$('.more').hide();
  		$('.more2').fadeIn(1000);
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

  $('.more').hide();

  $('.chat-list').hide();

  $('.chat').click(function(){
   var list =  $(this).next('.chat-list');

    if(list.is(":visible")){
        list.fadeOut();
    }
    else{
      list.fadeIn();
    }
  });


});
