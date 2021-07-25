<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>
<!DOCTYPE html>
<html lang="zxx">
<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:23:42 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Tromic - MotorBike's Accessories Shop</title>
<meta name="robots" content="index, follow" />
<meta name="description"
	content="Tromic car accessories bootstrap 5 template is an awesome website template for any modern car accessories shop." />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<link rel="stylesheet" href="${url}/assets/css/vendor/vendor.min.css" />
<link rel="stylesheet" href="${url}/assets/css/plugins/plugins.min.css" />

<!-- Style CSS -->
<!-- <link rel="stylesheet" href="${url}/assets/css/style.css"> -->
<link rel="stylesheet" href="${url}/assets/css/style.min.css" />
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

		<!-- Begin Slider Area -->
		<div class="slider-area">
			<!-- Main Slider -->
			<div class="swiper-container main-slider swiper-arrow with-bg_white">
				<div class="swiper-wrapper">
					<div class="swiper-slide animation-style-01">
						<div class="slide-inner bg-height"
							data-bg-image="${url}/assets/images/slider/bg/1-1.jpg">
							<div class="container">
								<div class="slide-content text-white">
									<h3 class="sub-title"></h3>
									<h2 class="title mb-3">Parts & repair</h2>
									<p class="short-desc different-width mb-10">Exclusive
										Exchange Offer & 30% Off In This Week</p>
									<div class="button-wrap">
										<a class="btn btn-custom-size lg-size btn-primary"
											href="${pageContext.request.contextPath }/Shop">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-slide animation-style-01">
						<div class="slide-inner bg-height"
							data-bg-image="${url}/assets/images/slider/bg/1-2.jpg">
							<div class="container">
								<div class="slide-content text-white">
									<h3 class="sub-title">Collection of</h3>
									<h2 class="title mb-3">New Arrivals</h2>
									<p class="short-desc different-width mb-10">Upgrade your
										gear from head to toe</p>
									<div class="button-wrap">
										<a class="btn btn-custom-size lg-size btn-primary"
											href="${pageContext.request.contextPath }/Shop">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-slide animation-style-01">
						<div class="slide-inner bg-height"
							data-bg-image="${url}/assets/images/slider/bg/1-3.jpg">
							<div class="container">
								<div class="slide-content text-white">
									<h3 class="sub-title">More Experience</h3>
									<h2 class="title mb-3">Rider Guide</h2>
									<p class="short-desc different-width mb-10">Kickstart your
										Motorcycle journey</p>
									<div class="button-wrap">
										<a class="btn btn-custom-size lg-size btn-primary"
											href="${pageContext.request.contextPath }/Shop">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-slide animation-style-01">
						<div class="slide-inner bg-height"
							data-bg-image="${url}/assets/images/slider/bg/1-4.jpg">
							<div class="container">
								<div class="slide-content text-white">
									<h3 class="sub-title">Interest with</h3>
									<h2 class="title mb-3">Rugged & Versatile</h2>
									<p class="short-desc different-width mb-10">Sleek and
										streamlined stored</p>
									<div class="button-wrap">
										<a class="btn btn-custom-size lg-size btn-primary"
											href="${pageContext.request.contextPath }/Shop">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination with-bg d-md-none"></div>
				<!-- Custom Arrows -->
				<div class="custom-arrow-wrap d-none d-md-block">
					<div class="custom-button-prev"></div>
					<div class="custom-button-next"></div>
				</div>
			</div>

		</div>
		<!-- Slider Area End Here -->

		<div class="background-img">
			<div class="inner-bg">
				<img
					src="${url}/assets/images/background-img/inner-bg/1-1-496x566.png"
					alt="Inner Background" />
			</div>
			<!-- Begin Shipping Area -->
			<div class="shipping-area section-space-y-axis-100">
				<div class="container">
					<div class="shipping-bg"
						data-bg-image="${url}/assets/images/shipping/bg/1-1-1280x202.jpg">
						<div class="row shipping-wrap py-5 py-xl-0">
							<div class="col-lg-4">
								<div class="shipping-item">
									<div class="shipping-img">
										<img src="${url}/assets/images/shipping/icon/plane.png"
											alt="Shipping Icon" />
									</div>
									<div class="shipping-content">
										<h2 class="title">Free Shipping</h2>
										<p class="short-desc mb-0">Provide free home delivery for
											all product over $100</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 pt-4 pt-lg-0">
								<div class="shipping-item">
									<div class="shipping-img">
										<img src="${url}/assets/images/shipping/icon/earphones.png"
											alt="Shipping Icon" />
									</div>
									<div class="shipping-content">
										<h2 class="title">Online Support</h2>
										<p class="short-desc mb-0">To satisfy our customer we try
											to give support online</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 pt-4 pt-lg-0">
								<div class="shipping-item">
									<div class="shipping-img">
										<img src="${url}/assets/images/shipping/icon/shield.png"
											alt="Shipping Icon" />
									</div>
									<div class="shipping-content">
										<h2 class="title">Secure Payment</h2>
										<p class="short-desc mb-0">We ensure our product Good
											quality all times</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Shipping Area End Here -->
		</div>
		<!-- Begin Product Area -->
		<!-- Product Area End Here -->
		<!-- Begin Newsletter Area -->
		<!-- Newsletter Area End Here -->
		<!-- Begin Product Area -->
		<div class="background-img"
			data-bg-image="${url}/assets/images/background-img/1-2-1920x716.jpg">
			<div class="product-area section-space-y-axis-100 product-arrow">
				<div class="container">
					<div class="section-title pb-55">
						<h2 class="title mb-0">New Product</h2>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="swiper-container product-slider">
								<div class="swiper-wrapper text-heading">
									<c:forEach items="${newProduct }" var="P">
										<div class="swiper-slide">
											<div class="product-item">
												<div class="product-img img-zoom-effect">
													<a
														href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id}">
														<img class="img-full" src="${url}/${P.image }/1.jpg"
															alt="Product Images" />
													</a>
												</div>
												<div class="product-content">
													<a class="product-name pb-1"
														href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id}">${P.name }</a>
													<div class="price-box">
														<div class="price-box-holder">
															<span>Price:</span>
															<span class="new-price text-primary">$ ${P.price }</span>
														</div>
													</div>
													<div class="product-add-action">
														<ul>
															<li class="quuickview-btn" data-bs-toggle="modal"
																data-bs-target="">
																<a href="ProductDetail?productId=${P.id}"
																	data-tippy="Quickview" data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder">
																	<i class="pe-7s-look"></i>
																</a>
															</li>
															<li>
																<c:choose>
																	<c:when test="${P.status == 1}">
																		<a href="AddToCart?productId=${P.id }"
																			data-tippy="Add to cart" data-tippy-inertia="true"
																			data-tippy-animation="shift-away"
																			data-tippy-delay="50" data-tippy-arrow="true"
																			data-tippy-theme="sharpborder">
																			<i class="pe-7s-cart"></i>
																		</a>
																	</c:when>
																	<c:when test="${P.status == 0}">
																		<a href="#" data-tippy="Add to cart"
																			data-tippy-inertia="true"
																			data-tippy-animation="shift-away"
																			data-tippy-delay="50" data-tippy-arrow="true"
																			data-tippy-theme="sharpborder">
																			<i class="pe-7s-cart"></i>
																		</a>
																	</c:when>
																</c:choose>
															</li>
															<li>
																<a
																	href="${pageContext.request.contextPath }/AddToWishlist?productId=${P.id}"
																	data-tippy="Add to wishlist" data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder">
																	<i class="pe-7s-like"></i>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<!-- Add Arrows -->
							<div class="product-button-wrap pt-10">
								<div class="product-button-prev">
									<i class="pe-7s-angle-left"></i>
								</div>
								<div class="product-button-next">
									<i class="pe-7s-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Product Area End Here -->
		<!-- Begin Banner Area -->
		<div class="banner-area section-border-y-axis">
			<div class="container">
				<div class="row">
					<div
						class="col-md-6 align-self-md-center order-2 order-md-1 pt-5 pt-md-0 ">
						<div class="banner-content text-center">
							<div class="inner-img mb-2">
								<img src="${url}/assets/images/banner/inner-img/1-1-201x57.png"
									alt="Banner Image" />
							</div>
							<h3 class="title text-charcoal">Deal of the day</h3>
							<h4 class="sub-title text-primary mb-6">Hot Deal ! Sale Up
								To 30% Off</h4>
							<div class="countdown-wrap pb-8">
								<div class="countdown item-4" data-countdown="2021/12/24"
									data-format="short">
									<div class="countdown__item me-3">
										<span class="countdown__time daysLeft"></span>
										<span class="countdown__text daysText"></span>
									</div>
									<div class="countdown__item me-3">
										<span class="countdown__time hoursLeft"></span>
										<span class="countdown__text hoursText"></span>
									</div>
									<div class="countdown__item me-3">
										<span class="countdown__time minsLeft"></span>
										<span class="countdown__text minsText"></span>
									</div>
									<div class="countdown__item">
										<span class="countdown__time secsLeft"></span>
										<span class="countdown__text secsText"></span>
									</div>
								</div>
							</div>
							<div class="button-wrap pb-8 pb-md-0">
								<a class="btn btn-custom-size lg-size btn-primary"
									href="${pageContext.request.contextPath }/Shop">Shop Now</a>
							</div>
						</div>
					</div>
					<div class="col-md-6 order-1 order-md-2">
						<div class="banner-img">
							<img src="${url}/assets/images/banner/2-1-407x529.png"
								alt="Banner Image" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Banner Area End Here -->
		<!-- Begin Testimonial Area -->
		<div class="testimonial-area bg-white-smoke section-space-y-axis-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="swiper-container testimonial-slider">
							<div class="swiper-wrapper">
								<c:forEach items="${listReview }" var="R" varStatus="">
									<div class="swiper-slide testimonial-item">
										<div class="user-info mb-3">
											<div class="user-shape-wrap">
												<div class="user-shape">
													<img
														src="${url}/assets/images/testimonial/user/shape/1.png"
														alt="User Image" />
												</div>
												<div class="user-img">
													<img src="${url}/assets/images/profile/${R.user.avatar}"
														alt="User Image" />
												</div>
											</div>
											<div class="user-content">
												<h4 class="user-name mb-1">${R.user.fullName }</h4>
												<span class="user-occupation">${R.createDate }</span>
											</div>
										</div>
										<p class="user-comment mb-6">${R.content}</p>
										<div class="rating-box">
											<ul>
												<li>
													<i class="fa fa-star"></i>
												</li>
												<li>
													<i class="fa fa-star"></i>
												</li>
												<li>
													<i class="fa fa-star"></i>
												</li>
												<li>
													<i class="fa fa-star"></i>
												</li>
												<li>
													<i class="fa fa-star-o"></i>
												</li>
											</ul>
											<span class="title">4.0</span>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- Add Pagination -->
							<div class="testimonial-pagination with-bg"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Brand Area End Here -->
		<!-- Begin Footer Area -->
		<%@include file="components/footer.jsp"%>
		<!-- Footer Area End Here -->

		<!-- Begin Modal Area -->
		<!-- Begin Scroll To Top -->
		<a class="scroll-to-top" href="#">
			<i class="fa fa-chevron-up"></i>
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

<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:24:39 GMT -->

</html>