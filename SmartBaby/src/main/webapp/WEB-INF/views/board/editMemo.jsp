<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<style>
body, html {
	height: 100%;
	background-color: #8FBC8F;
}
</style>

<script
	src="${context}/resources/bower_components/tinymce/tinymce.min.js">
	
</script>

<script>
	$(function() {
		tinymce.init({
			selector : 'textarea',
			language : 'ko_KR',
			height : "300"
		});
	});
</script>

<iot:page-header icon="eraser" title="메모 추가" />

<form:form commandName="board" enctype="multipart/form-data" method="POST">

	<form:textarea path="memo"/>

	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md">
			<i class="fas fa-check"></i>확인
		</button>
		<a href="list" class="btn btn-primary btn-md"> <i
			class="fas fa-undo mr-2"></i>취소
		</a>
	</div>

</form:form>