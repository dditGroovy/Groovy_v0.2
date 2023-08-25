<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .box-sort-search {
        margin-top: calc((18 / var(--vh)) * 100vh);
        margin-bottom: calc((32 / var(--vh)) * 100vh);
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    select {
        margin-right: calc((24 / var(--vw)) * 100vw);
        width: calc((148 / var(--vw)) * 100vw);
        height: var(--vh-32);
        border: 1px solid var(--color-stroke);
    }

    .box-search {
        width: calc((560 / var(--vw)) * 100vw);
        height: var(--vh-64);
        padding-left: var(--vw-24);
        padding-right: var(--vw-24);
        display: flex;
        justify-content: space-between;
        align-items: center;
        border: 1px solid var(--color-stroke);
    }

    .icon-search-24 {
        width: var(--vw-18);
        height: var(--vw-18);
    }

    .input-search {
        border: none;
    }

    .btn-search {
        width: calc((87 / var(--vw)) * 100vw);
        height: calc((37 / var(--vh)) * 100vh);
    }

    .box-notices {
        display: grid;
        grid-template-columns: repeat(3, calc((476 / var(--vw)) * 100vw));
        grid-gap: var(--vw-24) var(--vh-24);
    }

    .box-notice {
        width: calc((476 / var(--vw)) * 100vw);
        height: calc((346 / var(--vh)) * 100vh);

    }


</style>
<h1 class="font-36 font-md color-font-high">공지사항</h1>
<div class="box-sort-search">
    <select name="sortOptions" id="" class="stroke">
        <option value="최신순">최신순</option>
        <option value="오래된순">오래된순</option>
    </select>
    <div class="box-search border-radius-24 stroke">
        <i class="icon icon-search-24"></i>
        <input type="text" placeholder="검색어를 입력하세요." size="50" class="input-search">
        <input type="button" value="검색" class="btn-free-blue btn-search">
    </div>
</div>
<div class="box-notices">
        <c:forEach var="eachMonth" begin="1" end="12"> <!-- 12: 공지사항 개수(length) -->
    <div class="box-notice card-df">
        <p><i class="icon icon-category-40"></i></p>
        <p>건강한 가정을 위한 실용적인 청소 요령</p>
        <p>Lorem ipsum dolor sit amet consectetur. Nibh vitae adipiscing non aliquam porttitor eget. Laoreet
            scelerisque rhoncus sed quisque praesent ornare nibh risus commodo. Mauris imperdiet viverra varius
            quam. Quis vitae molestie pretium augue adipiscing vel urna.</p>
        <div class="box-view-date">
            <div class="box-view">
                <i class="icon icon-view-24"></i>
                <span class="text-view-count">15</span> view
            </div>
            <div class="box-date">
                2023-08-13
            </div>
        </div>
    </div>
        </c:forEach>
</div>