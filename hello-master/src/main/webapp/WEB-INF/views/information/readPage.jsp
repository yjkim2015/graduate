<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>해외여행지 정보(명소)</title>
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

.visual{width:100%; min-height:400px; overflow:hidden; padding:80px 0 0 0; background-image:url("../resources/assets/images/1.jpg"); background-size:100% 100%;}

.login_wrap{width:500px; height:92px; float:left; overflow:hidden;}
.login_wrap>label{width:600px; height:46px; float:left;}
.login_wrap>label>p{width:120px; height:46px; float:left;}
.login_wrap>label>input{width:358px; height:40px; float:left; margin-left:18px; }
.login_bt{width:128px; height:10px; float:left; margin-left:12px;}
.login_wrap img{float:left; display:block; }
.total_wrap{width:650px; height:100px; margin:auto; margin-top:29.5%;}

#footer{width:100%; height:70px; background:gold;  bottom:0;}

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
		formObj.attr("action", "/information/modifyPage");
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
				
				formObj.attr("action", "/information/removePage");
				formObj.submit();
				
			});
		}else{
			
			formObj.attr("action", "/information/removePage");
			formObj.submit();
		}
		
	 	/*
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
		 */
	});	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/information/");
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
	<input type="hidden" name="bno" value="${boardVO.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>


<div class="box-body" style="padding:50px">
	<div class="form-group">
		<label for="exampleInputEmail1" style="font-size:20px">제목</label> <input type="text" 
		name="title" class="form-control" value="${boardVO.title }" style="background-color:white; font-size:15px;"
		 readonly="readonly" >
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1" style="font-size:20px">내용</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly" style="background-color:white; font-size:15px;">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1"style="font-size:20px">글쓴이</label>
		<input type="text" name="writer" class="form-control" value="${boardVO.writer }" style="background-color:white; font-size:15px;"
		readonly="readonly">
	</div>
</div>

<div class="box-footer" style="border-top:none; margin-top:-40px; margin-left:40px; margin-right:40px;">

 	<div><hr></div>

   	<ul class="mailbox-attachments clearfix uploadedList" style="width: 100%">
<%-- 	${href} --%>

	 <c:forEach var="item" items="${list}" varStatus="status">
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
    	
    	  if(href.indexOf("홍콩")!=-1){
    		   myLatLng=[{lat:22.285324,lng:114.159274},{lat:22.3158576,lng:114.0404637},{lat:22.249859,lng:113.921356},
      		{lat:22.283289,lng:114.154687},{lat:22.325003,lng:114.172153},{lat:22.2938118,lng:114.1753399},
      		{lat:22.288338,lng:114.150247},{lat:22.271977,lng:114.150011},{lat:22.29267,lng:114.010105},
      		{lat:22.287386,lng:114.150428},{lat:22.293762,lng:114.16871}]

      		name=['IFC몰 55층 전망대','디즈니랜드','란타우 피크',
      		'미드레벨 에스컬레이터','꽃 시장','심포니 오브 라이트',
      		'마카오 페리터미널','피크 타워','디스커버리 베이',
      		'웨스턴 마켓','스타페리']

    	  		document.getElementsByName("hong")[0].style.backgroundColor="powderblue";
    	  }else if(href.indexOf("마카오")!=-1){
    		myLatLng=[{lat:22.193524,lng:113.539734},{lat:22.11741,lng:113.551598},{lat:22.116923,lng:113.551458},
    			  {lat:22.14945,lng:113.567111},{lat:22.198936,lng:113.539546},{lat:22.1887759,lng:113.554607},
    			  {lat:22.193664,lng:113.540131},{lat:22.194627,lng:113.540394},{lat:22.1887759,lng:113.554607},
    			  {lat:22.196907,lng:113.542384},{lat:22.125833,lng:113.557755}]

    			  name=['세나도 광장','콜로안 빌리지','성 프란시스 자비에르 성당',
    			  '시티 오브 드림즈','성 안토니오 성당','베네시안 마카오',
    			  '자비의 성채(자애당)','성 도미니크 성당&광장','마카오 예술박물관',
    			  '몬테 요새','마카오 자이언트 판다 파빌리온']
	  		document.getElementsByName("makao")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("오사카")!=-1){

    		 myLatLng=[{lat:34.6848558,lng:135.8428766},{lat:34.9670829,lng:135.7726205},{lat:34.985865,lng:135.758078},
    		  {lat:34.7013658,lng:135.1895261},{lat:34.6654759,lng:135.4323292},{lat:34.6825757,lng:135.5208635},
    		  {lat:35.0177597,lng:135.6742081},{lat:34.6889894,lng:135.8398104},{lat:34.657798,lng:135.432673},
    		  {lat:34.795519,lng:135.248992},{lat:34.7052616,lng:135.4906696}]

    		  name=['나라공원','후시미이나리 신사','JR 쿄토역',
    		  '가자미도리노 야카타(풍향계의 집)','유니버셜 스튜디오','오사카 역사 박물관',
    		  '노노미야 신사','도다이지','덴포잔',
    		  '긴노유 온천','공중 정원 전망대(우메다 스카이 빌딩)']
    		 
 	  		document.getElementsByName("osaka")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("후쿠오카")!=-1){
    		  
    		  
    		  myLatLng=[{lat:33.603778,lng:130.398149},{lat:33.59267,lng:130.405027},{lat:33.594782,lng:130.351237},
    			  {lat:33.588307,lng:130.421603},{lat:33.589786,lng:130.353064},{lat:33.473055,lng:130.414219},
    			  {lat:33.521509,lng:130.534827},{lat:33.518343,lng:130.538906},{lat:33.519557,lng:130.531544},
    			  {lat:33.5896022,lng:130.4113231},{lat:33.513754,lng:130.516148}]

    			  name=['나미하노유','나카스 야타이','시사이드 모모치 해변 공원',
    			  '요도바시 카메라','후쿠오카시 박물관','세이류 온천',
    			  '다자이후 텐만구','구슈 국립 박물관','다자이후 거리',
    			  '캐널 시티','다자이후 세이쵸 아토']

   	  		document.getElementsByName("hukuoka")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("도쿄")!=-1){
    		  
    		  myLatLng=[{lat:35.658743,lng:139.745416},{lat:35.689574,lng:139.691676},{lat:35.66057,lng:139.729238},
    			  {lat:35.6365636,lng:139.7631419},{lat:35.664427,lng:139.759944},{lat:35.625345,lng:139.780608},
    			  {lat:35.6958202,lng:139.7596347},{lat:35.660404,lng:139.729037},{lat:35.676363,lng:139.699369},
    			  {lat:35.659083,lng:139.700592},{lat:35.665298,lng:139.726368}]

    			  name=['도쿄 타워','도쿄 도청 전망대','롯폰기 힐즈',
    			  '레인보우 브릿지','니혼 테레비 타워','비너스 포트',
    			  '간다 고서점 거리','모리 타워 도쿄 시티 뷰','메이지 신궁',
    			  '하치코 동상','국립신미술관']
    		  
     	  		document.getElementsByName("dokyo")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("오키나와")!=-1){
    	  
    		 myLatLng=[{lat:26.1764107,lng:127.6404905},{lat:26.2151942,lng:127.6849187},{lat:26.7077943,lng:128.0178255},
    			  {lat:26.3168555,lng:127.7575677},{lat:26.694168,lng:127.8779197},{lat:26.1734542,lng:127.8260168},
    			  {lat:26.5049504,lng:127.850132},{lat:26.1667342,lng:127.8297204},{lat:26.2170166,lng:127.7195191},
    			  {lat:26.1386609,lng:127.7507722},{lat:26.5869445,lng:127.9891462}]

    			  name=['우미카지 테라스','나하 국제 거리','코우리 섬',
    			  '아메리칸 빌리지','추라우미 수족관','세이화우타키',
    			  '만자모(만좌모)','치넨 미사키 공원','슈리성',
    			  '오키나와 월드','오리온 맥주 공장']
    	  }else if(href.indexOf("타이베이")!=-1){
    		  
    		 myLatLng=[{lat:25.045544,lng:121.507399},{lat:25.03473,lng:121.521982},{lat:25.136252,lng:121.50514},
    			  {lat:25.0931098,lng:121.5323603},{lat:25.031902,lng:121.529619},{lat:25.102165,lng:121.548591},
    			  {lat:25.079137,lng:121.533024},{lat:25.036801,lng:121.499968},{lat:25.011087,lng:121.454585},
    			  {lat:25.086279,lng:121.524977},{lat:25.033768,lng:121.564813}]

    			  name=['시먼딩','국립 중정기념당','베이터우 온천',
    			  '사림관저공원','용캉제','고궁박물원',
    			  '충렬사','용산사','임가화원',
    			  '스린 야시장','타이베이 101(타이페이 101)']
  	  		document.getElementsByName("taibei")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("가오슝")!=-1){
    		  
    		  myLatLng=[{lat:22.624705,lng:120.300737},{lat:22.626814,lng:120.286868},{lat:22.607072,lng:120.269344},
    			  {lat:22.61889,lng:120.266844},{lat:22.631439,lng:120.301906},{lat:22.751302,lng:120.445354},
    			  {lat:22.611047,lng:120.30016},{lat:22.656967,lng:120.286447},{lat:22.619666,lng:120.281872},
    			  {lat:22.625023,lng:120.289134},{lat:22.6179526,lng:120.2660465}]
    			  name=['중앙 공원','가오슝 시립 역사 박물관','치진 풍경구(기진 풍경구)',
    			  '다거우 영국 영사관','메이리다오 역(미려도 역)','불광산',
    			  '85 스카이 타워','가오슝 시립 미술관','보얼 예술 특구(박이 예술 특구)',
    			  '아이허','시즈완 풍경구 (서자만 풍경구)']
    	  		document.getElementsByName("gao")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("타이중")!=-1){
    		  myLatLng=[{lat:24.133715,lng:120.609338},{lat:24.187403,lng:120.595509},{lat:24.144871,lng:120.684384},
    			  {lat:24.159436,lng:120.68782},{lat:24.178695,lng:120.646416},{lat:24.178903,lng:120.600498},
    			  {lat:24.151235,lng:120.685832},{lat:24.155728,lng:120.655437},{lat:24.136865,lng:120.685006},
    			  {lat:24.157265,lng:120.666145}]
    			  name=['무지개 마을','동해 국제 예술거리','타이중 공원',
    			  '바오쮀쓰(보각사)','펑지아 야시장(봉갑 야시장)','동해대학',
    			  '이중지에(일중가상권)','징밍이제(정명일가)','타이중 기차역',
    			  '국립 자연 과학 박물관']
  	  		document.getElementsByName("taijung")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("베이징(북경)")!=-1){
    		  
    		  myLatLng=[{lat:39.910563,lng:116.41141},{lat:39.945411,lng:116.41688},{lat:39.925075,lng:116.40899},
    			  {lat:39.914081,lng:116.39706},{lat:40.350861,lng:116.00936},{lat:39.908535,lng:116.39751},
    			  {lat:39.895728,lng:116.39501},{lat:39.985193,lng:116.49473},{lat:39.925009,lng:116.39671},
    			  {lat:39.922454,lng:116.4622},{lat:39.912238,lng:116.39358}]
    			  name=['왕부정 거리','옹화궁','중국미술관',
    			  '고궁박물원(자금성)','만리장성','천안문 광장',
    			  '대관루','다산쯔 789 예술구','경산공원',
    			  '조양극장','중산공원']
    	  		document.getElementsByName("baging")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("상하이(상해)")!=-1){
    		  
    		  
    		  myLatLng=[{lat:31.217238,lng:121.474706},{lat:31.237458,lng:121.495753},{lat:31.191169,lng:121.436095},
    			  {lat:31.239692,lng:121.499717},{lat:31.207874,lng:121.469734},{lat:31.23455,lng:121.507458},
    			  {lat:31.232243,lng:121.473157},{lat:31.213829,lng:121.553804},{lat:31.217502,lng:121.488023},
    			  {lat:31.209581,lng:121.440719},{lat:31.254469,lng:121.492148}]
    			  name=['대한민국 임시정부','빈강대도','서가회 천주교당',
    			  '동방명주탑','프랑스 조계지','상하이 세계금융센터',
    			  '인민공원','세기공원','문묘',
    			  '무강로','1993 노장방']
  	  		document.getElementsByName("sanghai")[0].style.backgroundColor="powderblue";
   		  
    	  }else if(href.indexOf("칭다오(청도)")!=-1){
    		  
    		  myLatLng=[{lat:36.079514,lng:120.349666},{lat:36.068075,lng:120.320561},{lat:36.061347,lng:120.32723},
    			  {lat:36.062152,lng:120.385049},{lat:36.101995,lng:120.4730272},{lat:36.056548,lng:120.335953},
    			  {lat:36.079132,lng:120.346833},{lat:36.058495,lng:120.320396},{lat:36.066049,lng:120.331973},
    			  {lat:36.0699961,lng:120.3990921},{lat:36.0648978,lng:120.3326941}]

    			  name=['맥주거리','천주교당','천후궁(칭다오 민속 박물관)',
    			  '5.4광장','칭다오시 박물관','칭다오 해저세계',
    			  '칭다오 맥주박물관','잔교','신호산공원',
    			  '청죽원','영빈관']
    	  		document.getElementsByName("chingdao")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("황산")!=-1){
    		  
    		  myLatLng=[{lat:29.921109,lng:118.282599},{lat:29.696109,lng:118.315329},{lat:29.704333,lng:118.291673},
    			  {lat:29.713059,lng:118.291126},{lat:29.86664,lng:118.364635},{lat:30.000684,lng:117.99135},
    			  {lat:29.708295,lng:118.306453}]

    			  name=['정감촌','문봉교','리양 옛거리',
    			  '향명대극원','당모','홍춘',
    			  '명·청 옛거리(툰시 라오지에)']

    		  
  	  		document.getElementsByName("hwangsan")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("장가계")!=-1){
    		  myLatLng=[{lat:29.36607,lng:110.48586},{lat:29.32256,lng:110.55279},{lat:29.36163,lng:110.61401}]

    		  name=['십리화랑','보봉호','황룡동']

    	  		document.getElementsByName("jang")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("서안")!=-1){
    		  
    		  myLatLng=[{lat:34.4805682,lng:110.08196716},{lat:34.3841221,lng:109.2784739},{lat:34.377564,lng:109.260207},
    			  {lat:34.361718,lng:109.213028}]

    			  name=['[화산]서봉','진시황릉 박물원',
    			  '진시황릉','화청지']
  	  		document.getElementsByName("seoan")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("싱가포르")!=-1){
    		  
    		  myLatLng=[{lat:1.289562,lng:103.845123},{lat:1.31384,lng:103.8159138},{lat:1.2533955,lng:103.818885},
    			  {lat:1.300974,lng:103.855219},{lat:1.2866944,lng:103.8543183},{lat:1.289304,lng:103.844157},
    			  {lat:1.2815686,lng:103.8636135},{lat:1.284005,lng:103.858824},{lat:1.2922739,lng:103.8521987},
    			  {lat:1.2540418,lng:103.8238082},{lat:1.2804377,lng:103.8505284}]

    			  name=['클락 키','보타닉 가든','머라이언 타워',
    			  '부기스 빌리지','머라이언 파크','리버사이드 포인트',
    			  '가든스 바이 더 베이','마리나 베이 샌즈','성 앤드류 성당',
    			  '유니버셜 스튜디오 싱가포르','라우 파삿 페스티벌 마켓']
    		  
    	  		document.getElementsByName("singga")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("방콕")!=-1){
    		  
    		 myLatLng=[{lat:13.759028,lng:100.49717},{lat:13.705343,lng:100.504025},{lat:13.799366,lng:100.548677},
    			  {lat:13.751335,lng:100.492553},{lat:13.729129,lng:100.5317},{lat:13.743735,lng:100.485984},
    			  {lat:13.7589925,lng:100.493897},{lat:13.774056,lng:100.5123925},{lat:13.740763,lng:100.568212},
    			  {lat:13.745263,lng:100.540566},{lat:13.520341,lng:99.958835}]

    			  name=['카오산 로드','아시아티크','짜뚜짝 시장',
    			  '왓 프라 깨오(에메랄드 사원)','팟퐁 야시장','왓 아룬(새벽 사원)',
    			  '국립 미술관','위만멕 궁','더 오아시스 스파',
    			  '에라완 사당','담넌 사두억 수상시장']

  	  		document.getElementsByName("bangkok")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("푸켓")!=-1){
    		  
    		  
    		  myLatLng=[{lat:8.001607,lng:98.292014},{lat:7.8984101,lng:98.2954422},{lat:7.893904,lng:98.380115},
    			  {lat:7.892028,lng:98.294782},{lat:7.893729,lng:98.296238},{lat:7.8466743,lng:98.2926158},
    			  {lat:7.886933,lng:98.386599},{lat:7.846826,lng:98.336883},{lat:7.949228,lng:98.27337},
    			  {lat:7.8208891,lng:98.2970361},{lat:7.903485,lng:98.367134}]
    			  name=['방타오 비치','빠통 비치','카오랑 뷰포인트',
    			  '리모네 마사지','방라 로드','까론 비치',
    			  '디북 로드&탈랑 로드','왓 찰롱','바닐라 스카이 바&라운지',
    			  '까타 비치','아프로디테 카바레 쇼']
    		document.getElementsByName("puket")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("세부")!=-1){
    		     		  
    		 myLatLng=[{lat:10.294014,lng:123.902443},{lat:10.292488,lng:123.905824},{lat:9.629602,lng:123.8745},
    			  {lat:9.839952,lng:124.197647},{lat:10.293554,lat:123.901944},{lat:10.33071,lng:123.907517},
    			  {lat:9.659646,lng:124.070124},{lat:10.378942,lng:123.872971},{lat:9.6958683,lng:124.0992488},
    			  {lat:10.328335,lng:123.903674},{lat:9.517063,lng:123.682019}]
    			  name=['산토 니뇨 성당','산 페드로 요새','혈맹 기념비',
    			  '초콜릿 힐','마젤란 십자가','아이티 파크',
    			  '안경 원숭이 보호 구역','탑스 힐','나비 보호 센터',
    			  '더 트리 쉐이드 스파','발리카삭 섬']
      		document.getElementsByName("sebu")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("보라카이")!=-1){
    		  
    		 myLatLng=[{lat:11.978224,lng:121.927039},{lat:11.962691,lng:121.923527},{lat:11.965735,lng:121.929335},
    			  {lat:11.9452305,lng:121.9583756},{lat:11.965178,lng:121.922442},{lat:11.9706235,lng:121.9169782},
    			  {lat:11.994554,lng:121.911677},{lat:11.950232,lng:121.9515681},{lat:11.970379,lng:121.918504},
    			  {lat:11.95062,lng:121.939095},{lat:11.954315,lng:121.93354}]
    			  name=['루호 산 전망대','화이트 비치','불라복 비치',
    			  '라우렐 섬','뱀부 라운지','윌리스 락',
    			  '푸카쉘 비치','크로커다일 섬','클럽 파라우',
    			  '띠르따 스파','라바스톤 스파']

        		document.getElementsByName("borakai")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("마닐라")!=-1){
    		  myLatLng=[{lat:14.5842957,lng:120.9816273},{lat:14.5708076,lng:120.9818307},{lat:14.5533035,lng:121.0198169},
    			  {lat:14.5587746,lng:120.98417},{lat:14.5729036,lng:120.9872737},{lat:14.5895972,lng:120.9747258},
    			  {lat:14.5915542,lng:120.9742321},{lat:14.5552792,lng:121.0160108},{lat:14.5384422,lng:120.9899692},
    			  {lat:14.5869434,lng:120.9813484},{lat:14.5242232,lng:120.9919484}]
    			  name=['리잘 공원','베이 워크','더 스파 그린벨트',
    			  '하버 스퀘어','궁 오리엔탈 스파','인트라무로스',
    			  '마닐라 대성당','레가스피 일요 시장','블루 베이 워크',
    			  '국립 박물관','시티 오브 드림즈 마닐라']
      		document.getElementsByName("manila")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("코타 키나발루")!=-1){
    		  
    		  myLatLng=[{lat:5.995482,lng:116.107761},{lat:6.072963,lng:116.560718},{lat:5.95993,lng:116.06712},
    			  {lat:5.948328,lng:116.045738},{lat:5.9846454,lng:116.005922},{lat:5.978907,lng:116.07099},
    			  {lat:5.9900714,lng:116.0790333},{lat:6.036363,lng:116.118632},{lat:5.9791253,lng:116.0697513},
    			  {lat:5.9855515,lng:116.0792306},{lat:6.017766,lng:116.109877}]

    			  name=['리카스 모스크','키나발루 산','사바 주립 모스크',
    			  '탄중 아루 비치','툰구 압둘 라만 해상 공원','와리산 스퀘어',
    			  '제셀톤 포인트','사바 주립 대학교','워터 프론트',
    			  '시그널 힐 전망대','(구)사바 주 청사']

        		document.getElementsByName("kota")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("페낭")!=-1){
    		  
    		  myLatLng=[{lat:5.4773939,lng:100.2620201},{lat:5.4640234,lng:100.2294723},{lat:5.4173704,lng:100.3403137},
    			  {lat:5.4197217,lng:100.3391211},{lat:5.419209,lng:100.3440251},{lat:5.4346665,lng:100.3146284},
    			  {lat:5.42421,lng:100.26863},{lat:5.4671818,lng:100.1862918},{lat:5.4184533,lng:100.3388053},
    			  {lat:5.4492676,lng:100.2153197},{lat:5.4377327,lng:100.2906979}]
    			  name=['바투 페링기 야시장','열대 향신료 정원','리틀 인디아',
    			  '세인트 조지 교회','빅토리아 시계탑','거니 드라이브',
    			  '데이비드 브라운 레스토랑 & 티 테라스','페낭 국립 공원','관음사',
    			  '이스케이프 테마파크','페낭 식물원']
      		document.getElementsByName("penang")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("쿠알라룸푸르")!=-1){
    		  
    		  
    		  myLatLng=[{lat:3.1577405,lng:101.712167},{lat:3.147166,lng:101.693229},{lat:3.1415927,lng:101.6899665},
    			  {lat:3.1433815,lng:101.6977711},{lat:3.1537355,lng:101.7133822},{lat:3.142137,lng:101.692042},
    			  {lat:3.1466759,lng:101.7111758},{lat:3.1556466,lng:101.7149966},{lat:3.2377402,lng:101.6839782},
    			  {lat:3.1472032,lng:101.7084904},{lat:3.147744,lng:101.6934862}]
    			  name=['페트로나스 트윈 타워','쿠알라품루프 시티 갤러리','이슬람 아트 뮤지엄',
    			  '차이나타운','아쿠아리아 KLCC','국립 모스크',
    			  '부킷 빈탕','KLCC 공원','바쿠 동굴',
    			  '창캇 부킷 빈탕','메르데카 광장']

        		document.getElementsByName("kuala")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("라오스")!=-1){
    		  myLatLng=[{lat:19.7494979,lng:101.9919372},{lat:19.8437755,lng:102.2199981},{lat:17.9631949,lng:102.603508},
    			  {lat:17.9652588,lng:102.6143866},{lat:17.9624056,lng:102.6175272},{lat:17.9645743,lng:102.6080831},
    			  {lat:19.888984,lng:102.133408},{lat:18.9417266,lng:102.4475741},{lat:19.8867207,lng:102.1386322},
    			  {lat:17.9678114,lng:102.6038612}]
    			  name=['꽝시 폭포','땃새 폭포','메콩강 야시장',
    			  '딸랏사오 몰(아침 시장)','비엔티안 센터','남푸 분수',
    			  '아침 공양','몬도가네 아침시장','라오 레드 크로스 사우나&마사지',
    			  '홈 아이디얼 마트']
      		document.getElementsByName("laos")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("다낭")!=-1){
    		  
    		  myLatLng=[{lat:16.0255207,lng:108.0313969},{lat:16.0392763,lng:108.2285285},{lat:16.0670681,lng:108.2227247},
    			  {lat:16.1001648,lng:108.2777309},{lat:16.0039264,lng:108.2628393},{lat:16.0494274,lng:108.2463491},
    			  {lat:16.0606348,lng:108.2361733},{lat:16.0607069,lng:108.223443},{lat:16.0682357,lng:108.2242292}]

    			  name=['바나 힐','아시아 파크','다낭 대성당',
    			  '영응사','오행산','엘 스파',
    			  '퀸 스파','참 조각 박물관','한 시장']
        		document.getElementsByName("danang")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("하노이")!=-1){
    		  myLatLng=[{lat:21.03493,lng:105.8521},{lat:21.03482,lng:105.8514},{lat:21.03812,lng:105.84947},
    			  {lat:21.03927,lng:105.83458},{lat:21.03545,lng:105.83272},{lat:21.03677,lng:105.83464},
    			  {lat:21.02878,lng:105.849},{lat:21.03812,lng:105.84947},{lat:21.02318,lng:105.85156},
    			  {lat:21.02516,lng:105.84636}]

    			  name=['따히엔 맥주 거리','구시가','야시장',
    			  '주석궁&호치민 관저','호치민 박물관','호치민 묘소',
    			  '성 요셉 성당','동쑤언 시장','베트남 여성 박물관',
    			  '호아로 수용소']
      		document.getElementsByName("hanoi")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("호치민")!=-1){
    		  
    		  myLatLng=[{lat:10.779394,lng:106.6921474},{lat:10.7789308,lng:106.7038067},{lat:10.7801495,lng:106.7036551},
    			  {lat:10.7798544,lng:106.6989827},{lat:10.7674211,lng:106.6939976},{lat:10.7776516,lng:106.6959786},
    			  {lat:10.7765452,lng:106.7009383},{lat:10.7799281,lng:106.6999269},{lat:10.776545,lng:106.7030461},
    			  {lat:10.788328,lng:106.6906732},{lat:10.7714437,lng:106.7042077}]

    			  name=['전쟁 박물관','스파 갤러리','템플 리프 스파&사우나',
    			  '노트르담 대성당','여행자 거리','통일궁',
    			  '인민위원회 청사','중앙 우체국','오페라 하우스',
    			  '떤딘 성당','비텍스코 파이낸셜 타워']
    		  
        		document.getElementsByName("hochimin")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("파리")!=-1){
    		  
    		  myLatLng=[{lat:48.860614,lng:2.3376417},{lat:48.874002,lng:2.295005},{lat:48.857667,lng:2.361449},
    			  {lat:48.855225,lng:2.315803},{lat:48.8583905,lng:2.2944689},{lat:48.853103,lng:2.349937},
    			  {lat:48.8861739,lng:2.3431182},{lat:48.8703258,lng:2.3059994},{lat:48.886857,lng:2.342899},
    			  {lat:48.8421387,lng:2.3219508},{lat:48.8560187,lng:2.3454952}]
    			  name=['루브르 박물관','개선문','마레 지구',
    			  '로댕 미술관','에펠탑','노트르담 대성당',
    			  '몽마르뜨','샹젤리제 거리','사크레쾨르 대성당',
    			  '몽파르나스 타워','콩시에르쥬리']
      		document.getElementsByName("pari")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("로마")!=-1){
    		  myLatLng=[{lat:41.910704,lng:12.4763576},{lat:41.900934,lng:12.483314},{lat:41.901361,lng:12.498255},
    			  {lat:41.90649,lng:12.45364},{lat:41.902221,lng:12.456796},{lat:41.8963237,lng:12.4812493},
    			  {lat:41.902157,lng:12.454332},{lat:41.899165,lng:12.473075},{lat:41.896072,lng:12.482453},
    			  {lat:41.8902101,lng:12.4922309},{lat:41.893368,lng:12.482989}]

    			  name=['포폴로 광장','트레비 분수','로마 국립 박물관',
    			  '바티칸 박물관(궁전)','산 피에트로 광장','베네치아 궁전',
    			  '바티칸 시국','나보나 광장','베네치아 광장',
    			  '콜로세움','캄피돌리오 광장']
        		document.getElementsByName("roma")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("런던")!=-1){
    		  
    		  
    		  myLatLng=[{lat:51.5237712,lng:-0.1585615},{lat:51.505455,lng:-0.091107},{lat:51.5118307,lng:-0.1326299},
    			  {lat:51.5110595,lng:-0.1171482},{lat:51.5144731,lng:-0.1263566},{lat:51.507447,lng:-0.165676},
    			  {lat:51.5134265,lng:-0.1456563},{lat:51.5089294,lng:-0.1283008},{lat:51.5138505,lng:-0.0983512},
    			  {lat:51.505457,lng:-0.0753593},{lat:51.5194187,lng:-0.126965}]
    			  name=['셜록 홈즈 박물관','버로우 마켓','퀸즈 시어터',
    			  '서머셋 하우스','닐스 야드','하이드 파크',
    			  '본드 스트리트','내셔널 갤러리','세인트 폴 대성당',
    			  '타워 브리지','대영 박물관']
      		document.getElementsByName("rondon")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("바르셀로나")!=-1){
    		  myLatLng=[{lat:41.414495,lng:2.152694},{lat:41.3826757,lng:2.1770243},{lat:41.3797083,lng:2.1752836},
    			  {lat:41.3808982,lng:2.1228075},{lat:41.3801968,lng:2.1732947},{lat:41.3686306,lng:2.1598508},
    			  {lat:41.368653,lng:2.163054},{lat:41.38702,lng:2.170014},{lat:41.385216,lng:2.1808928},
    			  {lat:41.3839632,lng:2.1761969},{lat:41.3750293,lng:2.1491146}]
    			  name=['구엘 공원','산 하우메 광장','타란토스',
    			  '캄프 누 스타디움','리세우 극장','호안 미로 미술관',
    			  '몬주익 언덕','까딸루냐 광장','피카소 미술관',
    			  '바르셀로나 대성당','에스빠냐 광장']
        		document.getElementsByName("basel")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("크로아티아")!=-1){
    		  myLatLng=[{lat:44.112419,lng:15.228815},{lat:42.641699,lng:18.107139},{lat:43.507604,lng:16.438459},
    			  {lat:43.50732,lng:16.441195},{lat:43.5862973,lng:15.9227836},{lat:44.117526,lng:15.220044},
    			  {lat:42.640423,lng:18.110596},{lat:45.81327,lng:15.977993},{lat:43.3056935,lng:16.6539001},
    			  {lat:44.114225,lng:15.227482},{lat:42.640265,lng:18.109985}]
    			  name=['5개의 우물','성벽 투어','리바 거리',
    			  '그린 마켓','프리모슈텐','태양에게 인사',
    			  '렉터 궁전','돌라츠 시장','브라츠',
    			  '나도르니 광장','군둘리체바 광장']
      		document.getElementsByName("croatia")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("이스탄불")!=-1){
    		  
    		  myLatLng=[{lat:41.0083839,lng:28.9778781},{lat:41.0085832,lng:28.9801747},{lat:41.0116855,lng:28.9813274},
    			  {lat:41.0085336,lng:28.9715997},{lat:41.025621,lng:28.974141},{lat:41.021112,lng:29.004098},
    			  {lat:41.0244131,lng:28.9787274},{lat:41.0070981,lng:28.9766782},{lat:41.0084916,lng:28.9725566},
    			  {lat:41.0479726,lng:28.9337826},{lat:41.0169864,lng:28.9719591}]
    			  name=['지하궁전','아야소피아 박물관','이스탄불 고고학 박물관',
    			  '챔벌리타쉬 하맘','갈라타 타워','처녀의 탑',
    			  '카라쿄이','알만 체스메시(카이저 빌헬름 분수)','술탄 마무드 2세의 무덤',
    			  '에윱 술탄 자미','예니 자미']

    		  
        		document.getElementsByName("istan")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("블라디보스토크")!=-1){
    		  myLatLng=[{lat:43.1174627,lng:131.8984866},{lat:43.0144695,lng:131.9305015},{lat:43.1178009,lng:131.8812222},
    			  {lat:42.9463889,lng:131.8730556},{lat:43.0876995,lng:131.8487102},{lat:43.0731357,lng:131.8431687},
    			  {lat:43.1194049,lng:131.8769968},{lat:43.1152698,lng:131.8851185},{lat:43.1007244,lng:131.8985027},
    			  {lat:43.0280085,lng:131.8920827},{lat:43.1350342,lng:131.8955228}]
    			  name=['독수리 전망대','프리모르스키 아쿠아리움','아르바트 거리',
    			  '루스키섬 트레킹','반야 모례','에게르셀드 등대',
    			  '해양 공원','중앙 광장','마린스키 극장(분관)',
    			  '극동연방대학교 캠퍼스','신한촌 기념비']
      		document.getElementsByName("bladi")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("뉴욕")!=-1){
    		  myLatLng=[{lat:40.706854,lng:-74.011076},{lat:40.758906,lng:-73.985134},{lat:40.762715,lng:-73.983332},
    			  {lat:40.731332,lng:-73.997084},{lat:40.758737,lng:-73.978672},{lat:40.772305,lng:-73.982956},
    			  {lat:40.753591,lng:-73.98324},{lat:40.689258,lng:-74.044499},{lat:40.763504,lng:-73.9723158},
    			  {lat:40.7813376,lng:-73.9739943},{lat:40.7614231,lng:-73.977595}]
    			  name=['뉴욕 증권거래소','타임스 스퀘어','브로드웨이',
    			  '워싱턴 스퀘어 파크','록펠러 센터','링컨 센터',
    			  '브라이언트 파크','자유의 여신상','애플 스토어',
    			  '미국 자연사 박물관','뉴욕 현대 미술관']

        		document.getElementsByName("newyork")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("하와이")!=-1){
    		  
    		  myLatLng=[{lat:21.391885,lng:-157.715052},{lat:19.13637,lng:-155.505166},{lat:19.405402,lng:-155.2810621},
    			  {lat:21.588599,lng:-158.110921},{lat:21.3329197,lng:-157.8706129},{lat:20.8809788,lng:-156.5450424},
    			  {lat:37.5635968,lng:126.9866496},{lat:21.2667401,lng:-157.8187537},{lat:21.316863,lng:-157.830148},
    			  {lat:20.903337,lng:-156.369444},{lat:19.511185,lng:-155.921638}]
    			  name=['라니카이 비치','푸날루우 블랙샌드 비치','킬라우에아 화산(하와이 화산국립공원)',
    			  '할레이바 거리','비숍 박물관','이아오 밸리 주립공원',
    			  '와이메아 캐니언 전망대','카피올라니 공원','탄탈루스 언덕',
    			  '파이아 마을','그린웰 팜스']

      		document.getElementsByName("hawai")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("미서부")!=-1){
    		  myLatLng=[{lat:37.808563,lng:-122.476887},{lat:34.138023,lng:-118.279416},{lat:34.017275,lng:-118.288766},
    			  {lat:36.11311,lng:-115.174233},{lat:34.078554,lng:-118.474981},{lat:34.009827,lng:-118.49668},
    			  {lat:34.101895,lng:-118.340945},{lat:37.802742,lng:-122.448472},{lat:33.843019,lng:-118.392235},
    			  {lat:37.791941,lng:-122.412984},{lat:33.761689,lng:-118.19046}]
    			  name=['금문교','그리피스 파크','L.A 자연사 박물관',
    			  '벨라지오 호텔 분수 쇼','게티 센터','산타 모니카 피어',
    			  'TLC 차이니즈 극장(맨즈 차이니즈 극장)','더 팰리스 오브 파인 아츠','레돈도 비치',
    			  '그레이스 성당','롱비치']

        		document.getElementsByName("miseobu")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("괌")!=-1){
    		  
    		  myLatLng=[{lat:13.653785,lng:144.860183},{lat:13.534976,lng:144.802478},{lat:13.266993,lng:144.742244},
    			  {lat:13.299123,lng:144.663494},{lat:13.47424,lng:144.752414},{lat:13.513576,lng:144.805182},
    			  {lat:13.4723254,lng:144.7518468},{lat:13.271421,lng:144.747488},{lat:13.4733531,lng:144.7478557},
    			  {lat:13.295082,lng:144.659974},{lat:13.477631,lng:144.752199}]
    			  name=['리티디안 비치','사랑의 절벽','곰 바위',
    			  '괌 참전용사 기념비','아가나 대성당','샌드 캐슬',
    			  '라테스톤 공원','이나라한 수영장','산타 아규에다 요새',
    			  '솔레다르 요새','차모로 빌리지']
      		document.getElementsByName("gwam")[0].style.backgroundColor="powderblue";

    	  }else if(href.indexOf("시드니")!=-1){
    		  myLatLng=[{lat:-33.8523061,lng:151.2107871},{lat:-33.8731575,lng:151.2061154},{lat:-33.8545548,lng:151.2095245},
    			  {lat:-33.8567844,lng:151.2152966},{lat:-33.8667542,lng:151.2127841},{lat:-33.8743445,lng:151.2131669},
    			  {lat:-33.861191,lng:151.210659},{lat:-33.8748801,lng:151.2008999},{lat:-33.8700537,lng:151.2023355},
    			  {lat:-33.8596572,lng:151.2225332},{lat:-33.8833114,lng:151.1911561}]
    			  name=['하버 브리지','타운 홀(시드니 시청)','파일런 전망대',
    			  '오페라 하우스','뉴사우스웨일즈 주립 도서관','호주 박물관',
    			  '서큘러 키','달링 하버','씨라이프 시드니 수족관',
    			  '미세스 맥콰리 체어','글리브 마켓']
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
   if(href.indexOf("홍콩")!=-1){
	   for(count=1;count<=6;count++){
   document.write("<li><a name='hong' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=홍콩-"+count+"'>"+count+"</a></li>");
	}}else if(href.indexOf("마카오")!= -1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='makao' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=마카오-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("오사카")!= -1){
	   for(count=1;count<=12;count++){
		   document.write("<li><a name='osaka' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=오사카-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("후쿠오카")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='hukuoka'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=후쿠오카-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("도쿄")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='dokyo' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=도쿄-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("타이베이")!=-1){
	   for(count=1;count<=5;count++){
		   document.write("<li><a name='taibei' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=타이베이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("가오슝")!=-1){
	   for(count=1;count<=2;count++){
		   document.write("<li><a name='gao' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=가오슝-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("타이중")!=-1){
	   for(count=1;count<=2;count++){
		   document.write("<li><a name='taijung' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=타이중-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("베이징(북경)")!=-1){
	   for(count=1;count<=5;count++){
		   document.write("<li><a name='baging'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=베이징(북경)-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("상하이(상해)")!=-1){
	   for(count=1;count<=5;count++){
		   document.write("<li><a name='sanghai'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=상하이(상해)-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("칭다오(청도)")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='chingdao' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=칭다오(청도)-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("황산")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='hwangsan' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=황산-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("장가계")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='jang' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=장가계-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("서안")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='seoan'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=서안-"+count+"'>"+count+"</a></li>");
   }}
   else if(href.indexOf("호치민")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='hochimin' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=효치민-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("하노이")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='hanoi' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=하노이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("다낭")!=-1){
	   for(count=1;count<=2;count++){
		   document.write("<li><a name='danang' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=다낭-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("라오스")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='laos' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=라오스-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("쿠알라룸푸르")!=-1){
	   for(count=1;count<=2;count++){
		   document.write("<li><a name='kuala' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=쿠알라룸푸르-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("페낭")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='penang' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=페낭-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("코타 키나발루")!=-1){
	   for(count=1;count<=2;count++){
		   document.write("<li><a name='kota' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=코타키나발루-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("마닐라")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='manila'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=마닐라-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("보라카이")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='borakai'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=보라카이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("세부")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='sebu' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=세부-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("푸켓")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='puket' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=푸켓-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("방콕")!=-1){
	   for(count=1;count<=5;count++){
		   document.write("<li><a name='bangkok'href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=방콕-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("싱가포르")!=-1){
	   for(count=1;count<=7;count++){
		   document.write("<li><a name='singga' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=싱가포르-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("블라디보스토크")!=-1){
	   for(count=1;count<=3;count++){
		   document.write("<li><a name='bladi' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=블라디보스토크-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("이스탄불")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='istan' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=이스탄불-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("크로아티아")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='croatia' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=크로아티아-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("바르셀로나")!=-1){
	   for(count=1;count<=5;count++){
		   document.write("<li><a name='basel' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=바르셀로나-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("런던")!=-1){
	   for(count=1;count<=7;count++){
		   document.write("<li><a name='rondon' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=런던-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("로마")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='roma' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=로마-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("파리")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='pari' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=파리-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("미서부")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='miseobu' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=미서부-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("하와이")!=-1){
	   for(count=1;count<=9;count++){
		   document.write("<li><a name='hawai' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=하와이-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("뉴욕")!=-1){
	   for(count=1;count<=6;count++){
		   document.write("<li><a name='newyork' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=뉴욕-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("괌")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='gwam' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=괌-"+count+"'>"+count+"</a></li>");
   }}else if(href.indexOf("시드니")!=-1){
	   for(count=1;count<=4;count++){
		   document.write("<li><a name='sydney' href='http://localhost:8181/information/readPage?page=1&perPageNum=10&searchType&keyword&bno=1&title=시드니-"+count+"'>"+count+"</a></li>");
   }}
   
 </script>
    	</ul>
    </div>
    <br>
 
    
       <script>
    if("${boardVO.writer}"=="${name}"){
	document.write("<button type='submit' class='btn btn-warning' id='modifyBtn'>수정</button>");
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
	 댓글 목록<small id="replycntSmall">[${boardVO.replycnt }]</small></span></li>
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
	return year +"/"+month+"/"+date;
});


var printData = function(replyArr,target,templateObject){

	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

var bno = ${boardVO.bno};
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
	getPage("/replies/"+bno+"/1");
});

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/replies/"+bno+"/"+replyPage);
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
		url:'/replies/',
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
		url:'/replies/'+rno,
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
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});

$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});


</script>
<script>
var bno =${boardVO.bno};
var template = Handlebars.compile($("#templateAttach").html());

$.getJSON("/information/getAttach/"+bno,function(list){
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