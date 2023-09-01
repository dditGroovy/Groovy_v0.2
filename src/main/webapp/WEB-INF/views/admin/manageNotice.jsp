<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>공지 등록</h1>
<form action="${pageContext.request.contextPath}/admin/inputNotice" method="post">
    <label for="noti-title">공지 제목</label>
    <input type="text" name="notiTitle" id="noti-title" required><br/>
    <label for="noti-content">공지 내용</label>
    <textarea cols="10" rows="10" name="notiContent" id="noti-content" required></textarea><br>
    <label for="noti-category">카테고리</label>
    <select name="notiCtgryIconFileStreNm" id="noti-category">
        <option value="important.png">중요</option>
        <option value="notice.png">공지</option>
        <option value="event.png">행사</option>
        <option value="obituary.png">부고</option>
    </select>
    <br>
<%--    <label for="noti-file">파일 첨부</label>--%>
<%--    <input type="file" name="fileName" id="noti-file"><br/>--%>
    <button type="submit">등록</button>
</form>
<table border="1">
    <tr>
        <th>번호</th>
        <th><a href="#"></a>제목</th>
    </tr>
    <tr>
        <td>1</td>
        <td>공지글입니다</td>
    </tr>
</table>

<%--노출 : NOTI020--%>
<%--비노출 : NOTI021--%>
