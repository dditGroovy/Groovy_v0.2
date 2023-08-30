<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <style>
        #createChat input[type=text] {width: 90%; padding: 10px;}
    </style>
</head>
<body>
    <h1>채팅방 개설</h1>
    <form action="#" method="post">
        <table border="1" style="width: 50%" id="createChat">
            <tr>
                <th>채팅방 번호</th>
                <td><input type="text" name="chttRoomNo" id="chttRoomNo"></td>
            </tr>
            <tr>
                <th>채팅방 이름</th>
                <td><input type="text" name="chttRoomNm" id="chttRoomNm"></td>
            </tr>
            <tr>
                <th>채팅방 타입</th>
                <td><input type="text" name="chttRoomTy" id="chttRoomTy"></td>
            </tr>
            <tr>
                <th>채팅방 인원</th>
                <td><input type="text" name="chttRoomNmpr" id="chttRoomNmpr"></td>
            </tr>
            <tr>
                <th>채팅방 멤버</th>
                <td><input type="text" name="chttRoomEmplId" id="chttRoomEmplId"></td>
            </tr>
            <tr>
                <th>채팅방 생성일</th>
                <td><input type="text" name="chttRoomCreateDe" id="chttRoomCreateDe"></td>
            </tr>
        </table>
        <button type="submit">채팅방 생성하기</button>
    </form>

    <br />
    <hr>
    <br />
    <h1>채팅방 리스트 불러오기</h1>
    <form action="#" method="post">
        <!--원래는 로그인한 아이디가 자동으로 되는데, 없으니까 수동으로-->
        <input type="text" name="chttRoomEmplId1" id="chttRoomEmplId1">
        <button type="submit">불러오기</button>
    </form>
    <br />
    <form action="#">
        <input type="text" name="inviteEmplId" id="inviteEmplId">
        <button type="submit">사원 초대하기</button>
    </form>
    <br />
        <table border="1" style="width: 80%">
            <thead>
                <tr>
                    <th>채팅방 번호</th>
                    <th>채팅방 이름</th>
                    <th>채팅방 타입</th>
                    <th>채팅방 인원</th>
                    <th>채팅방 멤버</th>
                    <th>가장 마지막 대화 내역</th>
                </tr>
            </thead>
            <tbody>
            <tr>
                <td>\${채팅방 번호}</td>
                <td>\${채팅방 이름}</td>
                <td>\${채팅방 타입}</td>
                <td>\${채팅방 인원}</td>
                <td>\${채팅방 멤버}</td>
                <td>\${가장 마지막 대화 내역}</td>
            </tr>
            </tbody>
        </table>
        <br />
        <hr>
        <br />
        <h1>채팅 불러오기</h1>
        <form action="#" method="post">
            <!--원래는 로그인한 아이디가 자동으로 되는데, 없으니까 수동으로-->
            <input type="text" name="searchchattRoom" id="searchchattRoom" placeholder="채팅방번호 입력">
            <button type="submit">불러오기</button>
        </form>
        <div id="chatts">
            <table border="1" style="width: 80%">
                <tr>
                    <th>채팅방 번호</th>
                    <th>채팅방 이름</th>
                    <th>채팅방 타입</th>
                    <th>채팅방 인원</th>
                    <th>채팅 멤버 사원 아이디</th>
                    <th style="width: 35%">채팅 내용</th>
                    <th>채팅 입력 날짜</th>
                </tr>
                <tr>
                    <td>$채팅방 번호</td>
                    <td>$채팅방 이름</td>
                    <td>$채팅방 타입</td>
                    <td>$채팅방 인원</td>
                    <td>$채팅 멤버 사원 아이디</td>
                    <td>$채팅 내용</td>
                    <td>$채팅 입력 날짜</td>
                </tr>
            </table> <br/><br/>
            <form action="#" method="post">
                <label for="sendChattId">채팅방 번호</label>
                <input type="text" name="sendChattId" id="sendChattId">
                <label for="sendEmplId">보내는 사원 아이디</label>
                <input type="text" name="sendEmplId" id="sendEmplId">

                <textarea name="chttCn" id="chttCn" cols="80" rows="10"></textarea>
                <button>전송하기</button>
            </form>

        </div>
</body>
</html>