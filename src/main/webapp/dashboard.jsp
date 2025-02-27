<%@page import="com.googlecode.objectify.cmd.Query"%>
<%@page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@page import="tut.entity.UserDetailsEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="tut.entity.CourseDetailsEntity"%>
<%@page import="tut.service.OfyService"%>
<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@page import= "com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="com.google.appengine.api.images.*" %>


 
<%

if(session.getAttribute("uemail") == null){
	response.sendRedirect("loginerror.html");
}
	else
	{	String uemail=(String)session.getAttribute("uemail");
		//Query<CourseDetailsEntity> itr=(Query<CourseDetailsEntity>)session.getAttribute("itr");
		//UserDetailsEntity ude=(UserDetailsEntity)session.getAttribute("ude");
		UserDetailsEntity ude=OfyService.ofy().load().type(UserDetailsEntity.class).id(uemail).now();
		String servingUrl;
		if(ude.picId == null){
			servingUrl="img/default.jpg";
		}
		else{
	 	String blobKey = ude.picId;
		BlobKey bk = new BlobKey(blobKey);
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		ServingUrlOptions servingOptions = ServingUrlOptions.Builder.withBlobKey(bk); 
		servingUrl = imagesService.getServingUrl(servingOptions); }
			
		
		
		%>
		
<!DOCTYPE html>
<html>
	<head>
	

		<!-- Basic -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">	

		<title>TutPoint - Dashboard</title>	

		<meta name="keywords" content="tuition" />
		<meta name="description" content="Best tuition">
		<meta name="author" content="cv-jatinsharm.appspot.com">

		<!-- Favicon -->
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

		<!-- Web Fonts  -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/font-awesome/css/fontawesome-all.min.css">
		<link rel="stylesheet" href="vendor/animate/animate.min.css">
		<link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.min.css">
		<link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.min.css">
		<link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.min.css">

		<!-- Theme CSS -->
		<link rel="stylesheet" href="css/theme.css">
		<link rel="stylesheet" href="css/theme-elements.css">
		<link rel="stylesheet" href="css/theme-blog.css">
		<link rel="stylesheet" href="css/theme-shop.css">

		<!-- Current Page CSS -->
		<link rel="stylesheet" href="vendor/rs-plugin/css/settings.css">
		<link rel="stylesheet" href="vendor/rs-plugin/css/layers.css">
		<link rel="stylesheet" href="vendor/rs-plugin/css/navigation.css">
		
		<!-- Demo CSS -->
		<link rel="stylesheet" href="css/demos/demo-education.css">

		<!-- Skin CSS -->
		<link rel="stylesheet" href="css/skins/skin-education.css"> 

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="css/custom.css">

		<!-- Head Libs -->
		<script src="vendor/modernizr/modernizr.min.js"></script>

	</head>
	<body>

		<div class="body">
			<header id="header" class="header-semi-transparent custom-header-semi-transparent" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': true, 'stickyStartAt': 49, 'stickySetTop': '-49px', 'stickyChangeLogo': false}">
				<div class="header-body">
					<div class="header-top header-top-style-3">
						<div class="container">
							<div class="header-row">
							<div class="header-column justify-content-end">
									<div class="header-row">
										<nav class="header-nav-top mr-0">
											<ul class="nav">
												<li><a href="logout"><span class="ws-nowrap"> Logout</span></a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="header-container container">
						<div class="header-row">
							<div class="header-column">
								<div class="header-row">
									<div class="header-logo py-2">
										<a href="index.jsp">
											<img alt="TutPoint" width="160" height="48" src="img/demos/education/logo.png">
										</a>
									</div>
								</div>
							</div>
							<div class="header-column justify-content-end">
								<div class="header-row">
									<div class="header-nav header-nav-stripe">
										<div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
											<nav class="collapse">
												<ul class="nav" id="mainNav">
													<li>
														<a class="nav-link" href="index.jsp">
															Home
														</a>
													</li>
													<li>
														<a class="nav-link" href="index.jsp#seecourses">
															Courses
														</a>
													</li>
												</ul>
											</nav>
										</div>
										<button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main nav">
											<i class="fas fa-bars"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<div role="main" class="main">
			
			<div class="container" style="height:220px;">
			<div class="row" style="height:160px;"></div>
			<h2>Dashboard</h2>
				</div>
				
			<section class="section background-color-tertiary border-0 my-0">

			<div class="content-wrap">

				<div class="container clearfix">

				<div class="row clearfix">
				
					<div class="col-md-3 clearfix">

							<div class="list-group">
								<a href="dashboard.jsp" class="list-group-item list-group-item-action clearfix">Profile <i class="fa fa-user float-right"></i></a>								
								<a href="editProfile.jsp" class="list-group-item list-group-item-action clearfix">Edit Profile<i class="fa fa-edit float-right"></i></a>
								<a href="logout" class="list-group-item list-group-item-action clearfix">Logout <i class="fa fa-sign-out float-right"></i></a>
							</div>

							<div class="fancy-title topmargin title-border" style="margin-top:40px;">
								<h4>Profile Photo</h4>
							</div>
							<p><img src="<%=servingUrl%>" alt="Profile Photo" class="img-responsive img-thumbnail"></p>
							
							
							<!-- <%// }
							//else{ 
							%>
							<a href="editProfile.jsp"><p><img src="img/default.jpeg" alt="Add Profile Photo" class="img-responsive img-thumbnail"></p></a>
							<% //} %>-->
							
					</div>		

					<div class="w-100 line d-block d-md-none"></div>
					<div class="col-md-9">
						<div class="heading-block noborder" align="center">
							<h1><%= ude.name %></h1>
							<span>Phone: <%= ude.phone %></span>
						</div>
						<hr>
						<div class="clear"></div>

						<div class="row clearfix">

							<div class="col-lg-12" align="center">

								<div style="margin-top:20px;" align="center">
									<h2>My Courses</h2>
								</div>
									
						<div class="row justify-content-center mb-5">
						
							<% List<CourseDetailsEntity> courseList=OfyService.ofy().load().type(CourseDetailsEntity.class).list();
							Iterator<CourseDetailsEntity> itr=courseList.iterator();
							while(itr.hasNext()){							
							CourseDetailsEntity user=itr.next();
							if(uemail.equals(user.owner)){
							//UserDetailsEntity tutor=OfyService.ofy().load().type(UserDetailsEntity.class).id(user.owner).now();
							String cId=user.courseId;
							%>
							<div class="col-9 col-md-6 col-lg-4 col-xl-4 mb-4 pb-3 appear-animation <%=user.courseType %> columnC" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="100">
								<div class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-style-1">
									<div class="thumb-info-wrapper">
										<a href=<%="\"courseDetail.jsp?courseId="+cId+"\"" %>><img src="<%=servingUrl %>" class="img-fluid resp img-thumbnail" alt=""></a>
										<div class="thumb-info-price background-color-secondary font-weight-semibold">
											<span>Rs. <%= user.courseFees %></span>
										</div>
										<a href=<%="\"editCourse.jsp?courseId="+cId+"\"" %>><button class="btn" style="float:left; margin-top:10px;"><i class="fa fa-pencil-alt"></i></button></a>
										<a href=<%="\"removecourse?courseId="+cId+"\"" %>><button class="btn" style="float:right; margin-top:10px;">X</button></a>
									</div>
									<div class="thumb-info-caption" style="margin-bottom:-40px;">
										<a href=<%="\"courseDetail.jsp?courseId="+cId+"\"" %>><h2 class="font-weight-semibold text-transform-none" style="margin-top:-50px;"><%= user.subject %></h2></a>
										<h6 ><i class="fa fa-thumbs-up text-color-primary"></i> Likes :<%= user.likes%></h6>
										<h5> -<%= ude.name %></h5>
										<% if("Home".equals(user.tutType)){ %>
										<i class="fa fa-home text-color-primary"> Home Tuition</i>
										<h6></h6>
										<% }
											else{ %>
											<i class="fa fa-university text-color-primary"> <%= user.tutName %></i>
											<h6><%= user.tutAdd %></h6>
											<% } %>
										
									</div>
									<div class="thumb-info-footer">
										<ul class="nav text-1">
											<li class="ml-3"><a href=<%="\"courseDetail.jsp?courseId="+cId+"\"" %>><i class="fa fa-align-justify text-color-primary"></i> &nbsp;More Details</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!--<div class="modal" tabindex="-1" id="removeModal" data-keyboard="false" data-backdrop="static">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<form action="removecourse">
													<label for="inputUserName"><h4>Do you want to remove the course?</h4></label>
													<input type="hidden" name="courseId" value=""><br>
													<button type="submit" class="btn btn-primary">Delete</button> &nbsp;
												<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
											</form>
										</div>
									</div>
								</div>
							</div>-->
							<% }} %>
							
							
							
							<div class="col-6 col-md-6 col-lg-4 col-xl-4 mb-4 pb-3 appear-animation school" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="200">
								<div class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-style-1">
									<div class="thumb-info-wrapper">
										<a href="addCourse.jsp"><img src="img/plus.jpg" class="img-fluid" alt=""></a>
									</div>
									<div class="thumb-info-caption">
										<a href="addCourse.jsp">
										<h4>
											Add a Course
										</h4>
										</a>
									</div>
								</div>
							</div>
							
						</div>

								</div>

							</div>

						</div>

						

						
					</div>

				</div>

			</div>

		</section>
			
			<footer id="footer" class="background-color-quaternary border-top-0 mt-0">
				<div class="container">
				<div class="row">					
					<div class="col-lg-9">
						<div class="row justify-content-between">
							<div class="col-lg-12"><h2>Contact Us</h2></div>
							<div class="col-lg-4 col-md-4 mb-4 mb-lg-0">
								<h5 class="text-color-light mb-3">Ankur Palmia</h5>
								<p>B.Tech (Information Technology)<br>MSIT (GGSIPU)</p>
							
								<span class="d-block text-5 mb-4">
									<a href="mailto:ankur.palmia@gmail.com" class="text-1">Email: ankur.palmia@gmail.com</a>
								</span>
								<ul class="social-icons social-icons-transparent social-icons-icon-light">
									<li class="social-icons-facebook"><a href="http://www.facebook.com/ankur.palmia" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
									<li class="social-icons-instagram"><a href="https://www.instagram.com/ankurpalmia/" target="_blank" title="Instagram"><i class="fab fa-instagram"></i></a></li>
									<li class="social-icons-linkedin"><a href="https://www.linkedin.com/in/ankur-palmia-9a44b8100/" target="_blank" title="Linkedin"><i class="fab fa-linkedin-in"></i></a></li>
								</ul>
							</div>
							<div class="col-lg-4 mb-4 col-md-4 mb-lg-0">
								<h5 class="text-color-light mb-3">Chetanya Mahajan</h5>
								<p>B.Tech (Computer Science)<br>MSIT (GGSIPU)</p>
							
								<span class="d-block text-5 mb-4">
									<a href="mailto:chetanyamahajan98.com" class="text-1">Email: chetanyamahajan98@gmail.com</a>
								</span>
								<ul class="social-icons social-icons-transparent social-icons-icon-light">
									<li class="social-icons-facebook"><a href="http://www.facebook.com/chetanya.mahajan" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
									<li class="social-icons-instagram"><a href="https://www.instagram.com/mahajan_chetanya/" target="_blank" title="Instagram"><i class="fab fa-instagram"></i></a></li>
									<li class="social-icons-linkedin"><a href="https://www.linkedin.com/in/" target="_blank" title="Linkedin"><i class="fab fa-linkedin-in"></i></a></li>
								</ul>
							</div>
							<div class="col-lg-4 col-md-4 mb-4 mb-lg-0">
								<h5 class="text-color-light mb-3">Jatin Sharma</h5>
								<p>B.Tech (Information Technology)<br>MSIT (GGSIPU)</p>
							
								<span class="d-block text-5 mb-4">
									<a href="mailto:gmjjatin@gmail.com" class="text-1">Email: gmjjatin@gmail.com</a>
								</span>
								<ul class="social-icons social-icons-transparent social-icons-icon-light">
									<li class="social-icons-facebook"><a href="http://www.facebook.com/gmjjatin" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
									<li class="social-icons-instagram"><a href="https://www.instagram.com/gmjjatin/" target="_blank" title="Instagram"><i class="fab fa-instagram"></i></a></li>
								<li class="social-icons-linkedin"><a href="https://www.linkedin.com/in/" target="_blank" title="Linkedin"><i class="fab fa-linkedin-in"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
					<div class="row justify-content-between">
						<div class="col-lg-12">
							<h4>Mentor</h4>
						</div>
						<div class="col-lg-12 col-md-12 mb-4 mb-lg-0">
							<h5 class="text-color-light mb-3">Ashish Singh</h5>
							<p>OSAHUB Technologies</p>
							
							<span class="d-block text-5 mb-4">
								<a href="mailto:ashish@osahub.com" class="text-1">Email: ashish@osahub.com</a>
							</span>
							<ul class="social-icons social-icons-transparent social-icons-icon-light">
								<li class="social-icons-website"><a href="http://www.osahub.com" target="_blank" title="Osahub"><i class="fab fa-internet-explorer"> www.osahub.com</i></a></li>
								</ul>
						</div>
						</div>
					</div>
				</div>						
				<div class="footer-copyright background-color-quaternary border-top-0">
					<div class="container">
						<div class="row">
							<div class="col">
								<p class="text-center">� Copyright 2018. All Rights Reserved.</p>
							</div>
						</div>
					</div>
				</div>
				</div>
			</footer>
		</div>

		<!-- Vendor -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/jquery.appear/jquery.appear.min.js"></script>
		<script src="vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="vendor/jquery-cookie/jquery-cookie.min.js"></script>
		<script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/common/common.min.js"></script>
		<script src="vendor/jquery.validation/jquery.validation.min.js"></script>
		<script src="vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
		<script src="vendor/jquery.gmap/jquery.gmap.min.js"></script>
		<script src="vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
		<script src="vendor/isotope/jquery.isotope.min.js"></script>
		<script src="vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
		<script src="vendor/vide/vide.min.js"></script>
		<script src="vendor/jquery.countdown/jquery.countdown.min.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="js/theme.js"></script>
		
		<!-- Current Page Vendor and Views -->
		<script src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
		<script src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

		<!-- Demo -->
		<script src="js/demos/demo-education.js"></script>
		
		<!-- Theme Custom -->
		<script src="js/custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="js/theme.init.js"></script>




		<!-- Google Analytics: Change UA-XXXXX-X to be your site's ID. Go to http://www.google.com/analytics/ for more information.
		<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
			ga('create', 'UA-12345678-1', 'auto');
			ga('send', 'pageview');
		</script>
		 -->



	</body>
</html>

<%
session.setAttribute("uemail", uemail);
		}
%>
	