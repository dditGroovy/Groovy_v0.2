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
    <form action="#" method="post">
        <!-- seoju : csrf 토큰 추가-->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <%--        <input type="hidden" name="enabled" value="1"/>--%>
        <label>사원번호</label>
        <input type="text" name="emplId" id="emplId" value="${empVO.emplId}" required readonly>

        <label>비밀번호</label>
        <input type="password" name="emplPassword" value="${empVO.emplPassword}" required readonly><br/>

        <label>이름</label>
        <input type="text" name="emplNm" value="${empVO.emplNm}" required readonly><br/>

        <label>휴대폰 번호</label>
        <input type="text" name="emplTelno" value="${empVO.emplTelno}" required readonly><br/>

        <label>우편번호</label>
        <input type="text" name="emplZip" value="${empVO.emplZip}" required readonly><br/>
        <label>주소</label>
        <input type="text" name="emplAdres" value="${empVO.emplAdres}" required readonly><br/>
        <label>상세주소</label>
        <input type="text" name="emplDetailAdres" value="${empVO.emplDetailAdres}" required readonly><br/>

        <label>생년월일</label>
        <input type="date" name="emplBrthdy" value="${empVO.emplBrthdy}" required readonly><br/>


        <%-- commonCodeLastAcdmcr --%>
        <label>최종학력</label>
        <input type="radio" name="commonCodeLastAcdmcr" id="empEdu1"
               value="0" ${empVO.commonCodeLastAcdmcr == '0' ? 'checked' : ''}>
        <label for="empEdu1">고졸이하</label>
        <input type="radio" name="commonCodeLastAcdmcr" id="empEdu2"
               value="1" ${empVO.commonCodeLastAcdmcr == '1' ? 'checked' : ''}>
        <label for="empEdu2">대졸</label>
        <input type="radio" name="commonCodeLastAcdmcr" id="empEdu3"
               value="2" ${empVO.commonCodeLastAcdmcr == '2' ? 'checked' : ''}>
        <label for="empEdu3">석사</label>
        <input type="radio" name="commonCodeLastAcdmcr" id="empEdu4"
               value="3" ${empVO.commonCodeLastAcdmcr == '3' ? 'checked' : ''}>
        <label for="empEdu4">박사</label><br/>

        <%-- commonCodeClsf --%>
        <label>직급</label>
        <input type="radio" name="commonCodeClsf" id="empPos1"
               value="08" ${empVO.commonCodeClsf == '08' ? 'checked' : ''}>
        <label for="empPos1">사원</label>
        <input type="radio" name="commonCodeClsf" id="empPos2"
               value="07" ${empVO.commonCodeClsf == '07' ? 'checked' : ''}>
        <label for="empPos2">대리</label>
        <input type="radio" name="commonCodeClsf" id="empPos3"
               value="06" ${empVO.commonCodeClsf == '06' ? 'checked' : ''}>
        <label for="empPos3">과장</label>
        <input type="radio" name="commonCodeClsf" id="empPos4"
               value="05" ${empVO.commonCodeClsf == '05' ? 'checked' : ''}>
        <label for="empPos4">차장</label>
        <input type="radio" name="commonCodeClsf" id="empPos5"
               value="04" ${empVO.commonCodeClsf == '04' ? 'checked' : ''}>
        <label for="empPos5">팀장</label>
        <input type="radio" name="commonCodeClsf" id="empPos6"
               value="03" ${empVO.commonCodeClsf == '03' ? 'checked' : ''}>
        <label for="empPos6">부장</label>
        <input type="radio" name="commonCodeClsf" id="empPos7"
               value="02" ${empVO.commonCodeClsf == '02' ? 'checked' : ''}>
        <label for="empPos7">이사</label>
        <input type="radio" name="commonCodeClsf" id="empPos8"
               value="01" ${empVO.commonCodeClsf == '01' ? 'checked' : ''}>
        <label for="empPos8">대표</label><br/>

        <%-- commonCodeDept --%>
        <%--        <c:if test="${data.condition=='신규도서'}">checked</c:if>--%>
        <label>부서</label>
        <select name="commonCodeDept" id="emp-department">
            <option value="HRT" ${empVO.commonCodeDept == 'HRT' ? 'selected' : ''}>인사팀</option>
            <option value="GAT" ${empVO.commonCodeDept == 'GAT' ? 'selected' : ''}>총무팀</option>
            <option value="AT" ${empVO.commonCodeDept == 'AT' ? 'selected' : ''}>회계팀</option>
            <option value="ST" ${empVO.commonCodeDept == 'ST' ? 'selected' : ''}>영업팀</option>
            <option value="PRT" ${empVO.commonCodeDept == 'PRT' ? 'selected' : ''}>홍보팀</option>
            <option value="CEO" ${empVO.commonCodeDept == 'CEO' ? 'selected' : ''}>관리직</option>
        </select><br/>

        <label>입사일</label>
        <input type="date" value="" name="emplEncpn" id="joinDate" value="${empVO.emplEncpn}" required readonly><br/>


        <label>이메일</label>
        <input type="email" name="emplEmail" id="emplEmail" value="${empVO.emplEmail}" required readonly><br/>

        <label>재직 상태 설정</label>
        <input type="radio" name="commonCodeHffcSttus" id="office"
               value="0" ${empVO.commonCodeHffcSttus == '0' ? 'checked' : ''}>
        <label for="office">재직</label>
        <input type="radio" name="commonCodeHffcSttus" id="leave"
               value="1" ${empVO.commonCodeHffcSttus == '1' ? 'checked' : ''}>
        <label for="leave">휴직</label>
        <input type="radio" name="commonCodeHffcSttus" id="quit"
               value="2" ${empVO.commonCodeHffcSttus == '2' ? 'checked' : ''}>
        <label for="quit">퇴사</label>
        <br/><br/>
        <button type="button" id="btn-modify">수정</button>
        <button type="submit" id="btn-save" hidden="hidden">저장</button>
        <button type="button" id="btn-list" disabled>목록</button>
    </form>

</div>


<script>
    $(function () {
        $("#btn-modify").on("click", function () {
            // 모든 인풋 요소 readonly 속성 제거
            let inputElements = $("#empDetail form input");
            inputElements.each(function () {
                $(this).removeAttr("readonly");
            });

            // 저장(submit)버튼 활성화
            let saveBtn = $("#btn-save").removeAttr("hidden");

            //수정 버튼 숨김
            $(this).hide();


        })
    });

</script>
</body>
</html>
