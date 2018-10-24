<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>

<!--  left column -->
<div class="col-md-12">
	<!--  general form elements -->
	<div class="box">
		<div class="box-header" with-border">
			<h3 class="box-title">SUCCESS PAGE</h3>
		</div>
		<div class="box-body">SUCCESS!!!</div>
		<!--  /.box-body -->
		<div class="box-footer">Footer</div>
		<!-- /.box-footer -->
	</div>
</div>
<!-- /.col -->
<%@include file="../footer.jsp" %>
</body>
</html>