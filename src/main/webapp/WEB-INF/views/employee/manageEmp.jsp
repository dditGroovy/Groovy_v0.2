<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<h1>사원 관리</h1>
<h2>사원추가</h2>
<button>사원추가</button>
<!--    사원 추가 모달   -->
<div id="addEmployeeModal" class="modal">
    <div class="modal-content">
        <form name="insertEmp">
            <label>비밀번호</label>
            <input type="text" name="empPw" required><br />

            <label>이름</label>
            <input type="text" name="empName" required><br />

            <label>휴대폰 번호</label>
            <input type="tel" name="empTel" required><br />

            <label>우편번호</label>
            <input type="text" name="empZip" required><br />
            <label>주소</label>
            <input type="text" name="empAddr" required><br />
            <label>상세주소</label>
            <input type="text" name="empAddrDetail" required><br />

            <label>생년월일</label>
            <input type="text" name="empBir" required><br />

            <label>최종학력</label>
            <input type="radio" name="empEdu" id="empEdu1" value="0" checked>
            <label for="empEdu1">고졸이하</label>
            <input type="radio" name="empEdu" id="empEdu2" value="1">
            <label for="empEdu2">대졸</label>
            <input type="radio" name="empEdu" id="empEdu3" value="2">
            <label for="empEdu3">석사</label>
            <input type="radio" name="empEdu" id="empEdu4" value="3">
            <label for="empEdu3">박사</label><br />

            <label>직급</label>
            <input type="radio" name="empPos" id="empPos1" value="08" checked>
            <label for="empPos1">사원</label>
            <input type="radio" name="empPos" id="empPos2" value="07">
            <label for="empPos2">대리</label>
            <input type="radio" name="empPos" id="empPos3" value="06">
            <label for="empPos3">과장</label>
            <input type="radio" name="empPos" id="empPos4" value="05">
            <label for="empPos4">차장</label>
            <input type="radio" name="empPos" id="empPos5" value="04">
            <label for="empPos5">팀장</label>
            <input type="radio" name="empPos" id="empPos6" value="03">
            <label for="empPos6">부장</label>
            <input type="radio" name="empPos" id="empPos7" value="02">
            <label for="empPos7">이사</label>
            <input type="radio" name="empPos" id="empPos8" value="01">
            <label for="empPos8">대표</label> <br />

            <label>부서</label>
            <select name="empDep" id="emp-department">
                <option value="HRT">인사팀</option>
                <option value="GAT">총무팀</option>
                <option value="AT">회계팀</option>
                <option value="ST">영업팀</option>
                <option value="PRT">홍보팀</option>
                <option value="MAG">관리직</option>
            </select><br />

            <label>입사일</label>
            <input type="date" value="2018-04-09" name="joinDate" id="joinDate" required><br />

            <label>사원번호</label>
            <input type="text" name="empId" id="empId" required readonly>
            <button id="generateId" type="button">사원 번호 생성</button><br />

            <label>이메일</label>
            <input type="email" name="empMail" id="empMail" required><br />

            <label>재직 상태 설정</label>
            <input type="radio" name="empStatus" id="office" value="0" checked>
            <label for="office">재직</label>
            <input type="radio" name="empStatus" id="leave" value="1">
            <label for="leave">휴직</label>
            <input type="radio" name="empStatus" id="quit" value="2">
            <label for="quit">퇴사</label>
            <br /><br />
            <button type="button" id="insert">등록</button>
            <button type="reset">지우기</button>
        </form>
    </div>
</div>
<hr />
<h2>사원 조회 필터, 검색 및 정렬 -> 프론트로 처리할건지?</h2>
<form action="backend-url-for-filter-sort" method="GET">
    <label>부서 필터</label>
    <select name="filterDep">
        <option value="HRT">인사팀</option>
        <option value="GAT">총무팀</option>
        <option value="AT">회계팀</option>
        <option value="ST">영업팀</option>
        <option value="PRT">홍보팀</option>
        <option value="MAG">관리직</option>
    </select>
    <!-- 사원 검색 -->
    <form action="#" method="GET">
        <input type="text" name="keyword">
        <button type="submit">검색</button>
    </form>
    <label>정렬</label>
    <select name="sortBy">
        <option value="sortJoin">입사일</option>
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
    let joinDateVal = undefined;
    let empEduIs = undefined;
    let empStatusIs = undefined;
    let empPosIs = undefined;
    const empId = document.querySelector("#empId");
    const empPw = document.querySelector("input[name=empPw]");
    const empName = document.querySelector("input[name=empName]");
    const empTel = document.querySelector("input[name=empTel]");
    const empMail = document.querySelector("input[name=empMail]");
    const empZip = document.querySelector("input[name=empZip]");
    const empAddr = document.querySelector("input[name=empAddr]");
    const empAddrDetail = document.querySelector("input[name=empAddr]");
    const empEdu = document.querySelectorAll("input[name=empEdu]");
    const empBir = document.querySelector("input[name=empBir]");
    const empStatus = document.querySelectorAll("input[name=empStatus]");
    const empPos = document.querySelectorAll("input[name=empPos]");
    const empDep = document.querySelector("select[name=filterDep]");
    const empJoinDate = document.querySelector("input[name=joinDate]");


    document.getElementById("selectAll").addEventListener("change", function() {
        const checked = document.querySelectorAll(".selectEmp");
        checked.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
    });

    empJoinDate.addEventListener("change",function(){
        joinDateVal = this.value;
        console.log(joinDateVal);
    });

    document.querySelector("#generateId").addEventListener("click",function(){
        const dateSplit = joinDateVal.split("-");
        const depCode = empDep.value;

        //ajax 처리 하고 idx에 담아주세여
        let idx = "001";
        empId.value = `${dateSplit[0]}${dateSplit[1]}${idx}`;

        if(empId.value != ""){
            empMail.value = empId.value + "@groovy.com";
        }
    })


    // 등록
    document.querySelector("#insert").addEventListener("click",function(){

        /* 학력 */
        for (const edu of empEdu) {
            if(edu.checked){
                empEduIs = edu.value;
                break;
            }
        }
        /* 상태 */
        for (const status of empStatus) {
            if(status.checked){
                empStatusIs = status.value;
                break;
            }
        }
        /* 직급 */
        for (const pos of empPos) {
            if(pos.checked){
                empPosIs = pos.value;
                break;
            }
        }
        /* 사원 VO */
        const empVO = {
            empId : empId.value,
            empName : empName.value,
            empTel : empTel.value,
            empZip : empZip.value,
            empAddr : empAddr.value,
            empAddrDetail : empAddrDetail.value,
            empBir : empBir.value,
            empEdu : empEduIs,
            empPos : empPosIs,
            empDep : empDep.value,
            empJoinDate : empJoinDate.value,
            empMail : empMail.value,
            empStatus : empStatusIs
        }

        /* 사원 데이터 중 하나라도 null 이면 전송 x alert */
        let hasNull = false;
        for (const vo in empVO) {
            if (!empVO[vo] || empVO[vo].trim() === '') {
                hasNull = true;
                break;
            }else {
                hasNull = false;
                break;
            }
        }
        if(!hasNull){
            /* ajax */
            console.log(empVO);
        }else {
            alert("모든 항목을 입력해주세요.");
        }
    })
</script>
</body>
</html>