<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style  type="text/css">
html, body {
	height: 100%;
	background-color: #8FBC8F;
}
</style>

<html>
<body>
	<div style="height: 96%;">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h2 class="my-5 font-weight-bold" align="center">
				<i class="far fa-comment-dots fa-lg"></i>&nbsp;&nbsp;로그인</h2>
				<form:form commandName="member">
					<div class="md-form">
						<label for="userId">사용자 ID</label>
						<form:input path="userId" class="form-control" />
					</div>

					<div class="md-form">
						<label for="password">비밀번호</label>
						<form:password path="password" class="form-control" />
					</div>

					<div class="error">${error}</div>
					<button class="btn btn-warning btn-block my-4" type="submit">Sign
						in</button>

				</form:form>
			</div>
		</div>
	</div>

</body>
</html>
