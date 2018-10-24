<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Bino html5 free Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


<link rel="stylesheet" href="resources/assets/css/iconfont.css">
<link rel="stylesheet" href="resources/assets/css/slick/slick.css">
<link rel="stylesheet" href="resources/assets/css/slick/slick-theme.css">
<link rel="stylesheet" href="resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/jquery.fancybox.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


<!--For Plugins external css-->
<link rel="stylesheet" href="resources/assets/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />

<script src="resources/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, body {
	height: 100%;
}
</style>
<script type="text/javascript">
function logout(){
	location.href="Logout";
}
var id="${id}";
alert(id);
</script>
</head>
<body>
	<div class="culmn" style="height: 100%; overflow-y: scroll;" >
		<header id="main_menu" class="header navbar-fixed-top">
			<div class="main_menu_bg">
				<div class="container">
					<div class="row">
						<div class="nave_menu">
							<div class="container-fluid">
								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav navbar-right">
										<li><a href="/with2" class="btn btn-default"><font color="black">HOME</font></a></li>
										<li><a href="/information/"class="btn btn-default"><font color="black">여행지 정보</font></a></li>
										<li><a href="/together/"class="btn btn-default"><font color="black">동행</font></a></li>
										<li><a href="/review/"class="btn btn-default"><font color="black">여행 후기</font></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<section id="home" class="home" style="height: 100%">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 ">
						<div class="main_home_slider text-center">
							<div class="single_home_slider">
								<div class="main_home wow fadeInUp" data-wow-duration="700ms">
									
									<h1>With</h1>
									 <div class="separator"></div>
	                                 <p>여행 함께해요</p>
									<div class="home_btn">
									<a href="#"class="btn btn-default"><font color="black"><strong>${name}님</strong></font></a>
									</div>
									<a href="#" onclick="logout();" class="btn btn-default">로그아웃</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

</body>
</html>