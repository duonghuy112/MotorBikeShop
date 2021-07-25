<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:19 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - Cart</title>
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
								<h2 class="breadcrumb-heading">Cart Page</h2>
								<ul>
									<li>
										<a href="${pageContext.request.contextPath }/Home">Home/</a>
									</li>
									<li>Cart</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cart-area section-space-y-axis-100">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<form action="UpdateCart" method="GET">
								<div class="table-content table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th class="product_remove">Remove</th>
												<th class="product-thumbnail">Images</th>
												<th class="cart-product-name">Product</th>
												<th class="product-price">Unit Price</th>
												<th class="product-quantity">Quantity</th>
												<th class="product-subtotal">Total</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listCart}" var="C" varStatus="tmp">
												<tr>
													<td class="product_remove">
														<a href="DeleteCart?productId=${C.product.id}">
															<i class="pe-7s-trash" data-tippy="Remove"
																data-tippy-inertia="true"
																data-tippy-animation="shift-away" data-tippy-delay="50"
																data-tippy-arrow="true" data-tippy-theme="sharpborder"></i>
														</a>
													</td>
													<td class="product-thumbnail">
														<a href="ProductDetail?productId=${C.product.id}">
															<img src="${url}/${C.product.image}/1-small.jpg"
																alt="Cart Thumbnail">
														</a>
													</td>
													<td class="product-name">
														<a href="ProductDetail?productId=${C.product.id}">${C.product.name}</a>
													</td>
													<td class="product-price">
														<span class="amount">$${C.product.price}</span>
													</td>
													<td class="quantity">
														<div class="cart-plus-minus">
															<input class="cart-plus-minus-box" value="${C.quantity}"
																type="text" name="quantity${tmp.index}">
															<div class="dec qtybutton">
																<i class="fa fa-minus"></i>
															</div>
															<div class="inc qtybutton">
																<i class="fa fa-plus"></i>
															</div>
														</div>
													</td>
													<td class="product-subtotal">
														<span class="amount">$${C.product.price *
															C.quantity }</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="row">
									<div class="col-12">
										<div class="coupon-all">
											<div class="coupon">
												<a class="btn lg-size btn-primary"
													href="${pageContext.request.contextPath }/Shop">Continute Shopping</a>
											</div>		
											<div class="coupon2">
												<input class="button mt-xxs-30" name="update_cart"
													value="Update cart" type="submit">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-5 ml-auto">
										<div class="cart-page-total">
											<h2>Cart totals</h2>
											<ul>
												<li>
													Subtotal
													<span>$${total }</span>
												</li>
												<li>
													Total
													<span>$${total }</span>
												</li>
											</ul>
											<a href="${pageContext.request.contextPath }/Checkout">Proceed
												to checkout</a>
										</div>
									</div>
								</div>
							</form>
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


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:21 GMT -->

</html>