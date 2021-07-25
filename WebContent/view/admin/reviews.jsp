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
    <link rel="icon" type="image/png" sizes="16x16" href="${url}/assets/images/favicon.png">
    <link href="${url}/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
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
                                Review List
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
							<div class="card-header flex-wrap border-0 pl-0">
								<div class="table-tabs mb-3">
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" data-toggle="tab" href="#AllReview">
												All Review	
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#Published">
												Published
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link " data-toggle="tab" href="#Hidden">
												Hidden
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="card-body p-0">
								<div class="tab-content" id="Tab">
									<div class="tab-pane fade active show" id="AllReview">
										<div class="row">
											<div class="col-xl-12">
												<c:forEach items="${reviewList}" var="R">
													<div class="card review-table p-0 border-0">
													<div class="d-flex flex-wrap align-items-center py-4 px-2  border-bottom">
														<div class="col-xl-4 col-xxl-4 col-lg-5 col-md-12">
															<div class="media align-items-center">
																<img class="mr-3 img-fluid " width="100" src="${url}/assets/images/profile/${R.user.avatar}" alt="DexignZone">
																<div class="card-body p-0">
																	<p class="text-primary fs-14 mb-0">#${R.id}</p>
																	<h3 class="fs-20 text-black font-w600 mb-2">${R.user.fullName}</h3>
																	<span class="text-dark">${R.createDate}</span>
																</div>
															</div>
														</div>
														<div class="col-xl-5 col-xxl-4 col-lg-7 col-md-12 mt-3 mt-lg-0">
															<p class="mb-0 text-dark">${R.content}</p>
														</div>
														<div class="col-xl-3 col-xxl-4 col-lg-7 col-md-12 offset-lg-5 offset-xl-0 mt-xl-0 mt-3">
															<div class="row align-items-center">
																<div class="text-xl-center start-bx col-xl-7 col-sm-9 col-lg-8 col-6">
																	<c:choose>
																		<c:when test="${R.isPublish == 1}">
																			<a class="btn text-success bgl-success"
																					href="javascript:void(0);">PUBLISHED</a>
																		</c:when>
																		<c:when test="${R.isPublish == 0}">
																			<a class="btn text-white bgl-light"
																			href="javascript:void(0);">HIDDEN</a>
																		</c:when>
																	</c:choose>
																</div>
																<div class="col-xl-5 col-sm-3 col-lg-4 col-6 text-right">
																	<c:choose>
																		<c:when test="${R.isPublish == 1}">
																			<a href="${pageContext.request.contextPath }/Admin/HiddenReview?reviewId=${R.id}" class="text-danger mr-2 fs-14 font-w600">HIDDEN</a>
																		</c:when>
																		<c:when test="${R.isPublish == 0}">
																			<a href="${pageContext.request.contextPath }/Admin/PublishReview?reviewId=${R.id}" class="text-success fs-14 font-w600">PUBLISH</a>
																		</c:when>
																	</c:choose>
																</div>
															</div>
														</div>
													</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="Published">
										<div class="row">
											<div class="col-xl-12">
												<c:forEach items="${publishedReviewList}" var="R">
													<div class="card review-table p-0 border-0">
													<div class="d-flex flex-wrap align-items-center py-4 px-2  border-bottom">
														<div class="col-xl-4 col-xxl-4 col-lg-5 col-md-12">
															<div class="media align-items-center">
																<img class="mr-3 img-fluid " width="100" src="${url}/assets/images/profile/${R.user.avatar}" alt="DexignZone">
																<div class="card-body p-0">
																	<p class="text-primary fs-14 mb-0">#${R.id }</p>
																	<h3 class="fs-20 text-black font-w600 mb-2">${R.user.fullName}</h3>
																	<span class="text-dark">${R.createDate}</span>
																</div>
															</div>
														</div>
														<div class="col-xl-5 col-xxl-4 col-lg-7 col-md-12 mt-3 mt-lg-0">
															<p class="mb-0 text-dark">${R.content}</p>
														</div>
														<div class="col-xl-3 col-xxl-4 col-lg-7 col-md-12 offset-lg-5 offset-xl-0 mt-xl-0 mt-3">
															<div class="row align-items-center">
																<div class="text-xl-center start-bx col-xl-7 col-sm-9 col-lg-8 col-6">
																	<a class="btn text-success bgl-success"
																			href="javascript:void(0);">PUBLISHED</a>
																</div>
																<div class="col-xl-5 col-sm-3 col-lg-4 col-6 text-right">
																	<a href="${pageContext.request.contextPath }/Admin/HiddenReview?reviewId=${R.id}" class="text-danger mr-2 fs-14 font-w600">HIDDEN</a>
																</div>
															</div>
														</div>
														
													</div>
												</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="Hidden">
										<div class="row">
											<div class="col-xl-12">
												 <c:forEach items="${hiddenReviewList}" var="R">
													<div class="card review-table p-0 border-0">
													<div class="d-flex flex-wrap align-items-center py-4 px-2  border-bottom">
														<div class="col-xl-4 col-xxl-4 col-lg-5 col-md-12">
															<div class="media align-items-center">
																<img class="mr-3 img-fluid " width="100" src="${url}/assets/images/profile/${R.user.avatar}" alt="DexignZone">
																<div class="card-body p-0">
																	<p class="text-primary fs-14 mb-0">#${R.id }</p>
																	<h3 class="fs-20 text-black font-w600 mb-2">${R.user.fullName}</h3>
																	<span class="text-dark">${R.createDate}</span>
																</div>
															</div>
														</div>
														<div class="col-xl-5 col-xxl-4 col-lg-7 col-md-12 mt-3 mt-lg-0">
															<p class="mb-0 text-dark">${R.content}</p>
														</div>
														<div class="col-xl-3 col-xxl-4 col-lg-7 col-md-12 offset-lg-5 offset-xl-0 mt-xl-0 mt-3">
															<div class="row align-items-center">
																<div class="text-xl-center start-bx col-xl-7 col-sm-9 col-lg-8 col-6">
																	<a class="btn text-white bgl-light"
																			href="javascript:void(0);">HIDDEN</a>
																</div>
																<div class="col-xl-5 col-sm-3 col-lg-4 col-6 text-right">
																	<a href="${pageContext.request.contextPath }/Admin/PublishReview?reviewId=${R.id}" class="text-success fs-14 font-w600">PUBLISH</a>
																</div>
															</div>
														</div>
														
													</div>
												</div>
												</c:forEach>
											</div>
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
	<script src="${url}/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="${url}/assets/js/custom.min.js"></script>
	<script src="${url}/assets/js/deznav-init.js"></script>
	<script src="${url}/assets/js/demo.js"></script>
    <script src="${url}/assets/js/styleSwitcher.js"></script>
</body>
</html>