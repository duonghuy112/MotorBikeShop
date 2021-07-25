<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/about.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:21 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - About</title>
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
								<h2 class="breadcrumb-heading">About Us</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home /</a></li>
									<li>About Us</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="about-banner different-bg-position section-space-y-axis-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="about-banner-content text-center section-space-bottom-95">
								<div class="section-title">
									<span class="about-sub-title text-primary">Our Story</span>
									<h2 class="about-title mb-5">Tromic- MotorBike's
										Accessories & Parts</h2>
									<p class="short-desc mb-0">Tromic was founded in 2021 by a
										core team of FPT's student whose sole goal was to bring the
										best possible shopping experience to any enthusiast who visits
										us in online shop. Over the next semester, we continuously
										smashed records, raked in awards, and, most importantly,
										helped keep hundreds of thousands of new and experienced
										riders safe and sound. Now, as part of the FPT Family of
										Brands, Tromic continues its mission to serve the rider, fuel
										the industry, and inspire the community. At Tromic, we know
										that a large and rider-specific product selection is a
										commodity within the world of motorcycle gear and parts web
										sites. There is a lot of competition out there and to an
										extent we all have overlapping product selections. We hope our
										straightforward and fair customer approach differentiates us
										from the pack and speaks to how serious we are about putting
										our customer's satisfaction as our number one priority. For
										us, the customer always comes first and we do our darndest to
										make sure that each customer has an experience which is
										exemplary of our brand. We hope that you enjoy shopping with
										us now and in the future.</p>
								</div>
							</div>
							<div class="about-banner-img row">
								<div class="col-lg-4">
									<div class="single-img img-hover-effect">
										<img class="img-full"
											src="${url}/assets/images/about/banner/1-1-400x500.jpg"
											alt="About Banner">
									</div>
								</div>
								<div class="col-lg-4 section-space-top-100">
									<div class="single-img img-hover-effect">
										<img class="img-full"
											src="${url}/assets/images/about/banner/1-2-400x500.jpg"
											alt="About Banner">
									</div>
								</div>
								<div class="col-lg-4 section-space-top-100 pt-lg-0">
									<div class="single-img img-hover-effect">
										<img class="img-full"
											src="${url}/assets/images/about/banner/1-3-400x500.jpg"
											alt="About Banner">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Begin Testimonial Area -->
			<!-- Testimonial Area End Here -->

			<div class="team-member section-space-y-axis-100">
				<div class="container">
					<div class="section-title text-center pb-55">
						<span class="about-sub-title text-primary">Our expert</span>
						<h2 class="about-title mb-0">Team Member</h2>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="swiper-container team-member-slider">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="team-member-item img-gradient-effect">
											<div class="team-member-img">
												<a href="#"> <img class="img-full"
													src="${url}/assets/images/about/team/1-1-400x442.jpg"
													alt="Team Member">
												</a>
											</div>
											<div class="team-member-content">
												<h2 class="title mb-0">Nguyen Duong Huy</h2>
												<span class="occupation">Team Leader</span>
												<div class="social-link with-border pt-2">
													<ul>
														<li><a href="#"> <i class="fa fa-pinterest-p"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-twitter"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-tumblr"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-dribbble"></i>
														</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="team-member-item img-gradient-effect">
											<div class="team-member-img">
												<a href="#"> <img class="img-full"
													src="${url}/assets/images/about/team/1-2-400x442.jpg"
													alt="Team Member">
												</a>
											</div>
											<div class="team-member-content">
												<h2 class="title mb-0">Dang Phuc Dang Khoa</h2>
												<span class="occupation">Team member</span>
												<div class="social-link with-border pt-2">
													<ul>
														<li><a href="#"> <i class="fa fa-pinterest-p"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-twitter"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-tumblr"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-dribbble"></i>
														</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="team-member-item img-gradient-effect">
											<div class="team-member-img">
												<a href="#"> <img class="img-full"
													src="${url}/assets/images/about/team/1-3-400x442.jpg"
													alt="Team Member">
												</a>
											</div>
											<div class="team-member-content">
												<h2 class="title mb-0">Nguyen Van Tuan</h2>
												<span class="occupation">Team member</span>
												<div class="social-link with-border pt-2">
													<ul>
														<li><a href="#"> <i class="fa fa-pinterest-p"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-twitter"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-tumblr"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-dribbble"></i>
														</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="swiper-slide">
										<div class="team-member-item img-gradient-effect">
											<div class="team-member-img">
												<a href="#"> <img class="img-full"
													src="${url}/assets/images/about/team/1-4-400x442.jpg"
													alt="Team Member">
												</a>
											</div>
											<div class="team-member-content">
												<h2 class="title mb-0">Le Dinh Nhan</h2>
												<span class="occupation">Team member</span>
												<div class="social-link with-border pt-2">
													<ul>
														<li><a href="#"> <i class="fa fa-pinterest-p"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-twitter"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-tumblr"></i>
														</a></li>
														<li><a href="#"> <i class="fa fa-dribbble"></i>
														</a></li>
													</ul>
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

			<!-- Begin Banner Area -->
			<!-- Banner Area End Here -->

			<!-- Begin Brand Area -->
			<!-- Brand Area End Here -->

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


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/about.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:24 GMT -->

</html>