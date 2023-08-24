<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .box-sort-search {
        margin-top: 18px;
        margin-bottom: 32px;
        display: flex;
        justify-content: flex-end;
    }

    /*select {*/
    /*    margin-right: 24px;*/
    /*    width: 148px;*/
    /*    height: 32px;*/
    /*}*/

    .box-search {
        width: 560px;
        height: 64px;
    }


</style>
<h1 class="font-36 font-md color-font-high">공지사항</h1>
<div class="box-sort-search">
    <select name="sortOptions" id="">
        <option value="최신순">최신순</option>
        <option value="최신순">최신순</option>
        <option value="최신순">최신순</option>
    </select>
    <div class="box-search border-radius-24">
        <i class="icon icon-search-24"></i>
        <input type="text" placeholder="검색어를 입력하세요." size="20" class="input-search">
        <input type="button" value="검색">
    </div>
</div>
<div class="box-notice-all">
    <c:forEach var="eachMonth" begin="1" end="12"> <!-- 12: 공지사항 개수(length) -->
        <div class="box-notice-one">
            <p><i class="icon icon-category-40"></i></p>
            <p>건강한 가정을 위한 실용적인 청소 요령</p>
            <p>Lorem ipsum dolor sit amet consectetur. Nibh vitae adipiscing non aliquam porttitor eget. Laoreet
                scelerisque rhoncus sed quisque praesent ornare nibh risus commodo. Mauris imperdiet viverra varius
                quam. Quis vitae molestie pretium augue adipiscing vel urna.</p>
        </div>
        <div class="box-view-date">
            <div class="box-view">
                <i class="icon icon-view-24"></i>
                <span class="text-view-count">15</span> view
            </div>
            <div class="box-date">
                2023-08-13
            </div>
        </div>
    </c:forEach>
</div>