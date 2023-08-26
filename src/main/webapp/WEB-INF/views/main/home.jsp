<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="weather"></div>
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

                for (var i = 0; i < items.length; i++) {
                    var jsonObj_4 = items[i];
                    var fcstValue = jsonObj_4.fcstValue;
                    var category = jsonObj_4.category;

                    if (category === 'SKY') {
                        if (fcstValue === '1') {
                            sky += '맑음';
                        } else if (fcstValue === '2') {
                            sky += '비';
                        } else if (fcstValue === '3') {
                            sky += '구름 ';
                        } else if (fcstValue === '4') {
                            sky += '흐림 ';
                        }
                    }
                    if (category === 'TMP') {
                        temperature = '' + fcstValue + '℃';
                    }
                }
                document.getElementById("weather").innerHTML = sky + " " + temperature;
            } else {
                console.log(xhr.status);
            }
        };
        xhr.send();
    };
</script>