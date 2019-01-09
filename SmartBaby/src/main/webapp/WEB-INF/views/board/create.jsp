<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="${context}/resources/bower_components/tinymce/tinymce.min.js">
</script>

<script>
$(function() {
	tinymce.init({
		selector:'textarea',
		heifht : "300"
	});
})
</script>

<h2 class="mt-5, mb-4">게시글 작성</h2>

<form:form commandName="board" enctype="multipart/form-data">
	<input type="hidden" name="writer" value="${USER.userId}" />
	<div class="md-form">
		<label>제목</label>
		<form:input path="title" class="form-control"/>
		<form:errors path="title"/>
	</div>
	
	<div class="mb-3">
		<label>작성자 : ${USER.userId}</label>	
	</div>
	
	<div class="md-form">
		<label>비밀번호</label>
		<form:password path="password" class="form-control"/>
		<form:errors path="password" />
	</div>
	
	<div>
		<label>파일첨부</label>
		<input type="file" name="files" multiple="multiple">
	</div>
	
	<form:textarea path="content"/>
	
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fas fa-undo mr-2"></i>확인</button>
		<a href="list" class="btn btn-primary btn-md">
			<i class="fas fa-undo mr-2"></i>돌아가기</a>
	</div>
	
</form:form>