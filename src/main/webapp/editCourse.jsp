<%@page import="tut.service.OfyService"%>
<%@page import="tut.entity.CourseDetailsEntity"%>
<%@page import="com.googlecode.objectify.impl.Session"%>
<%

if(session.getAttribute("uemail") == null){
	response.sendRedirect("loginerror.html");
}
	else
	{
		String uEmail=(String)session.getAttribute("uemail");
		String cId=(String)request.getParameter("courseId");
		CourseDetailsEntity cde=OfyService.ofy().load().type(CourseDetailsEntity.class).id(cId).now();
	
		%>
		
		<!DOCTYPE html>
<html>
	<head>

		<!-- Basic -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">	

		<title>TutPoint - Add a Course</title>	

			<meta name="keywords" content="tuition" />
		<meta name="description" content="tution">
		<meta name="author" content="cv-jatinsharma.appspot.com">

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
														<a class="nav-link active" href="index.jsp">
															Home
														</a>
													</li>
													<li>
														<a class="nav-link" href="index.jsp#seecourses">
															Courses
														</a>
													</li>
													<li>
														<a class="nav-link" href="dashboard.jsp">
															Dashboard
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
			</div>
					<h2>Edit Course</h2>
				</div>
				<div class="section background-color-tertiary border-0 my-0" style="padding-top:40px;">

					<div class="container">
					<form action="editCourse" method="">
						<div class="row pt-1 pb-4 mb-3">
							<div class="col">
					
						<div class="row padtop">
							<div class="col-md-2"><h5>Select Type/Level of Course:</h5></div>
								<div class="col-md-5">	
									<select name="course-type" value="<%=cde.courseType%>">
										<option value="" selected disabled hidden>Choose here</option>
										<option><h5>School</h5></option>
										<option><h5>Professional</h5></option>
										<option><h5>CoCurricular</h5></option>
									</select>
								</div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Subject:</h5>
								</div>
								<div class="col-md-5"><input type="text" maxlength=40 name="course-subject" value="<%=cde.subject%>">
								</div>
							</div>
								
							<div class="row padtop">
								<div class="col-md-2"><h5>Select Class:</h5></div>
								<div class="col-md-5"><input type="text" maxlength=30 placeholder="eg: 9,10 or college" name="classLevel" value="<%=cde.classlvl%>"></div>
							</div>
							<%if("Centre".equals(cde.tutType)){ %>
							<div class="row padtop">
								<div class="col-md-2"><h5>Tuition Type:</h5></div>
								<div class="col-md-5">
									<input type="radio" name="tutType" value="Centre" checked> Tuition Centre &nbsp; &nbsp;
									<input type="radio" name="tutType" value="Home"> Home Tuition<br>
								</div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Name of Tuition Centre:</h5></div>
								<div class="col-md-5"><input type="text" maxlength=30 placeholder="*for Tuition Centre only" name="course-centre-name" value="<%=cde.tutName%>"></div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Address of Tuition Centre:</h5></div>
								<div class="col-md-5"><input type="text" maxlength=100 placeholder="*for Tuition Centre only" name="course-centre-address" value="<%=cde.tutAdd%>"></div>
							</div>
							<%} else { %>
							<div class="row padtop">
								<div class="col-md-2"><h5>Tuition Type:</h5></div>
								<div class="col-md-5">
									<input type="radio" name="tutType" value="Centre"> Tuition Centre &nbsp; &nbsp;
									<input type="radio" name="tutType" value="Home" checked> Home Tuition<br>
								</div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Name of Tuition Centre:</h5></div>
								<div class="col-md-5"><input type="text" maxlength=30 placeholder="*for Tuition Centre only" name="course-centre-name"></div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Address of Tuition Centre:</h5></div>
								<div class="col-md-5"><input type="text" maxlength=100 placeholder="*for Tuition Centre only" name="course-centre-address"></div>
							</div>
							<%} %>
							<div class="row padtop">
								<div class="col-md-2"><h5>Preferred Fees:</h5></div>
								<div class="col-md-5"><input type="text" maxlength=100  name="course-fees" value="<%=cde.courseFees%>"></div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Fees negotiable:</h5></div>
								<div class="col-md-5">
									<input type="radio" name="fees-neg" value="yes" checked> Yes &nbsp; &nbsp;
									<input type="radio" name="fees-neg" value="no"> No<br>
								</div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Trial Classes:</h5></div>
								<div class="col-md-5">
									<input type="radio" name="trial" value="yes" checked> Yes &nbsp; &nbsp;
									<input type="radio" name="trial" value="no"> No<br>
								</div>
							</div>
							<div class="row padtop">
								<div class="col-md-2"><h5>Experience:</h5></div>
								<div class="col-md-5"><input type="number" maxlength=2 name="course-exp" value="<%=cde.experience%>"> &nbsp; Years</div>
							</div>
							<input type="hidden" name="courseId" value="<%=cde.courseId%>">
							<div class="row padtop">
								<div class="col-md-2">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

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
	}
%>
		