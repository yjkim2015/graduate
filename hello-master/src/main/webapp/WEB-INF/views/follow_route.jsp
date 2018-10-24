<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../resources/assets/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<title>해외 여행지정보(맛집)</title>
<style>
#header{width:100%; height:80px; background:#fff; position:fixed; top:0; overflow:hidden; z-index:9999;}
#header h4{width:146px; height:40px; position:absolute; top:20px; left:50px;}
#header .gnb{margin:0 auto; text-align:center; overflow:hidden;}
#header .gnb li{margin:0 25px; display:inline-block;}
#header .gnb li a{height:80px; line-height:80px; display:block; font-weight:700; font-size:15px; letter-spacing:2px; position:relative; color:#333;}
#header .gnb li a:before {content:''; width:0; height:2px; background:orange; position:absolute; left:50%; bottom:0;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
}
#header .gnb li a:hover {color:orange; text-decoration:none;}
#header .gnb li a:hover:before {width:100%;left:0;}

#header .join{width:150px; height:30px; line-height:30px; position:absolute; top:25px; right:50px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:40px; text-align:center; font-size:12px; font-weight:700;}
#header .join a{position:relative; color:rgba(0, 0, 0, 0.5);}
#header .join span{width:1px; height:10px; line-height:10px; background:rgba(0, 0, 0, 0.5); position:relative; margin:0 8px; display:inline-block; vertical-align:middle; top:-1px;}

.visual{width:100%; min-height:400px; overflow:hidden; padding:80px 0 0 0; background-image:url("../resources/assets/images/follow.jpg"); background-size:100% 100%;}

.login_wrap{width:500px; height:92px; float:left; overflow:hidden;}
.login_wrap>label{width:600px; height:46px; float:left;}
.login_wrap>label>p{width:120px; height:46px; float:left;}
.login_wrap>label>input{width:358px; height:40px; float:left; margin-left:18px; }
.login_bt{width:128px; height:10px; float:left; margin-left:12px;}
.login_wrap img{float:left; display:block; }
.total_wrap{width:650px; height:100px; margin:auto; margin-top:29.5%;}

#footer{width:100%; height:70px; background:#9370DB; bottom:0;}
.btn-primary{background-color:#9370DB; margin-top:40px;}
</style>
 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height:500px;
        width:1200px;
		margin:auto;
       margin-top:40px;
       margin-bottom:40px; 
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
<script type="text/javascript">
var name="${name}";
if(name=="" || name==null){logout();}
function logout(){
	location.href="/Logout";
}
var id="${id}";
</script>

<script type='text/javascript'>
function show_detail(){
	

	setTimeout(function(){$("#tour").fadeOut(500);},500);
	$("#tour").css("style='display:none;'");
	setTimeout(function(){$("#tour2").fadeIn(500);},500);
	setTimeout(function(){$("#tour3").fadeIn(500);},500);

	setTimeout(function(){$("#tour3").fadeOut(10000);},10000);
	$("#tour3").css("style='display:none;'");

	setTimeout(function(){$("#tour2").fadeOut(10000);},10000);
	$("#tour2").css("style='display:none;'");

	setTimeout(function(){$("#tour").fadeIn(15000);},15000);
	$("#tour").css("style='display:contents;'");

	//setTimeout(function(){location.href="with"},2000);
}
</script>
</head>
<body>

<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>

<body>
 <div id="header" >
     <h4>
      <a href="/with2"><img src="../resources/assets/images/logo2.png" alt="logo"></a>
     </h4>
     <ul class="gnb">
     <li id='tour2' style='display:none;'>
        <a href="/information/" >여행지 명소</a>
      </li>
      <li id='tour3' style='display:none;'>
        <a href="/food/" >여행지 맛집</a>
      </li> 
      <li id='tour'>
        <a href="#"  onClick="show_detail();">여행지 정보</a>
      </li>
      <li>
        <a href="/together/">동행</a>
      </li>
      <li>
        <a href="/review/">여행 후기</a>
      </li>
      <li>
        <a href="/follow_route" >오시는 길</a>
      </li>
      <li>
        <a href="/help/" >고객 센터</a>
      </li>
     </ul>
        <div class="join">
	      <a href='#'><strong>${name}님</strong></a>
	      <span></span>
	      <a href='#' onclick="logout();" >로그아웃</a>
       </div>
     </div>
  <div class="visual">
  </div>
 
 
<div class="box-body" style="width:100%; margin-top:40px;">
	<h1 style=" border-bottom: 1px solid #d2d6de; width:30%; margin:auto;">오시는 길</h1>
</div>


	<div style="width:100%;">
      <div id="map"></div>
	</div>
 <script type="text/javascript">

      function initMap() {
    
    	  var myLatLng;
    	  var name;
    	
    	
    	   myLatLng=[{lat:37.615095,lng:127.0131113}];
      	   name=['서경대학교'];
    	  	   
    	        var map = new google.maps.Map(document.getElementById('map'), {
    	            zoom: 16,  
    	            center: myLatLng[0]
    	          });
          	
    	        for(var i=0;i<myLatLng.length;i++){
    	        	
    	           var marker = new google.maps.Marker({
    	            position: myLatLng[i],
    	            map: map,
    	            title: name[i]
    	          });
    	        }
    	     
      }
    	
</script>
   <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACpkEI5NDJxhW5wPOLmoAqnHv6IxwC8f8&callback=initMap">
      </script>
      
      
<div style="width:100%">     
   <div style="width:1200px;height:100px; margin:auto; margin-bottom:40px;">
      <div style="float:left;">
      <p><h2 style=" border-bottom: 1px solid #d2d6de; width:40%;">주소</h2></p>
      <p><h4>서울특별시 성북구 정릉동 서경로 124</h4></p>
      </div>
      <div style="float:left; margin-left:250px;">
      <p><h2 style=" border-bottom: 1px solid #d2d6de; width:100%;">전화번호</h2></p>
      <p><h4>02-940-7114</h4></p>
      </div>
    </div> 
</div>
     
<%@include file="footer.jsp" %>


</body>
</html>