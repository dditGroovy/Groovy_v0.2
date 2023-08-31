<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>GROOVY</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <tiles:insertAttribute name="aside" />
        <div class="container">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>
</body>
</html>