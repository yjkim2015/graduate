<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


</head>

<body>
<%@include file="../header.jsp" %>

<form id='registerForm' role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail">방 제목</label>
			<input type="text" name="title" class="form-control" placeholder="enter title">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail">방장</label>
			<input type="text" id="writer1" name="writer" class="form-control" value="${name}" readonly >

		</div>

	</div>
		<!--  /.box-body -->
		<div class="box-footer">
			
			
		<button type="submit" class="btn btn-primary">방만들기</button>
			
		</div>

</form>


<script type="text/javascript" src="../resources/js/upload.js"></script>





<%@include file="../footer.jsp" %>

</body>
</html>