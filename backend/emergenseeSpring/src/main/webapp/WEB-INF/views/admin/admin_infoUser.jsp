<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 조회</title>
    <script src="/emergensee/js/getUserInfo.js" defer></script>
    <script src="/emergensee/js/admUserInfo.js" defer></script>
    <style>
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label,
        .form-container select,
        .form-container input,
        .form-container button {
            display: inline-block;
            margin-right: 10px;
            vertical-align: middle;
            justify-content: center;
            margin-bottom: 10px;
        }
    </style>
</head>
    <div class="container">
        <div class="main-container">
            <!-- 사이드 메뉴 -->
            <nav class="side-nav">
                <span class="PageTitle">관리자 페이지</span>
                <ul>
                    <li>
                        <a href="#" class="emphasize">회원 관리</a>
                        <ul>
                            <li><a href="/emergensee/admin/user" class="emphasize">회원정보 조회</a></li>
                            <li><a href="/emergensee/admin/leave">회원탈퇴 관리</a></li>
                            <li><a href="/emergensee/admin/dormant">휴면회원 관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">게시판 관리</a>
                        <ul>
                            <li><a href="/emergensee/admin/board">게시물 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>

            <main>
                <!-- search box -->
                <div class="form-container">
                    <h1>회원 정보 조회</h1>
                    <div>
                        <label>회원정보</label>
                        <select id="selectSearchType">
                            <option value="viewAll">전체보기</option>
                            <option value="name">이름</option>
                            <option value="id">아이디</option>
                            <option value="cellNum">전화번호</option>
                        </select>
                        <input type="text" id="inputUser" value="" name="user_info">
                        <button id="searchButton">검색</button>
                    </div>
                    <div>
                        <label>관심지역</label>
                        <select id="searchArea">
                            <option value="">--선택--</option>
                            <option value="seoul">서울</option>
                            <option value="incheon">인천</option>
                            <option value="gyunggido">경기도</option>
                        </select>
                        <select id="areaData">
                            <option value="">--선택--</option>
                        </select>
                    </div>
                    <div>
                        <label>기간설정</label>
                        <button value="today">오늘</button>
                        <button value="sevenDays">일주일</button>
                        <button value="oneMonth">한달</button>
                    </div>
                    <div>
                        <label for="startDate">start</label>
                        <input type="date" id="startDate" />
                        <label for="endDate">end</label>
                        <input type="date" id="endDate" />
                        <button id="searchBtn" type="submit" value="검색" name="검색">검색</button>
                    </div>
                    <input id="dateType" type="hidden">
                </div>
                <br>
                <br>
                <div class="form-container">
                    <h1>회원목록</h1>
                    <div class="result_text">
                        <span id="membersCnt">[총 회원수 0명] 검색결과 0명</span>
                        <input class="banBtn dark" type="submit" value="탈퇴/삭제" name="탈퇴/삭제">
                    </div>
                    <table id="memberTable">
                        <thead>
                            <tr>
                                <th>선택</th>
                                <th>등록일</th>
                                <th>이름</th>
                                <th>관심지역</th>
                                <th>전화번호</th>
                                <th>성별</th>
                                <th>나이</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" id="banCheck1"></td>
                                <td>23.08.15</td>
                                <td>홍길동</td>
                                <td>서울,대구</td>
                                <td>010-2222-2222</td>
                                <td>남</td>
                                <td>50</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="banCheck2"></td>
                                <td>23.04.10</td>
                                <td>이순신</td>
                                <td>부산,인천</td>
                                <td>010-3333-3333</td>
                                <td>남</td>
                                <td>60</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="banCheck3"></td>
                                <td>23.05.20</td>
                                <td>장보고</td>
                                <td>울산,광주</td>
                                <td>010-4444-4444</td>
                                <td>남</td>
                                <td>40</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="banCheck4"></td>
                                <td>23.07.05</td>
                                <td>이세종</td>
                                <td>대전,강원</td>
                                <td>010-5555-5555</td>
                                <td>남</td>
                                <td>55</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="banCheck5"></td>
                                <td>22.10.30</td>
                                <td>멍멍멍</td>
                                <td>전북,경북</td>
                                <td>010-6666-6666</td>
                                <td>여</td>
                                <td>35</td>
                            </tr>
                        </tbody>
                    </table>                    
                </div>
            </main>
        </div>
    </div>