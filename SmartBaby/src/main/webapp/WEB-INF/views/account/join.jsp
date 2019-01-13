<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
body, html {
	height: 100%;
	background-color: #8FBC8F;
}
</style>

<script>
	$(function() {
		$('#id-check').click(
				function() {
					var userId = $('#userId').val();
					if (!userId) {
						return alert('사용자 ID를 입력하세요');
					}

					var url = '${context}/account/idcheck';
					var params = {
						userId : userId
					};

					$.get(url, params, function(data) {
						if (data == "ok") { // id 중복 아님
							$('.check-result').text('사용가능한 ID 입니다.')
									.removeClass('error');
							$('[type=submit]').prop('disabled', false);
						} else { // id가 중복됨
							$('.check-result').text('이미 사용중인 ID 입니다.')
									.addClass('error');
							$('[type=submit]').prop('disabled', true);
						}
					});
				});

		$('#userId').keyup(function() {
			$('.check-result').text('ID 중복검사를 하세요.').removeClass('error');
			$('[type=submit]').prop('disabled', true);
		});

		$('form').submit(function(e) {
			e.preventDefault();

			// 비밀번호 확인 체크
			var password = $('[name=password]').val();
			var password2 = $('[name=password2]').val();
			if (password != password2) {
				alert('비밀번호가 일치하지 않습니다.');
				$('[name=password]').focus();
				return;
			}

			this.submit();

		})
	});
</script>

<div class="container"
	style="width: 60%; margin-left: auto; margin-right: auto;">
	<div class="row">

		<h2 class="my-5" align="center">
			<i class="fas fa-user-circle fa-lg"></i> 회원가입
		</h2>
		<form:form commandName="member">
			<div class="md-form">
				<label for="userId">사용자 ID </label>
				<form:input path="userId" class="form-control" />
				<form:errors path="userId" element="div" cssClass="error" />
			</div>

			<p>
				<button type="button" id="id-check">ID 중복 검사</button>
				<span class="check-result">ID 중복검사를 하세요.</span>
			</p>

			<div class="md-form">
				<label for="userId">비밀번호 </label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" element="div" cssClass="error" />
			</div>

			<div class="md-form">
				<label for="password2">비밀번호 확인</label> <input type="password"
					id="password2" name="password2" class="form-control">
			</div>

			<div class="md-form">
				<label for="parName">사용자 이름 </label>
				<form:input path="parName" class="form-control" />
				<form:errors path="parName" element="div" cssClass="error" />
			</div>

			<div class="md-form">
				<label for="babyName">아기 이름 </label>
				<form:input path="babyName" class="form-control" />
				<form:errors path="babyName" element="div" cssClass="error" />
			</div>

			<div class="md-form">
				<label for="email">email </label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" element="div" cssClass="error" />
			</div>

			<p align="center">
				<button type="submit" class="btn btn-primary" disabled>
					<i class="fas fa-check"></i> 확인
				</button>
				<button type="reset" class="btn btn-success">
					<i class="fas fa-undo"></i> 취소
				</button>
			</p>


		</form:form>
	</div>
</div>