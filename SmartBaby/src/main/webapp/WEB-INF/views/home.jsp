<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

<c:set var="context" value="${pageContext.request.contextPath}"
	scope="request" />

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link
	href="${context}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="${context}/resources/bower_components/MDBootstrap/css/mdb.min.css"
	rel="stylesheet">

<!-- Your custom styles (optional) -->
<link href="${context}/resources/css/main.css" rel="stylesheet">

<!-- JQuery -->
<script
	src="${context}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script
	src="${context}/resources/bower_components/popper.js/dist/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script
	src="${context}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- MDB core JavaScript -->
<script
	src="${context}/resources/bower_components/MDBootstrap/js/mdb.min.js"></script>

<style>
body, html {
	height: 100%;
	background-color: #8FBC8F;
}

.bg {
	/* The image used */
	background-image: url("resources/images/babyroom.jpg");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>

<body>

	<!-- Grid row -->


	<!--Card-->
	<div class="card default-color-dark"
		style="width: 60%; margin-left: auto; margin-right: auto; height: 100%">

		<!--Card image-->
		<div class="view">
			<img src="resources/images/7d5373214990.png" style="width: 100%"
				class="card-img-top" alt="photo">
			<div class="mask rgba-white-slight"></div>
		</div>

		<!--Card content-->
		<div class="card-body text-center"
			style="position: relative; height: 450px;
					border-width:7px; border-style:solid; border-color:white">
			<!--Title-->
			<h1 class="card-title white-text"><br>SMART BABY</h1>
			<!--Text-->
			<p class="card-text black-text"><br><br>
				<br> 소중한 우리 아기의 수면 패턴이 궁금하시다면?<br> 지금 SMART BABY 하세요!<br>
				아기의 취침/기상을 자동으로 기록해 드립니다.<br>
			</p>
			<div align="center"
				style="position: absolute; bottom: 30px; left: 37%;">
				<c:if test="${empty USER}">
					<a href="account/login"
						class="btn btn-outline-white btn-md waves-effect">로그인</a>
					<a href="account/join"
						class="btn btn-outline-white btn-md waves-effect">회원가입</a>
				</c:if>
				<c:if test="${not empty USER}">
					<a href="board/list"
						class="btn btn-outline-white btn-md waves-effect">수면기록</a>
					<a class="btn btn-outline-white btn-md waves-effect"
						href="${context}/account/logout"> 로그아웃 </a>
				</c:if>
			</div>
		</div>

	</div>
	<!--/.Card-->




</body>

</html>