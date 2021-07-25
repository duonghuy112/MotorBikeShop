<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/single-product-variable.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:16 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - Single Product Variable</title>
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

		<!-- Begin Main Content Area  -->
		<main class="main-content">
			<div class="breadcrumb-area breadcrumb-height"
				data-bg-image="${url}/assets/images/breadcrumb/bg/1-1-1920x400.jpg">
				<div class="container h-100">
					<div class="row h-100">
						<div class="col-lg-12">
							<div class="breadcrumb-item text-night-rider">
								<h2 class="breadcrumb-heading">Product Style</h2>
								<ul>
									<li>
										<a href="${pageContext.request.contextPath }/Home">Home /</a>
									</li>
									<li>Single Product Variable</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single-product-area section-space-top-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-6">
							<div class="single-product-img">
								<div class="swiper-container single-product-slider">
									<div class="swiper-wrapper">
										<c:forEach var="i" begin="1" end="6">
											<div class="swiper-slide">
												<a href="${url}/${product.image }/${i}.jpg"
													class="single-img gallery-popup">
													<img class="img-full"
														src="${url}/${product.image }/${i}.jpg"
														alt="Product Image">
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="thumbs-arrow-holder">
									<div class="swiper-container single-product-thumbs">
										<div class="swiper-wrapper">
											<c:forEach var="i" begin="1" end="6">
												<a href="#" class="swiper-slide">
													<img class="img-full"
														src="${url}/${product.image }/${i}.jpg"
														alt="Product Thumnail">
												</a>
											</c:forEach>
										</div>
									</div>
									<!-- Add Arrows -->
									<div class=" thumbs-button-wrap d-none d-md-block">
										<div class="thumbs-button-prev">
											<i class="pe-7s-angle-left"></i>
										</div>
										<div class="thumbs-button-next">
											<i class="pe-7s-angle-right"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 pt-9 pt-lg-0">
							<div class="single-product-content">
								<h2 class="title mb-3">${product.name}</h2>
								<div class="price-box pb-3">
									<span class="new-price text-danger">$ ${product.price}</span>
								</div>
								<div class="rating-box-wrap pb-55">
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
												<i class="fa fa-star"></i>
											</li>
										</ul>
									</div>
									<div class="review-status ps-4">
										<a href="#">( ${countComment} Customer Review )</a>
									</div>
								</div>
								<div class="selector-wrap color-option">
									<span class="selector-title border-bottom-0">Color</span>
									<select class="nice-select wide border-bottom-0 rounded-0">
										<option value="default">Dark Black With Shadow</option>
										<option value="blue">Blue</option>
										<option value="green">Green</option>
										<option value="red">Red</option>
									</select>
								</div>
								<div class="selector-wrap pb-55">
									<span class="selector-title">Size</span>
									<select class="nice-select wide rounded-0">
										<option value="medium">Medium Size With Screw</option>
										<option value="large">Large Size With Screw</option>
										<option value="small">Small Size With Screw</option>
									</select>
								</div>
								<p class="short-desc mb-9">${product.description }</p>
								<form action="AddToCart" method="get">
									<ul class="quantity-with-btn pb-9">
										<li class="quantity">
											<div class="cart-plus-minus">
												<input class="cart-plus-minus-box" value="1" type="text"
													name="quantity">
											</div>
										</li>
										<c:choose>
											<c:when test="${product.status == 1}">
												<li class="add-to-cart">
													<input class="btn btn-custom-size lg-size btn-primary"
														value="Add To Cart" type="submit">
													<input type="hidden" name="productId" value="${product.id}">
												</li>
											</c:when>
											<c:otherwise>
												<li class="add-to-cart">
													<a class="btn btn-custom-size lg-size btn-primary" href="#"
														style="background-color: #505050">Add to cart</a>
												</li>
											</c:otherwise>
										</c:choose>
										<li class="wishlist-btn-wrap">
											<a class="custom-circle-btn"
												href="AddToWishlist?productId=${product.id }">
												<i class="pe-7s-like"></i>
											</a>
										</li>
									</ul>
								</form>
								<div class="product-category pb-3">
									<span class="title">Status :</span>
									<c:choose>
										<c:when test="${product.status == 1}">
											<ul>
												<li>In stock</li>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<li>Out stock</li>
											</ul>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="product-category pb-3">
									<span class="title">Categories :</span>
									<ul>
										<li>
											<a
												href="${pageContext.request.contextPath }/Category?categoryId=${product.category.id}">${product.category.name }</a>
										</li>
									</ul>
								</div>
								<div class="product-category product-tags pb-3">
									<span class="title">Supplier :</span>
									<ul>
										<li>
											<a
												href="${pageContext.request.contextPath }/Supplier?supplierId=${product.supplier.id}">${product.supplier.name }</a>
										</li>
									</ul>
								</div>
								<div
									class="product-category social-link align-items-center pb-lg-8">
									<span class="title pe-3">Share:</span>
									<ul>
										<li>
											<a href="#" data-tippy="Pinterest" data-tippy-inertia="true"
												data-tippy-animation="shift-away" data-tippy-delay="50"
												data-tippy-arrow="true" data-tippy-theme="sharpborder">
												<i class="fa fa-pinterest-p"></i>
											</a>
										</li>
										<li>
											<a href="#" data-tippy="Twitter" data-tippy-inertia="true"
												data-tippy-animation="shift-away" data-tippy-delay="50"
												data-tippy-arrow="true" data-tippy-theme="sharpborder">
												<i class="fa fa-twitter"></i>
											</a>
										</li>
										<li>
											<a href="#" data-tippy="Tumblr" data-tippy-inertia="true"
												data-tippy-animation="shift-away" data-tippy-delay="50"
												data-tippy-arrow="true" data-tippy-theme="sharpborder">
												<i class="fa fa-tumblr"></i>
											</a>
										</li>
										<li>
											<a href="#" data-tippy="Dribbble" data-tippy-inertia="true"
												data-tippy-animation="shift-away" data-tippy-delay="50"
												data-tippy-arrow="true" data-tippy-theme="sharpborder">
												<i class="fa fa-dribbble"></i>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="product-tab-area section-space-y-axis-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<ul class="nav product-tab-nav mb-10" role="tablist">
								<li class="nav-item" role="presentation">
									<a class="tab-btn" id="information-tab" data-bs-toggle="tab"
										href="#information" role="tab" aria-controls="information"
										aria-selected="false"> Information </a>
								</li>
								<li class="nav-item" role="presentation">
									<a class="active tab-btn" id="description-tab"
										data-bs-toggle="tab" href="#description" role="tab"
										aria-controls="description" aria-selected="true">
										Description </a>
								</li>
								<li class="nav-item" role="presentation">
									<a class="tab-btn" id="reviews-tab" data-bs-toggle="tab"
										href="#reviews" role="tab" aria-controls="reviews"
										aria-selected="false"> Reviews(${countComment}) </a>
								</li>
							</ul>
							<div class="tab-content product-tab-content">
								<div class="tab-pane fade" id="information" role="tabpanel"
									aria-labelledby="information-tab">
									<div class="product-information-body">
										<h4 class="title">Shipping</h4>
										<p class="short-desc mb-4">The item will be shipped from
											China. So it need 15-20 days to deliver. Our product is good
											with reasonable price and we believe you will worth it. So
											please wait for it patiently! Thanks.Any question please
											kindly to contact us and we promise to work hard to help you
											to solve the problem</p>
										<h4 class="title">About return request</h4>
										<p class="short-desc mb-4">If you don't need the item with
											worry, you can contact us then we will help you to solve the
											problem, so please close the return request! Thanks</p>
										<h4 class="title">Guarantee</h4>
										<p class="short-desc mb-0">If it is the quality question,
											we will resend or refund to you; If you receive damaged or
											wrong items, please contact us and attach some pictures about
											product, we will exchange a new correct item to you after the
											confirmation.</p>
									</div>
								</div>
								<div class="tab-pane fade show active" id="description"
									role="tabpanel" aria-labelledby="description-tab">
									<div class="product-description-body">
										<p class="short-desc mb-0">${product.supplier.description}</p>
									</div>
								</div>
								<div class="tab-pane fade" id="reviews" role="tabpanel"
									aria-labelledby="reviews-tab">
									<div class="product-review-body">
										<div class="blog-comment">
											<h4 class="heading mb-7">${countComment}Comments</h4>
											<c:forEach items="${listComment}" var="C">
												<div class="blog-comment-item mb-8">
													<div class="blog-comment-img">
														<img
															src="${url}/assets/images/profile/${C.user.avatar}"
															alt="User Image">
													</div>
													<div class="blog-comment-content pb-8">
														<div class="user-meta">
															<span>
																<strong>${C.user.fullName} -</strong>
																${C.createDate}
															</span>
														</div>
														<p class="user-comment mb-4">${C.content}</p>
														<c:if test="${sessionScope.user.id == C.user.id}">
															<a class="btn btn-custom-size comment-btn"
																href="DeleteComment?productId=${product.id}&commentId=${C.id}">Remove</a>
														</c:if>
													</div>
												</div>
											</c:forEach>
										</div>
										<c:choose>
											<c:when test="${sessionScope.user != null}">
												<div class="feedback-area pt-10">
													<h2 class="heading mb-3">Add a comment</h2>
													<p class="short-desc mb-3">Please leave your comments
														about our products.</p>
													<div class="rating-box">
														<span>Your rating</span>
														<ul class="ps-4">
															<li>
																<i class="fa fa-star" data-tippy="1 star"
																	data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder"></i>
															</li>
															<li>
																<i class="fa fa-star" data-tippy="2 star"
																	data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder"></i>
															</li>
															<li>
																<i class="fa fa-star" data-tippy="3 star"
																	data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder"></i>
															</li>
															<li>
																<i class="fa fa-star" data-tippy="4 star"
																	data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder"></i>
															</li>
															<li>
																<i class="fa fa-star" data-tippy="5 star"
																	data-tippy-inertia="true"
																	data-tippy-animation="shift-away" data-tippy-delay="50"
																	data-tippy-arrow="true" data-tippy-theme="sharpborder"></i>
															</li>
														</ul>
													</div>
													<form class="feedback-form pt-8"
														action="AddComment?productId=${product.id}" method="POST">
														<div class="form-field mt-6">
															<textarea name="content" placeholder="Message"
																class="textarea-field"></textarea>
														</div>
														<div class="button-wrap mt-8">
															<button type="submit" value="submit"
																class="btn btn-custom-size lg-size btn-primary"
																name="submit">Submit</button>
														</div>
													</form>
												</div>
											</c:when>
											<c:otherwise>
												<div class="feedback-area pt-10">
													<h2 class="heading mb-3">Login to add a comment</h2>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="background-img"
				data-bg-image="${url}/assets/images/background-img/1-2-1920x716.jpg">
				<div class="product-area product-arrow section-space-y-axis-100">
					<div class="container">
						<div class="section-title pb-55">
							<h2 class="title mb-0">New Products</h2>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="swiper-container product-slider">
									<div class="swiper-wrapper text-heading">
										<c:forEach items="${newProduct }" var="P">
											<div class="swiper-slide">
												<div class="product-item">
													<div class="product-img img-zoom-effect">
														<a href="shop.html">
															<img class="img-full" src="${url}/${P.image }/1.jpg"
																alt="Product Images" />
														</a>
													</div>
													<div class="product-content">
														<a class="product-name pb-1" href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id}">${P.name }</a>
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
																		data-tippy-animation="shift-away"
																		data-tippy-delay="50" data-tippy-arrow="true"
																		data-tippy-theme="sharpborder">
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
																	<a href="AddToWishlist?productId=${P.id }"
																		data-tippy="Add to wishlist" data-tippy-inertia="true"
																		data-tippy-animation="shift-away"
																		data-tippy-delay="50" data-tippy-arrow="true"
																		data-tippy-theme="sharpborder">
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
		</main>
		<!-- Main Content Area End Here  -->
		<!-- Begin Footer Area -->
		<%@include file="components/footer.jsp"%>
		<!-- Footer Area End Here -->

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


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/single-product-variable.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:18 GMT -->

</html>