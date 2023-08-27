<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</script>