<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:21 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - Checkout</title>
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
								<h2 class="breadcrumb-heading">Checkout Page</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home/</a></li>
									<li>Checkout</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="checkout-area section-space-y-axis-100">
				<form action="Checkout" method="POST">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-12">
								<div class="checkbox-form">
									<h3>Billing Details</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Full Name <span class="required">*</span></label> <input
													placeholder="" type="text" name="fullname">
											</div>
										</div>
										<div class="col-md-12">
											<div class="checkout-form-list">
												<label>Phone Number*</label> <input placeholder=""
													type="text" name="phone">
											</div>
										</div>
										<div class="col-md-12">
											<div class="order-notes">
												<div class="checkout-form-list checkout-form-list-2">
													<label>Address*</label>
													<textarea id="checkout-mess" cols="30" rows="10"
														placeholder="" name="address"></textarea>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="order-notes">
												<div class="checkout-form-list checkout-form-list-2">
													<label>Order Notes</label>
													<textarea id="checkout-mess" cols="30" rows="10"
														placeholder="Notes about your order, e.g. special notes for packaging products."
														name="note"></textarea>
													<input placeholder="" name="totalPrice"
														value="${totalPrice}" type="hidden">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-12">
								<div class="your-order">
									<h3>Your order</h3>
									<div class="your-order-table table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th class="cart-product-name ">Product</th>
													<th class="cart-product-total">Total</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${listCart}" var="C">
													<tr class="cart_item">
														<td class="cart-product-name">${C.product.name}<strong
															class="product-quantity"> * ${C.quantity}</strong></td>
														<td class="cart-product-total"><span class="amount">$${C.total}</span></td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr class="cart-subtotal">
													<th>Cart Subtotal</th>
													<td><span class="amount">$${totalPrice }</span></td>
												</tr>
												<tr class="order-total">
													<th>Order Total</th>
													<td><strong><span class="amount">$${totalPrice
																}</span></strong></td>
												</tr>
											</tfoot>
										</table>
									</div>
									<div class="payment-method">
										<div class="payment-accordion">
											<div id="accordion">
												<div class="card">
													<div class="card-header" id="#payment-1">
														<h5 class="panel-title">
															<a href="#" class="" data-bs-toggle="collapse"
																data-bs-target="#collapseOne" aria-expanded="true">
																Direct Bank Transfer. </a>
														</h5>
													</div>
													<div id="collapseOne" class="collapse show"
														data-bs-parent="#accordion">
														<div class="card-body">
															<p>Make your payment directly into our bank account.
																Please use your Order ID as the payment reference. Your
																order wonât be shipped until the funds have cleared in
																our account.</p>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header" id="#payment-2">
														<h5 class="panel-title">
															<a href="#" class="collapsed" data-bs-toggle="collapse"
																data-bs-target="#collapseTwo" aria-expanded="false">
																Cheque Payment </a>
														</h5>
													</div>
													<div id="collapseTwo" class="collapse"
														data-bs-parent="#accordion">
														<div class="card-body">
															<p>Make your payment directly into our bank account.
																Please use your Order ID as the payment reference. Your
																order wonât be shipped until the funds have cleared in
																our account.</p>
														</div>
													</div>
												</div>
												<div class="card">
													<div class="card-header" id="#payment-3">
														<h5 class="panel-title">
															<a href="#" class="collapsed" data-bs-toggle="collapse"
																data-bs-target="#collapseThree" aria-expanded="false">
																PayPal </a>
														</h5>
													</div>
													<div id="collapseThree" class="collapse"
														data-bs-parent="#accordion">
														<div class="card-body">
															<p>Make your payment directly into our bank account.
																Please use your Order ID as the payment reference. Your
																order wonât be shipped until the funds have cleared in
																our account.</p>
														</div>
													</div>
												</div>
											</div>
											<div class="order-button-payment">
												<input value="Place order" type="submit">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
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


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:21 GMT -->

</html>