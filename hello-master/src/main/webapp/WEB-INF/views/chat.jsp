<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="../resources/js/sockjs-0.3.4.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#sendBtn").click(function(){
		sendMessage();
	});
});

var sock =  new SockJS("http://localhost:8181/echo");

sock.onmessage = onMessage;

sock.onclose = onClose;

function sendMessage(){
	sock.send($("#message").val()+"<br/>");
}

function onMessage(evt){
	var data = evt.data;
	$("#data").append(data);
}

function onClose(evt){
	$("#data").append("Connection Closed!");
}
</script>
</head>
<body>

<input type="text" id="message"/>
<input type="button" id="sendBtn" value="SEND"/>
<div id="data"></div>
</body>
</html>