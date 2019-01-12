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
	background-color:#8FBC8F;
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
		<div class="row" style="height: 100%">
			<div class="col-md-3"></div>
			<!-- Grid column -->
			<div class="col-md-6">

				<!--Card-->
				<div class="card default-color-dark" style="height: 100%">

					<!--Card image-->
					<div class="view">
						<img
							src="resources/images/babyroom.jpg"
							class="card-img-top" alt="photo"> 
							<div class="mask rgba-white-slight"></div>
					</div>

					<!--Card content-->
					<div class="card-body text-center" style="position:relative;height:710px;">
						<!--Title-->
						<h4 class="card-title white-text">SMART BABY</h4>
						<!--Text-->
						<p class="card-text white-text">Sed ut perspiciatis unde omnis
							iste natus error sit voluptatem accusantium doloremque
							laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore
							veritatis et quasi architecto beatae vitae dicta sunt explicabo.
							Nemo enim ipsam voluptatem quia voluptas.</p>
						<div align="center" style="position:absolute; bottom:30px;right:200px;">
							<a href="account/login"
								class="btn btn-outline-white btn-md waves-effect">로그인</a> <a
								href="account/join"
								class="btn btn-outline-white btn-md waves-effect">회원가입</a>
						</div>
					</div>

				</div>
				<!--/.Card-->
				

			</div>
			<!-- Grid column -->
			<div class="col-md-3"></div>

		</div>
		<!-- Grid row -->

	
</body>

</html>