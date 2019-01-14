<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<style>
body, html {
	background-color: #8FBC8F;
}

td {
	vertical-align: middle !important;
}
</style>

<script>
	// 체크박스
	//전체선택 및 해제 기능
	$(function() {
		$('#ck_all').click(function() {
			if ($("#ck_all").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
	});

	// 메모 보기 기능
	$(function() {
		$('[data-toggle="popover"]').popover()
	})

	$(function() {
		$('#day').click(function() {

		})
	})

	function showPopup() {
		window.open("/board/guideLine", "a",
				"width=400, height=300, left=100, top=50");
	}
</script>

<body>
	<div class="container" style="width: 70%; height: 100%;">
		<h2 class="my-4 font-weight-bold">
			<i class="fas fa-hourglass-half"></i> &nbsp;&nbsp;수면 기록
		</h2>

		<!-- 
		<div class="text-right" style="margin-right: 0px">
			(총 ${pagination.total}건) <a
				href="../delete/${member.userId}?page=${param.page}"
				class="delete-btn btn btn-deep-purple btn-sm">삭 제</a>
		</div> 	-->

		<div class="text-right" style="margin-right: 0px">
			<input type="button" value="guide line" onclick="showPopup();" />
			<button class="btn btn-primary btn-sm" id="all">All</button>
			<button class="btn btn-primary btn-sm" id="day">낮잠</button>
			<button class="btn btn-primary btn-sm" id="night">밤잡</button>
		</div>

		<table class="table table-stripped">
			<thead align="center">
				<tr>
					<th class="checkbox"><input type="checkbox" id="ck_all"></th>
					<th style="width: 60px" class="font-weight-bold">No.</th>
					<th style="width: 120px" class="font-weight-bold">등록일</th>
					<th style="width: 120px" class="font-weight-bold">잠든 시각</th>
					<th style="width: 120px" class="font-weight-bold">일어난 시각</th>
					<th style="width: 120px" class="font-weight-bold">수면 시간</th>
					<th style="width: 120px" class="font-weight-bold">수면 타입</th>
					<th style="width: 120px" class="font-weight-bold">memo</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="board" items="${list}" varStatus="status">
					<fmt:formatDate var="regDate" value="${board.regDate}"
						pattern="yyyy-MM-dd" scope="request" />
					<tr>
						<td><input type="checkbox" id="ck_row"></td>
						<td id="boardId">${board.boardId}</td>
						<td>${regDate}</td>
						<td>${board.sleepTime}</td>
						<td><c:if test="${board.wakeupTime != null}">
								${board.wakeupTime}
							</c:if> <c:if test="${board.wakeupTime == null}">
								자는 중
							</c:if></td>
						<td><c:if test="${board.totalTime != null}">
								${board.totalTime}
							</c:if> <c:if test="${board.totalTime == null}">
								자는 중
							</c:if></td>
						<td>${board.dayNight}</td>
						<td><c:if test="${board.memo != null}">
								<button type="button" class="btn peach-gradient btn-sm"
									data-toggle="popover" data-placement="right" title="memo"
									data-content="${board.memo}">memo</button>
							</c:if> <c:if test="${board.memo == null}">
								<a href="./editMemo/${board.boardId}"><i
									class="fas fa-plus-circle fa-lg"></i></a>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<iot:pagination />
	</div>
</body>
