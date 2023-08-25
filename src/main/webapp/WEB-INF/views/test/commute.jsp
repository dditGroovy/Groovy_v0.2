<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <p>출근 <span>08:54</span></p>
</div>
<div>
    <p>퇴근 <span>18:00</span></p>
</div>
<div>
    <p>오늘 근무 시간</p>
    <p>05시간 30분</p>
</div>
<div>
    <p>이번주 총 근무 시간</p>
    <p>34시간 30분</p>
</div>

<div>
    <c:forEach var="eachMonth" begin="1" end="12">
        <input type="button" class="month" value="<c:out value="${eachMonth}" />">
    </c:forEach>
</div>

<div class="modal">
    <p>근태 현황</p>
    <div></div>
</div>