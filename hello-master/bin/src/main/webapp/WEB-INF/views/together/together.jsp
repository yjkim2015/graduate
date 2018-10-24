<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Insert title here</title>


<script type="text/javascript" src="../resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../resources/js/sockjs-0.3.4.js"></script>
</head>
<body>
<%@include file="../header.jsp" %>


<!-- <script type="text/javascript">
 var wsocket;
 
 function connect() {
  wsocket = new SockJS(
    "http://localhost:8181/chat.sockjs");
  wsocket.onopen = onOpen;
  wsocket.onmessage = onMessage;
  wsocket.onclose = onClose;
 }
 function disconnect() {
  wsocket.close();
 }
 function onOpen(evt) {
  appendMessage("연결되었습니다.");
 }
 function onMessage(evt) {
  var data = evt.data;
  if (data.substring(0, 4) == "msg:") {
   appendMessage(data.substring(4));
  }
 }
 function onClose(evt) {
  appendMessage("연결을 끊었습니다.");
 }
 
 function send() {
  var nickname = $("#nickname").val();
  var msg = $("#message").val();
  wsocket.send("msg:"+nickname+":" + msg);
  $("#message").val("");
 }

 function appendMessage(msg) {
  $("#chatMessageArea").append(msg+"<br>");
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
  $('#exitBtn').click(function() { disconnect(); });
 });
</script>
 -->
<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>
<div class="box-body">
	<select name="searchType">
		<option value="n"
			<c:out value="${cri.searchType == null?'selected':''}"/>>
		---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
		Title</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
		Content</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
		Writer</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
		Title OR Content</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
		Content OR Writer</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
		Title OR Content OR Writer</option>
	
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
<button id="searchBtn">검색</button>
<button id="newBtn">방 만들기</button>
	
</div>
<table class="table table-bordered">
    <colgroup>
       <col style="width:5%;" />
       <col style="width:30%;" />
       <col style="width:30%;" />
       <col style="width:30%;" />
       <col style="width:30%;" />
   </colgroup>
   <thead>
    <tr>
      <th>방번호</th>
      <th>방제목</th>
      <th>방장</th>
      <th>날짜</th>
      </tr>
   </thead>
   <tbody>
    <c:forEach items="${list3}" var="chatboardVO">
		<tr>
			<td>${chatboardVO.bno}</td>
			<td><a href='/together/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${chatboardVO.bno}'>${chatboardVO.title}</a></td>
			<td>${chatboardVO.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${chatboardVO.regdate}" /></td>
		</tr>
	</c:forEach>
   </tbody>
</table>

<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMaker.prev }">
			<li>
			<a href="${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage }" var="idx">
			<li
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="${pageMaker.makeSearch(idx)}">${idx }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
		</c:if>
	</ul>
</div>
<form id="jobForm">
	<input type="hidden" name="page" value=${pageMaker.cri.page}>
	<input type="hidden" name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

<%@include file="../footer.jsp" %>
<script type="text/javascript">
${".pagination li a"}.on("click",function(event){
	event.preventDefault();
	
	var targetPage= $(this).attr("href");
	
	var jobForm = $("#jobForm");
	
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action","/together/").attr("method","get");
	jobForm.submit();
	
});

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#searchBtn').on("click",function(event){
		self.location=""
		+ '${pageMaker.makeQuery(1)}'
		+ "&searchType="
		+ $("select option:selected").val()
		+ "&keyword=" + $('#keywordInput').val();
	});
	
	$('#newBtn').on("click",function(evt){
		self.location="register";
	});
});
</script>
</body>
</html>