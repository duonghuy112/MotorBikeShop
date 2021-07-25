<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/login-register.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:19 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - Login | Register</title>
<meta name="robots" content="index, follow" />
<meta name="description"
	content="Tromic car accessories bootstrap 5 template is an awesome website template for any modern car accessories shop.">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${url}/assets/images/favicon.ico" />

<!-- CSS
    ============================================ -->

<!-- Vendor CSS (Contain Bootstrap, Icon Fonts) -->
<!-- <link rel="stylesheet" href="${url}/assets/css/vendor/font-awesome.min.css"/> -->
<!-- <link rel="stylesheet" href="${url}/assets/css/vendor/Pe-icon-7-stroke.css"/> -->

<!-- Plugin CSS (Global Plugins Files) -->
<!-- <link rel="stylesheet" href="${url}/assets/css/plugins/animate.min.css"> -->
<!-- <link rel="stylesheet" href="${url}/assets/css/plugins/jquery-ui.min.css"> -->
<!-- <link rel="stylesheet" href="${url}/assets/css/plugins/swiper-bundle.min.css"> -->
<!-- <link rel="stylesheet" href="${url}/assets/css/plugins/nice-select.css"> -->
<!-- <link rel="stylesheet" href="${url}/assets/css/plugins/magnific-popup.min.css"/> -->
<!-- <link rel="stylesheet" href="${url}/assets/css/plugins/ion.rangeSlider.min.css"/> -->

<!-- Minify Version -->
<link rel="stylesheet" href="${url}/assets/css/vendor/vendor.min.css">
<link rel="stylesheet" href="${url}/assets/css/plugins/plugins.min.css">

<!-- Style CSS -->
<!-- <link rel="stylesheet" href="${url}/assets/css/style.css"> -->
<link rel="stylesheet" href="${url}/assets/css/style.min.css">

</head>

<body>
	<div class="preloader-activate preloader-active open_tm_preloader">
		<div class="preloader-area-wrap">
			<div
				class="spinner d-flex justify-content-center align-items-center h-100">
				<div class="bounce1"></div>
				<div class="bounce2"></div>
				<div class="bounce3"></div>
			</div>
		</div>
	</div>
	<div class="main-wrapper">

		<!-- Begin Main Header Area -->
		<%@include file="components/header.jsp"%>

		<!-- Main Header Area End Here -->

		<!-- Begin Main Content Area -->
		<main class="main-content">
			<div class="breadcrumb-area breadcrumb-height"
				data-bg-image="${url}/assets/images/breadcrumb/bg/1-1-1920x400.jpg">
				<div class="container h-100">
					<div class="row h-100">
						<div class="col-lg-12">
							<div class="breadcrumb-item text-night-rider">
								<h2 class="breadcrumb-heading">Login Page</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home/</a></li>
									<li>Login</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="background-img">
				<div class="inner-bg">
					<img
						src="${url}/assets/images/background-img/inner-bg/1-1-496x566.png"
						alt="Inner Background" />
				</div>
				<div class="login-register-area section-space-y-axis-100">
					<div class="container">
						<div class="row">
							<div class="col-lg-6" style="float: none; margin: auto;">
								<form action="Login" method="POST">
									<div class="login-form">
										<h4 class="login-title">Login</h4>
										<div class="row">
											<div class="col-lg-12">
												<c:forTokens items="${err}-${notActive}" delims="-" var="e">
													<label style="color: red; font-size: 16px">${e}</label>
												</c:forTokens>
												<label></label> <label>User Name*</label> <input type="text"
													placeholder="User Name" name="username" value="${username}">
											</div>
											<div class="col-lg-12">
												<label>Password*</label> <input type="password"
													placeholder="Password" name="password" value="${password}">
											</div>
											<div class="col-md-8">
												<div class="check-box">
													<input type="checkbox" id="remember_me" name="remember">
													<label for="remember_me">Remember me</label>
												</div>
											</div>
											<div class="col-md-4 pt-1 mt-md-0">
												<div class="forgotton-password_info">
													<a href="${pageContext.request.contextPath }/ForgotPassword"> Forgotten password?</a>
												</div>
											</div>
											<div class="col-lg-12 pt-5">
												<button class="btn btn-custom-size lg-size btn-primary">Login</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-- Main Content Area End Here -->

		<!-- Begin Footer Area -->
		<%@include file="components/footer.jsp"%>
		<!-- Footer Area End Here -->

		<!-- Begin Scroll To Top -->
		<a class="scroll-to-top" href="#"> <i class="fa fa-chevron-up"></i>
		</a>
		<!-- Scroll To Top End Here -->

	</div>

	<!-- Global Vendor, plugins JS -->

	<!-- JS Files
    ============================================ -->
	<!-- Global Vendor, plugins JS -->

	<!-- Vendor JS -->
	<!-- <script src="${url}/assets/js/vendor/bootstrap.bundle.min.js"></script> -->
	<!-- <script src="${url}/assets/js/vendor/jquery-3.6.0.min.js"></script> -->
	<!-- <script src="${url}/assets/js/vendor/jquery-migrate-3.3.2.min.js"></script> -->
	<!-- <script src="${url}/assets/js/vendor/modernizr-3.11.2.min.js"></script> -->

	<!--Plugins JS-->
	<!-- <script src="${url}/assets/js/plugins/wow.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/jquery-ui.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/swiper-bundle.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/jquery.nice-select.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/parallax.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/jquery.magnific-popup.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/tippy.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/ion.rangeSlider.min.js"></script> -->
	<!-- <script src="${url}/assets/js/plugins/mailchimp-ajax.js"></script> -->

	<!-- Minify Version -->
	<script src="${url}/assets/js/vendor.min.js"></script>
	<script src="${url}/assets/js/plugins.min.js"></script>
	<script src="${url}/assets/js/main.min.js"></script>
</body>



</html>