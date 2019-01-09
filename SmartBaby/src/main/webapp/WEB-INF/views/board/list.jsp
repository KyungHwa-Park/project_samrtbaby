<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>

<iot:page-header icon="list" title="게시글 목록"/>

<div class="text-right">
	(총 ${pagination.total}건)	/
	<a href="create"><i class="fas fa-plus"></i>추가</a>)
</div>

<table class="table table-stripped">
	<thead>
		<tr>
			<th style="width:60px">No</th>
			<th>제목</th>
			<th style="width:100px">작성자</th>
			<th style="widthwidth:90px">조회수</th>
			<th style="width:120px">등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${list}" varStatus="status">
			<fmt:formatDate var = "regDate" value="${board.regDate}"
					pattern="yyyy-MM-dd" scope="request" />
			<tr>
				<td>${board.boardId}</td>
				<td>
					<a href="view/${board.boardId}?page=${pagination.page}">
						${board.title} <iot:new-item date="${regDate}"/>
					</a>
				</td>
				<td>${board.writer}</td>
				<td>${board.readCnt}</td>
				<td>${regDate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<iot:pagination/>
