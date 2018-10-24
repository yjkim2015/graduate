<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    
    
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="../resources/assets/css/iconfont.css">
<link rel="stylesheet" href="../resources/assets/css/slick/slick.css">
<link rel="stylesheet" href="../resources/assets/css/slick/slick-theme.css">
<link rel="stylesheet" href="../resources/assets/css/stylesheet.css">
<link rel="stylesheet" href="../resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/assets/css/jquery.fancybox.css">
<link rel="stylesheet" href="../resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
<!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


<!--For Plugins external css-->
<link rel="stylesheet" href="resources/assets/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->	
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
  
  .content-wrapper{
  margin:0;
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
.main-header{
max-height:400px;
height:400px;
background-image:url("../resources/assets/images/homebg.jpg");
background-size:100% 100%;
}
.btn {
    display: inline-block;
    min-width: 150px;
    text-align: center;
    color: #fff;
    letter-spacing: 1px;
    margin: 0;
    font-size:0.8125rem;
    border-radius: 0px;
    margin-top: 20px;
    transition: .5s;
    border: 1px solid #e74c3c;
    font-family: 'open_sansbold';
    padding: 0.8rem 3rem;
    transition: all 0.6s;
    border-radius: 2px;

}

.btn:hover{
    box-shadow: 0px 2px 2px 1px rgba(221, 221, 221, 0.6);
    color:#fff;
}
.btn-default{
    background: transparent;
    border:1px solid #fff;
    padding: 1.125rem 3rem;
}
.btn-default:hover{
    background: #e74c3c;
    border:1px solid #e74c3c;
}
.btn-lg{
    background: #e74c3c;
    padding: 1.125rem 3rem;
}
.btn-md{
    background: #999999;
    padding: 1rem 2rem;
    border: 1px solid transparent;
}


.separator {
    width: 10px;
    height: 10px;
    margin: 20px auto;
    background: #e74c3c;
    position: relative;
    display: inline-block;
    border-radius: 50%;
}
.separator:after {
    position: absolute;
    left:5%;
    bottom:4px;
    height: 1px;
    width: 80px;
    background: #eee;
    content:"";
    display: inline-block;
    margin-left: 20px;
}
.separator:before {
    position: absolute;
    right: 5%;
    bottom:4px;
    height: 1px;
    width: 80px;
    background: #eee;
    content:"";
    display: inline-block;
    margin-right: 20px;
}
    </style>
 
    
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
  <body class="skin-blue sidebar-mini">

      
    
    <header class="main-header">
        <!-- Logo -->
      
      <!-- <a href="/resources/index2.html" class="logo"> 
          <!-- mini logo for sidebar mini 50x50 pixels -->
       <span class="logo-mini"></span>
          <!-- logo for regular state and mobile devices -->
       <!--   <span class="logo-lg" color="red"><b>With</b></span> -->
        <!--  </a>--> 
        <!-- Header Navbar: style can be found in header.less -->
     <nav  role="navigation"> 
          <!-- Sidebar toggle button-->
        
         <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">   
              <!-- Messages: style can be found in dropdown.less-->
              <script type="text/javascript">
              var href=window.location.href;
			 if(href.indexOf("membership")!= -1){
			 document.write("<li><a href='/with' class='btn btn-default' value='HOME'><font color='black'>HOME</font></a></li>");
			 document.write("<li><a href='#' class='btn btn-default' id='test1' ><font color='black'>여행지정보</font></a></li>"); 
			 document.write("<li><a href='#' class='btn btn-default'><font color='black'>동행</font></a></li>");
			 document.write("<li><a href='#' class='btn btn-default'><font color='black'>여행후기</font></a></li>");
			 }
			 else{
				 document.write("<li><a href='/with2' class='btn btn-default' value='HOME'><font color='black'>HOME</font></a></li>");
				 document.write("<li><a href='/information/' class='btn btn-default' id='test1' ><font color='black'>여행지정보</font></a></li>");
				 document.write("<li><a href='/together/' class='btn btn-default'><font color='black'>동행</font></a></li>");
				 document.write("<li><a href='/review/' class='btn btn-default'><font color='black'>여행후기</font></a></li>");
			 }
             </script>
             
             
             
             
    
       
             
              <!-- Tasks: style can be found in dropdown.less -->
              
              <!-- User Account: style can be found in dropdown.less -->
              
              <!-- Control Sidebar Toggle Button -->
              
            </ul>
          </div>
        </nav>
       
		
		<section id="home" class="home" style="height: 100%">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 ">
										
						<div class="main_home_slider text-center">
							<div class="single_home_slider">
								<div class="main_home wow fadeInUp" data-wow-duration="700ms">
									
									<br><br><br><br>
									<script type=></script>
									<h1><font color="#fff">With</font></h1>
										 <div class="separator"></div>	
									<script type="text/javascript">
													
											var href=window.location.href;
									
								 if(href.indexOf("information") != -1){
									document.write("<h5><a href='/information/' class='btn-default'><b><font color='black'>여행지 명소</font></b></a>");
									document.write("<a href='/food/' class='btn-default'><font color='#fff'>맛집 정보</font></a></h5>");
								 }else if(href.indexOf("food")!=-1){
										document.write("<h5><a href='/information/' class='btn-default'><b><font color='#fff'>여행지 명소</font></b></a>");
										document.write("<a href='/food/' class='btn-default'><b><font color='black'>맛집 정보</font></b></a></h5>");
								 }
								
								 else if(href.indexOf("Login") != -1){
									 document.write("<h5><a href='#' class='btn-default'><font color='#fff'>로그인</font></a></h5>");
								 }
								 else if(href.indexOf("together") != -1){
									 document.write("<h5><a href='#' class='btn-default'><font color='#fff'>동행</font></a></h5>");
								 }
								 else if(href.indexOf("review")!= -1){
									 document.write("<h5><a href='#' class='btn-default'><font color='#fff'>여행 후기</font></a></h5>");
								 }
								 else if(href.indexOf("member")!= -1){
									 document.write("<h5><a href='#' class='btn-default'><font color='#fff'>회원가입</font></a></h5>");
								 }
										   
									</script>
								
	                             
								
							
								</div>
							</div>
						</div>
					
						</div>
				</div>
			</div>
		</section>
		
		
        
      </header>
    
      <!-- Left side column. contains the logo  -->
      
    <!--  <aside class="main-sidebar"><%--
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/resources/index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                <li><a href="/resources/index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>Layout Options</span>
                <span class="label label-primary pull-right">4</span>
              </a>
              <ul class="treeview-menu">
                <li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                <li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
                <li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
                <li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
              </ul>
            </li>
            <li>
              <a href="../widgets.html">
                <i class="fa fa-th"></i> <span>Widgets</span> <small class="label pull-right bg-green">new</small>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                <li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
                <li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                <li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                <li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
                <li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
                <li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
                <li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
                <li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
              </ul>
            </li>
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-edit"></i> <span>Forms</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li class="active"><a href="general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
                <li><a href="advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                <li><a href="editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-table"></i> <span>Tables</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                <li><a href="../tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
              </ul>
            </li>
            <li>
              <a href="../calendar.html">
                <i class="fa fa-calendar"></i> <span>Calendar</span>
                <small class="label pull-right bg-red">3</small>
              </a>
            </li>
            <li>
              <a href="../mailbox/mailbox.html">
                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                <small class="label pull-right bg-yellow">12</small>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Examples</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
                <li><a href="../examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
                <li><a href="../examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
                <li><a href="../examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                <li><a href="../examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                <li><a href="../examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                <li><a href="../examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>                
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                    <li>
                      <a href="#"><i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i></a>
                      <ul class="treeview-menu">
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
              </ul>
            </li>
            <li><a href="/resources/documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
            <li class="header">LABELS</li>
            <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
            <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
          </ul>
        </section> --%>
        <!-- /.sidebar -->
     <!-- </aside> --> 

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
	
     
   
        <!-- Content Header (Page header) -->
        