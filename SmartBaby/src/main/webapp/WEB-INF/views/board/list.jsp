<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<script>
	$(function() {
		$('.delete-btn').click(function(e) {
			e.preventDefault();
			var result = confirm('${board.boardId} 기록을 삭제할까요?');
			if (result) {
				location = $(this).attr('href');
			}
		})
	});

	//popovers Initialization
	$(function() {
		$('[data-toggle="popover"]').popover()
	})
</script>

<iot:page-header icon="list" title="수면 기록" />

<div class="col-md-10">
	<div class="text-right">(총 ${pagination.total}건)</div>

	<table class="table table-stripped">
		<thead>
			<tr>
				<th style="width: 60px">No</th>
				<th style="width: 120px">등록일</th>
				<th style="width: 120px">잠든 시각</th>
				<th style="width: 120px">일어난 시각</th>
				<th style="width: 120px">수면 시간</th>
				<th style="width: 120px">수면 타입</th>
				<th style="width: 120px">memo</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}" varStatus="status">
				<fmt:formatDate var="regDate" value="${board.regDate}"
					pattern="yyyy-MM-dd" scope="request" />
				<tr>
					<td>${board.boardId}</td>
					<td>${regDate}</td>
					<td>${board.sleepTime}</td>
					<td>${board.wakeupTime}</td>
					<td>${board.totalTime}</td>
					<td>${board.dayNight}</td>
					<td><c:if test="${board.memo != null}">
							<button type="button" class="btn btn-primary"
								data-toggle="popover" data-placement="right" title="memo"
								data-content="${board.memo}">memo</button>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="col-md-2"></div>
<iot:pagination />
