<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Insert title here</title>


</head>
<body>
<%@include file="../header.jsp" %>

<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>

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
      <th>번호</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>날짜</th>
      <th>조회수</th>
      </tr>
   </thead>
   <tbody>
    <c:forEach items="${list}" var="boardVO">
      <tr>
         <td>${boardVO.bno}</td>
         <td><a href='/information/read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
         <td>${boardVO.writer}</td>
         <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
         <td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
      </tr>
   </c:forEach>
   </tbody>
</table>
<%@include file="../footer.jsp" %>

</body>
</html>