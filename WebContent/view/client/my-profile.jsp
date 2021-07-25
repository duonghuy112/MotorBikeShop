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
<title>Tromic - My profile</title>
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

<link rel="stylesheet" type="text/css" href="${url}/assets/profile/css/master.css">
<link rel="stylesheet" type="text/css" href="${url}/assets/profile/css/color/color-1.css" id="color">
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
								<h2 class="breadcrumb-heading">My Account Page</h2>
								<ul>
									<li><a href="${pageContext.request.contextPath }/Home">Home/</a></li>
									<li>My Account</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			 <section id="agent-2-peperty" class="profile padding ">
  
				  <div class="container-3"> 
				  
				    <div class="row">
				    	
				      <div class="col-md-4 col-sm-6 col-xs-12">
				      	<h2 class="text-uppercase">my profile</h2>
				      		<form action="UploadAvatar" method="post" enctype="multipart/form-data">
					          <div class="agent-p-img">
					              <img src="${url}/assets/images/profile/${user.avatar}" class="img-responsive" alt="image">
					              <input type="file" name="avatar" placeholder="Avatar" />
					          </div>
					          <button class="btn btn-primary" type="submit">Upload</button>
				      		</form>
					          <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				        		More Options
				      		</button>
				
				      </div>
				            
				      <div class="col-md-8">
					
				          <div class="agent-p-form">
				              
				              <div class="row">
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Full name:</label>
				                      <input type="text" value="${user.fullName}" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Username:</label>
				                      <input type="text" value="${user.username}" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Email:</label>
				                      <input type="text" value="${user.email}" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Phone:</label>
				                      <input type="text" value="${user.phone}" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Gender:</label>
				                      <c:choose>
				                      	<c:when test="${user.gender == 1}">
				                      		<input type="text" value="Male" class="keyword-input">
				                      	</c:when>
				                      	<c:when test="${user.gender == 2}">
				                      		<input type="text" value="Female" class="keyword-input">
				                      	</c:when>
				                      	<c:otherwise>
				                      		<input type="text" class="keyword-input">
				                      	</c:otherwise>
				                      </c:choose>
				                    </div>
				                  </div>
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Day of Birth:</label>
				                      <input type="text" value="${user.dob}" class="keyword-input">
				                    </div>
				                  </div>
				                  
				                  <div class="col-md-12 clearfix">
				                    <div class="single-query">
				                    <label>Create Date:</label>
				                      <input type="text" value="${user.createDate}" class="keyword-input">
				                    </div>
				                  </div>
				              </div>
				          </div>
				      </div>
				   </div>
				
				   </div>


   
				  <div class="container">
				    
				    
				
				  	<div class="row">
				    	<div class="collapse" id="collapseExample">
				      <div class="well">
				        <div class="agent-p-form social-network">
				        
				            <div class="col-md-5 col-sm-5 col-xs-12">  
				              <h3 class="text-uppercase  bottom40">Change Your <span class="color_red">Information</span></h3>
				              <div class="row">
				                <form action="UpdateProfile" method="POST">
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Full name:</label>
				                      <input type="text" name="fullName" value="${user.fullName }" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Email address:</label>
				                      <input type="text" name="email" value="${user.email }" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Phone:</label>
				                      <input type="text" name="phone" value="${user.phone }" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Gender:</label>
				                      <c:choose>
				                      	<c:when test="${user.gender == 1}">
				                      		<input type="text" name="gender" value="Male" class="keyword-input">
				                      	</c:when>
				                      	<c:when test="${user.gender == 2}">
				                      		<input type="text" name="gender" value="Female" class="keyword-input">
				                      	</c:when>
				                      	<c:otherwise>
				                      		<input type="text" name="gender" class="keyword-input">
				                      	</c:otherwise>
				                      </c:choose>
				                    </div>
				                  </div>
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Day of Birth:</label>
				                      <input type="text" name="dob" value="${user.dob }" class="keyword-input">
				                    </div>
				                  </div>
				                                    
				                <div class="col-md-12 col-sm-12 col-xs-12 text-right">
				                  <div class="query-submit-button">
				                    <input type="submit" class="btn_fill" value="submit now">
				                  </div>
				                </div>
				                </form>
				              </div>
				             </div> 
				            <div class="col-md-1 hidden-xs"></div>
				            <div class="col-md-6 col-sm-6 col-xs-12">  
				              <h3 class="text-uppercase  bottom40">Change Your <span class="color_red">Password</span></h3>
				              <c:forTokens items="${passwordErr}-${confirmErr}" delims="-" var="err">
				              <h5 class="text-uppercase  bottom40"><span class="color_red">${err}</span></h5>
				              </c:forTokens>
				              <div class="row">
				                <form action="ChangePassword" method="post">
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Current Password</label>
				                      <input type="password" placeholder="" name="password" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>New Password</label>
				                      <input type="password" placeholder="" name="newPassword" class="keyword-input">
				                    </div>
				                  </div>
				                  <div class="col-md-12">
				                    <div class="single-query">
				                    <label>Confirm Password</label>
				                      <input type="password" placeholder="" name="confirmNewPassword" class="keyword-input">
				                    </div>
				                  </div>
				                                                      
				                <div class="col-md-12 col-sm-12 col-xs-12 text-right">
				                  <div class="query-submit-button">
				                    <input type="submit" class="btn_fill" value="submit now">
				                  </div>
				                </div>
				                </form>
				              </div>
				             </div>
				      </div>
				      </div>
				    </div>
				    </div>
				  </div>
			</section>
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
	
	<script src="${url}/assets/profile/js/jquery-3.2.1.min.js"></script> 
	<script src="${url}/assets/profile/js/bootstrap.min.js"></script> 
	<script src="${url}/assets/profile/js/bootsnav.js"></script>
</body>


<!-- Mirrored from htmldemo.hasthemes.com/tromic/tromic/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 May 2021 06:25:19 GMT -->

</html>