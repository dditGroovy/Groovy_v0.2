<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <a href="#"><p>내 휴가</p></a>
    <a href="/employee/mySalary"><p>내 급여</p></a>
</div>

<div>
    <div>
        <table>
            <tr>
                <th>발생 연차</th>
                <th>사용 연차</th>
                <th>잔여 연차</th>
            </tr>
            <tr>
                <th>05</th>
                <th>03</th>
                <th>02</th>
            </tr>
        </table>
    </div>
    <div>
        <div>
            <div>
                <div><h3>휴가 기록</h3></div>
                <div><a href="/employee/vacationRecord">더보기</a></div>
            </div>
            <div>
                <table>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                    <tr>
                        <td>연차 | 20XX년 XX월 XX일</td>
                    </tr>
                </table>
            </div>
        </div>
        <div>
            <h3>구성원의 휴가(연락금지)</h3>
            <table>
                <tr>
                    <td>이혜진 | 연차 20XX년 XX월 XX일</td>
                </tr>
            </table>
        </div>
    </div>
</div>

<!-- 휴가기록 pop -->
<div class="modal">
    <form>
        <h3>연차</h3>
        <h3>휴가 일정</h3>
        <input type="date" required><img/><input type="date" required>
        <h3>휴가 내용</h3>
        <textarea required></textarea><br/>
        <h3>상세내용</h3>
        <p>연속 휴가일 경우 마지막 연차 종류를 선택해주세요.</p>
        <label><input type="radio" name="option" value="오전 반차"/>오전 반차</label><br/>
        <label><input type="radio" name="option" value="오후 반차"/>오후 반차</label><br/>
        <label><input type="radio" name="option" value="하루종일"/>하루종일</label>
        <br/>
        <input type="submit" value="확인"/>
    </form>
</div>

<!-- 구성원의휴가 pop -->
<div class="modal">
    <div>
        <img/>
        <p>이혜진</p>
    </div>
    <h3>연차</h3>
    <h3>휴가 일정</h3>
    <input type="date" readonly><img/><input type="date" readonly>
    <h3>휴가 내용</h3>
    <textarea readonly></textarea><br/>
    <h3>상세내용</h3>
    <p>연속 휴가일 경우 마지막 연차 종류를 선택해주세요.</p>
    <label><input type="radio" name="option" value="오전 반차"/>오전 반차</label><br/>
    <label><input type="radio" name="option" value="오후 반차"/>오후 반차</label><br/>
    <label><input type="radio" name="option" value="하루종일"/>하루종일</label>
    <br/>
    <input type="button" value="확인"/>
</div>