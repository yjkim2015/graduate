<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="../../../resources/js/jquery-3.3.1.js"/>"></script>
		<script type="text/javascript">
$(document).ready(function(){

	var formObj= $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click",function(){
	formObj.attr("action","/information/modify");
	formObj.attr("method","get");
	formObj.submit();
	});
	
	$(".btn-danger").on("click",function(){
	formObj.attr("action","/information/remove");
	formObj.submit();
	});
	
	$(".btn-primary").on("click",function(){
	self.location="/information/listAll";
	});
});

</script>
</head>
<body>
<%@include file="../header.jsp" %>
<form role="form" method="post">
	<input type="hidden" name="bno" value="${boardVO.bno }">

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
		<input type="text" name="writer" class="form-control" value="${boardVO.writer }"
		readonly="readonly">
	</div>
</div>

<div class="box-footer">
	<button type="submit" class="btn btn-warning">수정</button>
	<button type="submit" class="btn btn-danger">삭제</button>
	<button type="submit" class="btn btn-primary">목록</button>
</div>
<%@include file="../footer.jsp" %>

</body>
</html>