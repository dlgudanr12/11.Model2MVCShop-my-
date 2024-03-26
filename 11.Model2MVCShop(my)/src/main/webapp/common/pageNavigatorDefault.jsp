<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container text-center">
<nav>
<ul class="pagination" >
<c:if test="${resultPage.currentPage > resultPage.pageUnit }">
	<li>
	<a href="javascript:fncGetList('${resultPage.beginUnitPage - 1 }')">
	◀이전</a>
	</li>
</c:if>

<c:forEach var="i" begin="${resultPage.beginUnitPage }"
	end="${resultPage.endUnitPage }" step="1">
	<li>
	<a href="javascript:fncGetList('${i }')">${i }</a>
	</li>
</c:forEach>

<c:if test="${resultPage.endUnitPage<resultPage.maxPage }">
	<li>
	<a href="javascript:fncGetList('${resultPage.endUnitPage + 1 }')">이후▶</a>
	</li>
</c:if>
</ul>
</nav>
</div>

