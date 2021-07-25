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
                                Product Detail
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
							<h3 class="text-black font-w600 mb-0 fs-28 mr-5">#${product.id}</h3>
							<div class="d-flex">
								<a class="mb-0 text-black font-w500 fs-18" href="${pageContext.request.contextPath }/Admin/ProductList">Product /
								</a>
								<a class="mb-0 font-w400 fs-18 ml-2" href="#"> Product
									Detaills </a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-xxl-4">
						<div class="row">
							<div class="col-xl-12 col-md-6">
								<div class="card">
									<div class="card-body">
										<div class="text-center order-media">
											<img src="${url}/${product.image}/1.jpg" alt="">
											<img src="${url}/${product.image}/2.jpg" alt="">
											<img src="${url}/${product.image}/3.jpg" alt="">
											<img src="${url}/${product.image}/4.jpg" alt="">
											<img src="${url}/${product.image}/5.jpg" alt="">
											<img src="${url}/${product.image}/6.jpg" alt="">
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-xxl-8">
						<div class="row">
							<div class="col-xl-12">
								<form action="EditProduct" method="post">
									<input type="hidden" name="productId" value="${product.id}">
									<div class="form-group">
										<label class="text-black font-w500">Product Name</label>
										<input type="text" class="form-control" name="name" value="${product.name}">
									</div>
									<div class="form-group">
										<label class="text-black font-w500">Category</label>
										<select class="mr-sm-2 form-control"
											id="inlineFormCustomSelect" name="categoryId">
											<option selected="" value="${product.category.id}">${product.category.name}</option>
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
											<option selected="" value="${product.supplier.id}">${product.supplier.name}</option>
											<option value="1">Scorpion</option>
											<option value="2">ICON</option>
											<option value="3">Armega</option>
											<option value="4">ZANheadgear</option>
										</select>
									</div>
									<div class="form-group">
										<label class="text-black font-w500">Unit Price</label>
										<input type="text" class="form-control" id="val-number"
											name="price" placeholder="$" value="${product.price}">
									</div>
									<div class="form-group">
										<label class="text-black font-w500">Description</label>
										<textarea class="form-control" rows="4" id="comment" name="description">${product.description}</textarea>
									</div>
									<div class="form-group">
										<label class="text-black font-w500">Status</label>
										<div class="mb-0">
				                            <label class="radio-inline mr-3"><input type="radio" name="status" value="1" checked>On stock</label>
	                                        <label class="radio-inline mr-3"><input type="radio" name="status" value="0">Out stock</label>
		                                </div>
									</div>
									<div class="form-group">
										<div class="input-group-prepend">
											<span class="input-group-text">Image</span>
										</div>
										<div class="custom-file">
											<input type="file" class="custom-file-input">
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
		<!--**********************************
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