<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<ul>
			<li class="latest_sort">최신 순</li>
			<li class="maximum_sort">최다 동의 순</li>
			<li class="expire_sort">만료 임박 순</li>
</ul>
<div id="wrap" style="color:red; background-color:brown; width:100px; height: 100px;">여기에 내용이 있어도 이 내용을 바꿔줘야함</div>
<input type="text" class="txt" name="txt" /><input type="button" class="btn" name="btn" value="검색" />
</body>
<script type="text/javascript">
$(function(){
	
	if($('.txt').val != ''){
	$('.btn').click(function(){
		$.ajax(
			{
				url: "default.jsp",   // 이동할 페이지
				type: "post", // get or post
				dataType: "html",
				success : function(result){
					$('#wrap').html(result);
				},
				error : function(){
					alert("error");
				}

			});
		
		$(this).css({'color': 'red', 'background-color': 'skyblue'});
	});
	}else{
		alert('검색어를 입력하세요');
	}
});
</script>
</html>