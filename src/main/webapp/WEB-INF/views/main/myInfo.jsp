<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .toggle {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .toggle input {
        display: none;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        transition: 0.4s;
        border-radius: 34px;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: 0.4s;
        border-radius: 50%;
    }

    input:checked + .slider {
        background-color: #2196F3;
    }

    input:checked + .slider:before {
        transform: translateX(26px);
    }
</style>
<form action="">
    <h2>내 정보 관리</h2>
    <h3>프로필 변경</h3>
    <p>프로필 사진을 변경합니다.</p>
    <label for="empProflPhotoFile">사진</label> <!-- 톱니 모양 -->
    <input type="file" name="empProflPhotoFile" id="empProflPhotoFile" style="display: none;"/>
    <button type="button" id="pCancel">취소</button>
    <button type="button" id="pSave">저장</button>
</form>

<hr/>
<form action="">
    <h2>내 정보 관리</h2>
    <h3>비밀번호 변경</h3>
    <label for="emplPassword">현재 비밀번호 입력</label>
    <input type="password" name="emplPassword" id="emplPassword" placeholder="현재 비밀번호를 입력하세요."/>
    <label for="emplPasswordCheck1">새로운 비밀번호 입력</label>
    <input type="password" name="emplPasswordCheck1" id="emplPasswordCheck1" placeholder="새로운 비밀번호를 입력하세요."/>
    <input type="password" name="emplPasswordCheck2" id="" placeholder="새로운 비밀번호를 입력하세요."/>

</form>

<hr/>
<form action="">
    <h3>정보 변경</h3>
    <label for="emplEmail">이메일</label>
    <input type="text" name="emplEmail" id="emplEmail" placeholder="kim123@naver.com"/>
    <label for="emplEmail">휴대폰 번호</label>
    <input type="text" name="emplTelNo" id="emplTelNo" placeholder="010-1234-1234"/>
    <label for="emplZip">우편번호</label> <!-- 나중에 display:none -->
    <input type="text" name="emplZip" id="emplZip" placeholder="12345"/>
    <label for="emplAdres">주소</label>
    <input type="text" name="emplAdres" id="emplAdres" placeholder="경기도 성남시 분당구 새마을로 38"/>
    <button type="button" id="iCancel">취소</button>
    <button type="button" id="iSave">저장</button>
</form>

<hr/>
<form action="">
    <h2>내 정보 관리</h2>
    <h3>서명 설정/변경</h3>
    <p>전자결재에 필요한 서명을 설정 · 변경합니다.</p>
    <div id="emplSignFilePreview"></div>
    <!-- 미리보기 -->
    <p>서명</p>
    <label for="emplSignFile">등록</label> <!-- 등록 버튼 -->
    <input type="file" name="emplSignFile" id="emplSignFile" style="display: none;"/>
    <button type="button">삭제</button>

    <button type="button" id="sCancel">취소</button>
    <button type="button" id="sSave">저장</button>
</form>

<hr/>

<form action="">
    <h3>알림 설정</h3>
    <p>알림 범위를 설정합니다.</p>

    <!-- 각 요소의 id, for 임시로 넣어 놓음 -->
    <div>
        <p>업무 요청</p>
        <label class="toggle" for="a">
            <input type="checkbox" id="a">
            <span class="slider"></span>
        </label>
    </div>
    <div>
        <p>팀 커뮤니티</p>
        <label class="toggle" for="b">
            <input type="checkbox" id="b">
            <span class="slider"></span>
        </label>
    </div>
    <div>
        <p>공지사항</p>
        <label class="toggle" for="c">
            <input type="checkbox" id="c">
            <span class="slider"></span>
        </label>
    </div>
    <div>
        <p>전자결재</p>
        <label class="toggle" for="d">
            <input type="checkbox" id="d">
            <span class="slider"></span>
        </label>
    </div>
    <div>
        <p>일정</p>
        <label class="toggle" for="e">
            <input type="checkbox" id="e">
            <span class="slider"></span>
        </label>
    </div>
    <div>
        <p>채팅 방 개설 알림</p>
        <label class="toggle" for="f">
            <input type="checkbox" id="f">
            <span class="slider"></span>
        </label>
    </div>
    <div>
        <p>메일 수신 알림</p>
        <label class="toggle" for="g">
            <input type="checkbox" id="g">
            <span class="slider"></span>
        </label>
    </div>
    <button type="button">취소</button>
    <button type="button">저장</button>
</form>