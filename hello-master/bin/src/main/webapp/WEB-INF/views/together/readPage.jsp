<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/upload.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../resources/js/sockjs-0.3.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="<c:url value="../../../resources/js/jquery-3.3.1.js"/>"></script>
<style>
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
  background: pink;
  color: white;
  margin-left:15px;
  font-family: "Josefin Sans", sans-serif;
}

#chatList{
border-radius: 25px;
  color: white;

margin-left:550px;
font-size: 14px;
 background: pink;
  font-family: "Josefin Sans", sans-serif;

}
.chatlist{
 border-bottom: 1px solid #e5e5e5;}
</style>

<script type="text/javascript">
 var wsocket;
 var count=0;
 var bno = ${chatBoardVO.bno}
 var connection=1;
 var namelist;
 var namecount=0;
 function connect() {
	if(connection==1){
  wsocket = new SockJS(
	"http://localhost:8181/chat.sockjs");
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
	  var nickname = "${name}";
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
				$(".chatList2").append("<li><h4>"+namelist[i]+"<br></h4></li>");

			}
		  var lis= $(".chatList2").find('li');
		  alert(lis[1].innerText);
			
		}	
		});
	  
	 
	}
}
 
 function onMessage(evt) {
  var data = evt.data;
  var bno = ":"+${chatBoardVO.bno};
  var n = data.indexOf(bno);
 
  if (data.substring(0, 4) == "msg:") { 
	
	  
   appendMessage(data.substring(4,n));
  }
 }
 function onClose(evt) {
  appendMessage("연결을 끊었습니다.");
  var nickname = "${name}";

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
			$(".chatList2").append("<li><h4>"+namelist[i]+"<br></h4></li>");

		}
	  var lis= $(".chatList2").find('li');
	 
		
	}	
	});

  
	
 }

 function appendMessage(msg) {
  $("#chatMessageArea").append("<li class='chatlist'>"+msg+"<br></li>");
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
<%@include file="../header.jsp" %>



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
		
		<div class="box-body">
	<input type="text" id="nickname" value="${name}" readonly class="btn btn-link" style="color:black; font-size:12px ;font-weight:bolder;">
	<input type="button" id="enterBtn" value="입장" class="btn btn-success" style="font-size:10px;">
 	<input type="button" id="exitBtn" value="나가기" class="btn btn-danger" style="font-size:10px;">
    
    </div>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <div id="chatList" style="overflow-y: auto; float: center;  width: 200px; height: 300px;"><center><h5>채팅 참여자 리스트</h5><hr style="border:1px solid white;"></center><ul class="chatList2"></ul></div></div>
   	</div>
    <input type="text" id="message" class="btn btn-link" style="margin-left:150px; color:black; font-size:10px" >
    <input type="button" id="sendBtn" value="전송" class="btn btn-primary" style="font-size:10px;">
	








<%@include file="../footer.jsp" %>

</body>
</html>