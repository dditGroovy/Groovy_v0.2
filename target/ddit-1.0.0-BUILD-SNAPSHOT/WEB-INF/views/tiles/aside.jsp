<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<div id="sideBar">
  <header id="header">
    <div id="profile">
      <img id="userProfile" src = "http://placehold.it/120X120" />
    </div>
    <div class="user">
      <div class="user-info">

        <sec:authorize access="isAuthenticated()">
          <sec:authentication property="principal" var="CustomUser" />
          <span id="userName" class="font-24 font-md" >${CustomUser.employeeVO.emplNm}</span>

        <span id="userHierarchy" class="font-14 font-md">${CustomUser.employeeVO.commonCodeClsf}</span></sec:authorize>
      </div>
      <div class="user-service">
        <ul class="font-11 font-reg">
          <li><i class="ic-mail icon"></i><span>메일</span><a href="#" id="linkMail">8</a></li>
          <li><a href="#" id="settingMyinfo">내 정보 관리</a></li>
        </ul>
      </div>
      <div class="btn-wrap">
        <button id="logout" class="font-11 btn-free-white color-font-md">로그아웃<i class="ic-logout icon"></i></button>
        <button id="videoConference" class="font-11 btn-free-white"><a href="/employee/manageEmp"><span class="btn-detail">사원관리</span></a></button>
        <button id="reservation" class="font-11 btn-free-white"><span class="btn-detail">예약</span></button>
      </div>
    </div>
  </header>
  <nav id="nav">
    <div class="personal">
      <span class="nav-cate">개인</span>
      <ul>
        <li class="nav-list"><a href="/main/home" class="active"><i class="icon i-board"></i>홈</a></li>
        <li class="nav-list"><a href="/employee/commute"><i class="icon icon2"></i>출 · 퇴근</a></li>
        <li class="nav-list"><a href="/employee/myVacation"><i class="icon icon3"></i>휴가 · 급여</a></li>
        <li class="nav-list"><a href="#"><i class="icon icon4"></i>내 할 일</a></li>
        <li class="nav-list"><a href="#"><i class="icon icon5"></i>결재함</a></li>
      </ul>
    </div>
    <div class="team">
      <span class="nav-cate">팀</span>
      <ul>
        <li class="nav-list"><a href="#"><i class="icon icon6"></i>캘린더</a></li>
        <li class="nav-list"><a href="#"><i class="icon icon7"></i>팀 커뮤니티</a></li>
      </ul>
    </div>
    <div class="company">
      <span class="nav-cate">회사</span>
      <ul>
        <li class="nav-list"><a href="${pageContext.request.contextPath}/common/loadNoticeList"><i class="icon icon8"></i>공지사항 (완료)</a></li>
        <li class="nav-list"><a href="${pageContext.request.contextPath}/common/club"><i class="icon icon9"></i>동호회</a></li>
        <li class="nav-list"><a href="${pageContext.request.contextPath}/common/loadOrgChart"><i class="icon icon10"></i>조직도 (완료)</a></li>
      </ul>
    </div>
  </nav>

</div>
