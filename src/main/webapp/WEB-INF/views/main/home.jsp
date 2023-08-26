<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="weather"></div>
<img id="weatherImg" src="" width="100px">
<script>
    window.onload = function () {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/weather/getWeather', true);
        xhr.onload = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var responseJSON = JSON.parse(xhr.responseText);
                var items = responseJSON.response.body.items.item;
                var sky = '';
                var temperature = '';
                var imgSrc = "/resources/images/";

                for (var i = 0; i < items.length; i++) {
                    var jsonObj_4 = items[i];
                    var fcstValue = jsonObj_4.fcstValue;
                    var category = jsonObj_4.category;

                    if (category === 'SKY') {
                        switch (fcstValue) {
                            case '1' :
                                sky += '맑음';
                                imgSrc += 'sun.png';
                                break;
                            case '2' :
                                sky += '비';
                                imgSrc += 'heavyRain.png';
                                break;
                            case '3' :
                                sky += '구름 ';
                                imgSrc += 'cloud.png';
                                break;
                            case '4' :
                                sky += '흐림 ';
                                imgSrc += 'cloudSun.png';
                                break;
                        }
                    }
                    if (category === 'TMP') {
                        temperature = '' + fcstValue + '℃';
                    }
                }
                document.getElementById("weather").innerHTML = sky + " " + temperature;
                document.getElementById("weatherImg").src = imgSrc;
            } else {
                console.log(xhr.status);
            }
        };
        xhr.send();
    };
</script>