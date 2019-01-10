<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--Navbar-->
<nav class="navbar navbar-expand-lg #ffcdd2 red lighten-4">
	<!-- Navbar brand -->
	<a class="navbar-brand" href="${context}">HOME</a>

	<!-- Collapse button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#basicExampleNav" aria-controls="basicExampleNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>


	<!-- Collapsible content -->
	<div class="collapse navbar-collapse" id="basicExampleNav">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="${context}/board/list">게시판</a></li>		
		</ul>

		<ul class="navbar-nav">
			<!-- 로그인 사용자 -->
			<c:if test="${not empty USER}">
				<li class="nav-item">
					 <a class="nav-link" href="${context}/account/logout">
					 	<i class="fas fa-sign-out-alt"></i>
					 	로그아웃</a>
				</li>
			</c:if>
			 
			<!-- 로그인 안한 사용자 -->
			<c:if test="${empty USER}">
				<li class="nav-item">
					<a class="nav-link" href="${context}/account/login">
						<i class="fas fa-sign-in-alt"></i>
						로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${context}/account/join">
						<i class="fas fa-user-plus"></i>
						회원가입</a>
				</li>
			</c:if> 
		</ul>
	</div>
	<!-- Collapsible content -->

</nav>
