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
        <form name="insertEmp" action="/employee/inputEmp" method="post">
            <!-- seoju : csrf 토큰 추가-->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="enabled" value="1"/>
            <input type="hidden" name="empSign" value="noSign.jpg"/>
            <input type="hidden" name="empProfile" value="noImage.jpg"/>

            <label>비밀번호</label>
            <input type="password" name="empPw" required><br/>

            <label>이름</label>
            <input type="text" name="empName" required><br/>

            <label>휴대폰 번호</label>
            <input type="text" name="empTel" required><br/>

            <label>우편번호</label>
            <input type="text" name="empZip" required><br/>
            <label>주소</label>
            <input type="text" name="empAddr" required><br/>
            <label>상세주소</label>
            <input type="text" name="empAddrDetail" required><br/>

            <label>생년월일</label>
            <input type="date" value="2000-01-01" name="empBir" required><br/>

            <label>최종학력</label>
            <input type="radio" name="empEdu" id="empEdu1" value="0" checked>
            <label for="empEdu1">고졸이하</label>
            <input type="radio" name="empEdu" id="empEdu2" value="1">
            <label for="empEdu2">대졸</label>
            <input type="radio" name="empEdu" id="empEdu3" value="2">
            <label for="empEdu3">석사</label>
            <input type="radio" name="empEdu" id="empEdu4" value="3">
            <label for="empEdu3">박사</label><br/>

            <label>직급</label>
            <input type="radio" name="posCode" id="empPos1" value="08" checked>
            <label for="empPos1">사원</label>
            <input type="radio" name="posCode" id="empPos2" value="07">
            <label for="empPos2">대리</label>
            <input type="radio" name="posCode" id="empPos3" value="06">
            <label for="empPos3">과장</label>
            <input type="radio" name="posCode" id="empPos4" value="05">
            <label for="empPos4">차장</label>
            <input type="radio" name="posCode" id="empPos5" value="04">
            <label for="empPos5">팀장</label>
            <input type="radio" name="posCode" id="empPos6" value="03">
            <label for="empPos6">부장</label>
            <input type="radio" name="posCode" id="empPos7" value="02">
            <label for="empPos7">이사</label>
            <input type="radio" name="posCode" id="empPos8" value="01">
            <label for="empPos8">대표</label> <br/>

            <label>부서</label>
            <select name="depCode" id="emp-department">
                <option value="HRT">인사팀</option>
                <option value="GAT">총무팀</option>
                <option value="AT">회계팀</option>
                <option value="ST">영업팀</option>
                <option value="PRT">홍보팀</option>
                <option value="CEO">관리직</option>
            </select><br/>

            <label>입사일</label>
            <input type="date" value="" name="empJoinDate" id="joinDate" required><br/>
            <label>사원번호</label>
            <input type="text" name="empId" id="empId" required readonly>
            <button id="generateId" type="button">사원 번호 생성</button>
            <br/>

            <label>이메일</label>
            <input type="email" name="empMail" id="empMail" required><br/>

            <label>재직 상태 설정</label>
            <input type="radio" name="empStatus" id="office" value="0" checked>
            <label for="office">재직</label>
            <input type="radio" name="empStatus" id="leave" value="1">
            <label for="leave">휴직</label>
            <input type="radio" name="empStatus" id="quit" value="2">
            <label for="quit">퇴사</label>
            <br/><br/>
            <button type="submit" id="insert">등록</button>
            <button type="reset">지우기</button>
        </form>
    </div>
</div>
<hr/>


<h2>사원 조회 필터, 검색 및 정렬 -> 프론트로 처리할건지?</h2>
<form action="#" method="GET">
    <label>부서 필터</label>
    <select name="searchDepCode">
        <option value="HRT">인사팀</option>
        <option value="GAT">총무팀</option>
        <option value="AT">회계팀</option>
        <option value="ST">영업팀</option>
        <option value="PRT">홍보팀</option>
        <option value="CEO">관리직</option>
    </select>
    <label>
        <input type="text" name="searchName">
    </label>
    <label>정렬</label>
    <select name="sortBy" class="sortBy">
        <option value="EMP_JOIN_DATE">입사일</option>
        <option value="EMP_NAME">이름순</option>
        <option value="POS_CODE">직급순</option>
    </select>
    <button type="button" id="findEmp">검색</button>
</form>

<br/><br/>


<!-- 사원 목록 -->
<hr/>
<h2>사원 조회 및 엑셀로 내보내기</h2>
<form action="#" method="GET">
    <button type="exportExc">엑셀로 내보내기</button>
</form>
<div id="emp-list">

</div>


<script>
    $(document).ready(function () {
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
        const posCode = document.querySelectorAll("input[name=posCode]");
        const depCode = document.querySelector("select[name=depCode]");
        const empJoinDate = document.querySelector("input[name=empJoinDate]");
        const empList = document.querySelector("#emp-list");
        const enabled = document.querySelector("input[name=enabled]");


        $(document).on("click", "#findEmp", function () {
            const depCodeValue = $("select[name=searchDepCode]").val();
            const empNameValue = $("input[name=searchName]").val();
            const sortByValue = $(".sortBy").val();

            $.ajax({
                url: "/employee/findEmp",
                type: "get",
                data: {
                    depCode: depCodeValue,
                    empName: empNameValue,
                    sortBy: sortByValue
                },
                contentType: "application/json;charset=utf-8",
                success: function (res) {
                    console.log("findEmp success");
                    let code = "<table border=1>";
                    code += `<thead><tr><th><input type="checkbox" id="selectAll"></th><th>사번</th><th>이름</th><th>팀</th><th>직급</th><th>입사일</th><th>생년월일</th><th>전자서명</th><th>재직상태</th></tr></thead><tbody>`;
                    if (res.length === 0) {
                        code += "<td colspan='8'>검색 결과가 없습니다</td>";
                    } else {
                        for (let i = 0; i < res.length; i++) {
                            code += "<tr>";
                            code += `<td><input type="checkbox" class="selectEmp"></td>`;
                            code += `<td>\${res[i].empId}</td>`;
                            code += `<td>\${res[i].empName}</td>`;
                            code += `<td>\${res[i].depCode}</td>`;
                            code += `<td>\${res[i].posCode}</td>`;
                            code += `<td>\${res[i].empJoinDate}</td>`;
                            code += `<td>\${res[i].empBir}</td>`;
                            /* 개인서명 등록 유무 */
                            code += `<td>\${res[i].empSign == null ? "미등록" : "등록완료"}</td>`;
                            code += `<td>\${res[i].empStatus}</td>`;
                            code += "</tr>";
                        }
                    }
                    code += "</tbody></table>";

                    empList.innerHTML = code;
                },
                error: function (xhr, status, error) {
                    console.log("code: " + xhr.status);
                    console.log("message: " + xhr.responseText);
                    console.log("error: " + error);
                }
            });
        });

        // 입사일 선택 - value 값 변경
        empJoinDate.addEventListener("change", function () {
            joinDateVal = this.value;
            console.log(joinDateVal);
        });

        // 사번 생성 버튼 클릭 이벤트
        document.querySelector("#generateId").addEventListener("click", function () {
            // 사원 수 + 1 인덱스 처리
            $.ajax({
                url: "/employee/countEmp",
                type: 'GET',
                dataType: 'text',
                success: function (data) {
                    console.log("countEmp: ", data);
                    // 사번 생성 (idx 3글자로 설정함)
                    const dateSplit = joinDateVal.split("-");
                    let count = parseInt(data) + 1;
                    let idx = count.toString().padStart(3, '0');
                    empId.value = dateSplit[0] + dateSplit[1] + idx;
                    // 사번에 따른 사원 이메일 생성
                    if (empId.value != "") {
                        empMail.value = empId.value + "@groovy.com";
                    }
                },
                error: function (xhr) {
                    console.log(xhr.status)
                }
            })
        })


        // 등록
        document.querySelector("#insert").addEventListener("click", function () {

            /* 학력 */
            for (const edu of empEdu) {
                if (edu.checked) {
                    empEduIs = edu.value;
                    break;
                }
            }
            /* 상태 */
            for (const status of empStatus) {
                if (status.checked) {
                    empStatusIs = status.value;
                    break;
                }
            }
            /* 직급 */
            for (const pos of posCode) {
                if (pos.checked) {
                    empPosIs = pos.value;
                    break;
                }
            }
            /* 사원 VO */
            const empVO = {
                empId: empId.value,
                empPw: empPw.value,
                empName: empName.value,
                empTel: empTel.value,
                empZip: empZip.value,
                empAddr: empAddr.value,
                empAddrDetail: empAddrDetail.value,
                empBir: empBir.value,
                empEdu: empEduIs,
                posCode: empPosIs,
                depCode: depCode.value,
                empJoinDate: empJoinDate.value,
                empMail: empMail.value,
                empStatus: empStatusIs,
                enabled: enabled.value
            }

            /* 사원 데이터 중 하나라도 null 이면 전송 x alert */
            let hasNull = false;
            for (const vo in empVO) {
                if (!empVO[vo] || empVO[vo].trim() === '') {
                    hasNull = true;
                    break;
                } else {
                    hasNull = false;
                    break;
                }
            }
            if (!hasNull) {

                console.log(empVO);
            } else {
                alert("모든 항목을 입력해주세요.");
            }
        })


        /*사원 목록 불러오기 */
        function getEmpList() {
            $.ajax({
                type: "get",
                url: "/employee/loadEmp",
                dataType: "json",
                success: function (res) {
                    console.log("loadEmp success");
                    let code = "<table border=1>";
                    code += `<thead><tr><th><input type="checkbox" id="selectAll"></th><th>사번</th><th>이름</th><th>팀</th><th>직급</th><th>입사일</th><th>생년월일</th><th>전자서명</th><th>재직상태</th></tr></thead><tbody>`;
                    for (let i = 0; i < res.length; i++) {
                        code += "<tr>";
                        code += `<td><input type="checkbox" class="selectEmp"></td>`;
                        code += `<td>\${res[i].empId}</td>`;
                        code += `<td>\${res[i].empName}</td>`;
                        code += `<td>\${res[i].depCode}</td>`;
                        code += `<td>\${res[i].posCode}</td>`;
                        code += `<td>\${res[i].empJoinDate}</td>`;
                        code += `<td>\${res[i].empBir}</td>`;
                        /* 개인서명 등록 유무 */
                        code += `<td>\${res[i].empSign == null ? "미등록" : "등록완료"}</td>`;
                        code += `<td>\${res[i].empStatus}</td>`;
                        code += "</tr>";
                    }
                    code += "</tbody></table>";

                    empList.innerHTML = code;
                },
                error: function (xhr, status, error) {
                    console.log("code: " + xhr.status);
                    console.log("message: " + xhr.responseText);
                    console.log("error: " + error);
                }
            });
        }

        getEmpList();

        // 사원 리스트 - 전체 선택
        $(document).on("click", "#selectAll", function () {
            const checked = document.querySelectorAll(".selectEmp");
            checked.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });
    })
</script>
</body>
</html>