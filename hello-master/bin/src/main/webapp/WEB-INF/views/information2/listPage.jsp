<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Insert title here</title>

<script>
${".pagination li a"}.on("click",function(event){
	event.preventDefault();
	
	var targetPage= $(this).attr("href");
	
	var jobForm = $("#jobForm");
	
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action","/information/listPage").attr("method","get");
	jobForm.submit();
	
});
</script>

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
         <td><a href='/information/readPage${pageMaker.makeQuery(pageMaker.cri.page)
         }&bno=${boardVO.bno}'>
         ${boardVO.title}</a></td>
         <td>${boardVO.writer}</td>
         <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
         <td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
      </tr>
   </c:forEach>
   </tbody>
</table>

<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMaker.prev }">
			<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage }" var="idx">
			<li
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
		</c:if>
	</ul>
</div>
<form id="jobForm">
	<input type="hidden" name="page" value=${pageMaker.cri.perPageNum}>
	<input type="hidden" name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

<%@include file="../footer.jsp" %>

</body>
</html>