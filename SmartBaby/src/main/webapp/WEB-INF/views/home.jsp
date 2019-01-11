<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<head>
<style>
body, html {
	height: 100%;
}

.bg {
	/* The image used */
	background-image: url("resources/images/Desert.jpg");
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
	<div class="bg"></div>
	<div class="row">
		
		<div class="col-md-7">
			<div class="view overlay z-depth-1-half">
				<img src="resources/images/Desert.jpg" class="card-img-top" alt="">
				<div class="mask rgba-red-light"></div>
			</div>
		</div>
		<div class="col-md-5"></div>
	</div>


</body>
