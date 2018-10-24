<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Insert title here</title>
<style>
.butt2:hover{
background-color: white;
   color: black;
   border: 2px solid #f44336;
    text-align: center;
   display: inline-block;
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>
<script type="text/javascript">

function checkLogin(){
	var sid=document.form1.id.value;
	var spw=document.form1.pw.value;
	
	if(sid==""){
		alert("아이디를 입력해주세요.");
	}else if(spw==""){
		alert("비밀번호를 입력해주세요.");
	}
	
 	if(sid!="" && spw!=""){
	$.ajax({
		data:{
			id:sid,
			pw1:spw
		},
	url:"checkLogin",
	success:function(data)
	{
		
		if(data==0){
			alert("존재하지 않는 아이디입니다.");
		}
		if(data==1){
			alert("잘못된 비밀번호입니다");
		}
		if(data==2){
			alert("이메일 인증 후 로그인해주세요.");
		}
		if(data==3){
			location.href="welcome3";
		}
		
	}	
	});
 	}
}


	


</script>


 <!-- <link rel="stylesheet" href="../resources/assets/css/stylemj.css"> -->
</head>
<body>

 <%@include file="header.jsp" %> 
 
  <!--테이블 시작 -->
  <hr style="border: solid 1px pink">
  
  <center>

 	<form id="SignUpForm"  name="form1" method="post">
         <table border="2" cellspacing="1" cellpadding="1" >
   
      <tr>
         <th>아이디</th>
         <td> <input type="text" name="id" id="id"  required><a href='#' style='cursor:pointer'></a>
  		<td rowspan="3"> <button type="button" class="butt1" style="height:50px;" onClick="checkLogin()">로그인</button></td>
  		
      </tr>

      <tr>
         <th>비밀번호</th>
         <td><input type="password" name="pw" id="pw" required ></td>
      </tr>
	<tr>

   </table>
   <br>
	<button type="button" class="butt2">아이디 찾기</button>
	<button type="button" class="butt2">비밀번호 찾기</button>
  </form>
 </center>

  
 </body>
 <%@include file="footer.jsp" %>
</html>


