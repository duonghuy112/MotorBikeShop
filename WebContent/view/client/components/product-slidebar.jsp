<div class="sidebar-area style-2">
	<div class="widgets-searchbox widgets-area py-6 mb-9">
		<form id="widgets-searchbox" action="SearchName" method="get">
			<input class="input-field" type="text" placeholder="Search"
				name="searchTxt" value="${searchTxt}">
			<button class="widgets-searchbox-btn" type="submit">
				<i class="pe-7s-search"></i>
			</button>
		</form>
	</div>
	<div class="widgets-area mb-9">
		<h2 class="widgets-title mb-5">Supplier</h2>
		<c:forEach items="${listSupplier }" var="S">
			<div class="widgets-item">
				<ul class="widgets-tags">
					<li>
						<c:choose>
							<c:when test="${supplierId == S.id }">
								<a style="background-color: #ee3231;; color: white;" href="${pageContext.request.contextPath }/Supplier?supplierId=${S.id }">${S.name}</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/Supplier?supplierId=${S.id }">${S.name}</a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</c:forEach>
	</div>

	<div class="widgets-area">
		<h2 class="widgets-title mb-5">Product Categories</h2>
		<c:forEach items="${listCategory }" var="C">
			<div class="widgets-item">
				<ul class="widgets-category">
					<li>
						<c:choose>
							<c:when test="${categoryId == C.id }">
								<a style="color: #ee3231" href="${pageContext.request.contextPath }/Category?categoryId=${C.id }">${C.name }</a>
								<span></span>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/Category?categoryId=${C.id }">${C.name }</a>
								<span></span>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</c:forEach>
	</div>
</div>