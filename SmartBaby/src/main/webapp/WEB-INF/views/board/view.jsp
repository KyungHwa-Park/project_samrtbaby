<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<script>
$(function(){
	$('#delete-btn').click(function(e){
		e.preventDefault();
		$('.password-panel').show();
	});
	
	$('#delete-cancel').click(function(){
		$('#password').val('');
		$('.password-panel').hide();
	});
	
	$('#delete-confirm').click(function(){
		var password = $('#password').val();
		var boardId = $(this).data('target');
		if(password == '') {
			alert('비밀번호를 입력하세요');
			$('#password').focus();
			return;
		}
		
		var result = confirm("게시글을 삭제할까요?");
		if(!result) return;
		
		var url = '../delete';
		var params = {
				boardId : boardId,
				password : password,
		};
		
		$.get(url, params, function(result) {
			if(result == 'ok') {
				//어디로 어떻게 이동할 것인가?
				location = '../list';
			} else {
				alert('삭제 실패 : ' + result);
			}
		});
	});
});

</script>


<iot:page-header title="${board.title}"/>

<div class="row">
	<div class="col-md-2">작성자</div>
	<div class="col-md-10">${board.writer}</div>
</div>

<div class="row">
	<div class="col-md-2">조회수</div>
	<div class="col-md-10">${board.readCnt}</div>
</div>

<div class="row">
	<div class="col-md-2">첨부파일</div>
	<div class="col-md-10">
		<c:forEach var="file" items="${board.attachList}">
			<div>
				<a href="../download/${file.attachmentId}">
					<i class="fas fa-download"></i> ${file.fileName}
				</a>
			</div>
		</c:forEach>
	</div>
</div>

<div class="row">
	<div class="col-md-2">작성일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${board.regDate}"
				pattern="yyyy-MM-dd"/>
	</div>
</div>

<div class="row">
	<div class="col-md-2">수정일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${board.updateDate}"
				pattern="yyyy-MM-dd"/>
	</div>
</div>

<hr/>
<div>
	${board.content}
</div>

<div class="text-center">
	<c:if test="${USER.userId == board.writer}">
	<%-- 로그인한 사용자와 글 작성자가 동일한 경우에만 수정/삭제 가능 --%>
		<a href="../edit/${board.boardId}?page=${param.page}" class="mr-4">
			<i class="fas fa-edit mr-2"></i>수정</a>
		<a href="#" id="delete-btn" class="mr-4">
			<i class="fas fa-trash mr-2"></i>삭제</a>
	</c:if>
	<a href="../list?page=${param.page}">
		<i class="fas fa-arrow-left mr-2"></i>돌아가기</a>
</div>

<div class="password-panel text-center my-3"
		style="display:none">
	삭제 비밀번호 : <input type="password" id="password">
	<button type="button" id="delete-confirm"
			data-target="${board.boardId}">확인</button>
	<button type="button" id="delete-cancel">취소</button>
</div>

