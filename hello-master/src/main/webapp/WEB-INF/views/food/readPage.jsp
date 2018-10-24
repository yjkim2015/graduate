<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해외여행지 정보(맛집)</title>
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

<style>
.star{
display: block;
    height: 15px;
    color: #ff4f02;
    font-size: 18px;
    font-weight: 500;
    padding-left: 50px;
    line-height: 15px;
   background:url("../resources/assets/images/star.png") center no-repeat ; 
   margin-right:25px;
  
}
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

.visual{width:100%; min-height:400px; overflow:hidden; padding:80px 0 0 0; background-image:url("../resources/assets/images/12.jpg"); background-size:100% 100%;}

.login_wrap{width:500px; height:92px; float:left; overflow:hidden;}
.login_wrap>label{width:600px; height:46px; float:left;}
.login_wrap>label>p{width:120px; height:46px; float:left;}
.login_wrap>label>input{width:358px; height:40px; float:left; margin-left:18px; }
.login_bt{width:128px; height:10px; float:left; margin-left:12px;}
.login_wrap img{float:left; display:block; }
.total_wrap{width:650px; height:100px; margin:auto; margin-top:29.5%;}

#footer{width:100%; height:70px; background:#9370DB;  bottom:0;}

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
				margin-top:150px;
				max-width:1200px;
				max-height:800px;
				overflow:auto;
			}
		
			.mailbox-attachments li {
				width: 25% !important;
				height: 480px;
				text-align: center;
				margin-bottom: 40px !important;
				
				vertical-align: middle;
				margin:auto;
				
				padding:5px;
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
				margin-top:7px;
				height: auto;				
				margin-botton:5px;
			}
			
</style>
 <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height:500px;
       
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
    
<script type="text/javascript">

$(document).ready(function(){


	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/food/modifyPage");
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
				
				formObj.attr("action", "/food/removePage");
				formObj.submit();
				
			});
		}else{
			
			formObj.attr("action", "/food/removePage");
			formObj.submit();
		}
		
	 	/*
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
		 */
	});	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/food/");
		formObj.submit();
	});
	
});
</script>



    

</head>
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
  
<div class='popup back' style="display:none;"></div>
	<div id="popup_front" class='popup front' style="display:none;">
	<img id="popup_img">
</div>

<form role="form" method="post" action="modifyPage">
	<input type="hidden" name="bno" value="${boardVO3.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>


<div class="box-body" style="padding:50px">
	<div class="form-group">
		<label for="exampleInputEmail1" style="font-size:20px">제목</label> <input type="text" 
		name="title" class="form-control" value="${boardVO3.title }" style="background-color:white; font-size:15px;"
		 readonly="readonly" >
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1" style="font-size:20px">내용</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly" style="background-color:white; font-size:15px;">${boardVO3.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1"style="font-size:20px">글쓴이</label>
		<input type="text" name="writer" class="form-control" value="${boardVO3.writer }" style="background-color:white; font-size:15px;"
		readonly="readonly">
	</div>
</div>

<div class="box-footer" style="border-top:none; margin-top:-40px; margin-left:40px; margin-right:40px;">

 	<div><hr></div>

   	<ul class="mailbox-attachments clearfix uploadedList" style="width: 100%" >
<%-- 	${href} --%>

	 <c:forEach var="item" items="${list5}" varStatus="status">
	 		<li> 
	 			<script type="text/javascript">
	 			
	 			</script>
	 			<div class="img-box"><img src="${item.img}" height="350px"></img></div>
	 			<div class="title-box" style="font-size:15px;">${item.detail1}<p style="font-size:20px;">${item.title}</p>${item.detail2}</div>
	 		</li>
	 </c:forEach>
<!-- 		<p> -->
<!-- 		<img src="http://cfd.tourtips.com/@cms_600/2014062351/gjdjqj/_산타마리아호_TT이정엽(2).jpg" alt="" width="700px" height="500px">	</p>	 -->
<!-- 		<strong class="title">산타마리아호</strong> -->
    </ul>
      <div id="map"></div>
  
   <script type="text/javascript">

      function initMap() {
    	  var href=window.location.href;
    	  href=decodeURI(href);
    	
    	  var myLatLng;
    	  var name;
    	
    	  if(href.indexOf("홍콩-2")!=-1){
    		   myLatLng=[{lat:22.238994,lng:114.195618},{lat:22.316733,lng:114.171702},{lat:22.297103,lng:114.172161},
    			  			{lat:22.282654,lng:114.153636},{lat:22.301359,lng:114.174043},{lat:22.24331,lng:114.161757},
    			  			{lat:22.284239,lng:114.152467},{lat:22.2801777,lng:114.1719231},{lat:22.284793,lng:114.157927},
    			  			{lat:22.286631,lng:114.150462},{lat:22.298072,lng:114.170507}];
      	   name=['더 베란다','허유산','더로비','타이청베이커리','넛츠포드 테라스',
      		  '점보 플로팅 레스토랑','카우키 레스토링(구기우남)','슈퍼스타 시푸드 레스토랑(코즈웨이 베이점)',
      		  '고디바','팀스 키친','비첸향'];
    	  		document.getElementsByName("hong")[1].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("홍콩-3")!=-1){
    		   myLatLng=[{lat:22.280588,lng:114.18328},{lat:22.2978296,lng:114.1682214},{lat:22.2870756,lng:114.1504296},
                   {lat:22.282232,lng:114.185216},{lat:22.284316,lng:114.153445},{lat:22.281244,lng:114.158018},
                   {lat:22.271018,lng:114.14937},{lat:22.294779,lng:114.169006},{lat:22.270806,lng:114.149925},
                   {lat:22.305035,lng:114.170525},{lat:22.284738,lng:114.158173}];

         		 name=['이슌 밀크 컴퍼니','크리스탈 제이드 라멘 샤오롱바오','허니문 디저트','버거룸',
          	   '조이힝 로스트 미트','라뜰리에드 조엘로부숑','더 피크 룩아웃','제이드가든',
                '막스 누들(빅토리아피크점)','캐피탈 카페','퍼시픽 커피 컴퍼니(빅토리아 피크점)'];
    	  		document.getElementsByName("hong")[2].style.backgroundColor="powderblue";


    	 }else if(href.indexOf("홍콩-4")!=-1){
    		   myLatLng=[{lat:22.294946,lng:114.166862},{lat:22.284098,lng:114.152556},{lat:22.303804,lng:114.160225},
                 {lat:22.281452,lng:114.172163},{lat:22.277667,lng:114.166411},{lat:22.277667,lng:114.166411},
                 {lat:22.295148,lng:114.16898},{lat:22.297766,lng:114.171432},{lat:22.299695,lng:114.175374},
                 {lat:29.6343829,lng:111.5789249},{lat:22.282976,lng:114.154432}];

        		name=['나트랑','씽헝윤','리츠 칼튼 라운지 앤 바','타이우 레스토랑(코즈웨이베이점)',
              	'린 흥 티 하우스','카페 그레이 디럭스','페킹 가든','마카오 레스토랑',
              	'찰리브라운 카페','스타벅스 커피','첨자기면'];
    	  		document.getElementsByName("hong")[3].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("홍콩-5")!=-1){
    		   myLatLng=[{lat:22.278622,lng:114.184127},{lat:22.27767,lng:114.171799},{lat:22.285155,lng:114.156951},
                 {lat:22.280486,lng:114.182228},{lat:22.293914,lng:114.173696},{lat:22.295645,lng:114.17293},
                 {lat:22.284943,lng:114.15411},{lat:22.281517,lng:114.155685},{lat:22.293558,lng:114.173939},
                 {lat:22.276523,lng:114.169294},{lat:22.282768,lng:114.153788}];

        		name=['더 레드페퍼 레스토랑','윙와','테이스티 콘지&누들 완탕 샵','티핀',
              	'로비 라운지','스카이 라운지','라푸께이 누들 숍','융키 레스토랑','노부 인터콘티넨탈',
              	'시프트 파티세리','란퐁위엔'];
    	  		document.getElementsByName("hong")[4].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("홍콩-6")!=-1){
    		   myLatLng=[{lat:22.29641,lng:114.016754},{lat:22.297495,lng:114.169373},{lat:22.296072,lng:114.169869},
                 {lat:22.278548,lng:114.170221},{lat:22.280421,lng:114.186436},{lat:22.281932,lng:114.1593973},
                 {lat:22.282286,lng:114.155438},{lat:22.318783,lng:114.171394},{lat:22.285976,lng:114.151706},
                 {lat:22.276923,lng:114.1709},{lat:22.280412,lng:114.184902}];

        		name=['작스','푸드 리퍼블릭','후통','더 플라잉 팬',
              	'아지센 라멘','클리퍼 라운지','록유 티 하우스','모스버거','상키 콘지숍',
              	'푹람문','금라보'];
    	  		document.getElementsByName("hong")[5].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("홍콩-7")!=-1){
    		   myLatLng=[{lat:22.279546,lng:114.160542},{lat:22.275602,lng:114.172652},{lat:22.21872,lng:114.211523},
                 {lat:22.218702,lng:114.211062},{lat:22.28652,lng:114.156937},{lat:22.318666,lng:114.168278},
                 {lat:22.283996,lng:114.173454},{lat:22.303923,lng:114.160139},{lat:22.2896238,lng:113.9414025},
                 {lat:22.299423,lng:114.174032},{lat:22.299018,lng:114.172902}];

        		name=['올리버스 슈퍼샌드위치','깜풍','보트 하우스','피클드 펠리칸',
              	'더 라운지','밍 코트','골든 보히니아 레스토랑','틴렁힌','올드 청두',
              	'카터킹 딤섬','한주쿠 코보'];
    	  		document.getElementsByName("hong")[5].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("홍콩-1")!=-1 || href.indexOf("홍콩")!=-1){
    	  		 myLatLng=[{lat:22.297832,lng:114.169626},{lat:22.271254,lng:114.150151},{lat:22.32053,lng:114.171365},
    	                 {lat:22.2967918,lng:114.1712843},{lat:22.297337,lng:114.172381},{lat:22.31099,lng:114.170332},
    	                 {lat:22.29763,lng:114.171683},{lat:22.296041,lng:114.169815},{lat:22.293827,lng:114.171001},
    	                 {lat:22.2777,lng:114.177265},{lat:22.271143,lng:114.150218}];
    	  
    	         name=["딘타이펑","부바 검프",'레이 가든','죽원 시푸드 레스토랑',
    	              '제니 베이커리','미도 카페','성림거','아쿠아',
    	              '심포니 바이 제이드','호주우유공사','팀호완'];
     			document.getElementsByName("hong")[0].style.backgroundColor="powderblue";
     		
    		 }
    	  
    	  
    	  
    	    if(href.indexOf("마카오-2")!=-1){
    		  myLatLng=[{lat:22.1527222,lng:113.5550315},{lat:22.1572291,lng:113.5569332},{lat:22.1865208,lng:113.5500231},
    			  {lat:22.199194,lng:113.539246}];
    		  
    		  name=['카페 에스키모','신무이','돔 갈로','컴 바이'];
    		  
    	  		document.getElementsByName("makao")[1].style.backgroundColor="powderblue";
    	  	}else if(href.indexOf("마카오-1")!=-1 || href.indexOf("마카오")!= -1) {
      		  myLatLng=[{lat:22.152973,lng:113.555503},{lat:22.1181181,lng:113.551124},{lat:22.117852,lng:113.55149},
      			  		{lat:22.1930004,lng:113.5403907},{lat:22.154163,lng:113.5568923},{lat:22.1941056,lng:113.5401982},
      			  		{lat:22.152717,lng:113.555822},{lat:22.1515596,lng:113.5549182},{lat:22.195035,lng:113.53804},
      			  		{lat:22.1528663,lng:113.5551327},{lat:22.1918083,lng:113.5418478}];
      		  name=['덤보 레스토랑','로드 스토우즈 카페','로드 스토우즈 베이커리',
      			  '에스카다','코찌냐 피노키오','윙 치 케이',
      			  '안토니오 레스토랑','카페 리토랄','이슌 밀크 컴퍼니',
      			  '세라두라','카페 이 나타 마가렛츠'];
     	  		document.getElementsByName("makao")[0].style.backgroundColor="powderblue";
    		} 
    	    
    	    if(href.indexOf("오사카-2")!= -1){
     		  myLatLng=[{lat:34.672652,lng:135.5022139},{lat:34.6661186,lng:135.5015548},{lat:34.6659547,lng:135.5015382},
    		  		{lat:34.6656089,lng:135.4993239},{lat:34.702986,lng:135.499048},{lat:34.6559108,lng:135.430038},
    		  		{lat:34.6696404,lng:135.498755},{lat:34.698825,lng:135.499256},{lat:34.6688572,lng:135.5015147},
    		  		{lat:34.6527282,lnat:135.5064628},{lat:34.6683517,lng:135.5032251}];
    		  
    		  name=['메이지켄','리쿠로오지상 치즈케익','홉 슈크림',
    			  '난반떼','미후네','나니와 구이신보 요코초',
    			  '홋쿄쿠세이','하가쿠레','가니도라쿠/본점','미즈노'];
    			  
     			document.getElementsByName("osaka")[1].style.backgroundColor="powderblue";
     		
    	  }	else if(href.indexOf("오사카-3")!= -1) {
     
   		  myLatLng=[{lat:35.0005586,lng:135.7787995},{lat:34.6648775,lng:135.5325093},{lat:35.0036523,lng:135.774486},
  			  		{lat:34.669213,lng:135.5030376},{lat:35.0092197,lng:135.7711964},{lat:34.6684427,lng:135.5030441},
  			  		{lat:34.6734208,lng:135.5014993},{lat:35.0153939,lng:135.6774026},{lat:34.6676239,lng:135.504198},
  			  		,{lat:34.690028,lng:135.189627}];
   		  
  		  		name=['히사고','스시긴','사료 쓰지리(기온 쓰지리)',
  		  			'이치란라멘','스타벅스커피/산조오하시점','카무쿠라',
  		  			'카스테라 긴소','갸아테이','마루후쿠코히텐/센니치마에본점',
  		  			,'아카노렌'];
  		  		
  	  			document.getElementsByName("osaka")[2].style.backgroundColor="powderblue";

  		  }else if(href.indexOf("오사카-4")!= -1) {
  		     
  	   		  myLatLng=[{lat:35.007592,lng:135.767949},{lat:34.6619834,lng:135.5359269},{lat:34.6686526,lng:135.502945},
  	  			  		{lat:34.6662293,lng:135.5015194},{lat:34.6497128,lng:135.5059945},{lat:34.6677752,lng:135.502997},
  	  			  		{lat:35.0039347,lng:135.7708595},{lat:34.6998263,lng:135.190233},{lat:34.6675489,lng:135.5021103},
  	  			  		,{lat:35.015861,lng:135.784797},{lat:34.695315,lng:135.193253}];
  	   		  
  	  		  		name=['가네오','오모니','시텐노라멘',
  	  		  			'다이토라','야에카츠','아카오니(도톰보리)',
  	  		  			'오멘','스타벅스 커피 고베/키타노이진칸 점','쿠시노보/오사카 호첸지 본점',
  	  		  			'그릴 코다카라','카와무라 비프테키'];
  	  		  		
  	  	  			document.getElementsByName("osaka")[3].style.backgroundColor="powderblue";

  	  		  }else if(href.indexOf("오사카-5")!= -1) {
  	  		     
  	  	   		  myLatLng=[{lat:34.6738939,lng:135.4997087},{lat:34.6935242,lng:135.1912587},{lat:35.0152664,lng:135.6774724},
  	  	  			  		{lat:34.651219,lng:135.505725},{lat:34.6931483,lng:135.1914641},{lat:34.7010458,lng:135.1899145},
  	  	  			  		{lat:34.6688538,lng:135.5018094},{lat:34.7028186,lng:135.4985323},{lat:34.7009841,lng:135.4974458},
  	  	  			  		,{lat:34.665769,lng:135.501419},{lat:34.6850795,lng:135.1817869}];
  	  	   		  
  	  	  		  		name=['미미우','미소노','아린코',
  	  	  		  			'즈보라야','아라캄파뉴','롯코목장 소프트 아이스크림',
  	  	  		  			'보떼쥬/본점','동양정','이카야키',
  	  	  		  			'홋쿄쿠','마마노 에란다 모토마치 케이크'];
  	  	  		  		
  	  	  	  			document.getElementsByName("osaka")[4].style.backgroundColor="powderblue";

  	  	  		}else if(href.indexOf("오사카-6")!= -1) {
  	  	  		     
    	  	   		  myLatLng=[{lat:34.997034,lng:135.781263},{lat:34.6919796,lng:135.195526},{lat:34.6973127,lng:135.1941389},
    	  	  			  		{lat:35.0146733,lng:135.6781161},{lat:34.6848872,lng:135.8286363},
    	  	  			  		{lat:35.03009,lng:135.769568},{lat:35.0337015,lng:135.7178852},{lat:35.0094601,lng:135.7670576},
    	  	  			  		,{lat:34.9981066,lng:135.7808014},{lat:34.6722817,lng:135.4977494}];
    	  	   		  
    	  	  		  		name=['이노다 커피','비고노미세','이스즈 베이커리(본점)',
    	  	  		  			'eX cafe(이쿠스 카페)','사쿠라 버거',
    	  	  		  			'데마치 후타바','세이겐인','스마트 커피',
    	  	  		  			'카사기야','고가류'];
    	  	  		  		
    	  	  	  			document.getElementsByName("osaka")[5].style.backgroundColor="powderblue";

    	  	    }else if(href.indexOf("오사카-7")!= -1) {
 	  	  		     
  	  	   		 	 myLatLng=[{lat:34.6832837,lng:135.82836},{lat:34.6554498,lng:135.4297315},{lat:34.6838058,lng:135.838999},
  	  	  			  		{lat:34.693769,lng:135.188612},{lat:34.7068238,lng:135.4974552},{lat:35.011292,lng:135.790069},
  	  	  			  		{lat:34.6950752,lng:135.1943552},{lat:35.0299437,lng:135.7748671},{lat:34.6881226,lng:135.1879656},
  	  	  			  		,{lat:34.6821901,lng:135.8214877},{lat:34.6838043,lng:135.8391999}];
  	  	   		  
  	  	  		  		name=['플로레스타','아이즈야','이자사',
  	  	  		  			'스테이크 아오야마','비어부르그','준세이',
  	  	  		  			'니시무라 커피','오무라 하우스/데마치야나기점','로쇼키',
  	  	  		  			'로쿠야','유메 카제 플라자'];
  	  	  		  		
  	  	  	  			document.getElementsByName("osaka")[6].style.backgroundColor="powderblue";

  	  	    	}else if(href.indexOf("오사카")!= -1 || href.indexOf("오사카-1") !=-1) {
	     		 	 myLatLng=[{lat:34.6948288,lng:135.49542},{lat:34.6688516,lng:135.502538},{lat:34.666658,lng:135.502346},
	    			  		{lat:22.1930004,lng:113.5403907},{lat:34.6686405,lng:135.5030442},{lat:34.6664356,lng:135.5013019},
	    			  		{lat:35.022007,lng:135.794751},{lat:34.6688056,lng:135.5038333},{lat:34.666897,lng:135.503526},
	    			  		{lat:34.6649333,lng:135.50273},{lat:34.6688516,lng:135.5033435}];
	     		  
	    		  		name=['파블로','겐로쿠스시','지유켄',
	    		  			'오사카 도지마 몽슈슈','킨류라멘','551 호라이',
	    		  			'요지야 카페/긴카쿠지점','치보','도토루 커피',
	    		  			'이소노료타로','혼케 오타코'];
	    		  		
	    	  			document.getElementsByName("osaka")[0].style.backgroundColor="powderblue";

    		  }else if(href.indexOf("후쿠오카-2")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:33.589827,lng:130.41072},{lat:33.590298,lng:130.419348},{lat:33.590038,lng:130.419444},
	  	  			  		{lat:33.587283,lng:130.396578},{lat:33.5882,lng:130.42167},{lat:33.590307,lng:130.419546},
	  	  			  		{lat:33.593229,lng:130.404574},{lat:33.592547,lng:130.408919},{lat:34.6881226,lng:135.1879656},
	  	  			  		,{lat:33.592718,lng:130.410231},{lat:33.589636,lng:130.39868}];
	  	   		  
	  	  		  		name=['라멘 스타디움','쿠우텐','파티쉐리 몽 쉐르',
	  	  		  			'코듀로이 카페','우오베이 스시','텐진 호르몬',
	  	  		  			'이치란','요시츠카 우나기야','메이게츠도우',
	  	  		  			'우동 타이라','효우탄 스시'];
	  	  		  		
	  	  	  			document.getElementsByName("hukuoka")[1].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("후쿠오카-1")!= -1 || href.indexOf("후쿠오카")!=-1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:33.593728,lng:130.411894},{lat:33.582663,lng:130.39412},{lat:33.593759,lng:130.407711},
	  	  			  		{lat:33.596145,lng:130.406584},{lat:33.586455,lng:130.395282},{lat:33.588516,lng:130.400935},
	  	  			  		{lat:33.590884,lng:130.398599},{lat:33.596251,lng:130.406434},{lat:33.5904827,lng:130.416706},
	  	  			  		,{lat:33.561944,lng:130.424559},{lat:33.59005,lng:130.419796}];
	  	   		  
	  	  		  		name=['신슈소바 무라타','멘게키죠 겐에이','가와바타 젠자이 히로바',
	  	  		  			'타츠미 스시','마루우미야','고디바',
	  	  		  			'키와미야','노부히데 혼텐','교자노오쇼',
	  	  		  			'야마나카(곱창전골)','일포르노델 미뇽'];
	  	  		  		
	  	  	  			document.getElementsByName("hukuoka")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("도쿄")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:35.6991418,lng:139.7729695},{lat:35.667569,lng:139.706147},{lat:35.6706,lng:139.764774},
	  	  			  		{lat:35.6555103,lng:139.7360167},{lat:35.6691771,lng:139.7631955},{lat:35.671299,lng:139.704811},
	  	  			  		{lat:35.658576,lng:139.699415},{lat:35.691032,lng:139.703234},{lat:35.6602252,lng:139.7235122},
	  	  			  		,{lat:35.662531,lng:139.697873},{lat:35.690561,lng:139.702792}];
	  	   		  
	  	  		  		name=['건담카페','하라주쿠 교자','츠바메그릴',
	  	  		  			'후쿠시마야','라이언 비어홀','엔젤스 하트',
	  	  		  			'미도리 스시','후나바시야','곤파치',
	  	  		  			'골드 러쉬','이치란'];
	  	  		  		
	  	  	  			document.getElementsByName("dokyo")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("오키나와")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:26.1623234,lng:127.8123772},{lat:26.2175171,lng:127.7228665},{lat:26.5269926,lng:127.9270282},
	  	  			  		{lat:26.2164427,lng:127.6903307},{lat:26.212897,lng:127.6725429},{lat:26.594779,lng:127.9594478},
	  	  			  		{lat:26.6685915,lng:127.9007667},{lat:26.6627909,lng:127.9799134},{lat:26.6675284,lng:127.9003859},
	  	  			  		,{lat:26.225728,lng:127.695174},{lat:26.2159747,lng:127.6842186}];
	  	   		  
	  	  		  		name=['카페 쿠루쿠마','슈리 소바','후쿠 스시',
	  	  		  			'국제 거리 포장마차촌','잭스 스테이크 하우스','레스토랑 플리퍼',
	  	  		  			'카진호우','하나사키 식당','아네타이차야',
	  	  		  			'와후테이','로프트'];
	  	  		  		
	  	  	  			document.getElementsByName("okinawa")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("타이베이")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:25.048776,lng:121.518572},{lat:25.045177,lng:121.507783},{lat:25.033571,lng:121.530069},
	  	  			  		{lat:25.050293,lng:121.519947},{lat:25.033333,lng:121.529967},{lat:25.044222,lng:121.516141},
	  	  			  		{lat:25.045768,lng:121.505522},{lat:25.032536,lng:121.529814},{lat:25.0625611,lng:121.5416808},
	  	  			  		,{lat:25.0433209,lng:121.507625},{lat:25.043914,lng:121.514}];
	  	   		  
	  	  		  		name=['순청베이커리','삼형매','딘타이펑',
	  	  		  			'카페 85도씨','까오지','팔방운집',
	  	  		  			'천외천','스무시','스얼궈',
	  	  		  			'아종면선','디엔수이러우'];
	  	  		  		
	  	  	  			document.getElementsByName("taibei")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("가오슝")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:22.669634,lng:120.302605},{lat:22.626332,lng:120.282475},{lat:22.619448,lng:120.311552},
	  	  			  		{lat:22.626809,lng:120.282745},{lat:22.61889,lng:120.266844},{lat:22.62105,lng:120.287768},
	  	  			  		{lat:22.61991,lng:120.271056},{lat:22.634169,lng:120.298282}];
	  	   		  
	  	  		  		name=['딘타이펑','우스란','우바오춘 베이커리',
	  	  		  			'아포쯔빙(아파자빙)','로즈 하우스','항원 우육면관',
	  	  		  			'해지빙','마라좡위엔(마랄장원)'];
	  	  		  		

	  	    	}else if(href.indexOf("타이중")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:24.157519,lng:120.657261},{lat:24.137673,lng:120.675726},{lat:24.149977,lng:120.661451},
	  	  			  		{lat:24.153672,lng:120.65769},{lat:24.15192,lng:120.663484},{lat:24.134623,lng:120.682968}];
	  	   		  
	  	  		  		name=['딩왕마라궈','춘수당','미촌점두빙',
	  	  		  			'R 스타 커피','커우치즈','카페 도너츠'];
	  	  		  	
	  	    	}else if(href.indexOf("베이징(북경)")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:39.897059,lng:116.41505},{lat:39.899399,lng:116.38507},{lat:24.149977,lng:120.661451},
	  	  			  		{lat:24.153672,lng:120.65769},{lat:24.15192,lng:120.663484},{lat:24.134623,lng:120.682968}];
	  	   		  
	  	  		  		name=['노북경자장면','전취덕','노사차관',
	  	  		  			'금정헌','도일처','후통피자',
	  	  		  			'동래순','백가대원','이선생',
	  	  		  			'호대','남문쇄육'];
	  	  	  			document.getElementsByName("bayging")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("상하이(상해)")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:31.236628,lng:121.498054},{lat:31.246716,lng:121.445172},{lat:31.227683,lng:121.452156},
	  	  			  		{lat:31.226667,lng:121.491818},{lat:31.228016,lng:121.519544},{lat:31.235385,lng:121.489031},
	  	  			  		{lat:31.221926,lng:121.477165},{lat:31.234977,lng:121.47378},{lat:31.2265,lng:121.491536},
	  	  			  		{lat:31.234598,lng:121.490826},{lat:31.229362,lng:121.459817}];
	  	   		  
	  	  		  		name=['신원소','태가촌','린',
	  	  		  			'호심정','하이디라오 훠궈','그랜드마더',
	  	  		  			'벨라지오','릴리안 베이커리','남상만두점',
	  	  		  			'엠온 더 번드','허니문 디저트'];
	  	  	  			document.getElementsByName("sanghae")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("칭다오(청도)")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:36.059875,lng:120.394662},{lat:36.0698,lng:120.392988},{lat:36.071889,lng:120.395558},
	  	  			  		{lat:36.071337,lng:120.318532},{lat:36.070227,lng:120.398563},{lat:36.0708394,lng:120.3183711},
	  	  			  		{lat:36.0636619,lng:120.3836292},{lat:36.060742,lng:120.39566},{lat:36.068204,lng:120.393034},
	  	  			  		{lat:36.060742,lng:120.39566},{lat:36.066719,lng:120.3901255}];
	  	   		  
	  	  		  		name=['딘타이펑','운소로 미식거리','노전촌',
	  	  		  			'피차이위엔 꼬치거리','카페거리','춘화루',
	  	  		  			'진취덕','디엔디엔신(구 해윤노반점)','해도어촌',
	  	  		  			'허니문 디저트','영화대왕'];
	  	    	}else if(href.indexOf("황산")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:29.7140082,lng:118.345723},{lat:29.7083648,lng:118.3101878},{lat:29.7082762,lng:118.2943981},
	  	  			  		{lat:29.7076356,lng:118.3191544},{lat:29.7058979,lng:118.2976513},{lat:36.0708394,lng:120.3183711},
	  	  			  		{lat:36.0636619,lng:120.3836292},{lat:36.060742,lng:120.39566},{lat:36.068204,lng:120.393034},
	  	  			  		{lat:29.7003844,lng:118.2916918},{lat:29.708349,lng:118.310118}];
	  	   		  
	  	  		  		name=['휘황부제','노가제일루','한강',
	  	  		  			'계림성쌀국수','한도숯불구이','해운대 숯불구이',
	  	  		  			'미식인가'];
	  	    	}else if(href.indexOf("장가계")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:29.10674,lng:110.48248},{lat:29.12688,lng:110.46604},{lat:29.11354,lng:110.48027},
	  	  			  		{lat:29.12498,lng:110.48445},{lat:29.12614,lng:110.46687}];
	  	   		  
	  	  		  		name=['호사부삼하과','종가집','화전하',
	  	  		  			'중상광장','고향집'];
	  	    	}else if(href.indexOf("서안")!= -1) {
	  	  		     
	  	   		 	 myLatLng=[{lat:34.2641329,lng:108.9644086},{lat:34.255301,lng:108.941281},{lat:34.2225282,lng:108.9620537},
	  	  			  		{lat:34.2603156,lng:108.945778},{lat:34.2231734,lng:108.9362924},{lat:34.256093,lng:108.952128},
	  	  			  		{lat:34.2623551,lng:108.9437441},{lat:34.2677727,lng:108.9637247},{lat:34.262498,lng:108.943465},
	  	  			  		{lat:34.2509047,lng:108.9494576}];
	  	   		  
	  	  		  		name=['하이디라오 훠궈','뱡뱡면','천하제일면',
	  	  		  			'덕발장','웨이지아 량피',
	  	  		  			'친위 러우자모','쟈산관탕바오즈','황지황',
	  	  		  			'노손가','만 커피'];
	  	    	}else if(href.indexOf("싱가포르")!= -1) {
	  	  		    	   	myLatLng=[{lat:1.2933354,lng:103.8533889},{lat:1.2889978,lng:103.8447281},{lat:1.294764,lng:103.85892},
	  	   					{lat:1.284052,lng:103.843598},{lat:1.2895026,lng:103.8568866},{lat:1.2897868,lng:103.8390934},
	  	   					{lat:1.296453,lng:103.855294},{lat:1.304138,lng:103.832039},{lat:1.281822,lng:103.8449011},
	  	  			  		{lat:1.3051385,lng:103.9306051},{lat:1.2803767,lng:103.8447596}];
	  	   		  
	  	  		  		name=['에퀴녹스 레스토랑','점보 시푸드 레스토랑(리버 사이드 포인트)','토스트 박스',
	  	  		  			'림지관','마칸수트라 글루톤스 베이','레드 하우스',
	  	  		  			'킬리니 코피티암','푸드 오페라','난양 올드 커피',
	  	  		  			'점보 시푸드 레스토랑(이스트 코스트 시푸드 센터)','맥스웰 푸드 센터'];
	  	  		  		
	  	  	  			document.getElementsByName("sing")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("방콕")!= -1) {
	  	  		    	   	myLatLng=[{lat:13.7241175,lng:100.5139469},{lat:13.725147,lng:100.563098},{lat:13.734692,lng:100.581634},
	  	   					{lat:13.747024,lng:100.534966},{lat:13.754851,lng:100.540352},{lat:13.7237921,lng:100.5398103},
	  	   					{lat:13.759055,lng:100.4973},{llat:13.734637,lng:100.582308},{lat:13.736278,lng:100.557889},
	  	  			  		{lat:13.719361,lng:100.566622},{lat:13.7444129,lng:100.5343613}];
	  	   		  
	  	  		  		name=['오서스 라운지','루언 말리카 로열 타이 쿠진','오 봉 뺑',
	  	  		  			'MK 수끼 골드','바이욕 스카이 뷔페','버티고 그릴&문 바',
	  	  		  			'실크 바&레스토랑','그레이하운드 카페','캐비지&콘돔',
	  	  		  			'쏜통 포차나','쏨땀 누아'];
	  	  		  		
	  	  	  			document.getElementsByName("bang")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("푸켓")!= -1) {
	  	  		    	   	myLatLng=[{lat:7.775968,lng:98.330377},{lat:7.894534,lng:98.295723},{lat:7.886295,lng:98.396877},
	  	   					{lat:7.892363,lng:98.298942},{lat:7.949135,lng:98.275059},{lat:7.893803,lng:98.295163},
	  	   					{lat:7.816978,lng:98.300744},{lat:7.820006,lng:98.344189},
	  	  			  		{lat:7.880418,lng:98.392072},{lat:7.894085,lng:98.298399}];
	  	   		  
	  	  		  		name=['라와이 비치 씨푸드 식당가','사보이 씨푸드','란짠펜',
	  	  		  			'더 커피 클럽','실크 레스토랑 & 바','빠통 씨푸드',
	  	  		  			'돈스 비비큐','랍스터&프라운','깐앵@피어',
	  	  		  			'쏨 칫','넘버 식스 레스토랑'];
	  	  		  		
	  	  	  			document.getElementsByName("puket")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("세부")!= -1) {
	  	  		    	   	myLatLng=[{lat:10.291902,lng:123.998634},{lat:10.255547,lng:123.932797},{lat:10.32672,lng:123.97817},
	  	   					{lat:10.32881,lng:123.90592},{lat:10.33975,lng:123.910479},{lat:10.3095901,lng:124.0249452},
	  	   					{lat:10.351756,lng:123.889617},{lat:10.341684,lng:123.897178},{lat:10.283154,lng:123.99348},
	  	  			  		{lat:10.335135,lng:123.950117},{lat:10.28864,lng:123.998871}];
	  	   		  
	  	  		  		name=['골드 망고 그릴&레스토랑','란타우','라 테골라',
	  	  		  			'문 카페','크레이지 크랩','이비자 비치 클럽',
	  	  		  			'미스터 에이','마르코 폴로 호텔 블루 바&그릴','시빗 커피',
	  	  		  			'오이스터 베이','마리바고 그릴&레스토랑'];
	  	  		  		
	  	  	  			document.getElementsByName("sebu")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("보라카이")!= -1) {
	  	  		    	   	myLatLng=[{lat:11.965638,lng:121.922012},{lat:11.965805,lng:121.921873},{lat:11.964181,lng:121.923265},
	  	   					{lat:11.96293,lng:121.924912},{lat:11.963008,lng:121.924684},{lat:11.959196,lng:121.926183},
	  	   					{lat:11.962371,lng:121.924413},{lat:11.964454,lng:121.922844},{lat:11.958461,lng:121.927883},
	  	  			  		{lat:11.959282,lng:121.926135},{lat:11.96314,lng:121.9250031}];
	  	   		  
	  	  		  		name=['하와이안 바비큐','옐로우 캡','스테이크하우스 보라카이',
	  	  		  			'아이 러브 백야드 바비큐','레몬 카페','서머 플레이스',
	  	  		  			'에픽','마냐나','도스 메스티조스',
	  	  		  			'돈 비토','비스트로 발할라'];
	  	  		  		
	  	  	  			document.getElementsByName("bora")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("마닐라")!= -1) {
	  	  		    	   	myLatLng=[{lat:14.568402,lng:120.984034},{lat:14.5524806,lng:121.0211339},{lat:14.5788902,lng:120.974673},
	  	   					{lat:14.5703689,lng:120.986166},{lat:14.5538441,lng:121.0246219},{lat:14.5453223,lng:120.986713},
	  	   					{lat:14.5654044,lng:121.0280731},{lat:14.5516658,lng:121.0217656},{lat:14.5547216,lng:121.0256948},
	  	  			  		{lat:14.5405416,lng:120.9790549},{lat:14.5518658,lng:121.0260724}];
	  	   		  
	  	  		  		name=['아리스토크래트','메사 레스토랑','하버 뷰 레스토랑',
	  	  		  			'카페 아드리아티코','마카티 샹그릴라 호텔 애프터눈 티','마카파갈 시사이드 마켓',
	  	  		  			'71 그래머시','카페 하바나','페닌슐라 호텔 애프터눈 티',
	  	  		  			'바이킹스','게리스 그릴'];
	  	  		  		
	  	  	  			document.getElementsByName("manila")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("코타 키나발루")!= -1) {
	  	  		    	   	myLatLng=[{lat:5.985393,lng:116.076761},{lat:5.984756,lng:116.077448},{lat:5.979425,lng:116.070245},
	  	   					{lat:5.9850487,lng:116.0779569},{lat:5.9750498,lng:116.0727916},{lat:5.949235,lng:116.044935},
	  	   					{lat:5.978764,lng:116.069849},{lat:5.9777394,lng:116.0740878},{lat:5.987517,lng:116.077736},
	  	  			  		{lat:5.984562,lng:116.074936},{lat:5.9775589,lng:116.072783}];
	  	   		  
	  	  		  		name=['리틀 이태리','유키 바쿠테','토스카니',
	  	  		  			'올드타운 화이트 커피','웰컴 씨푸드','탄중 아루 푸드코트',
	  	  		  			'샴록 아이리쉬 바','깜풍 아이르','시크릿 레시피',
	  	  		  			'어퍼스타','셈플랑'];
	  	  		  		
	  	  	  			document.getElementsByName("kota")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("페낭")!= -1) {
	  	  		    	   	myLatLng=[{lat:5.4401081,lng:100.3090111},{lat:5.416092,lng:100.3331204},{lat:5.4199911,lng:100.3268429},
	  	   					{lat:5.4211972,lng:100.3345702},{lat:5.4154231,lng:100.3203297},{lat:5.4148424,lng:100.3387919},
	  	   					{lat:5.4176898,lng:100.3335374},{lat:5.4202302,lng:100.3427186},{lat:5.4177806,lng:100.3244798},
	  	  			  		{lat:5.4174297,lng:100.3359755},{lat:5.4190007,lng:100.3426948}];
	  	   		  
	  	  		  		name=['거니 드라이브 호거 센터','렁 키 딤섬 레스토랑','뉴 월드 파크 호커 센터',
	  	  		  			'레드 가든','차퀘이테오@잘란 시암','차이나 하우스',
	  	  		  			'타이 통 레스토랑','에스플러네이드 푸드 코트','핫 스파이스 보울 뇨냐 딜라이트',
	  	  		  			'텍센 레스토랑','카림 파셈버 로작'];
	  	  		  		
	  	  	  			document.getElementsByName("penang")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("쿠알라룸푸르")!= -1) {
	  	  		    	   	myLatLng=[{lat:3.1577405,lng:101.712167},{lat:3.1147973,lng:101.6125489},{lat:3.1432842,lng:101.6978009},
	  	   					{lat:3.1577405,lng:101.712167},{lat:3.1412874,lng:101.6973975},{lat:3.1451145,lng:101.7146275},
	  	   					{lat:3.1541305,lng:101.7148103},{lat:3.149144,lng:101.713228},{lat:3.1455728,lng:101.7085239},
	  	  			  		{lat:3.151173,lng:101.70996},{lat:3.1483436,lng:101.7131267}];
	  	   		  
	  	  		  		name=['리틀 페낭 카페','패티 크랩','아라베스크',
	  	  		  			'마담 콴','올드차이나 카페','사쿠라',
	  	  		  			'스카이 바','올드타운 화이트커피','잘란 알로',
	  	  		  			'헬리라운지 바','드래곤 아이'];
	  	  		  		
	  	  	  			document.getElementsByName("kuala")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("라오스")!= -1) {
	  	  		    	   	myLatLng=[{lat:19.8959421,lng:102.1428298},{lat:17.9645787,lng:102.6056047},{lat:18.9469736,lng:102.4440085},
	  	   					{lat:19.8921797,lng:102.1366259},{lat:18.9261092,lng:102.4472847},{lat:17.9644807,lng:102.6071241},
	  	   					{lat:18.9249488,lng:102.4487356},{lat:17.9671851,lng:102.6053056},{lat:18.9279978,lng:102.4493127},
	  	  			  		{lat:19.8879793,lng:102.1399143},{lat:19.8949382,lng:102.1420922}];
	  	   		  
	  	  		  		name=['르 바네통(루앙프라방)','르 바네통(비엔티안)','정글 파티',
	  	  		  			'블루 라군','샌드위치 노점거리','조마 베이커리(비엔티안)',
	  	  		  			'사쿠라 바','도가니 국수','피핑쏨',
	  	  		  			'유토피아','로젤라 퓨전 레스토랑'];
	  	  		  		
	  	  	  			document.getElementsByName("raos")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("다낭")!= -1) {
	  	  		    	   	myLatLng=[{lat:16.0687796,lng:108.2449007},{lat:16.0773209,lng:108.2236576},{lat:16.0752591,lng:108.2207286},
	  	   					{lat:16.0588459,lng:108.2160562},{lat:16.0670011,lng:108.2459575},{lat:16.0686661,lng:108.2246393},
	  	   					{lat:16.0723312,lng:108.2190228},{lat:16.0423245,lng:108.2468989},{lat:16.0745426,lng:108.2208037},
	  	  			  		{lat:16.0488135,lng:108.2464987},{lat:16.076482,lng:108.2159397}];
	  	   		  
	  	  		  		name=['더탑','스카이 36','하노이 쓰어',
	  	  		  			'반쎄오 바융','포유 레스토랑','해피 브레드',
	  	  		  			'미꽝 1A','람비엔 레스토랑','분짜까 109',
	  	  		  			'버거 브로스','퍼박 63'];
	  	  		  		
	  	  	  			document.getElementsByName("danang")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("하노이")!= -1) {
	  	  		    	   	myLatLng=[{lat:21.01799,lng:105.85384},{lat:21.03021,lng:105.84895},{lat:21.02632,lng:105.84341},
	  	   					{lat:21.01813,lng:105.85527},{lat:21.03023,lng:105.84824},{lat:21.03233,lng:105.85153},
	  	   					{lat:21.03224,lng:105.8469},{lat:21.02938,lng:105.84359},{lat:21.0360249,lng:105.848642},
	  	  			  		{lat:21.02659,lng:105.84318},{lat:21.03361,lng:105.84659}];
	  	   		  
	  	  		  		name=['흐엉 리엔(오바마 분짜)','피자 포피스','꾸안 안 응온',
	  	  		  			'퍼 틴','마담 히엔','콩 카페',
	  	  		  			'분보남보','소파 카페','반미 25',
	  	  		  			'라 바디안','퍼 지아 쭈웬'];
	  	  		  		
	  	  	  			document.getElementsByName("hanoi")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("호치민")!= -1) {
	  	  		    	   	myLatLng=[{lat:10.7773618,lng:106.6996291},{lat:10.7902781,lng:106.6977278},{lat:10.7814695,lng:106.6982666},
	  	   					{lat:10.7714444,lng:106.6936831},{lat:10.7705353,lng:106.6943949},{lat:10.7783525,lng:106.700993},
	  	   					{lat:10.7806027,lng:106.6919661},{lat:10.7865811,lng:106.6892329},{lat:10.777825,lng:106.699108},
	  	  			  		{lat:10.785792,lng:106.701035},{lat:10.7675282,lng:106.6905713}];
	  	   		  
	  	  		  		name=['냐항 응온','꾸안 94','쭝응우옌 레전드 카페',
	  	  		  			'퓩 롱','칠스카이바','콩 카페',
	  	  		  			'마리아 사이공','퍼 호아 파스퇴르','하이랜드 커피',
	  	  		  			'꾸안 넴','퍼 꾸인'];
	  	  		  		
	  	  	  			document.getElementsByName("hochimin")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("파리")!= -1) {
	  	  		    	   	myLatLng=[{lat:48.8714475,lng:2.3011744},{lat:48.8681015,lng:2.30282738},{lat:48.8704066,lng:2.3043662},
	  	   					{lat:48.857427,lng:2.35911},{lat:48.8574694,lng:2.3576027},{lat:48.870471,lng:2.3018709},
	  	   					{lat:48.8705583,lng:2.3258628},{lat:48.870849,lng:2.303146},{lat:48.8614257,lng:2.3532468},
	  	  			  		{lat:48.8563223,lng:2.3065066},{lat:48.8530397,lng:2.3388433}];
	  	   		  
	  	  		  		name=['푸케','르 흘레 드 랑트흐코트','레옹 드 브뤼셀',
	  	  		  			'라스 뒤 팔라펠','오 프티 페흐 아 슈발','히포포타무스',
	  	  		  			'포숑','라뒤레','플런치',
	  	  		  			'아모리노','르 프로코프'];
	  	  		  		
	  	  	  			document.getElementsByName("pari")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("로마")!= -1) {
	  	  		    	   	myLatLng=[{lat:41.8994342,lng:12.477407},{lat:41.8803047,lng:12.5137791},{lat:41.897642,lng:12.470757},
	  	   					{lat:41.906405,lng:12.456364},{lat:41.900963,lng:12.497065},{lat:41.9033875,lng:12.482414},
	  	   					{lat:41.9010588,lng:12.4772467},{lat:41.8982758,lng:12.4702938},{lat:41.893545,lng:12.508119},
	  	  			  		{lat:41.894115,lng:12.501203},{lat:41.8989621,lng:12.4776276}];
	  	   		  
	  	  		  		name=['타짜도르','폼피','라 몬테카를로',
	  	  		  			'올드 브릿지','알레씨오','피자 치로',
	  	  		  			'지올리띠','바페토','지오바니 파씨',
	  	  		  			'템피오 디 메체나테','라 사크리스띠아'];
	  	  		  		
	  	  	  			document.getElementsByName("roma")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("런던")!= -1) {
	  	  		    	   	myLatLng=[{lat:51.5107983,lng:-0.123163},{lat:51.5120878,lng:-0.1383644},{lat:51.5103651,lng:-0.1244733},
	  	   					{lat:51.5135033,lng:-0.1322785},{lat:51.5163342,lng:-0.1332682},{lat:51.5137954,lng:-0.1315194},
	  	   					{lat:51.5114669,lng:-0.1322801},{lat:51.5147285,lng:-0.1353952},{lat:51.5082166,lng:-0.0961089},
	  	  			  		{lat:51.5058334,lng:-0.1174553},{lat:51.5066189,lng:-0.1877761}];
	  	   		  
	  	  		  		name=['룰즈','플랫 아이언','난도스',
	  	  		  			'버거&랍스터','와사비','고메 버거 키친',
	  	  		  			'웡케이','브렉퍼스트 클럽','피자 익스프레스',
	  	  		  			'와가마마','오진저리'];
	  	  		  		
	  	  	  			document.getElementsByName("rondon")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("바르셀로나")!= -1) {
	  	  		    	   	myLatLng=[{lat:41.3831683,lng:2.1771906},{lat:41.3923928,lng:2.1609914},{lat:41.3793525,lng:2.1762693},
	  	   					{lat:41.3894892,lng:2.1705924},{lat:41.3739425,lng:2.1655847},{lat:41.3821314,lng:2.1832806},
	  	   					{lat:41.401756,lng:2.1735126},{lat:41.3862272,lng:2.1973729},{lat:41.3909903,lng:2.1674663},
	  	  			  		{lat:41.3868691,lng:2.1610773},{lat:41.3916966,lng:2.1661882}];
	  	   		  
	  	  		  		name=['꼬네사','까딸라나','라 폰다',
	  	  		  			'엘 그롭','끼멧끼멧','시에테 포르테스',
	  	  		  			'츄레리아','마리나 베이','타파스24',
	  	  		  			'라 플라우타','타파 타파'];
	  	  		  		
	  	  	  			document.getElementsByName("basel")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("크로아티아")!= -1) {
	  	  		    	   	myLatLng=[{lat:42.639192,lng:18.1086},{lat:42.641524,lng:18.108751},{lat:45.813219,lng:15.973346},
	  	   					{lat:43.510114,lng:16.436579},{lat:43.5076,lng:16.433749},{lat:42.640383,lng:18.111203},
	  	   					{lat:45.8157724,lng:15.9749848},{lat:44.111439,lng:15.22789},{lat:45.814834,lng:15.976798},
	  	  			  		{lat:44.113415,lng:15.225784},{lat:43.516654,lng:16.249103}];
	  	   		  
	  	  		  		name=['부자 카페','돌체 비타','빈섹',
	  	  		  			'갈리야','피페','코노바 로칸다 페슈카리야',
	  	  		  			'트리로기야','포사','녹투르노',
	  	  		  			'트라토리아 깐조나','돈 디노'];
	  	  		  		
	  	  	  			document.getElementsByName("croa")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("이스탄불")!= -1){
	  	    		

	  	    		myLatLng=[{lat:41.0041358,lng:28.9754882},{lat:41.008015,lng:28.9768381},{lat:41.013616,lng:28.985891},
	  	    		{lat:41.00814,lng:28.9760522},{lat:41.034642,lng:28.9802733},{lat:41.0256871,lng:28.9801446},
	  	    		{lat:41.0160732,lng:28.9734203},{lat:40.9894377,lng:29.024344},{lat:41.0360754,lng:28.9846138},
	  	    		{lat:41.0079861,lng:28.9771452},{lat:41.0394671,lng:28.9842503}]

	  	    		name=['도이도이 레스토랑','술탄아흐멧 쾨프테','콘얄르',
	  	    		'마도 카페','사라이 무할레비치지 1935','카라쿄이 귤류올루',
	  	    		'하피즈 무스타파','치야 케밥','키질카야라 이스락 버거',
	  	    		'랄레 레스토랑','파로스 케밥']

  	  	  			document.getElementsByName("istan")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("블라디보스토크")!= -1){
	  	    		
	  	    		myLatLng=[{lat:43.1271339,lng:131.901598},{lat:43.1213274,lng:131.8780804},{lat:43.1178993,lng:131.8817309},
	  	    			{lat:43.2116253,lng:131.9526511},{lat:43.1178151,lng:131.8924946},{lat:43.0133791,lng:131.8887556},
	  	    			{lat:43.1158592,lng:131.8820688},{lat:43.1183574,lng:131.8793417},{lat:43.1167716,lng:131.8808504},
	  	    			{lat:43.0901362,lng:131.9683394},{lat:43.120141,lng:131.8808109}]
	  	    			name=['오그뇩','주마','우흐 띠 블린',
	  	    			'세반','팔라우 피시','노빅 컨트리 클럽',
	  	    			'댑 버거','수프라','로즈키 플로스키',
	  	    			'우라르뚜','푸시킨 카페']
  	  	  			document.getElementsByName("bladi")[0].style.backgroundColor="powderblue";
	  	    	}else if(href.indexOf("뉴욕")!= -1){
	  	    		myLatLng=[{lat:40.7283329,lng:-73.9952862},{lat:40.7415183,lng:-73.9881644},{lat:40.738519,lng:-73.988452},
	  	    			{lat:40.7098205,lng:-73.9624688},{lat:40.7561252,lng:-73.9702901},{lat:40.7848308,lng:-73.9557445},
	  	    			{lat:40.726893,lng:-73.985303},{lat:40.761823,lng:-73.979209},{lat:40.7755787,lng:-73.9621963},
	  	    			{lat:40.7799301,lng:-73.9803323},{lat:40.7377493,lng:-73.9878719}]
	  	    			name=['띵크 커피','셰이크 섀크','그래머시 태번',
	  	    			'피터 루거 스테이크 하우스','에싸 베이글','사라베스',
	  	    			'루크스 랍스터','할랄 가이즈','레이디 M 케이크 부티',
	  	    			'르뱅 베이커리','유니온 스퀘어 카페']
  	  	  			document.getElementsByName("newyork")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("하와이")!= -1){
					
	  	    		
	  	    		myLatLng=[{lat:21.5911527,lng:-158.1028694},{lat:21.3916997,lng:-157.7411896},{lat:21.8833931,lng:-159.4693208},
	  	    			{lat:21.2787787,lng:-157.8280221},{lat:21.280929,lng:-157.830722},{lat:20.8757429,lng:-156.680335},
	  	    			{lat:21.2987385,lng:-157.8404474},{lat:21.5807074,lng:-158.1048059},{lat:21.2778827,lng:-157.8320146},
	  	    			{lat:21.2775478,lng:-157.827841},{lat:21.290581,lng:-157.843017}]
	  	    			name=['마츠모토 식품점 셰이브 아이스','부츠 앤 키모스 홈스타일 키친','라퍼츠 아이스크림',
	  	    			'탑 오브 와이키키','하드 록 카페','라하이나 피쉬 컴퍼니',
	  	    			'랍스터 킹','지오반니','하우스 위드아웃 어 키',
	  	    			'치즈케이크 팩토리','부바검프 쉬림프 컴퍼니']

  	  	  			document.getElementsByName("hawai")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("미서부")!= -1){
	  	    	
	  	    	
	  	    		myLatLng=[{lat:36.147546,lng:-115.155205},{lat:37.801504,lng:-122.409561},{lat:37.811233,lng:-122.410283},
	  	    			{lat:36.113135,lng:-115.176373},{lat:34.061927,lng:-118.302644},{lat:37.808451,lng:-122.41488},
	  	    			{lat:34.100689,lng:-118.290621},{lat:37.809496,lng:-122.410366},{lat:34.042125,lng:-118.235165},
	  	    			{lat:36.127676,lng:-115.165892},{lat:36.020596,lng:-115.089981}]
	  	    			name=['탑 오브 더 월드 레스토랑','마마스','부바 검프 쉬림프',
	  	    			'벨라지오 뷔페','북창동 순두부','부딘',
	  	    			'우마미 버거','크랩 하우스','얼스 카페',
	  	    			'윈 호텔 뷔페','피스트 뷔페']

  	  	  			document.getElementsByName("miseobu")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("괌")!= -1){
	  	    		
	  	    		myLatLng=[{lat:13.515152,lng:144.806429},{lat:13.489858,lng:144.783217},{lat:13.524428,lng:144.803978},
	  	    			{lat:13.501413,lng:144.789403},{lat:13.364125,lng:144.769758},{lat:13.474376,lng:144.753088},
	  	    			{lat:13.509737,lng:144.805584},{lat:13.487268,lng:144.782413},{lat:13.517793,lng:144.807832},
	  	    			{lat:13.471997,lng:144.754732},{lat:13.515809,lng:144.807371}]

	  	    			name=['나나스 카페','루비 튜스데이','더 비치',
	  	    			'프로아','제프스 파이러츠 코브','카르멘스 차차차',
	  	    			'조이너스','론스타','카프리초사 투몬',
	  	    			'셜리스 커피','차모로 아일랜드 바비큐']
  	  	  			document.getElementsByName("gwam")[0].style.backgroundColor="powderblue";

	  	    	}else if(href.indexOf("시드니")!= -1){
	  	    		
	  	    		myLatLng=[{lat:-33.879797,lng:151.2059659},{lat:-33.8779537,lng:151.205992},{lat:-33.870774,lng:151.19896},
	  	    			{lat:-33.8571503,lng:151.2087648},{lat:-33.8790443,lng:151.2064098},{lat:-33.8930365,lng:151.1831523},
	  	    			{lat:-33.877706,lng:151.2041862},{lat:-33.8595876,lng:151.2086125},{lat:-33.8719038,lng:151.2019553},
	  	    			{lat:-33.8786947,lng:151.2226908},{lat:-33.8761299,lng:151.2158103}]
	  	    			name=['해리스 카페 데 휠스','스크러피 머피스','허리케인 그릴',
	  	    			'팬케이크 온더 록스','챗타이','캄포스 커피',
	  	    			'마막','필립스 푸트','아임 앵거스',
	  	    			'빌즈','바 레지오']
  	  	  			document.getElementsByName("sydney")[0].style.backgroundColor="powderblue";

	  	    	}
    	    
	  	    	
    	    
    	    
    	    
	        var map = new google.maps.Map(document.getElementById('map'), {
	            zoom: 8,
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
      
    <div class="text-center">
        <ul class="pagination2">
    	 <script type="text/javascript">
    	 var href=window.location.href;
    
    	   var count;
    	  href=decodeURI(href);
    	  if(href.indexOf("홍콩")!= -1){
    		  for(count=1;count<=7;count++){
    			   document.write("<li><a name='hong' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=홍콩-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("마카오")!= -1){
    		  for(count=1;count<=2;count++){
   			   	   document.write("<li><a name='makao' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=마카오-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("오사카")!= -1){
    		  for(count=1;count<=7;count++){
      			   document.write("<li><a name='osaka' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=오사카-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("후쿠오카")!= -1){
    		  for(count=1;count<=6;count++){
      			   document.write("<li><a name='hukuoka' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=후쿠오카-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("도쿄")!= -1){
    		  for(count=1;count<=5;count++){
      			   document.write("<li><a name='dokyo' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=도쿄-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("오키나와")!= -1){
    		  for(count=1;count<=3;count++){
      			   document.write("<li><a name='okinawa' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=오키나와-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("타이베이")!= -1){
    		  for(count=1;count<=3;count++){
      			   document.write("<li><a name='taibei' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=타이베이-"+count+"'>"+count+"</a></li>");
       		  }
       	  }
       	  else if(href.indexOf("베이징(북경)")!= -1){
    		  for(count=1;count<=2;count++){
      			   document.write("<li><a name='bayging' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=베이징(북경)-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("상하이(상해)")!= -1){
    		  for(count=1;count<=2;count++){
      			   document.write("<li><a name='sanghae' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=상하이(상해)-"+count+"'>"+count+"</a></li>");
       		  }
       	  }
       	  else if(href.indexOf("서안")!= -1){
    		  for(count=1;count<=2;count++){
      			   document.write("<li><a href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=서안-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("호치민")!= -1){
    		  for(count=1;count<=2;count++){
     			   document.write("<li><a name='hochimin' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=호치민-"+count+"'>"+count+"</a></li>");
      		  }
      	  }else if(href.indexOf("하노이")!= -1){
    		  for(count=1;count<=2;count++){
    			   document.write("<li><a name='hanoi' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=하노이-"+count+"'>"+count+"</a></li>");
     		  }
     	  }else if(href.indexOf("다낭")!= -1){
    		  for(count=1;count<=2;count++){
    			   document.write("<li><a name='danang' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=다낭-"+count+"'>"+count+"</a></li>");
     		  }
     	  }else if(href.indexOf("라오스")!= -1){
    		  for(count=1;count<=3;count++){
   			   document.write("<li><a name='raos' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=라오스-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("쿠알라룸푸르")!= -1){
    		  for(count=1;count<=2;count++){
   			   document.write("<li><a name='kuala' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=쿠알라룸푸르-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("페낭")!= -1){
    		  for(count=1;count<=2;count++){
   			   document.write("<li><a name='penang' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=페낭-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("코타 키나발루")!= -1){
    		  for(count=1;count<=2;count++){
   			   document.write("<li><a name='kota' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=코타 키나발루-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("마닐라")!= -1){
    		  for(count=1;count<=3;count++){
   			   document.write("<li><a name='manila' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=마닐라-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("보라카이")!= -1){
    		  for(count=1;count<=4;count++){
   			   document.write("<li><a name='bora' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=보라카이-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("세부")!= -1){
    		  for(count=1;count<=3;count++){
   			   document.write("<li><a name='sebu' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=세부-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("푸켓")!= -1){
    		  for(count=1;count<=4;count++){
   			   document.write("<li><a name='puket' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=푸켓-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("방콕")!= -1){
    		  for(count=1;count<=5;count++){
   			   document.write("<li><a name='bang' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=방콕-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("싱가포르")!= -1){
    		  for(count=1;count<=6;count++){
   			   document.write("<li><a name='sing' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=싱가포르-"+count+"'>"+count+"</a></li>");
    		  }
    	  }else if(href.indexOf("블라디보스토크")!= -1){
    		  for(count=1;count<=2;count++){
      			   document.write("<li><a name='bladi'href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=블라디보스토크-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("이스탄불")!= -1){
    		  for(count=1;count<=2;count++){
      			   document.write("<li><a name='istan' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=이스탄불-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("크로아티아")!= -1){
    		  for(count=1;count<=2;count++){
      			   document.write("<li><a name='croa' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=크로아티아-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("바르셀로나")!= -1){
    		  for(count=1;count<=3;count++){
      			   document.write("<li><a name='basel' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=바르셀로나-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("런던")!= -1){
    		  for(count=1;count<=3;count++){
      			   document.write("<li><a name='rondon' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=런던-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("로마")!= -1){
    		  for(count=1;count<=4;count++){
      			   document.write("<li><a name='roma' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=로마-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("파리")!= -1){
    		  for(count=1;count<=6;count++){
      			   document.write("<li><a name='pari' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=파리-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("미서부")!= -1){
    		  for(count=1;count<=6;count++){
      			   document.write("<li><a name='miseobu'href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=미서부-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("하와이")!= -1){
    		  for(count=1;count<=7;count++){
      			   document.write("<li><a name='hawai' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=하와이-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("뉴욕")!= -1){
    		  for(count=1;count<=7;count++){
      			   document.write("<li><a name='newyork'href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=뉴욕-"+count+"'>"+count+"</a></li>");
       		  }
       	  }else if(href.indexOf("괌")!= -1){
    		  for(count=1;count<=3;count++){
     			   document.write("<li><a name='gwam' href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=괌-"+count+"'>"+count+"</a></li>");
      		  }
      	  }else if(href.indexOf("시드니")!= -1){
    		  for(count=1;count<=2;count++){
    			   document.write("<li><a name='sydney'href='https://localhost/food/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=시드니-"+count+"'>"+count+"</a></li>");
     		  }
     	  }
    	  
      	 
       	  
    	</script>
    	</ul>
    </div>
    <br>
 
    
       <script>
    if("${boardVO3.writer}"=="${name}"){
	document.write("<button type='submit' class='btn btn-warning' id='modifyBtn' >수정</button>");
	document.write("<button type='submit' class='btn btn-danger' id='removeBtn' style='margin-left:5px;'>삭제</button>");
	document.write("<button type='submit' class='btn btn-primary' id='goListBtn' style='margin-left:5px;'>목록</button>");
    }
    else
    {
    	document.write("<button type='submit' class='btn btn-primary' id='goListBtn' style='margin-left:50px;'>목록</button>");

    }	
	</script>
	
	
</div>


<div class="row" style="padding:50px;">
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

<ul class="timeline" style="margin-left:50px;" >
	<li class="time-label" id="repliesDiv"><span class="bg-green">
	 댓글 목록<small id="replycntSmall">[${boardVO3.replycnt }]</small></span></li>
</ul>
<div class="text-center">
	<ul id="pagination" class="pagination pagination-sm no-margin">
	
	</ul>
</div>

<div id="modifyModal" class="modal modal-primary fade" role="dialog"	>
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
	return year +"/"+month+"/"+date;
});


var printData = function(replyArr,target,templateObject){

	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

var bno = ${boardVO3.bno};
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
	getPage("/replies3/"+bno+"/1");
});

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/replies3/"+bno+"/"+replyPage);
});

$("#replyAddBtn").on("click",function(){

	var replyerObj = $("#newReplyWriter");

	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	alert(replyer);
	var replytext= replytextObj.val();
	alert(replyer);
	$.ajax({
		type:'post',
		url:'/replies3/',
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
				getPage("/replies3/"+bno+"/"+replyPage);
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
		url:'/replies3/'+rno,
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
				getPage("/replies3/"+bno+"/"+replyPage);
				
			}
		
		}});
});

$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies3/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPage("/replies3/"+bno+"/"+replyPage);
				
			}
		
		}});
});


</script>
<script>
var bno =${boardVO3.bno};
var template = Handlebars.compile($("#templateAttach").html());

$.getJSON("/food/getAttach/"+bno,function(list){
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