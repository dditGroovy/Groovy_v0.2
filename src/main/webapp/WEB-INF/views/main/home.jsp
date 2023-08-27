<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>유저이름 : \${}</h2>

<form>
    <button type="button" id="work" data-io="0">출근하기</button>
    <p id="workTime">00:00</p>
    <br />
    <button type="button" id="leave" data-io="1">퇴근하기</button>
    <p id="leaveTime">00:00</p>
    총 근무 시간 : <span id="totalWorkTime"></span>
</form>

<hr />

<h3>해야 할 일</h3>
<table border="1" style="width: 50%;">
    <thead>
    <tr>
        <th>업무결과</th>
        <th>업무제목</th>
        <th>마감날짜</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>진행전</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    <tr>
        <td>진행중</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    <tr>
        <td>완료</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    </tbody>
</table>
<br /><hr />

<h3>공지사항</h3>
<table border="1" style="width: 50%;">
    <thead>
    <tr>
        <th>카테고리</th>
        <th>제목</th>
        <th>날짜</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>휴가</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    <tr>
        <td>일정</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    </tbody>
</table>
<br /><hr />

<h3>결재함</h3>
<table border="1" style="width: 50%;">
    <thead>
    <tr>
        <th>카테고리</th>
        <th>제목</th>
        <th>날짜</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>휴가</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    <tr>
        <td>일정</td>
        <td>마인드풀니스:현대인의 스트레스 해소 비법</td>
        <td>2023-07-30</td>
    </tr>
    </tbody>
</table>
<br /><hr />
<h3>오늘의 식단</h3>
<table border="1" style="width: 50%;">
    <thead>
    <tr>
        <th>밥</th>
        <th>국</th>
        <th>반찬1</th>
        <th>반찬2</th>
        <th>반찬3</th>
        <th>디저트</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>흰밥</td>
        <td>참치김치찌개</td>
        <td>제육볶음</td>
        <td>어묵볶음</td>
        <td>계란말이</td>
        <td>식혜</td>
    </tr>
    </tbody>
</table>
<br /><hr />
<h3>이번달 생일</h3>
<table border="1" style="width: 50%;">
    <thead>
    <tr>
        <th>사원번호</th>
        <th>사원이름</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>202308001</td>
        <td>강서주</td>
    </tr>
    <tr>
        <td>202308001</td>
        <td>강서주</td>
    </tr>
    </tbody>
</table>
<br /><hr />
<h3>날씨</h3>
<div id="weather"></div>
<img id="weatherImg" src="">
<script>
    $(document).ready(function () {
        $.ajax({
            url: '/weather/getWeather',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                const items = data.response.body.items.item;
                let sky = '';
                let temperature = '';
                let imgSrc = "/resources/images/";

                for (let i = 0; i < items.length; i++) {
                    let jsonObj = items[i];
                    let fcstValue = jsonObj.fcstValue;
                    let category = jsonObj.category;

                    if (category === 'SKY') {
                        switch (fcstValue) {
                            case '1':
                                sky += '맑음';
                                imgSrc += 'sun.png';
                                break;
                            case '2':
                                sky += '비';
                                imgSrc += 'heavyRain.png';
                                break;
                            case '3':
                                sky += '구름 ';
                                imgSrc += 'cloud.png';
                                break;
                            case '4':
                                sky += '흐림 ';
                                imgSrc += 'cloudSun.png';
                                break;
                        }
                    }
                    if (category === 'TMP') {
                        temperature = '' + fcstValue + '℃';
                    }
                }
                $('#weather').html(sky + " " + temperature);
                $('#weatherImg').attr('src', imgSrc);
            },
            error: function (xhr) {
                console.log(xhr.status);
            }
        });
    });
    document.addEventListener("DOMContentLoaded", () => {
        const btnWork = document.querySelector("#work");
        const btnLeave = document.querySelector("#leave");
        const workTime = document.querySelector("#workTime");
        const leaveTime = document.querySelector("#leaveTime");
        let workTimeData = undefined;
        let leaveTimeData = undefined;
        let totalWorkTime = undefined;

        function formatDate(date) {
            const options = {
                year: "numeric",
                month: "2-digit",
                day: "2-digit",
                weekday: "short",
            };

            return date.toLocaleString("ko-KR", options).replace(/[()]/g, '');
        }
        let recordDate= (date) => {
            const currentDate = formatDate(date);
            const regex = /(\d{4})\. (\d{2})\. (\d{2})\. (\S+)/;
            const matches = currentDate.match(regex);
            if (matches) {
                const year = parseInt(matches[1]);
                const month = parseInt(matches[2]) - 1;
                const day = parseInt(matches[3]);
                const dayOfWeek = matches[4];

                const dateObj = new Date(year, month, day);
                return [dateObj, dayOfWeek]; // 배열로 반환
            }
        }
        const today = new Date();
        const recordToday = recordDate(today);

        console.log(today, recordToday);
        //  출근버튼을 눌렀을 때
        btnWork.addEventListener("click",() => {
            workTimeData = formatTime(new Date());
            workTime.innerHTML= workTimeData;
            /* 버튼을 눌렀을 때 서버로 데이터 전송 */
            /* $.ajax({
                type : "post",
                //url 적어주세요
                url : "#",
                data : JSON.stringify({
                    employee : "202308001",
                    date : today[0],
                    day : today[1],
                    status : 1
                }),
                dataType : "json",
                contentType : "application/json;charset-utf-8",
                success : function(rslt){
                    console.log("결과 확인 : "+ rslt);
                    //workTime.innerHTML= workTimeData;
                },
                error: function (xhr, status, error) {
                    console.log("code: " + xhr.status)
                    console.log("message: " + xhr.responseText)
                    console.log("error: " + error);
                }
            }) */

        })
        /* 퇴근 버튼을 눌렀을 때 */
        btnLeave.addEventListener("click",() => {
            leaveTimeData = formatTime(new Date());
            const totalWorkTime = calculateTotalWorkTime("09:00", "18:20");
            leaveTime.innerHTML= leaveTimeData;
            document.querySelector("#totalWorkTime").innerHTML = totalWorkTime

            /* 버튼을 눌렀을 때 서버로 데이터 전송 */
            /* $.ajax({
                type : "post",
                // url 적어주세요
                url : "#",
                data : JSON.stringify({
                    employee : "202308001",
                    date : today[0],
                    day : today[1],
                    status : 0,
                    time : totalWorkTime
                }),
                dataType : "json",
                contentType : "application/json;charset-utf-8",
                success : function(rslt){
                    console.log("결과 확인 : "+ rslt);
                    //leaveTime.innerHTML= leaveTimeData;

                },
                error: function (xhr, status, error) {
                    console.log("code: " + xhr.status)
                    console.log("message: " + xhr.responseText)
                    console.log("error: " + error);
                }
            }) */

        })
        calculateTotalWorkTime = (workTimeData, leaveTimeData) => {
            const [startHour, startMinute] = workTimeData.split(":").map(Number);
            const [endHour, endMinute] = leaveTimeData.split(":").map(Number);
            const totalMinutes = (endHour * 60 + endMinute) - (startHour * 60 + startMinute);
            const totalHours = Math.floor(totalMinutes / 60);
            return totalHours;
        }
        function formatTime(currentTime){
            const hours = currentTime.getHours().toString().padStart(2, "0");
            const minutes = currentTime.getMinutes().toString().padStart(2, "0");
            const time = hours + ":" + minutes;
            return time;
        }

        /*  */
    })
</script>