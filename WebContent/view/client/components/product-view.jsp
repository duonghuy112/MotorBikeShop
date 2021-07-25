<div class="tab-content text-charcoal pt-8">
	<div class="tab-pane fade show active" id="grid-view" role="tabpanel"
		aria-labelledby="grid-view-tab">
		<div class="product-grid-view row">
			<div class="col-xl-4 col-sm-6"></div>
			<div class="col-xl-4 col-sm-6 pt-6 pt-md-0"></div>
			<div class="col-xl-4 col-sm-6 pt-6 pt-xl-0"></div>
			<c:forEach items="${listProduct }" var="P">
				<div class="col-xl-4 col-sm-6">
					<div class="product-item">
						<div class="product-img img-zoom-effect">
							<a href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id }"> <img class="img-full"
								src="${url}/${P.image}/1.jpg" alt="Product Images">
							</a>
						</div>
						<div class="product-content">
							<a class="product-name pb-1" href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id }">${P.name}</a>
							<div class="price-box">
								<div class="price-box-holder">
									<span>Price:</span> <span class="new-price text-primary">$
										${P.price}</span>
								</div>
							</div>
							<div class="product-add-action">
								<ul>
									<li class="quuickview-btn" data-bs-toggle="modal"
										data-bs-target=""><a href="ProductDetail?productId=${P.id}"
										data-tippy="View" data-tippy-inertia="true"
										data-tippy-animation="shift-away" data-tippy-delay="50"
										data-tippy-arrow="true" data-tippy-theme="sharpborder"> <i
											class="pe-7s-look"></i>
									</a></li>
									<li>
										<c:if test="${P.status == 1}">
											<a href="AddToCart?productId=${P.id }" data-tippy="Add to cart"
												data-tippy-inertia="true" data-tippy-animation="shift-away"
												data-tippy-delay="50" data-tippy-arrow="true"
												data-tippy-theme="sharpborder"> <i class="pe-7s-cart"></i></a>
										</c:if>
									</li>
									<li><a href="AddToWishlist?productId=${P.id }" data-tippy="Add to wishlist"
										data-tippy-inertia="true" data-tippy-animation="shift-away"
										data-tippy-delay="50" data-tippy-arrow="true"
										data-tippy-theme="sharpborder"> <i class="pe-7s-like"></i>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<div class="tab-pane fade" id="list-view" role="tabpanel"
		aria-labelledby="list-view-tab">
		<div class="product-list-view row">
			<div class="col-12"></div>
			<c:forEach items="${listProduct }" var="P">
				<div class="col-12 pt-8">
					<div class="product-list-item">
						<div class="product-list-img img-zoom-effect">
							<a href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id }"> <img class="img-full"
								src="${url}/${P.image}/1.jpg" alt="Product Images">
							</a>
						</div>
						<div class="product-list-content">
							<a class="product-name pb-2" href="${pageContext.request.contextPath }/ProductDetail?productId=${P.id }">${P.name }</a>
							<div class="price-box pb-1">
								<span class="new-price">$ ${P.price }</span>
							</div>
							<div class="rating-box pb-2">
								<ul>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star-o"></i></li>
								</ul>
							</div>
							<p class="short-desc mb-0">${P.description }</p>
							<div class="product-add-action">
								<ul>
									<li class="quuickview-btn" data-bs-toggle="modal"
										data-bs-target=""><a href="ProductDetail?productId=${P.id}"
										data-tippy="View" data-tippy-inertia="true"
										data-tippy-animation="shift-away" data-tippy-delay="50"
										data-tippy-arrow="true" data-tippy-theme="sharpborder"> <i
											class="pe-7s-look"></i>
									</a></li>
									<li>
										<c:if test="${P.status == 1}">
											<a href="AddToCart?productId=${P.id }" data-tippy="Add to cart"
												data-tippy-inertia="true" data-tippy-animation="shift-away"
												data-tippy-delay="50" data-tippy-arrow="true"
												data-tippy-theme="sharpborder"> <i class="pe-7s-cart"></i></a>
										</c:if>
									</li>
									<li><a href="AddToWishlist?productId=${P.id }" data-tippy="Add to wishlist"
										data-tippy-inertia="true" data-tippy-animation="shift-away"
										data-tippy-delay="50" data-tippy-arrow="true"
										data-tippy-theme="sharpborder"> <i class="pe-7s-like"></i>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>