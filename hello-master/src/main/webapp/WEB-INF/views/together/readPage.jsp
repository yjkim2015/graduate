<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동행</title>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script type="text/javascript" src="../resources/js/upload.js"></script>
<script type="text/javascript" src="../resources/js/sockjs-0.3.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <!-- jQuery 1.x.x -->  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<style>
#header{width:100%; height:80px; background:#fff; position:fixed; top:0; overflow:hidden; z-index:9999;}
#header h4{width:146px; height:40px; position:absolute; top:20px; left:50px;}
#header .gnb{margin:0 auto; text-align:center; overflow:hidden;}
#header .gnb li{margin:0 25px; display:inline-block;}
#header .gnb li a{height:80px; line-height:80px; display:block; font-weight:700; font-size:15px; letter-spacing:2px; position:relative; color:#333;}
#header .gnb li a:before {content:''; width:0; height:2px; background:orange; position:absolute; left:50%; bottom:0;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
}
#header .gnb li a:hover {color:orange; text-decoration:none;}
#header .gnb li a:hover:before {width:100%;left:0;}

#header .join{width:150px; height:30px; line-height:30px; position:absolute; top:25px; right:50px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:40px; text-align:center; font-size:12px; font-weight:700;}
#header .join a{position:relative; color:rgba(0, 0, 0, 0.5);}
#header .join span{width:1px; height:10px; line-height:10px; background:rgba(0, 0, 0, 0.5); position:relative; margin:0 8px; display:inline-block; vertical-align:middle; top:-1px;}

.visual{width:100%; min-height:400px; overflow:hidden; padding:80px 0 0 0; background-image:url("../resources/assets/images/GO.jpg"); background-size:100% 100%;}

.login_wrap{width:500px; height:92px; float:left; overflow:hidden;}
.login_wrap>label{width:600px; height:46px; float:left;}
.login_wrap>label>p{width:120px; height:46px; float:left;}
.login_wrap>label>input{width:358px; height:40px; float:left; margin-left:18px; }
.login_bt{width:128px; height:10px; float:left; margin-left:12px;}
.login_wrap img{float:left; display:block; }
.total_wrap{width:650px; height:100px; margin:auto; margin-top:29.5%;}

#footer{width:100%; height:70px; background:gold; bottom:0;}

.join2{width:150px; height:30px; line-height:30px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:40px; text-align:center; font-size:12px; font-weight:700;}
.join2 a{position:relative; color:rgba(0, 0, 0, 0.5);}
.join2 span{width:1px; height:10px; line-height:10px; background:rgba(0, 0, 0, 0.5); position:relative; margin:0 8px; display:inline-block; vertical-align:middle; top:-1px;}
#join3{width:450px; height:30px; line-height:30px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:100px; text-align:left; font-size:12px; font-weight:700; }
#join3 a{position:relative; color:rgba(0, 0, 0, 0.5);}
#join3 span{width:1px; height:10px; line-height:10px; background:rgba(0, 0, 0, 0.5); position:relative; margin:0 8px; display:inline-block; vertical-align:middle; top:-1px;}
#join4{width:150px; height:30px; line-height:30px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:40px; text-align:center; font-size:12px; font-weight:700; margin-left:-10px; margin-top:-10px;}



.but{
background-color:  #008CBA; /* Green */
    border: none;
    color: white;
    padding: 10px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

</style>
<style>
#chatArea{
 width: 500px; height: 300px; overflow-y: auto;  border-radius: 25px; float:left; padding:10px; 
  font-size: 14px;
  background: #ddd;
  color: black;
  margin-left:15px;
  font-family: "Josefin Sans", sans-serif;
}

#chatList{
border-radius: 25px;
  color: black;

margin-left:550px;
font-size: 10px;
 background: #ddd;
  font-family: "Josefin Sans", sans-serif;

}
.chatlist{
 border-bottom: 1px solid #e5e5e5;}
 
 
</style>
<script type="text/javascript">
var name="${name}";
if(name=="" || name==null){logout();}
function logout(){
	location.href="/Logout";
}
var id="${id}";
</script>
<script type='text/javascript'>
function show_detail(){
	

	setTimeout(function(){$("#tour").fadeOut(500);},500);
	$("#tour").css("style='display:none;'");
	setTimeout(function(){$("#tour2").fadeIn(500);},500);
	setTimeout(function(){$("#tour3").fadeIn(500);},500);

	setTimeout(function(){$("#tour3").fadeOut(10000);},10000);
	$("#tour3").css("style='display:none;'");

	setTimeout(function(){$("#tour2").fadeOut(10000);},10000);
	$("#tour2").css("style='display:none;'");

	setTimeout(function(){$("#tour").fadeIn(15000);},15000);
	$("#tour").css("style='display:contents;'");

	//setTimeout(function(){location.href="with"},2000);
}
</script>
<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>

<script type="text/javascript">
var speak=0;

 var wsocket;
 var count=0;
 var bno = ${chatBoardVO.bno}
 var connection=1;
 var namelist;
 var namecount=0;
 function connect() {
	if(connection==1){
  wsocket = new SockJS(
	"https://localhost/chat.sockjs");
  wsocket.onopen = onOpen;
  wsocket.onmessage = onMessage;
  wsocket.onclose = onClose;
	}
 }
 function disconnect() {
  wsocket.close();
  connection=1;
 }
 function onOpen(evt) {
  appendMessage("연결되었습니다.");

  connection=0;
  if(connection==0){
	 count++;
	 var nickname = $("#nickname").val();
	  $.ajax({
			data:{
				chatname:nickname,
				bno:bno
			},
		url:"nameList",
		success:function(data)
		{	
			namelist=data.chat2;
			namecount=data.chat2.length;
			for(var i=0;i<namecount;i++){
				//alert(namelist[i])
				$(".chatList2").append("<li id='join4' style='margin-top:2px;'>"+namelist[i]+"<br></li>");

			}
		  var lis= $(".chatList2").find('li');			
		}	
		});
	  
	 
	}
}
 
 function onMessage(evt) {
  var data = evt.data;
  var bno = ":"+${chatBoardVO.bno};
  var n = data.indexOf(bno);


  if (data.substring(0, 4) == "msg:") { 
	
	appendMessage(data.substring(14,n));
 
  }
 }
 function onClose(evt) {
  appendMessage("연결을 끊었습니다.");
  var nickname = $("#nickname").val();

  $.ajax({
	
		data:{
			chatname:nickname,
			bno:bno
		},
	url:"nameremove", 
	success:function(data)
	{
		
	}	
	});

  connection=1;
  $(".chatList2").find('li').remove();
 }
 
 function send() {

  var nickname = $("#nickname").val();

  var msg = $("#message").val();
  var bno = ${chatBoardVO.bno};
  wsocket.send("msg:"+nickname+":" + msg+":"+bno);
  $("#message").val("");
  
  $.ajax({
		data:{
			chatname:nickname,
			bno:bno
		},
	url:"realnameList",
	success:function(data)
	{
		namelist=data.chat2;
		namecount=data.chat2.length;
		$(".chatList2").find('li').remove();

		for(var i=0;i<namecount;i++){
			//alert(namelist[i])
			$(".chatList2").append("<li id='join4' style='margin-top:2px;'>"+namelist[i]+"<br></li>");

		}
	  var lis= $(".chatList2").find('li');
	 
		
	}	
	});

  
	
 }
 function speak_change1(){
	 speak=0;
	 alert("한글입력/영어번역");
}
	 function speak_change2(){
	 	speak=1;
	 	alert("영어입력/한글번역");
}
 function appendMessage(msg) {
	 $("#chatMessageArea").append("<li class='chatlist' id='join3'>"+msg+"<br></li>");

	 $.ajax({
		  data:{
			  msg:msg,
			  speak:speak
		  },
		  url:"chat_send",
		  success:function(data){
			

			  var index=data.indexOf("{");

				var msg=data.substring(index+1,data.length);


				  $("#chatMessageArea").append("<li class='chatlist' id='join3'>"+msg+"<br></li>");

		  }
			 });
  var chatAreaHeight = $("#chatArea").height();
  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
  $("#chatArea").scrollTop(maxScroll);
 }

 $(document).ready(function() {
  $('#message').keypress(function(event){
   var keycode = (event.keyCode ? event.keyCode : event.which);
   if(keycode == '13'){
    send(); 
   }
   event.stopPropagation();
  });
  $('#sendBtn').click(function() { send(); });
  $('#enterBtn').click(function() { connect(); });
  $('#exitBtn').click(function() { disconnect(); });
  $('#korean').click(function(){speak_change1()});
  $('#english').click(function(){speak_change2()});
  
 });
</script>

<script type="text/javascript">
$(document).ready(function(){

	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	/*$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/information/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	*/
/* 	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	}); 

	
	/*$("#removeBtn").on("click", function(){
		
		var replyCnt =  $("#replycntSmall").html();
		
		
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		console.log(arr);
	 	if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
				formObj.attr("action", "/information/removePage");
				formObj.submit();
				
			});
		}else{
			
			formObj.attr("action", "/information/removePage");
			formObj.submit();
		}
		
	 	/*
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
		 
		 
	});	*/
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/together/");
		formObj.submit();
	});
	
});
</script>



</head>
<body>


<div id="header" >
     <h4>
      <a href="/with2"><img src="../resources/assets/images/logo2.png" alt="logo"></a>
     </h4>
     <ul class="gnb">
       <li id='tour2' style='display:none;'>
        <a href="/information/" >여행지 명소</a>
      </li>
      <li id='tour3' style='display:none;'>
        <a href="/food/" >여행지 맛집</a>
      </li> 
      <li id='tour'>
        <a href="#"  onClick="show_detail();">여행지 정보</a>
      </li>
      <li>
        <a href="/together/">동행</a>
      </li>
      <li>
        <a href="/review/">여행 후기</a>
      </li>
      <li>
        <a href="/follow_route" >오시는 길</a>
      </li>
      <li>
        <a href="/help/" >고객 센터</a>
      </li>
     
     </ul>
        <div class="join">
	      <a href='#'><strong>${name}님</strong></a>
	      <span></span>
	      <a href='#' onclick="logout();" >로그아웃</a>
       </div>
     </div>
  <div class="visual">
  </div>
<div style="width:1200px;margin:auto; margin-top:40px;">
<form role="form" method="post" action="modifyPage">
	<input type="hidden" name="bno" value="${chatBoardVO.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>
 
<div class="box-body">
<div class="form-group">
		<label for="exampleInputEmail1">방번호</label> <input type="text" 
		name="title" class="form-control" value="${chatBoardVO.bno }"
		 readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">방제목</label> <input type="text" 
		name="title" class="form-control" value="${chatBoardVO.title }"
		 readonly="readonly">
	</div>

	<div class="form-group">
		<label for="exampleInputEmail1">방장</label>
		<input type="text" name="writer" class="form-control" value="${chatBoardVO.writer }"
		readonly="readonly">
	</div>
</div>

<div class="box-footer">

	<!-- <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button> -->
	<!-- <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button> -->
	<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
</div>


<div class="row">
	<div class="col-md-12">
		<div class="box box-succes  s">
			<h3 class="box-title"></h3>
		</div>
		
		<div class="box-body" style="margin-bottom:5px;">
	<input type="button" id="korean" value="한글" class="btn btn-success" style="font-size:10px; margin-left:30px;">
	<input type="button" id="english" value="English" class="btn btn-success" style="font-size:10px; margin-left:5px;">
	
	<input type="text" id="nickname" value="${id} | ${name}" readonly class="join2" style="color:black; font-size:14px ;font-weight:bolder; margin-left:30px;">
	<input type="button" id="enterBtn" value="입장" class="btn btn-success" style="font-size:10px; margin-left:30px;">
 	<input type="button" id="exitBtn" value="나가기" class="btn btn-danger" style="font-size:10px;">
    
    </div>
    
     <div id="chatArea"><div id="chatMessageArea"></div></div>
     <div id="chatList" style="overflow-y: auto; width: 200px; height: 300px;"><center><h5>채팅 참여자 리스트</h5><hr style="border:1px solid white; margin-top:-5px;"></center><ul class="chatList2" style="font-size:12px;"></ul>
     </div>
   </div>
   	</div>
    <input type="text" id="message"  size=30 style="margin-left:20px;color:black;  width:430px; font-size:15px; margin-top:10px;" >
    <input type="button" id="sendBtn" value="전송" class="btn btn-primary" style="font-size:15px; margin-left:5px;">
	


</div>





<div id="footer" style="margin-top:40px;"></div>
</body>
</html>