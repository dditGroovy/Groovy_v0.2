<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/commonStyle.css">
</head>
<body>
<div class="container login">
    <h1 style="display: none">그루비 로그인</h1>
    <div class="logo-img"></div>
    <div class="login-div">
        <form action="${pageContext.request.contextPath}/signIn" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="text" class="userId btn-free-white" name="emplId" placeholder="ID"/>
            <input type="password" class="userPw btn-free-white" name="emplPassword" placeholder="PASSWORD"/>
            <div class="service-wrap">
                <div class="checkboxWrap">
                    <input type="checkbox" name="rememberMe" id="rememberId" class="checkBox" />
                    <label for="rememberId" class="checkBoxLabel">아이디 기억하기</label>
                </div>
                <div class="find-id-pw"><a href="#" class="font-14 color-font-row">비밀번호를 잊으셨나요?</a></div>

            </div>

            <c:if test="${message=='true'}">
                <div> 아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.</div>
            </c:if>
            <input type="submit" class="btn-free-blue" id="loginBtn" value="LOGIN">
        </form>
    </div>
</div>
</body>
</html>
