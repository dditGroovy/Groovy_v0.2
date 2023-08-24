<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
</head>
<body>
<h1>사원 관리</h1>
<h2>사원추가</h2>
<button>사원추가</button>
<!--    사원 추가 모달   -->
<div id="addEmployeeModal" class="modal">
    <div class="modal-content">
        <form action="#" method="POST">
            <input type="text" name="password" required><br />

            <label>이름</label>
            <input type="text" name="memName" required><br />

            <label>휴대폰 번호</label>
            <input type="tel" name="memTel" required><br />

            <label>이메일</label>
            <input type="email" name="memMail" required><br />

            <label>주소</label>
            <input type="text" name="memAddr" required><br />

            <label>생년월일</label>
            <input type="text" name="memBirth" required><br />

            <label>최종학력</label>
            <input type="radio" name="empEdu" id="empEdu1" checked>
            <label for="empEdu1">고졸이하</label>
            <input type="radio" name="empEdu" id="empEdu2">
            <label for="empEdu2">대졸</label>
            <input type="radio" name="empEdu" id="empEdu3">
            <label for="empEdu3">대졸이상(석사,박사)</label><br />

            <label>직급</label>
            <input type="radio" name="empPos" id="empPos1" checked>
            <label for="empPos1">사원</label>
            <input type="radio" name="empPos" id="empPos2">
            <label for="empPos2">대리</label>
            <input type="radio" name="empPos" id="empPos3">
            <label for="empPos3">과장</label>
            <input type="radio" name="empPos" id="empPos4">
            <label for="empPos4">차장</label>
            <input type="radio" name="empPos" id="empPos5">
            <label for="empPos5">팀장</label>
            <input type="radio" name="empPos" id="empPos6">
            <label for="empPos6">부장</label>
            <input type="radio" name="empPos" id="empPos7">
            <label for="empPos7">이사</label>
            <input type="radio" name="empPos" id="empPos8">
            <label for="empPos8">대표</label> <br />

            <label>부서</label>
            <select name="department" id="mem-department">
                <option value="인사">인사팀</option>
                <option value="총무">총무팀</option>
                <option value="회계">회계팀</option>
                <option value="영업">영업팀</option>
                <option value="홍보">홍보팀</option>
                <option value="관리">관리직</option>
            </select><br />

            <label>입사일</label>
            <input type="date" name="memHireDate" required><br />

            <label>사원번호</label>
            <input type="text" name="memId" required readonly>
            <button id="generateId">사원 번호 생성</button><br />

            <label>재직 상태 설정</label>
            <input type="radio" name="state" id="office" checked>
            <label for="office">재직</label>
            <input type="radio" name="state" id="leave">
            <label for="leave">휴직</label>
            <input type="radio" name="state" id="quit" >
            <label for="quit">퇴사</label>
            <br /><br />
            <button type="submit">저장</button>
            <button type="reset">지우기</button>
        </form>
    </div>
</div>
<hr />
<h2>사원 조회 필터, 검색 및 정렬 -> 프론트로 처리할건지?</h2>
<form action="backend-url-for-filter-sort" method="GET">
    <label>부서 필터</label>
    <select name="filterDep">
        <option value="인사">인사팀</option>
        <option value="총무">총무팀</option>
        <option value="회계">회계팀</option>
        <option value="영업">영업팀</option>
        <option value="홍보">홍보팀</option>
        <option value="관리">관리직</option>
    </select>
    <!-- 사원 검색 -->
    <form action="#" method="GET">
        <input type="text" name="keyword">
        <button type="submit">검색</button>
    </form>
    <label>정렬</label>
    <select name="sortBy">
        <option value="sortHire">입사일</option>
        <option value="sortabc">이름순</option>
        <option value="sortPos">직급순</option>
    </select>
    <button type="submit">정렬</button>
</form><br /><br />
<!-- 사원 목록 -->
<hr />
<h2>사원 조회 및 엑셀로 내보내기</h2>
<form action="#" method="GET">
    <button type="exportExc">엑셀로 내보내기</button>
</form>
<table border="1" style="width: 100%;">
    <thead>
    <tr>
        <th>
            <input type="checkbox" id="selectAll">
        </th>
        <th>사번</th>
        <th>이름</th>
        <th>팀</th>
        <th>직급</th>
        <th>입사일</th>
        <th>생년월일</th>
        <th>전자서명</th>
        <th>재직상태</th>
        <!-- 다른 테이블 헤더 추가 -->
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <input type="checkbox" class="selectEmp">
        </td>
        <td>1</td>
        <td>Buzz</td>
        <td>인사팀</td>
        <td>팀원</td>
        <td>2023-07-04</td>
        <td>1996-02-27</td>
        <td>등록완료</td>
        <td>재직</td>
    </tr>
    <tr>
        <td>
            <input type="checkbox" class="selectEmp">
        </td>
        <td>2</td>
        <td>Buzz</td>
        <td>인사팀</td>
        <td>팀원</td>
        <td>2023-07-04</td>
        <td>1996-02-27</td>
        <td>등록완료</td>
        <td>재직</td>
    </tr>
    </tbody>
</table>

<script>
    document.getElementById("selectAll").addEventListener("change", function() {
        const checked = document.querySelectorAll(".selectEmp");
        checked.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
    });
</script>
</body>
</html>