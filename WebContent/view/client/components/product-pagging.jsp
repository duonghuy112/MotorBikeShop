<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Previous">&laquo; </a></li>
		<c:forEach var="i" begin="1" end="${totalPage }">
			<c:choose>
				<c:when test="${pageIndex == i}">
					<li class="page-item active"><a class="page-link">${i}</a></li>
				</c:when>

				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath }/Shop?pageIndex=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Next">&raquo;</a></li>
	</ul>
</nav>