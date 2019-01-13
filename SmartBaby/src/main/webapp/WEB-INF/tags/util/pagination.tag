<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul
	class="pagination pagination-circle pg-amber justify-content-center my-5"
	style="margin-left:auto; margin-right:auto;">
	<c:if test="${pagination.currentBlock > 1}">
		<li class="page-item"><a class="page-link" href="list?page=1"><span>처음</span></a>
		</li>
		<li class="page-item"><a class="page-link"
			href="list?page=${pagination.prevBlockPage}"> <span>◀</span></a></li>
	</c:if>

	<c:forEach var="cnt" begin="${pagination.startPage}"
		end="${pagination.endPage}">
		<li
			class="page-item <c:if test="${pagination.page==cnt}"> active</c:if>">
			<a class="page-link" href="?page=${cnt}">${cnt}</a>
		</li>
	</c:forEach>

	<c:if test="${pagination.currentBlock < pagination.totalBlock}">
		<li class="page-item"><a class="page-link"
			href="list?page=${pagination.nextBlockPage}"> <span>▶</span></a></li>
		<li class="page-item"><a class="page-link"
			href="list?page=${pagination.totalPage}"> <span>마지막</span></a></li>
	</c:if>
	
</ul>