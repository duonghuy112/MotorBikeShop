<header class="main-header-area">
	<div class="header-top border-bottom d-none d-lg-block">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-6">
					<div class="header-top-left">
						<ul class="dropdown-wrap text-matterhorn">
							<li class="dropdown">
								<button class="btn btn-link dropdown-toggle ht-btn"
									type="button" id="languageButton" data-bs-toggle="dropdown"
									aria-label="language" aria-expanded="false">Select
									Language</button>
								<ul class="dropdown-menu" aria-labelledby="languageButton">
									<li>
										<a class="dropdown-item" href="#">English</a>
									</li>
									<li>
										<a class="dropdown-item" href="#">Vietnamese</a>
									</li>
								</ul>
							</li>
							<li>
								Total View: 
								<span class="text-primary">${sessionScope.view}</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-6">
					<div class="header-top-right text-matterhorn">
						<c:choose>
							<c:when
								test="${sessionScope.user != null && sessionScope.user.isAdmin == 1}">
								<p class="shipping mb-0">
									Hello Admin
									<span class="text-primary">${sessionScope.user.fullName}</span>
									, have a nice working day!
								</p>
							</c:when>
							<c:when
								test="${sessionScope.user != null && sessionScope.user.isAdmin == 0}">
								<p class="shipping mb-0">
									Hello
									<span class="text-primary">${sessionScope.user.fullName}</span>
									, welcome to our shop!
								</p>
							</c:when>
							<c:when test="${sessionScope.user == null}">
								<p class="shipping mb-0">
									Welcome
									<span class="text-primary">guests</span>
									, please login to enjoy shopping!
								</p>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-middle header-sticky py-6 py-lg-0">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="header-middle-wrap position-relative">
						<a href="${pageContext.request.contextPath }/Home"
							class="header-logo">
							<img src="${url}/assets/images/logo/dark.png" alt="Header Logo" />
						</a>

						<div class="main-menu d-none d-lg-block">
							<nav class="main-nav">
								<ul>
									<li>
										<a href="${pageContext.request.contextPath }/Home">Home</a>
									</li>
									<li class="megamenu-holder">
										<a href="${pageContext.request.contextPath }/Shop">
											Shop
											<i class="pe-7s-angle-down"></i>
										</a>
										<ul class="drop-menu megamenu">
											<li>
												<span class="title">Riding Gear</span>
												<ul>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=1">Helmets</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=2">Eyewear</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=3">Boots</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=4">Jackets
															& Vests</a>
													</li>
												</ul>
											</li>
											<li>
												<span class="title">Accessories</span>
												<ul>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=5">Oil
															& Fluids</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=6">Camping</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=7">Electronics
															& Mounts</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=8">Tool
															Kits</a>
													</li>
												</ul>
											</li>
											<li>
												<span class="title">PARTS</span>
												<ul>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=9">Lighting</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=10">Engine</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=11">Mirrors</a>
													</li>
													<li>
														<a
															href="${pageContext.request.contextPath }/Category?categoryId=12">Exhaust</a>
													</li>
												</ul>
											</li>
											<li>
												<div class="banner">
													<img src="${url}/assets/images/megamenu/banner/1.jpg"
														alt="Menu Banner" />
												</div>
											</li>
										</ul>
									</li>
									<!-- 
									<li>
										<a href="${url}/blog.jsp">Blog</a>
									</li>
									-->
									<li class="drop-holder">
										<a href="${pageContext.request.contextPath }/About">
											About Us
											<i class="pe-7s-angle-down"></i>
										</a>
										<ul class="drop-menu">
											<li>
												<a href="https://www.facebook.com/duonghuy1123/">Nguyen
													Duong Huy</a>
											</li>
											<li>
												<a href="#">Nguyen Van Tuan</a>
											</li>
											<li>
												<a href="#">Le Dinh Nhan</a>
											</li>
											<li>
												<a href="#">Dang Phuc Dang Khoa</a>
											</li>
										</ul>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/Contact">Contact</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class="header-right">
							<ul>
								<li class="dropdown d-none d-lg-block">
									<button class="btn btn-link dropdown-toggle ht-btn p-0"
										type="button" id="settingButton" data-bs-toggle="dropdown"
										aria-label="setting" aria-expanded="false">
										<i class="pe-7s-user"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-end"
										aria-labelledby="settingButton">
										<c:choose>
											<c:when test="${sessionScope.user != null}">
												<c:if test="${sessionScope.user.isAdmin == 1}">
													<li>
														<a class="dropdown-item"
															href="${pageContext.request.contextPath }/Admin/Dashboard">Dashboard</a>
													</li>
												</c:if>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/Profile">My
														Profile</a>
												</li>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/Orders">My
														Order</a>
												</li>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/ShoppingCart">Shopping
														Cart</a>
												</li>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/Checkout">Checkout</a>
												</li>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/Logout">Log
														Out</a>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/Login">Log
														In</a>
												</li>
												<li>
													<a class="dropdown-item"
														href="${pageContext.request.contextPath }/Register">Register</a>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>
								<li class="d-none d-lg-block">
									<a href="${pageContext.request.contextPath }/Wishlist">
										<i class="pe-7s-like"></i>
									</a>
								</li>
								<li class="minicart-wrap me-3 me-lg-0">
									<a href="#miniCart" class="minicart-btn toolbar-btn">
										<i class="pe-7s-shopbag"></i>
										<c:choose>
											<c:when
												test="${sessionScope.listcart.size() != 0 && sessionScope.listcart != null}">
												<span class="quantity">${sessionScope.listcart.size()}</span>
											</c:when>
											<c:otherwise>
												<span class="quantity">0</span>
											</c:otherwise>
										</c:choose>
									</a>
								</li>
								<li class="mobile-menu_wrap d-block d-lg-none">
									<a href="#mobileMenu" class="mobile-menu_btn toolbar-btn pl-0">
										<i class="pe-7s-menu"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModal" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" data-tippy="Close" data-tippy-inertia="true"
						data-tippy-animation="shift-away" data-tippy-delay="50"
						data-tippy-arrow="true" data-tippy-theme="sharpborder"></button>
				</div>
			</div>
		</div>
	</div>
	<div class="offcanvas-minicart_wrapper" id="miniCart">
		<div class="offcanvas-body">
			<c:choose>
				<c:when test="${sessionScope.listcart != null}">
					<div class="minicart-content">
						<div class="minicart-heading">
							<h4 class="mb-0">Shopping Cart</h4>
							<a href="#" class="button-close">
								<i class="pe-7s-close" data-tippy="Close"
									data-tippy-inertia="true" data-tippy-animation="shift-away"
									data-tippy-delay="50" data-tippy-arrow="true"
									data-tippy-theme="sharpborder"></i>
							</a>
						</div>
						<ul class="minicart-list">
							<c:forEach items="${sessionScope.listcart}" var="C">
								<li class="minicart-product">
									<a href="shop.jsp" class="product-item_img">
										<img class="img-full"
											src="${url}/${C.product.image}/1-small.jpg"
											alt="Product Image" />
									</a>

									<div class="product-item_content">
										<a class="product-item_title" href="shop.jsp">${C.product.name }</a>
										<span class="product-item_quantity">${C.quantity} x
											$${C.product.price}</span>
									</div>
								</li>
							</c:forEach>

						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="minicart-content">
						<div class="minicart-heading">
							<h4 class="mb-0">Shopping Cart Is Empty</h4>
							<a href="#" class="button-close">
								<i class="pe-7s-close" data-tippy="Close"
									data-tippy-inertia="true" data-tippy-animation="shift-away"
									data-tippy-delay="50" data-tippy-arrow="true"
									data-tippy-theme="sharpborder"></i>
							</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="group-btn_wrap d-grid gap-2">
				<a href="${pageContext.request.contextPath }/ShoppingCart"
					class="btn btn-dark btn-primary-hover">View Cart</a>
				<a href="${pageContext.request.contextPath }/Checkout"
					class="btn btn-dark btn-primary-hover">View Checkout</a>
			</div>
		</div>
	</div>
	<div class="global-overlay"></div>
</header>