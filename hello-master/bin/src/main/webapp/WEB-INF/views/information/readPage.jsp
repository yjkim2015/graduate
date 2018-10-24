<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/upload.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="<c:url value="../../../resources/js/jquery-3.3.1.js"/>"></script>
<link rel="stylesheet" href="../../resources/bootstrap/css/home.css">
<style>
.pagination2 {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}
.pagination2 > li {
  display: inline;
}
.pagination2 > li > a,
.pagination2 > li > span {
  position: relative;
  float: left;
  padding: 6px 12px;
  margin-left: -1px;
  line-height: 1.42857143;
  color: #337ab7;
  text-decoration: none;
  background-color: #fff;
  border: 1px solid #ddd;
}
.pagination2 > li:first-child > a,
.pagination2 > li:first-child > span {
  margin-left: 0;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.pagination2 > li:last-child > a,
.pagination2 > li:last-child > span {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.pagination2 > li > a:hover,
.pagination2 > li > span:hover,
.pagination2 > li > a:focus,
.pagination2 > li > span:focus {
  color: #23527c;
  background-color: #eee;
  border-color: #ddd;
}
.pagination2 > .active > a,
.pagination2 > .active > span,
.pagination2 > .active > a:hover,
.pagination2 > .active > span:hover,
.pagination2 > .active > a:focus,
.pagination2 > .active > span:focus {
  z-index: 2;
  color: #fff;
  cursor: default;
  background-color: #337ab7;
  border-color: #337ab7;
}
.pagination > .disabled > span,
.pagination > .disabled > span:hover,
.pagination > .disabled > span:focus,
.pagination > .disabled > a,
.pagination > .disabled > a:hover,
.pagination > .disabled > a:focus {
  color: #777;
  cursor: not-allowed;
  background-color: #fff;
  border-color: #ddd;
}
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
			<style type="text/css">
			.popup {position:absolute;}
			.back {background-color: gray; opacity:0.5; width: 100%; height: 300%;
					overflow:hidden; z-index:1101;}
			.front {
				z-index:1110; opacity:1; boarder:1px; margin:auto;
			}
			.show{
				position:relative;
				max-width:1200px;
				max-height:800px;
				overflow:auto;
			}
			
			.mailbox-attachments li {
				width: 30% !important;
				height: 400px;
				margin-bottom: 100px !important;
				text-align: center;
				vertical-align: middle;
			}
			
			.mailbox-attachments li img {
				display : table-cell;
				width: 100%;
			}
			
			.mailbox-attachments .img-box {
				display : table;
				min-height: 300px;
				height: 350px;
			}
			
			.mailbox-attachments .title-box {
				height: auto;				
			}
			
</style>
<script type="text/javascript">
$(document).ready(function(){

	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/information/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
/* 	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	}); */

	
	$("#removeBtn").on("click", function(){
		
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
		 */
	});	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/information/");
		formObj.submit();
	});
	
});
</script>



</head>
<body>
<%@include file="../header.jsp" %>


<div class='popup back' style="display:none;"></div>
	<div id="popup_front" class='popup front' style="display:none;">
	<img id="popup_img">
</div> 

<form role="form" method="post" action="modifyPage">
	<input type="hidden" name="bno" value="${boardVO.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>


<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">제목</label> <input type="text" 
		name="title" class="form-control" value="${boardVO.title }"
		 readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">내용</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">글쓴이</label>
		<input type="text" name="writer" class="form-control" value="${boardVO.writer}"
		readonly="readonly">
	</div>
</div>

<div class="box-footer">

 	<div><hr></div>

    
 
 
	
	<ul class="mailbox-attachments clearfix uploadedList" style="width: 100%">
<%-- 	${href} --%>

	 <c:forEach var="item" items="${list}" varStatus="status">
	 		<li> 
	 			<script type="text/javascript">
	 			
	 			</script>
	 			<div class="img-box"><img src="${item.img}" height="350px"></img></div>
	 			<div class="title-box"><h4>${item.title}</h4></div>
	 		</li>
	 </c:forEach>
<!-- 		<p> -->
<!-- 		<img src="http://cfd.tourtips.com/@cms_600/2014062351/gjdjqj/_산타마리아호_TT이정엽(2).jpg" alt="" width="700px" height="500px">	</p>	 -->
<!-- 		<strong class="title">산타마리아호</strong> -->
    </ul>
    <hr>
    
    <div class="text-center">
    <ul class="pagination2">
 <script type="text/javascript">
  
   var href=window.location.href;
   var count;
  href=decodeURI(href);
   if(href.indexOf("홍콩")!=-1){
	   for(count=1;count<=6;count++){
   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=홍콩-"+count+"'>"+count+"</a></li>");
	}}else if(href.indexOf("마카오")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=마카오-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("오사카")){
	   for(count=1;count<=12;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=오사카-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("후쿠오카")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=후쿠오카-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("도쿄")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=도쿄-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("타이베이")){
	   for(count=1;count<=5;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=타이베이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("가오슝")){
	   for(count=1;count<=2;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=가오슝-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("타이중")){
	   for(count=1;count<=2;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=타이중-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("베이징(북경)")){
	   for(count=1;count<=5;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=베이징(북경)-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("상하이(상해)")){
	   for(count=1;count<=5;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=상하이(상해)-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("칭다오(청도)")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=칭다오(청도)-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("황산")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=황산-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("장가계")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=장가계-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("서안")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=서안-"+count+"'>"+count+"</a></li>");
   }}
   else if(href.indexOf("효치민")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=효치민-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("하노이")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=하노이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("다낭")){
	   for(count=1;count<=2;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=다낭-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("라오스")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=라오스-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("쿠알라룸푸르")){
	   for(count=1;count<=2;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=쿠알라룸푸르-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("페낭")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=페낭-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("코타키나발루")){
	   for(count=1;count<=2;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=코타키나발루-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("마닐라")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=마닐라-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("보라카이")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=보라카이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("세부")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=세부-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("푸켓")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=푸켓-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("방콕")){
	   for(count=1;count<=5;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=방콕-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("싱가포르")){
	   for(count=1;count<=7;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=싱가포르-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("블라디보스토크")){
	   for(count=1;count<=3;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=블라디보스토크-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("이스탄불")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=이스탄불-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("크로아티아")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=크로아티아-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("바르셀로나")){
	   for(count=1;count<=5;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=바르셀로나-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("런던")){
	   for(count=1;count<=7;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=런던-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("로마")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=로마-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("파리")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=파리-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("미서부")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=미서부-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("하와이")){
	   for(count=1;count<=9;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=하와이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("뉴욕")){
	   for(count=1;count<=6;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=뉴욕-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("괌")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=괌-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("시드니")){
	   for(count=1;count<=4;count++){
		   document.write("<li><a href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=시드니-"+count+"'>"+count+"</a></li>");
   }}
   
 </script>

   </ul>
    </div>

  
    <br>
    <script>
    if("${boardVO.writer}"=="${name}"){
	document.write("<button type='submit' class='btn btn-warning' id='modifyBtn'>수정</button>");
	document.write("<button type='submit' class='btn btn-danger' id='removeBtn'>삭제</button>");
    }
	</script>
	
	<button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
	
</div>


<div class="row">
	<div class="col-md-12">
		<div class="box box-success">
			<h3 class="box-title">댓글 달기</h3>
		</div>
		<div class="box-body">
			<label for="exampleInputEmail1">글쓴이</label><input 
			class="form-control" type="text" placeholder="USER ID"
			id="newReplyWriter" value="${name}" readonly> <label for="exampleInputEmail1">내용</label>
			<input class="form-control" type="text" placeholder="Reply TEXT" id="newReplyText">
		</div>
		<div class="box-footer">
			<button type="submit" class="but" id="replyAddBtn">등록</button>
		</div>
	</div>
</div>

<ul class="timeline">
	<li class="time-label" id="repliesDiv"><span class="bg-green">
	 댓글 목록<small id="replycntSmall">[${boardVO.replycnt }]</small></span>
	 </li>
</ul>
<div class="text-center">
	<ul id="pagination" class="pagination pagination-sm no-margin">
	
	</ul>
</div>

<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
	<span class="time">
		<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
	</span>
	<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
	<div class="timeline-body">{{replytext}} </div>
		<div class="timeline-footer">
		<a class="btn btn-primary btn-xs"
		data-toggle="modal" data-target="#modifyModal">Modify</a>
	</div>
</div>
</li>
{{/each}}

</script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
alt="Attachment"></span>
	<div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
</span>
</div>
</li>
</script>

<script>

Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj= new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() +1;
	var date = dateObj.getDate();
	return year +"/"+month+"/"+date;
});

var printData = function(replyArr,target,templateObject){

	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

var bno = ${boardVO.bno};
var replyPage= 1;

function getPage(pageInfo){
	$.getJSON(pageInfo,function(data){
		printData(data.list,$("#repliesDiv"),$("#template"));
		printPaging(data.pageMaker,$(".pagination"));
		$("#modifyModal").modal('hide');
		$("#replycntSmall").html("[ " +data.pageMaker.totalCount +" ]");
	});
}

var printPaging= function(pageMaker,target){
	
	var str="";
	if(pageMaker.prev){
		str+= "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++)
		{
		var strClass= pageMaker.cri.page==i?'class=active':'';
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage +1)+"'> >> </a></li>";
	}
	target.html(str);
};

$("#repliesDiv").on("click",function(){
	
	if($(".timeline li").size() >1){
		return;
	}
	getPage("/replies/"+bno+"/1");
});

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/replies/"+bno+"/"+replyPage);
});

$("#replyAddBtn").on("click",function(){
	
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext= replytextObj.val();
	$.ajax({
		type:'post',
		url:'/replies/',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({bno:bno,replyer:replyer,replytext:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("등록 되었습니다.");
				replyPage=1;
				getPage("/replies/"+bno+"/"+replyPage);
				replyerObj.val("");
				replytextObj.val("");
			}
		
		}});
});

$(".timeline").on("click",".replyLi",function(event){
	
	var reply=$(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
});

$("#replyModBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({replytext:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("수정 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});

$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});


</script>
<script>
var bno =${boardVO.bno};
var template = Handlebars.compile($("#templateAttach").html());

$.getJSON("/information/getAttach/"+bno,function(list){
	$(list).each(function(){
		var fileInfo = getFileInfo(this);
		var html = template(fileInfo);
		
		$(".uploadedList").append(html);
	})
})

$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	

</script>
<%@include file="../footer.jsp" %>

</body>
</html>