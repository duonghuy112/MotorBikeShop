<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/client" var="url"></c:url>

<!DOCTYPE html>
<html lang="zxx">


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:19 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tromic - My Orders</title>
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
								<h2 class="breadcrumb-heading">My Orders Page</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home/</a></li>
									<li>My Orders</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="account-page-area section-space-y-axis-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="tab-content myaccount-tab-content"
								id="account-page-tab-content">
								<div class="tab-pane fade show active" id="account-dashboard"
									role="tabpanel" aria-labelledby="account-dashboard-tab">
									<c:choose>
										<c:when test="${listOrder != null}">
											<div class="myaccount-orders">
												<h4 class="small-title">MY ORDERS</h4>
												<div class="table-responsive">
													<table class="table table-bordered table-hover">
														<tbody>
															<tr>
																<th>ORDER</th>
																<th>TOTAL PRICE</th>
																<th>STATUS</th>
																<th>NOTE</th>
																<th>DATE</th>
																<th>ACTION</th>
																<th></th>
															</tr>
															<c:forEach items="${listOrder}" var="O">
																<tr>
																	<td>#${O.id }</td>
																	<td>$${O.totalPrice }</td>
																	<c:choose>
																		<c:when test="${O.status == 1}">
																			<td style="color: #ee3231">Pending</td>
																		</c:when>
																		<c:when test="${O.status == 2}">
																			<td style="color: #5e72e4">Processing</td>
																		</c:when>
																		<c:when test="${O.status == 3}">
																			<td style="color: #488f1c">Completed</td>
																		</c:when>
																		<c:when test="${O.status == 0}">
																			<td style="color: #7e7e7e">Canceled</td>
																		</c:when>
																	</c:choose>
																	<td>${O.note}</td>
																	<td>${O.createDate}</td>
																	<td>
																		<c:choose>
																			<c:when test="${O.status == 1}">
																				<a
																					href="${pageContext.request.contextPath }/CancelOrder?orderId=${O.id}"
																					class="btn btn-dark btn-primary-hover"
																					style="background-color: #7e7e7e"><span>Canceled</span></a>
																			</c:when>
																			<c:when test="${O.status == 2}">
																				<a
																					href="${pageContext.request.contextPath }/CompleteOrder?orderId=${O.id}"
																					class="btn btn-dark btn-primary-hover"
																					style="background-color: #488f1c"><span>Complete</span></a>
																			</c:when>
																			<c:when test="${O.status == 0}">
																				<a
																					href="${pageContext.request.contextPath }/ReOrder?orderId=${O.id}"
																					class="btn btn-dark btn-primary-hover"
																					style="background-color: #ee3231"><span>Re-order</span></a>
																			</c:when>
																			
																		</c:choose>
																		</td>
																	<td><a
																		href="${pageContext.request.contextPath }/OrdersDetail?orderId=${O.id}"
																		class="btn btn-dark btn-primary-hover"><span>View</span></a>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="myaccount-orders">
												<h4 class="small-title">MY ORDERS IS EMPTY</h4>
											</div>
										</c:otherwise>
									</c:choose>
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


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:19 GMT -->

</html>