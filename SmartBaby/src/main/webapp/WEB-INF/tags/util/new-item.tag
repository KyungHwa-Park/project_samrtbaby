<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="date" required="true" type="String" %>

<fmt:formatDate var="today" value="<%=new java.util.Date()%>"
		pattern="yyyy-MM-dd" />
		
<c:if test="${today==date}">	
<!-- 왜냐면 list.jsp에서 속성 new-item.tag의 속성date="${regDate}"로 줌 -->
	<span class="badge badge-pill badge-danger">
		<i class="fas fa-tag"></i>New</span>
</c:if>