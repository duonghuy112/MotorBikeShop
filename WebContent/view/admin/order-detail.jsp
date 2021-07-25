<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/admin" var="url"></c:url>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Tromic - MotorBike's Accessories & Parts Shop</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${url}/assets/images/favicon.png">
<link rel="stylesheet"
	href="${url}/assets/vendor/chartist/css/chartist.min.css">
<link
	href="${url}/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css"
	rel="stylesheet">
<link href="${url}/assets/css/style.css" rel="stylesheet">

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
	</div>
</div>
	<!--*******************
        Preloader end
    ********************-->

	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">
		<!--**********************************
            Nav header start
        ***********************************-->
		<%@include file="components/nav-header.jsp" %>
		<!--**********************************
            Nav header end
        ***********************************--> <!--**********************************
            Header start
        ***********************************-->
		<div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="dashboard_bar">
                                Order Detail
                            </div>
                        </div>

                        <%@include file="components/nav-header-right.jsp" %>
                    </div>
                </nav>
            </div>
        </div>
		 <!--**********************************
            Header end ti-comment-alt
        ***********************************--> <!--**********************************
            Sidebar start
        ***********************************-->
		<%@include file="components/slidebar.jsp" %>
		<!--**********************************
            Sidebar end
        ***********************************--> <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="d-flex mb-3 mb-lg-4 align-items-center">
					<div class="mr-auto d-none d-lg-block">
						<div class="d-flex flex-wrap align-items-center">
							<h3 class="text-black font-w600 mb-0 fs-28 mr-5">#${order.id}</h3>
							<div class="d-flex"><a
								class="mb-0 text-black font-w500 fs-18" href="${pageContext.request.contextPath }/Admin/OrdersList">Orders / </a> <a
								class="mb-0 font-w400 fs-18 ml-2" href="#"> Order Detaills </a>
						</div>
					</div>
				</div>
					<div class="d-flex align-items-center"><c:choose>
							<c:when test="${order.status == 1}">
								<a class="btn text-warning bgl-warning mr-5"
									href="javascript:void(0);">PENDING</a>
							</c:when>
							<c:when test="${order.status == 2}">
								<a class="btn text-white bgl-light mr-5"
									href="javascript:void(0);" style="background-color: #a1afff">PROCESSING</a>
							</c:when>
							<c:when test="${order.status == 3}">
								<a class="btn text-success bgl-success mr-5"
									href="javascript:void(0);">COMPLETED</a>
							</c:when>
							<c:when test="${order.status == 0}">
								<a class="btn text-white bgl-light mr-5"
									href="javascript:void(0);">CANCELED</a>
							</c:when>
						</c:choose></div>
			</div>
				<div class="row">
					<div class="col-xl-3 col-xxl-4">
						<div class="row">
							<div class="col-xl-12 col-md-6">
								<div class="card">
									<div class="card-body">
										<div class="text-center order-media"><img
											src="${url}/assets/images/profile/${user.avatar}" alt="">
											<div>	
												<h4 class="text-black mb-3 font-w600">${user.fullName}</h4>
												<c:choose>
													<c:when test="${user.isAdmin == 1}">
														<a href="javascript:void(0);"
															class="btn btn-outline-primary btn-sm">Admin</a>
													</c:when>
													<c:when test="${user.isAdmin == 0}">
														<a href="javascript:void(0);"
															class="btn btn-outline-primary btn-sm">Customer</a>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
									<div class="card-body border-bottom">
										<div class="media align-items-center"><svg class="mr-4"
											width="24" height="24" viewbox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg">
												<path
													d="M22.9993 17.4712V20.7831C23.0006 21.0906 22.9375 21.3949 22.814 21.6766C22.6906 21.9583 22.5096 22.2112 22.2826 22.419C22.0556 22.6269 21.7876 22.7851 21.4958 22.8836C21.2039 22.9821 20.8947 23.0187 20.5879 22.991C17.1841 22.6219 13.9145 21.4611 11.0418 19.6019C8.36914 17.9069 6.10319 15.6455 4.40487 12.9781C2.53545 10.0981 1.37207 6.81909 1.00898 3.40674C0.981336 3.10146 1.01769 2.79378 1.11572 2.50329C1.21376 2.2128 1.37132 1.94586 1.57839 1.71947C1.78546 1.49308 2.03749 1.31221 2.31843 1.18836C2.59938 1.06451 2.90309 1.0004 3.21023 1.00011H6.52869C7.06551 0.994834 7.58594 1.18456 7.99297 1.53391C8.4 1.88326 8.66586 2.36841 8.74099 2.89892C8.88106 3.9588 9.14081 4.99946 9.5153 6.00106C9.66413 6.39619 9.69634 6.82562 9.60812 7.23847C9.51989 7.65131 9.31494 8.03026 9.01753 8.33042L7.61272 9.73245C9.18739 12.4963 11.4803 14.7847 14.2496 16.3562L15.6545 14.9542C15.9552 14.6574 16.3349 14.4528 16.7486 14.3648C17.1622 14.2767 17.5925 14.3089 17.9884 14.4574C18.992 14.8312 20.0348 15.0904 21.0967 15.2302C21.6341 15.3058 22.1248 15.576 22.4756 15.9892C22.8264 16.4024 23.0128 16.9298 22.9993 17.4712Z"
													stroke="#566069" stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round"></path>
											</svg>
											<h4 class="mb-0 text-black">+ ${user.phone}</h4></div>
								</div>
									<div class="card-body border-bottom">
										<div class="media align-items-center"><svg class="mr-4"
											width="24" height="24" viewbox="0 0 32 32" fill="none"
											xmlns="http://www.w3.org/2000/svg" style="min-width: 24px;">
												<path
													d="M28 13.3333C28 22.6667 16 30.6667 16 30.6667C16 30.6667 4 22.6667 4 13.3333C4 10.1507 5.26428 7.09848 7.51472 4.84805C9.76516 2.59761 12.8174 1.33333 16 1.33333C19.1826 1.33333 22.2348 2.59761 24.4853 4.84805C26.7357 7.09848 28 10.1507 28 13.3333Z"
													stroke="#3E4954" stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round"></path>
												<path
													d="M16 17.3333C18.2091 17.3333 20 15.5425 20 13.3333C20 11.1242 18.2091 9.33333 16 9.33333C13.7909 9.33333 12 11.1242 12 13.3333C12 15.5425 13.7909 17.3333 16 17.3333Z"
													stroke="#3E4954" stroke-width="2" stroke-linecap="round"
													stroke-linejoin="round"></path>
											</svg>
											<h4 class="mb-0 text-black">${user.email}</h4></div>
								</div>
									<div class="card-body">
										<h4 class="text-black font-weight-bold mb-3 wspace-no">Note
											Order</h4>
										<p class="my-0  font-w600">${order.note}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="col-xl-9 col-xxl-8">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-body p-0">
										<div class="table-responsive order-list card-table">
											<table class="table items-table table-responsive-md">
												<tbody>
													<tr class="bg-primary">
														<th class="text-black font-w500 fs-20">Products</th>
														<th style="width: 20%;" class="text-black font-w500 fs-20">Unit
															Price</th>
														<th style="width: 10%;" class="text-black font-w500 fs-20">Quantity
													</th>
														<th
														class="my-0 text-black font-w500 fs-20 wspace-no d-md-none d-lg-table-cell">
															Total Price</th>
												</tr>
													<c:forEach items="${orderDetailList}" var="D">
														<tr>
															<td>
																<div class="media"><a
																	href="${pageContext.request.contextPath }/ProductDetail?productId=${D.product.id}"><img
																		class="mr-3 img-fluid rounded"
																		src="${url}/${D.product.image}/1-small.jpg"
																		alt="DexignZone"></a>
																	<div class="media-body"><small
																		class="mt-0 mb-1 font-w500"><a
																			class="text-primary" href="javascript:void(0);">${D.product.category.name }</a></small>
																		<h5 class="mt-0 mb-2 mb-sm-3 my-0  font-w600"><a
																			class="text-black" href="${pageContext.request.contextPath }/ProductDetail?productId=${D.product.id}">${D.product.name }</a>
																	</h5>
																		<div class="star-review d-flex fs-14"><i
																			class="fa fa-star text-orange"></i><i
																			class="fa fa-star text-orange"></i><i
																			class="fa fa-star text-orange"></i> <i
																			class="fa fa-star text-orange"></i> <i
																			class="fa fa-star text-orange"></i></div></div></div>
														</td>
															<td>
																<h4 class="my-0  font-w600">$${D.product.price }</h4>
														</td>
															<td>
																<h4 class="my-0  font-w600">x${D.quantity}</h4>
														</td>
															<td class="d-md-none d-lg-table-cell">
																<h4 class="my-0  font-w600">$${D.product.price *
																	D.quantity}</h4>
														</td>
														</tr>
													</c:forEach>
													</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
							<div class="col-xl-12">
								<div class="card">
									<div class="card-body p-0">
										<div class="table-responsive order-list card-table">
											<table class="table items-table table-responsive-md">
												<tbody>
													<tr class="bg-primary">
														<th style="width: 5%;" class="text-black font-w500 fs-20">Shipping</th>
														<th class="text-black font-w500 fs-20">Full Name</th>
														<th class="text-black font-w500 fs-20">Phone</th>
														<th style="width: 20%;" class="text-black font-w500 fs-20">Address</th>
														<th style="width: 20%;" class="text-black font-w500 fs-20">Total
															Price</th>
												</tr>
													<tr>
														<td>#${order.shipping.id}</td>
														<td>
															<h4 class="my-0  font-w600">${order.shipping.fullname}</h4>
													</td>
														<td>
															<h4 class="my-0  font-w600">${order.shipping.phone}</h4>
													</td>
														<td>
															<h4 class="my-0  font-w600">${order.shipping.address}</h4>
													</td>
														<td class="d-md-none d-lg-table-cell">
															<h4 class="my-0  font-w600">$${order.shipping.totalPrice
																}</h4>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!--**********************************
            Content body end
        ***********************************--> <!--**********************************
            Footer start
        ***********************************-->
         <!--**********************************
           Support ticket button start
        ***********************************--> <!--**********************************
           Support ticket button end
        ***********************************-->

</div>

	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="${url}/assets/vendor/global/global.min.js"></script>
	<script
	src="${url}/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="${url}/assets/vendor/chart.js/Chart.bundle.min.js"></script>

	<!-- Chart piety plugin files -->
	<script src="${url}/assets/vendor/peity/jquery.peity.min.js"></script>

	<script src="${url}/assets/js/dashboard/order-detail.js"></script>

	<script src="${url}/assets/js/custom.min.js"></script>
	<script src="${url}/assets/js/deznav-init.js"></script>
	<script src="${url}/assets/js/demo.js"></script>
	<script src="${url}/assets/js/styleSwitcher.js"></script>

</body>

</html>