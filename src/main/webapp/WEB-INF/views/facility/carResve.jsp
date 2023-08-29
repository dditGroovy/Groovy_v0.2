<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1><a href="#">회의실 예약</a></h1>
<h1><a href="#">자리 예약</a></h1>
<h1><a href="#">차량 예약</a></h1>

<hr/>
<c:forEach var="" items="" varStatus="" >
  <button type="button" onclick="setRoomNumber(this)">
    <i></i>
    <div>
      <h3>레이</h3> <!-- 차량 -->
      <p class="no">14허8538</p> <!-- 차 번호 -->
      <h4>하이패스</h4>
      <p></p> <!-- 가능/불가능 -->
      <h4>인원</h4>
      <p><span></span>명</p>
    </div>
  </button>
</c:forEach>

<hr/>
<div>
  <form action="">
    <!-- 차량 클릭시 차 번호가 name값으로 들어옴 -->
    <input type="hidden" name="vhcleNo" id="vhcleNo"/>
    <p id="today"></p>
    <p id="time"></p>
    <span>오전</span>
    <button type="button">9:00</button>
    <button type="button">11:00</button>

    <span>오후</span>
    <button type="button">01:00</button>
    <button type="button">03:00</button>
    <button type="button">05:00</button>
    <button type="button">07:00</button>

    <h3>요청사항</h3>
    <input type="text" name="" value="" placeholder="비품 등 요청 사항을 적어주세요 :)"/>

    <div>
      <p><i></i>가능</p>
      <p><i></i>불가능</p>
    </div>

    <button type="button">예약하기</button>
  </form>
</div>

<script>
  //날짜
  let today = document.querySelector("#today");

  const currentDate = new Date();
  const month = currentDate.getMonth() + 1;
  const day = currentDate.getDate();
  const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
  const dayOfWeek = daysOfWeek[currentDate.getDay()];

  let todayCode = `${month}.${day}(${dayOfWeek})`;
  today.innerText = todayCode;

  //차량 번호
  function setRoomNumber(vhcle) {
    vhcleNo = $(vhcle).find(".no").html();
    console.log(vhcleNo);
    $("#vhcleNo").attr("value", vhcleNo);
  }
</script>
