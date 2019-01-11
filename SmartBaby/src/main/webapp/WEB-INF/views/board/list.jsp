<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

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

	// 체크된 행 삭제 기능
	$(function() {
		var ckBoardId = document.getElementByName("boardId");
		$('.delete-btn').click(function(e) {
			e.preventDefault();
			var result = confirm('${board.boardId} 기록을 삭제할까요?');
			if (result && $("#ck_row").prop("checked")) {
				location = $(this).attr('href');
			}
		})
	});

	// 메모 추가 기능
	var memo = '<p>새문단입니다.</p>'

	$(function() {
		$('#addMemo').click(function() {
			var addMemo = $(memo);
			addMemo.appendTo('#memoLocation');
		});
	});

	// 메모 보기 기능
	$(function() {
		$('[data-toggle="popover"]').popover()
	})
</script>

<iot:page-header icon="list" title="수면 기록" />

<div class="container">
	<div class="row">
		<div class="col-md-9">
			<div class="text-right">
				(총 ${pagination.total}건) 
				<a href="../delete/${member.userId}?page=${param.page}" 
					class="delete-btn btn btn-primary btn-sm">삭제</a>
			</div>

			<table class="table table-stripped">
				<thead>
					<tr>
						<th class="checkbox"><input type="checkbox" id="ck_all"></th>
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
							<td><input type="checkbox" id="ck_row"></td>
							<td id="boardId">${board.boardId}</td>
							<td>${regDate}</td>
							<td>${board.sleepTime}</td>
							<td>${board.wakeupTime}</td>
							<td>${board.totalTime}</td>
							<td>${board.dayNight}</td>
							<td><c:if test="${board.memo != null}">
									<button type="button" class="btn peach-gradient btn-sm"
										data-toggle="popover" data-placement="right" title="memo"
										data-content="${board.memo}">memo</button>
								</c:if> <c:if test="${board.memo == null}">
									<button type="button" id="addMemo"
										class="btn btn-outline-rgba(244, 67, 54, 0.7) rgba-red-strong waves-effect btn-sm">
										<i class="fas fa-plus-circle fa-lg"></i>
									</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<iot:pagination />
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-2" id="memoLocation"></div>
	</div>
</div>

