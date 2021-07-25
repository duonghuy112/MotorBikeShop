<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/blog-listview.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:28 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - Blog List View</title>
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
								<h2 class="breadcrumb-heading">Blog</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home/</a></li>
									<li>Blog List View</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="blog-area section-space-y-axis-100">
				<div class="container">
					<div class="row gx-md-8">
						<div class="col-lg-4 order-lg-1 order-2 pt-10 pt-lg-0">
							<div class="sidebar-area">
								<div class="widgets-searchbox widgets-area py-6 mb-9">
									<form id="widgets-searchbox" action="#">
										<input class="input-field" type="text" placeholder="Search">
										<button class="widgets-searchbox-btn" type="submit">
											<i class="pe-7s-search"></i>
										</button>
									</form>
								</div>
								<div class="widgets-area mb-9">
									<h2 class="widgets-title mb-5">Recent Post</h2>
									<div class="widgets-item">
										<div class="swiper-container widgets-list-slider">
											<div class="swiper-wrapper">
												<div class="swiper-slide">
													<div class="blog-list-item">
														<div class="blog-list-img">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/small-size/1-1-98x75.jpg"
																alt="Blog Images">
															</a>
														</div>
														<div class="blog-list-content">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="title mb-0">
																<a href="blog-detail.html">Lorem ipsum dolor sit
																	amet consecte</a>
															</h2>
														</div>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="blog-list-item">
														<div class="blog-list-img">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/small-size/1-3-98x75.jpg"
																alt="Blog Images">
															</a>
														</div>
														<div class="blog-list-content">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="title mb-0">
																<a href="blog-detail.html">Lorem ipsum dolor sit
																	amet consecte</a>
															</h2>
														</div>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="blog-list-item">
														<div class="blog-list-img">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/small-size/1-2-98x75.jpg"
																alt="Blog Images">
															</a>
														</div>
														<div class="blog-list-content">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="title mb-0">
																<a href="blog-detail.html">Lorem ipsum dolor sit
																	amet consecte</a>
															</h2>
														</div>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="blog-list-item">
														<div class="blog-list-img">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/small-size/1-4-98x75.jpg"
																alt="Blog Images">
															</a>
														</div>
														<div class="blog-list-content">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="title mb-0">
																<a href="blog-detail.html">Lorem ipsum dolor sit
																	amet consecte</a>
															</h2>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="widgets-area mb-9">
									<h2 class="widgets-title mb-5">Archives</h2>
									<div class="widgets-item">
										<ul class="widgets-category widgets-archives with-border">
											<li><a href="blog-detail.html"> January 2018 </a></li>
											<li><a href="blog-detail.html"> February 2019 </a></li>
											<li><a href="blog-detail.html"> March 2020 </a></li>
											<li><a href="blog-detail.html"> April 2021 </a></li>
										</ul>
									</div>
								</div>
								<div class="widgets-area mb-9">
									<h2 class="widgets-title mb-5">Subscribe</h2>
									<div class="widgets-item">
										<form class="newsletter-form widgets-newsletter wide"
											action="#">
											<input class="input-field" type="email" autocomplete="off"
												placeholder="Enter Your Email">
											<div class="button-wrap pt-4">
												<button class="btn btn-custom-size btn-primary">Subscribe</button>
											</div>
										</form>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-8 order-lg-2 order-1">
							<div class="blog-item-wrap row gx-md-8">
								<div class="col-12">
									<div class="blog-item row gx-md-8">
										<div class="col-lg-6">
											<div class="blog-img img-hover-effect">
												<a class="img-zoom-effect" href="blog-detail.html"> <img
													class="img-full"
													src="${url}/assets/images/blog/medium-size/1-1-400x250.jpg"
													alt="Blog Image">
												</a>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="blog-content pt-5 pt-lg-0">
												<div class="blog-meta text-paynes-grey pb-1">
													<ul>
														<li class="author"><a href="#"> <i
																class="pe-7s-user"></i> BY: ADMIN
														</a></li>
														<li class="date"><i class="pe-7s-date"></i> 27 FEB
															2021</li>
													</ul>
												</div>
												<h2 class="mb-3">
													<a class="title" href="blog-detail.html">Blog Image
														Post</a>
												</h2>
												<p class="short-desc mb-7">Lorem ipsum dolor sit amet,
													consectetur adipisicing elitsed do eiusmod tempor
													incididunt ut labore et dolore magna ali Ut enim ad minim
													veniam quis nostrud</p>
												<div class="button-wrap">
													<a class="btn btn-custom-size btn-matterhorn"
														href="blog-detail.html">Read More</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 pt-8">
									<div class="swiper-container single-blog-slider">
										<div class="swiper-wrapper">
											<div class="swiper-slide">
												<div class="blog-item row">
													<div class="col-lg-6">
														<div class="blog-img img-hover-effect">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/medium-size/1-3-400x250.jpg"
																alt="Blog Image">
															</a>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="blog-content pt-5 pt-lg-0">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="mb-3">
																<a class="title" href="blog-detail.html">Blog
																	Gallery Post</a>
															</h2>
															<p class="short-desc mb-7">Lorem ipsum dolor sit
																amet, consectetur adipisicing elitsed do eiusmod tempor
																incididunt ut labore et dolore magna ali Ut enim ad
																minim veniam quis nostrud</p>
															<div class="button-wrap">
																<a class="btn btn-custom-size btn-matterhorn"
																	href="blog-detail.html">Read More</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="swiper-slide">
												<div class="blog-item row">
													<div class="col-lg-6">
														<div class="blog-img img-hover-effect">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/medium-size/1-2-400x250.jpg"
																alt="Blog Image">
															</a>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="blog-content pt-5 pt-lg-0">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="mb-3">
																<a class="title" href="blog-detail.html">Blog Second
																	Gallery Post</a>
															</h2>
															<p class="short-desc mb-7">Lorem ipsum dolor sit
																amet, consectetur adipisicing elitsed do eiusmod tempor
																incididunt ut labore et dolore magna ali Ut enim ad
																minim veniam quis nostrud</p>
															<div class="button-wrap">
																<a class="btn btn-custom-size btn-matterhorn"
																	href="blog-detail.html">Read More</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="swiper-slide">
												<div class="blog-item row">
													<div class="col-lg-6">
														<div class="blog-img img-hover-effect">
															<a class="img-zoom-effect" href="blog-detail.html"> <img
																class="img-full"
																src="${url}/assets/images/blog/medium-size/1-1-400x250.jpg"
																alt="Blog Image">
															</a>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="blog-content pt-5 pt-lg-0">
															<div class="blog-meta text-paynes-grey pb-1">
																<ul>
																	<li class="author"><a href="#"> <i
																			class="pe-7s-user"></i> BY: ADMIN
																	</a></li>
																	<li class="date"><i class="pe-7s-date"></i> 27 FEB
																		2021</li>
																</ul>
															</div>
															<h2 class="mb-3">
																<a class="title" href="blog-detail.html">Blog Third
																	Gallery Post</a>
															</h2>
															<p class="short-desc mb-7">Lorem ipsum dolor sit
																amet, consectetur adipisicing elitsed do eiusmod tempor
																incididunt ut labore et dolore magna ali Ut enim ad
																minim veniam quis nostrud</p>
															<div class="button-wrap">
																<a class="btn btn-custom-size btn-matterhorn"
																	href="blog-detail.html">Read More</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 pt-8">
									<div class="blog-item row">
										<div class="col-lg-6">
											<div class="ratio ratio-16x9">
												<iframe allow="autoplay"
													src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/users/182537870&amp;color=%23ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;show_teaser=true&amp;visual=true"></iframe>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="blog-content pt-5 pt-lg-0">
												<div class="blog-meta text-paynes-grey pb-1">
													<ul>
														<li class="author"><a href="#"> <i
																class="pe-7s-user"></i> BY: ADMIN
														</a></li>
														<li class="date"><i class="pe-7s-date"></i> 27 FEB
															2021</li>
													</ul>
												</div>
												<h2 class="mb-3">
													<a class="title" href="blog-detail.html">Blog Audio
														Post</a>
												</h2>
												<p class="short-desc mb-7">Lorem ipsum dolor sit amet,
													consectetur adipisicing elitsed do eiusmod tempor
													incididunt ut labore et dolore magna ali Ut enim ad minim
													veniam quis nostrud</p>
												<div class="button-wrap">
													<a class="btn btn-custom-size btn-matterhorn"
														href="blog-detail.html">Read More</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 pt-8">
									<div class="blog-item row">
										<div class="col-lg-6">
											<div class="ratio ratio-16x9">
												<iframe src="https://www.youtube.com/embed/fkoEj95puX0"
													allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
													allowfullscreen> </iframe>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="blog-content pt-5 pt-lg-0">
												<div class="blog-meta text-paynes-grey pb-1">
													<ul>
														<li class="author"><a href="#"> <i
																class="pe-7s-user"></i> BY: ADMIN
														</a></li>
														<li class="date"><i class="pe-7s-date"></i> 27 FEB
															2021</li>
													</ul>
												</div>
												<h2 class="mb-3">
													<a class="title" href="blog-detail.html">Blog Video
														Post</a>
												</h2>
												<p class="short-desc mb-7">Lorem ipsum dolor sit amet,
													consectetur adipisicing elitsed do eiusmod tempor
													incididunt ut labore et dolore magna ali Ut enim ad minim
													veniam quis nostrud</p>
												<div class="button-wrap">
													<a class="btn btn-custom-size btn-matterhorn"
														href="blog-detail.html">Read More</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 pt-8">
									<div class="blog-item row">
										<div class="col-lg-6">
											<div class="blog-img img-hover-effect">
												<a class="img-zoom-effect" href="blog-detail.html"> <img
													class="img-full"
													src="${url}/assets/images/blog/medium-size/1-2-400x250.jpg"
													alt="Blog Image">
												</a>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="blog-content pt-5 pt-lg-0">
												<div class="blog-meta text-paynes-grey pb-1">
													<ul>
														<li class="author"><a href="#"> <i
																class="pe-7s-user"></i> BY: ADMIN
														</a></li>
														<li class="date"><i class="pe-7s-date"></i> 27 FEB
															2021</li>
													</ul>
												</div>
												<h2 class="mb-3">
													<a class="title" href="blog.html">Lorem ipsum dolor sit
														ametco</a>
												</h2>
												<p class="short-desc mb-7">Lorem ipsum dolor sit amet,
													consectetur adipisicing elitsed do eiusmod tempor
													incididunt ut labore et dolore magna ali Ut enim ad minim
													veniam quis nostrud</p>
												<div class="button-wrap">
													<a class="btn btn-custom-size btn-matterhorn"
														href="blog.html">Read More</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 pt-8">
									<div class="blog-item row">
										<div class="col-lg-6">
											<div class="blog-img img-hover-effect">
												<a class="img-zoom-effect" href="blog-detail.html"> <img
													class="img-full"
													src="${url}/assets/images/blog/medium-size/1-4-400x250.jpg"
													alt="Blog Image">
												</a>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="blog-content pt-5 pt-lg-0">
												<div class="blog-meta text-paynes-grey pb-1">
													<ul>
														<li class="author"><a href="#"> <i
																class="pe-7s-user"></i> BY: ADMIN
														</a></li>
														<li class="date"><i class="pe-7s-date"></i> 27 FEB
															2021</li>
													</ul>
												</div>
												<h2 class="mb-3">
													<a class="title" href="blog.html">Lorem ipsum dolor sit
														ametco</a>
												</h2>
												<p class="short-desc mb-7">Lorem ipsum dolor sit amet,
													consectetur adipisicing elitsed do eiusmod tempor
													incididunt ut labore et dolore magna ali Ut enim ad minim
													veniam quis nostrud</p>
												<div class="button-wrap">
													<a class="btn btn-custom-size btn-matterhorn"
														href="blog.html">Read More</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 pt-8">
									<div class="blog-item row">
										<div class="col-lg-6">
											<div class="blog-img img-hover-effect">
												<a class="img-zoom-effect" href="blog-detail.html"> <img
													class="img-full"
													src="${url}/assets/images/blog/medium-size/1-5-400x250.jpg"
													alt="Blog Image">
												</a>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="blog-content pt-5 pt-lg-0">
												<div class="blog-meta text-paynes-grey pb-1">
													<ul>
														<li class="author"><a href="#"> <i
																class="pe-7s-user"></i> BY: ADMIN
														</a></li>
														<li class="date"><i class="pe-7s-date"></i> 27 FEB
															2021</li>
													</ul>
												</div>
												<h2 class="mb-3">
													<a class="title" href="blog.html">Lorem ipsum dolor sit
														ametco</a>
												</h2>
												<p class="short-desc mb-7">Lorem ipsum dolor sit amet,
													consectetur adipisicing elitsed do eiusmod tempor
													incididunt ut labore et dolore magna ali Ut enim ad minim
													veniam quis nostrud</p>
												<div class="button-wrap">
													<a class="btn btn-custom-size btn-matterhorn"
														href="blog.html">Read More</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="pagination-area pt-10">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-end">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous">&laquo;</a></li>
												<li class="page-item active"><a class="page-link"
													href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next">&raquo;</a></li>
											</ul>
										</nav>
									</div>
								</div>
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

	<!--Main JS (Common Activation Codes)-->
	<!-- <script src="${url}/assets/js/main.js"></script> -->
	<script src="${url}/assets/js/main.min.js"></script>

</body>


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/blog-listview.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:28 GMT -->

</html>