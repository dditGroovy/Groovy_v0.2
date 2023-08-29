<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
</head>
<body>
<h1>사원 관리</h1>
<h2>사원정보</h2>
<!--    사원 추가 모달   -->
<div id="empDetail">
    <form action="#">
        <label>비밀번호</label>
        <input type="password" name="empPw" required readonly><br />

        <label>이름</label>
        <input type="text" name="empName" required readonly><br />

        <label>휴대폰 번호</label>
        <input type="text" name="empTel" required readonly><br/>

        <label>우편번호</label>
        <input type="text" name="empZip" required readonly><br />
        <label>주소</label>
        <input type="text" name="empAddr" required readonly><br />
        <label>상세주소</label>
        <input type="text" name="empAddrDetail" required readonly><br />

        <label>생년월일</label>
        <input type="date" value="2000-01-01" name="empBir" required readonly><br/>

        <label>최종학력</label>
        <input type="radio" name="empEdu" id="empEdu1" value="0" checked disabled>
        <label for="empEdu1">고졸이하</label>
        <input type="radio" name="empEdu" id="empEdu2" value="1" disabled>
        <label for="empEdu2">대졸</label>
        <input type="radio" name="empEdu" id="empEdu3" value="2" disabled>
        <label for="empEdu3">석사</label>
        <input type="radio" name="empEdu" id="empEdu4" value="3" disabled>
        <label for="empEdu3">박사</label><br />

        <label>직급</label>
        <input type="radio" name="posCode" id="empPos1" value="08" checked disabled>
        <label for="empPos1">사원</label>
        <input type="radio" name="posCode" id="empPos2" value="07" disabled>
        <label for="empPos2">대리</label>
        <input type="radio" name="posCode" id="empPos3" value="06" disabled>
        <label for="empPos3">과장</label>
        <input type="radio" name="posCode" id="empPos4" value="05" disabled>
        <label for="empPos4">차장</label>
        <input type="radio" name="posCode" id="empPos5" value="04" disabled>
        <label for="empPos5">팀장</label>
        <input type="radio" name="posCode" id="empPos6" value="03" disabled>
        <label for="empPos6">부장</label>
        <input type="radio" name="posCode" id="empPos7" value="02" disabled>
        <label for="empPos7">이사</label>
        <input type="radio" name="posCode" id="empPos8" value="01" disabled>
        <label for="empPos8">대표</label> <br />

        <label>부서</label>
        <select name="depCode" id="emp-department" disabled>
            <option value="HRT">인사팀</option>
            <option value="GAT">총무팀</option>
            <option value="AT">회계팀</option>
            <option value="ST">영업팀</option>
            <option value="PRT">홍보팀</option>
            <option value="MAG">관리직</option>
        </select><br />

        <label>입사일</label>
        <input type="date" value="2018-04-09" name="joinDate" id="joinDate" required readonly><br />

        <label>사원번호</label>
        <input type="text" name="empId" id="empId" required readonly><br />

        <label>이메일</label>
        <input type="email" name="empMail" id="empMail" required readonly><br />

        <label>재직 상태 설정</label>
        <input type="radio" name="empStatus" id="office" value="0" checked disabled>
        <label for="office">재직</label>
        <input type="radio" name="empStatus" id="leave" value="1" disabled>
        <label for="leave">휴직</label>
        <input type="radio" name="empStatus" id="quit" value="2" disabled>
        <label for="quit">퇴사</label>
        <br /><br />
        <button type="button" id="btn-modify">수정</button>
        <button type="button" id="btn-save">저장</button>
        <button type="button" id="btn-list" disabled>목록</button>
    </form>

</div>



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
    const posCode = document.querySelectorAll("input[name=posCode]");
    const depCode = document.querySelector("select[name=depCode]");
    const empJoinDate = document.querySelector("input[name=joinDate]");
    const modifyBtn = document.querySelector("#btn-modify");
    const saveBtn = document.querySelector("#btn-save");
    const listBtn = document.querySelector("#btn-list");
    saveBtn.style.display = "none";

    modifyBtn.addEventListener("click",function(){
        let input = document.querySelectorAll("input");
        input.forEach(element => {
            if(element.getAttribute("name") != "empId" && element.getAttribute("name") != "empMail"){
                element.readOnly = false;
            }
            if(element.getAttribute("type") == "radio"){
                element.disabled = false;
            }
        });
        saveBtn.style.display = "inline-block";
        this.style.display = "none";
        let selection = document.querySelector("select");
        selection.disabled = false;

    });
    saveBtn.addEventListener("click",function(){

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
        for (const pos of posCode) {
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
            posCode : empPosIs,
            depCode : depCode.value,
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
            console.log(empVO);

            /* ajax */
            $.ajax({
                type : "post",
                /* url 적어주세요 */
                url : "#",
                data : JSON.stringify(empVO),
                dataType : "text",
                contentType : "application/json;charset-utf-8",
                success : function(rslt){
                    console.log("결과 확인 : "+ rslt);
                },
                error: function (xhr, status, error) {
                    console.log("code: " + xhr.status)
                    console.log("message: " + xhr.responseText)
                    console.log("error: " + error);
                }
            })

            let input = document.querySelectorAll("input");
            input.forEach(element => {
                if(element.getAttribute("name") != "empId" && element.getAttribute("name") != "empMail"){
                    element.readOnly = true;
                }
                if(element.getAttribute("type") == "radio"){
                    element.disabled = true;
                }
            });

            let selection = document.querySelector("select");
            selection.disabled = true;
            this.style.display = "none";
            modifyBtn.style.display = "inline-block";
        }else {
            alert("모든 항목을 입력해주세요.");
        }
    })
    listBtn.addEventListener("click",() => {
        window.location.href = "manageEmployee.jsp"
    })


</script>
</body>
</html>
