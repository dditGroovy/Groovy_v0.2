<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>초기 비밀번호 설정</title>
</head>
<body>
<h1>Welcome! 입사를 축하합니다</h1>
<h2>비밀번호를 설정해주세요</h2>

<form action="#" method="post">
    <%--@declare id="memid"--%>
    <%--@declare id="mempassword"--%>
    <%--@declare id="passwordchk"--%>
    <label for="memId">아이디</label>
    <input type="text" name="memId" id="memId" readonly value="20230801"><br />
    <br/>
    <label for="memPassword">비밀번호</label>
    <input type="password" name="memPassword" id="memPassword">  <br/>
    <label for="passwordchk">비밀번호 확인</label>
    <input type="password" name="passwordchk" id="passwordchk"> <br/> <br/>
    <button type="submit">비밀번호 설정하기</button>
</form>
</body>
</html>