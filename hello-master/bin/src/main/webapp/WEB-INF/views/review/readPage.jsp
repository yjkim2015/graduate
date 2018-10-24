<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/upload.js"></script>

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
</style>
<script type="text/javascript">
$(document).ready(function(){

	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/review/modifyPage");
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
				
				formObj.attr("action", "/review/removePage");
				formObj.submit();
				
			});
		}else{
			
			formObj.attr("action", "/review/removePage");
			formObj.submit();
		}
		
	 	/*
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
		 */
	});	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/review/");
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
	<input type="hidden" name="bno" value="${boardVO2.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>


<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail1">제목</label> <input type="text" 
		name="title" class="form-control" value="${boardVO2.title }"
		 readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">내용</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO2.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">글쓴이</label>
		<input type="text" name="writer" class="form-control" value="${boardVO2.writer }"
		readonly="readonly">
	</div>
</div>

<div class="box-footer">

 	<div><hr></div>

    <ul class="mailbox-attachments clearfix uploadedList">
    </ul>
        <script>
    if("${boardVO2.writer}"=="${name}"){
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
			 value="${name}" readonly> <label for="exampleInputEmail1">내용</label>
			<input class="form-control" type="text" placeholder="Reply TEXT" id="newReplyText">
		</div>
		<div class="box-footer">
			<button type="submit" class="but" id="replyAddBtn">등록</button>
		</div>
	</div>
</div>

<ul class="timeline">
	<li class="time-label" id="repliesDiv"><span class="bg-green">
	 댓글 목록<small id="replycntSmall">[${boardVO2.replycnt }]</small></span></li>
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
	var dateObj= new Date();
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() +1;
	var date = dateObj.getDate();
	alert(year+"/"+month+"/"+date);
	return year +"/"+month+"/"+date;
});


var printData = function(replyArr,target,templateObject){

	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

var bno = ${boardVO2.bno};
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
	getPage("/replies2/"+bno+"/1");
});

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/replies2/"+bno+"/"+replyPage);
});

$("#replyAddBtn").on("click",function(){
	
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext= replytextObj.val();
	$.ajax({
		type:'post',
		url:'/replies2/',
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
		url:'/replies2/'+rno,
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
				getPage("/replies2/"+bno+"/"+replyPage);
				
			}
		
		}});
});

$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies2/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPage("/replies2/"+bno+"/"+replyPage);
				
			}
		
		}});
});


</script>
<script>
var bno =${boardVO2.bno};
var template = Handlebars.compile($("#templateAttach").html());

$.getJSON("/review/getAttach/"+bno,function(list){
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