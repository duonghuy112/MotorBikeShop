<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - Contact</title>
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
								<h2 class="breadcrumb-heading">Contact Us</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home/</a></li>
									<li>Contact</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Begin Shipping Area -->
			<div class="shipping-area shipping-style-2 section-space-y-axis-100">
				<div class="container">
					<div class="row shipping-wrap py-5 py-xl-0">
						<div class="col-lg-4 col-sm-6">
							<div class="shipping-item">
								<div class="shipping-img">
									<img src="${url}/assets/images/shipping/icon/phone.png"
										alt="Shipping Icon">
								</div>
								<div class="shipping-content">
									<h2 class="title">Phone & Email</h2>
									<p class="short-desc mb-0">0906403966</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 pt-4 pt-xl-0">
							<div class="shipping-item">
								<div class="shipping-img">
									<img src="${url}/assets/images/shipping/icon/message.png"
										alt="Shipping Icon">
								</div>
								<div class="shipping-content">
									<h2 class="title">Email</h2>
									<p class="short-desc mb-0">duoonghuy1123@gmail.com</p>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-sm-6 pt-4 pt-xl-0">
							<div class="shipping-item">
								<div class="shipping-img">
									<img src="${url}/assets/images/shipping/icon/home.png"
										alt="Shipping Icon">
								</div>
								<div class="shipping-content">
									<h2 class="title">Address:</h2>
									<p class="short-desc mb-0">FPT City, Hoa Hai, Ngu Hanh Son,</p>
									<p class="short-desc mb-0">Da Nang, Viet Nam</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Shipping Area End Here -->

			<div class="contact-form-area section-space-bottom-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="contact-form-wrap">
								<div class="contact-img">
									<img src="${url}/assets/images/contact/1-1-520x278.png"
										alt="Contact Images">
								</div>
								<form id="contact-form" class="contact-form"
									action="Contact"
									method="POST">
									<h4 class="contact-form-title mb-7">Send Us a Review</h4>
									<h6 class="mb-7" style="color: #ee3231">${userErr}</h6>
									<div class="group-input">
										<div class="form-field me-xl-6">
											<input type="text" name="email" id="con_name"
												placeholder="Email*" class="input-field">
										</div>
										<div class="form-field mt-6 mt-xl-0">
											<input type="password" name="password" id="con_email"
												placeholder="Password*" class="input-field">
										</div>
									</div>
									<div class="form-field mt-6">
										<textarea name="content" id="con_message" placeholder="Review"
											class="textarea-field"></textarea>
									</div>
									<div class="button-wrap mt-8">
										<button type="submit"
											class="btn btn btn-custom-size lg-size btn-primary btn-secondary-hover rounded-0">Post Review</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="contact-with-map">
				<div class="contact-map">
					<iframe class="contact-map-size"
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d245368.26104938771!2d107.93803986190554!3d16.071763492763544!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0x1df0cb4b86727e06!2zxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1622364658180!5m2!1svi!2s"
						allowfullscreen="" loading="lazy"></iframe>
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

	<!--Main JS (Common Activation Codes)-->
	<!-- <script src="${url}/assets/js/main.js"></script> -->
	<script src="${url}/assets/js/main.min.js"></script>

</body>


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:35 GMT -->

</html>