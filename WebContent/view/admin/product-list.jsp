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
		<%@include file="components/nav-header.jsp"%>
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
							<div class="dashboard_bar">Product List</div>
						</div>

						<%@include file="components/nav-header-right.jsp"%>
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
		<%@include file="components/slidebar.jsp"%>
		<!--**********************************
            Sidebar end
        ***********************************-->
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="d-flex mb-3 mb-lg-4 align-items-center">
					<div class="mr-auto d-none d-lg-block">
						<div class="d-flex flex-wrap align-items-center">
							<a href="javascript:void(0);" data-toggle="modal"
								data-target="#addNewProduct"
								class="btn btn-outline-primary  mr-auto mb-2">ADD NEW
								PRODUCT</a>
							<!-- Add Order -->
							<div class="modal fade" id="addNewProduct">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Product</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="AddNewProduct" method="post">
												<div class="form-group">
													<label class="text-black font-w500">Product Name</label>
													<input type="text" class="form-control" name="name">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Category</label>
													<select class="mr-sm-2 form-control"
														id="inlineFormCustomSelect" name="categoryId">
														<option selected="">Choose...</option>
														<option value="1">Helmets</option>
														<option value="2">Eyewear</option>
														<option value="3">Boots</option>
														<option value="4">Jacket & Vets</option>
														<option value="5">Oil & Fluids</option>
														<option value="6">Camping</option>
														<option value="7">Electrics & Mounts</option>
														<option value="8">Tool Kits</option>
														<option value="9">Lighting</option>
														<option value="10">Engine</option>
														<option value="11">Mirror</option>
														<option value="12">Exhaust</option>
													</select>
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Supplier</label>
													<select class="mr-sm-2 form-control"
														id="inlineFormCustomSelect" name="supplierId">
														<option selected="">Choose...</option>
														<option value="1">Scorpion</option>
														<option value="2">ICON</option>
														<option value="3">Armega</option>
														<option value="4">ZANheadgear</option>
													</select>
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Unit Price</label>
													<input type="text" class="form-control" id="val-number"
														name="price" placeholder="$">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Description</label>
													<textarea class="form-control" rows="4" id="comment"
														name="description"></textarea>
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Status</label>
													<div class="mb-0">
														<label class="radio-inline mr-3">
															<input type="radio" name="status" value="1" checked>
															On stock
														</label>
														<label class="radio-inline mr-3">
															<input type="radio" name="status" value="0">
															Out stock
														</label>
													</div>
												</div>
												<div class="form-group">
													<div class="input-group-prepend">
														<span class="input-group-text">Image</span>
													</div>
													<div class="custom-file">
														<input type="file" class="custom-file-input" name="image">
														<label class="custom-file-label">Choose file</label>
													</div>
												</div>
												<div class="form-group">
													<button type="submit" class="btn btn-primary">SAVE</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12">
						<div class="card bg-transparent shadow-none">
							<div class="card-body p-0">
								<div class="tab-content" id="Tab">
									<div class="tab-pane fade active show">
										<div class="table-responsive rounded table-hover">
											<table
												class="table text-black card-table  mb-4 table-responsive-lg dataTablesCard"
												id="dataTable1">
												<thead class="bg-primary">
													<tr>
														<th style="width: 5%">ID</th>
														<th style="width: 35%">Product</th>
														<th>Supplier</th>
														<th>Unit Price</th>
														<th>Status</th>
														<th>Create Date</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listProduct}" var="P">
														<tr class="alert alert-dismissible border-0">
															<td>#${P.id }</td>
															<td>
																<div class="media">
																	<a
																		href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id}">
																		<img class="mr-3 img-fluid rounded"
																			src="${url}/${P.image}/1-small.jpg" alt="DexignZone">
																	</a>
																	<div class="media-body">
																		<small class="mt-0 mb-1 font-w500">
																			<a class="text-primary" href="javascript:void(0);">${P.category.name }</a>
																		</small>
																		<h5 class="mt-0 mb-2 mb-sm-3">
																			<a class="text-black"
																				href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id}">${P.name }</a>
																		</h5>
																		<div class="star-review d-flex fs-14">
																			<i class="fa fa-star text-orange"></i>
																			<i class="fa fa-star text-orange"></i>
																			<i class="fa fa-star text-orange"></i>
																			<i class="fa fa-star text-orange"></i>
																			<i class="fa fa-star text-orange"></i>
																		</div>
																	</div>
																</div>
															</td>
															<td>${P.supplier.name}</td>
															<td>$${P.price}</td>
															<c:choose>
																<c:when test="${P.status == 1}">
																	<td>On stock</td>
																</c:when>
																<c:otherwise>
																	<td style="color: red;">Out stock</td>
																</c:otherwise>
															</c:choose>
															<td>${P.createDate }</td>
															<td>
																<div class="dropdown">
																	<a class="btn-link" href="javascript:void(0)"
																		data-toggle="dropdown" aria-expanded="false">
																		<svg xmlns="http://www.w3.org/2000/svg"
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
																			href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id}">View</a>
																		<a class="dropdown-item text-info"
																			href="${pageContext.request.contextPath }/Admin/EditProduct?productId=${P.id}">Edit</a>
																		<a class="dropdown-item" style="color: red;" href="${pageContext.request.contextPath }/Admin/DeleteProduct?productId=${P.id}"
																			data-toggle="modal" data-target="#deleteProduct">Delete</a>
																	</div>
																</div>
															</td>
														</tr>
														<div class="modal fade" id="deleteProduct">
															<div class="modal-dialog modal-dialog-centered" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title">Confirm Delete Product</h5>
																		<button type="button" class="close" data-dismiss="modal">
																			<span>&times;</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<p>Do you want to delete this product?</p>
																	</div>
																	<div class="modal-footer">
																		<a type="button" style="color: black;"
																			class="btn btn-danger light" data-dismiss="modal">No</a>
																		<a href="${pageContext.request.contextPath }/Admin/DeleteProduct?productId=${P.id}" type="button" style="color: white;" class="btn btn-primary">Yes</a>
																	</div>
																</div>
															</div>
														</div>
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