<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/commonStyle.css">
</head>
<body>
<div class="container">
    <h1 style="display: none">그루비 로그인</h1>
    <div class="logo-img"></div>
    <div class="login-div">
        <form action="${pageContext.request.contextPath}/signIn" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="text" class="userId btn-free-white" name="emplId" placeholder="ID"/>
            <input type="password" class="userPw btn-free-white" name="emplPassword" placeholder="PASSWORD"/>
            <div class="service-wrap">
                <div class="checkboxWrap">
                    <input type="checkbox"  name="rememberId" id="rememberId" class="checkBox">
                    <label for="rememberId" class="checkBoxLabel">아이디 기억하기</label>
                </div>
                <div class="find-id-pw"><a href="#" class="font-14 color-font-row">비밀번호 찾기</a></div>
            </div>
            <input type="submit" class="btn-free-blue" id="loginBtn" value="로그인">
        </form>
    </div>
</div>
</body>
</html>
