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
                                User List
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
				<div class="d-flex mb-3 mb-lg-4 align-items-center">
					<div class="mr-auto d-none d-lg-block">
						<div class="d-flex flex-wrap align-items-center">
							<a href="javascript:void(0);" data-toggle="modal"
								data-target="#addNewProduct"
								class="btn btn-outline-primary  mr-auto mb-2">ADD NEW
								USER</a>
							<!-- Add Order -->
							<div class="modal fade" id="addNewProduct">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">User</h5>
											<button type="button" class="close" data-dismiss="modal">
												<span>&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="AddNewUser" method="post" enctype="multipart/form-data">
												<div class="form-group">
													<label class="text-black font-w500">Full Name</label>
													<input type="text" class="form-control" name="fullName">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Username</label>
													<input type="text" class="form-control" name="username">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Password</label>
													<input type="password" class="form-control" name="password">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Email</label>
													<input type="text" class="form-control" name="email">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Phone</label>
													<input type="text" class="form-control" name="phone">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Gender</label>
													<div class="mb-0">
			                                            <label class="radio-inline mr-3"><input type="radio" name="gender" value="male">Male</label>
			                                            <label class="radio-inline mr-3"><input type="radio" name="gender" value="female">Female</label>
			                                        </div>
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Day of Birth</label>
													<input type="text" class="form-control" name="dob">
												</div>
												<div class="form-group">
													<label class="text-black font-w500">Role</label>
													<div class="mb-0">
			                                            <label class="radio-inline mr-3"><input type="radio" name="role" value="admin">Admin</label>
			                                            <label class="radio-inline mr-3"><input type="radio" name="role" value="user">User</label>
			                                        </div>
												</div>
												<div class="form-group">
													<div class="input-group-prepend">
														<span class="input-group-text">Avatar</span>
													</div>
													<div class="custom-file">
														<input type="file" class="custom-file-input" name="avatar">
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
														<th style="width: 34%">User</th>
														<th>Full Name</th>
														<th>Email</th>
														<th>Phone</th>
														<th>Gender</th>
														<th>Birthday</th>
														<th>Status</th>
														<th style="background-image: none;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listUser}" var="U">
														<tr class="alert alert-dismissible border-0">
															<td>#${U.id }</td>
															<td>
																<div class="media">
																	<a href="#">
																		<img class="mr-3 img-fluid rounded"
																			src="${url}/assets/images/profile/${U.avatar}">
																	</a>
																	<div class="media-body">
																		<c:choose>
																			<c:when test="${U.isAdmin == 1}">
																				<small class="mt-0 mb-1 font-w500">
																					<a class="text-primary" href="javascript:void(0);">Admin</a>
																				</small>
																			</c:when>
																			<c:when test="${U.isAdmin == 0}">
																				<small class="mt-0 mb-1 font-w500">
																					<a class="text-primary" href="javascript:void(0);">User</a>
																				</small>
																			</c:when>
																		</c:choose>
																		<h5 class="mt-0 mb-2 mb-sm-3">
																			<a class="text-black" href="#">${U.username }</a>
																		</h5>
																	</div>
																</div>
															</td>
															<td>${U.fullName}</td>
															<td>${U.email}</td>
															<td>${U.phone}</td>
															<c:choose>
																<c:when test="${U.gender == 1}">
																	<td>Male</td>
																</c:when>
																<c:when test="${U.gender == 2}">
																	<td>Female</td>
																</c:when>
																<c:when test="${U.gender == 0}">
																	<td></td>
																</c:when>
															</c:choose>
															<td>${U.dob}</td>
															<c:choose>
																<c:when test="${U.isActive == 1}">
																	<td>Active</td>
																</c:when>
																<c:when test="${U.isActive == 0}">
																	<td style="color: red">Blocked</td>
																</c:when>
															</c:choose>
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
																		<c:choose>
																			<c:when test="${U.isAdmin == 1}">
																				<a class="dropdown-item" href="${pageContext.request.contextPath }/Admin/SetUser?userId=${U.id}">Set User</a>
																			</c:when>
																			<c:when test="${U.isAdmin == 0}">
																				<a class="dropdown-item" href="${pageContext.request.contextPath }/Admin/SetAdmin?userId=${U.id}">Set Admin</a>
																			</c:when>
																		</c:choose>
																		<c:choose>
																			<c:when test="${U.isAdmin == 0 && U.isActive == 1}">
																				<a class="dropdown-item" href="${pageContext.request.contextPath }/Admin/SetBlock?userId=${U.id}">Block</a>
																			</c:when>
																			<c:when test="${U.isAdmin == 0 && U.isActive == 0}">
																				<a class="dropdown-item" href="${pageContext.request.contextPath }/Admin/SetActive?userId=${U.id}">Active</a>
																			</c:when>
																		</c:choose>
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