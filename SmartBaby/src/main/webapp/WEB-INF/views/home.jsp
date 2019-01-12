<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<style>
body {
	background-image: url("resources/images/Desert.jpg")
}
</style>
</head>

<body>
	<div class="bg"></div>
	<div class="row">
		<div class="col-md-3 offset-md-3">
			<a href="${context}/account/login"
				class="btn btn-primary btn-md"> <i
				class="fas fa-arrow-left mr-2"></i>로그인
			</a>
			<a href="${context}/account/join"
				class="btn btn-primary btn-md"> <i
				class="fas fa-arrow-left mr-2"></i>회원가입
			</a>
			<div class="col-md-3 offset-md-3"></div>
		</div>
	</div>
</body>
</html>

