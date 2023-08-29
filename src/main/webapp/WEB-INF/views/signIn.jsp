<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<style>
    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    .logo-img {
        width: 213px;
        height: 60px;
        border: 1px solid black;
    }

    .login-div {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 64px;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="text"], input[type="submit"], input[type="password"] {
        width: 516px;
        height: 64px;
        padding: 10px;
        border: 1px solid black;
    }

    .userId {
        margin-bottom: 24px;
    }

    .find-id-pw {
        text-align: right;
        font-size: 14px;
        width: 100%;
        padding: 20px 0px 65px 20px;
        box-sizing: border-box; /* Include padding in width calculation */
    }
</style>
<body>
<div class="container">
    <div class="logo-img"></div>
    <div class="login-div">
        <form action="${pageContext.request.contextPath}/signIn" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <input type="text" class="userId" name="emplId" placeholder="ID"/>
            <input type="password" class="userPw" name="emplPassword" placeholder="PASSWORD"/>
                        <div class="find-id-pw"><a href="#">비밀번호 찾기</a></div>
            <input type="submit" value="로그인">
        </form>
    </div>
</div>
</body>
</html>
