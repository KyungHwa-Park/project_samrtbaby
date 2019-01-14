<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ attribute name="icon" required="false" type="String" %>
<%@ attribute name="title" required="true" type="String" %>

<h1 class="my-3">
	<c:if test="${not empty icon}">
		<i class="fas fa-${icon}"></i>
	</c:if>	
	${title}
</h1>
<hr>