<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<c:url value="/view/admin" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Tromic - MotorBike's Accessories & Parts Shop</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${url}/assets/images/favicon.png">
<link
	href="${url}/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css"
	rel="stylesheet">
<link
	href="${url}/assets/vendor/datatables/css/jquery.dataTables.min.css"
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
        ***********************************-->
		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="dashboard_bar">
                                Orders List
                            </div>
                        </div>

                        <%@include file="components/nav-header-right.jsp" %>
                    </div>
                </nav>
            </div>
        </div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->
		<!--**********************************
            Sidebar start
        ***********************************-->
		<%@include file="components/slidebar.jsp" %>
		<!--**********************************
            Sidebar end
        ***********************************-->
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-12">
						<div class="card bg-transparent shadow-none">
							<div
								class="card-header flex-wrap border-0 p-0 justify-content-start">
								<div class="table-tabs mr-2 mb-3 mr-auto">
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#AllOrder" aria-expanded="false">
												All Order </a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#Pending" aria-expanded="false">
												Pending </a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#Processing" aria-expanded="false">
												Processing </a></li>
										<li class="nav-item"><a class="nav-link "
											data-toggle="tab" href="#Completed" aria-expanded="false">
												Completed </a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#Canceled" aria-expanded="false">
												Canceled </a></li>
									</ul>
								</div>

							</div>
							<div class="card-body p-0">
								<div class="tab-content" id="Tab">
									<div class="tab-pane fade active show" id="AllOrder">
										<div class="table-responsive rounded table-hover">
											<table
												class="table text-black card-table  mb-4 table-responsive-lg dataTablesCard"
												id="dataTable1">
												<thead class="bg-primary">
													<tr>
														<th style="width: 5%">Order ID</th>
														<th>Date</th>
														<th>Customer</th>
														<th>Address</th>
														<th>Note</th>
														<th>Total Price</th>
														<th>Status Order</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listOrder}" var="O">
														<tr class="alert alert-dismissible border-0">
															<td>#${O.id }</td>
															<td>${O.createDate}</td>
															<td>${O.user.username}</td>
															<td>${O.shipping.address }</td>
															<td>${O.note }</td>
															<td>$${O.totalPrice }</td>
															<td><c:choose>
																	<c:when test="${O.status == 1}">
																		<a class="btn text-warning bgl-warning"
																			href="javascript:void(0);">PENDING</a>
																	</c:when>
																	<c:when test="${O.status == 2}">
																		<a class="btn text-white bgl-light"
																			href="javascript:void(0);" style="background-color: #a1afff ">PROCESSING</a>
																	</c:when>
																	<c:when test="${O.status == 3}">
																		<a class="btn text-success bgl-success"
																			href="javascript:void(0);">COMPLETED</a>
																	</c:when>
																	<c:when test="${O.status == 0}">
																		<a class="btn text-white bgl-light"
																			href="javascript:void(0);">CANCELED</a>
																	</c:when>
																</c:choose></td>
															<td>
																<div class="dropdown">
																	<a class="btn-link" href="javascript:void(0)"
																		data-toggle="dropdown" aria-expanded="false"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewbox="0 0 24 24"
																			version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																				fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"></rect>
																		<circle fill="#000000" cx="12" cy="5" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="19" r="2"></circle></g></svg>
																	</a>
																	<c:choose>
																		<c:when test="${O.status == 1}">
																			<div class="dropdown-menu dropdown-menu-right">
																				<a class="dropdown-item text-info"
																					href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																				<a class="dropdown-item"
																					href="${pageContext.request.contextPath }/Admin/ProcessingOrder?orderId=${O.id}">Processing</a>
																				<a class="dropdown-item"
																					href="${pageContext.request.contextPath }/Admin/CanceledOrder?orderId=${O.id}">Cancel</a>
																			</div>
																		</c:when>
																		<c:when test="${O.status == 2}">
																			<div class="dropdown-menu dropdown-menu-right">
																				<a class="dropdown-item text-info"
																					href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																				<a class="dropdown-item"
																					href="${pageContext.request.contextPath }/Admin/CompletedOrder?orderId=${O.id}">Complete</a>
																			</div>
																		</c:when>
																		<c:when test="${O.status == 3}">
																			<div class="dropdown-menu dropdown-menu-right">
																				<a class="dropdown-item text-info"
																					href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																			</div>
																		</c:when>
																		<c:when test="${O.status == 0}">
																			<div class="dropdown-menu dropdown-menu-right">
																				<a class="dropdown-item text-info"
																					href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																				<a class="dropdown-item"
																					href="${pageContext.request.contextPath }/Admin/ReOrder?orderId=${O.id}">Re-Order</a>
																			</div>
																		</c:when>
																	</c:choose>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="Pending">
										<div class="table-responsive rounded table-hover">
											<table
												class="table text-black card-table  mb-4 table-responsive-lg dataTablesCard"
												id="dataTable2">
												<thead class="bg-primary">
													<tr>
														<th>Order ID</th>
														<th>Date</th>
														<th>Customer</th>
														<th>Address</th>
														<th>Note</th>
														<th>Total Price</th>
														<th>Status Order</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${pendingOrder}" var="O">
														<tr class="alert alert-dismissible border-0">
															<td>#${O.id}</td>
															<td>${O.createDate}</td>
															<td>${O.user.username}</td>
															<td>${O.shipping.address }</td>
															<td>${O.note}</td>
															<td>$${O.totalPrice }</td>
															<td><a class="btn text-warning bgl-warning"
																href="javascript:void(0);">PENDING</a></td>
															<td>
																<div class="dropdown">
																	<a class="btn-link" href="javascript:void(0)"
																		data-toggle="dropdown" aria-expanded="false"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewbox="0 0 24 24"
																			version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																				fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"></rect>
																		<circle fill="#000000" cx="12" cy="5" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="19" r="2"></circle></g></svg>
																	</a>
																	<div class="dropdown-menu dropdown-menu-right">
																		<a class="dropdown-item text-info"
																			href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																		<a class="dropdown-item"
																			href="${pageContext.request.contextPath }/Admin/ProcessingOrder?orderId=${O.id}">Processing</a>
																		<a class="dropdown-item"
																			href="${pageContext.request.contextPath }/Admin/CanceledOrder?orderId=${O.id}">Cancel</a>
																	</div>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="Processing">
										<div class="table-responsive rounded table-hover">
											<table
												class="table text-black card-table  mb-4 table-responsive-lg dataTablesCard"
												id="dataTable3">
												<thead class="bg-primary">
													<tr>
														<th>Order ID</th>
														<th>Date</th>
														<th>Customer</th>
														<th>Address</th>
														<th>Note</th>
														<th>Total Price</th>
														<th>Status Order</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${processingOrder}" var="O">
														<tr class="alert alert-dismissible border-0">
															<td>#${O.id}</td>
															<td>${O.createDate}</td>
															<td>${O.user.username}</td>
															<td>${O.shipping.address }</td>
															<td>${O.note}</td>
															<td>$${O.totalPrice }</td>
															<td><a class="btn text-white bgl-light"
																href="javascript:void(0);" style="background-color: #a1afff ">PROCESSING</a></td>
															<td>
																<div class="dropdown">
																	<a class="btn-link" href="javascript:void(0)"
																		data-toggle="dropdown" aria-expanded="false"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewbox="0 0 24 24"
																			version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																				fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"></rect>
																		<circle fill="#000000" cx="12" cy="5" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="19" r="2"></circle></g></svg>
																	</a>
																	<div class="dropdown-menu dropdown-menu-right">
																		<a class="dropdown-item text-info"
																			href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																		<a class="dropdown-item"
																			href="${pageContext.request.contextPath }/Admin/CompletedOrder?orderId=${O.id}">Complete</a>
																	</div>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="Completed">
										<div class="table-responsive rounded table-hover">
											<table
												class="table text-black card-table  mb-4 table-responsive-lg dataTablesCard"
												id="dataTable4">
												<thead class="bg-primary">
													<tr>
														<th>Order ID</th>
														<th>Date</th>
														<th>Customer</th>
														<th>Address</th>
														<th>Note</th>
														<th>Total Price</th>
														<th>Status Order</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${completedOrder}" var="O">
														<tr class="alert alert-dismissible border-0">
															<td>#${O.id }</td>
															<td>${O.createDate}</td>
															<td>${O.user.username}</td>
															<td>${O.shipping.address }</td>
															<td>${O.note }</td>
															<td>$${O.totalPrice }</td>
															<td><a class="btn text-success bgl-success"
																href="javascript:void(0);">COMPLETED</a></td>
															<td>
																<div class="dropdown">
																	<a class="btn-link" href="javascript:void(0)"
																		data-toggle="dropdown" aria-expanded="false"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewbox="0 0 24 24"
																			version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																				fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"></rect>
																		<circle fill="#000000" cx="12" cy="5" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="19" r="2"></circle></g></svg>
																	</a>
																	<div class="dropdown-menu dropdown-menu-right">
																		<a class="dropdown-item text-info"
																			href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																	</div>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="Canceled">
										<div class="table-responsive rounded table-hover">
											<table
												class="table text-black card-table  mb-4 table-responsive-lg dataTablesCard"
												id="dataTable4">
												<thead class="bg-primary">
													<tr>
														<th>Order ID</th>
														<th>Date</th>
														<th>Customer</th>
														<th>Address</th>
														<th>Note</th>
														<th>Total Price</th>
														<th>Status Order</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${canceledOrder}" var="O">
														<tr class="alert alert-dismissible border-0">
															<td>#${O.id }</td>
															<td>${O.createDate}</td>
															<td>${O.user.username}</td>
															<td>${O.shipping.address }</td>
															<td>${O.note }</td>
															<td>$${O.totalPrice }</td>
															<td><a class="btn text-white bgl-light"
																href="javascript:void(0);">CANCELED</a></td>
															<td>
																<div class="dropdown">
																	<a class="btn-link" href="javascript:void(0)"
																		data-toggle="dropdown" aria-expanded="false"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink"
																			width="24px" height="24px" viewbox="0 0 24 24"
																			version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																				fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24"></rect>
																		<circle fill="#000000" cx="12" cy="5" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="12" r="2"></circle>
																		<circle fill="#000000" cx="12" cy="19" r="2"></circle></g></svg>
																	</a>
																	<div class="dropdown-menu dropdown-menu-right">
																		<a class="dropdown-item text-info"
																			href="${pageContext.request.contextPath }/Admin/OrderDetail?orderId=${O.id}">View</a>
																		<a class="dropdown-item"
																			href="${pageContext.request.contextPath }/Admin/ReOrder?orderId=${O.id}">Re-Order</a>
																	</div>
																</div>
															</td>
														</tr>
													</c:forEach>
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
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<!--**********************************
            Footer start
        ***********************************-->
		<!--**********************************
            Footer end
        ***********************************-->
		<!--**********************************
           Support ticket button start
        ***********************************-->

	</div>
	<!--**********************************
           Support ticket button end
        ***********************************-->


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
	<script
		src="${url}/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${url}/assets/js/plugins-init/datatables.init.js"></script>
	<script src="${url}/assets/js/custom.min.js"></script>
	<script src="${url}/assets/js/deznav-init.js"></script>
	<script src="${url}/assets/js/demo.js"></script>
	<script src="${url}/assets/js/styleSwitcher.js"></script>
</body>

</html>