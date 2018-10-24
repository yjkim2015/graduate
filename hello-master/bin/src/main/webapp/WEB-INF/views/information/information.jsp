<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>



</head>
<body>

 <%@include file="../header.jsp" %> 
<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>
 <hr style="border: solid 1px pink">
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
<script type="text/javascript">
if("${id}"=="forteas2"){
document.write("<button id='newBtn'>글 쓰기</button>");
}
</script>	
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
			<td><a href='/information/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}&title=${boardVO.title}'>${boardVO.title}
			<strong>[${boardVO.replycnt }]</strong></a></td>
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
	jobForm.attr("action","/information/list").attr("method","get");
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