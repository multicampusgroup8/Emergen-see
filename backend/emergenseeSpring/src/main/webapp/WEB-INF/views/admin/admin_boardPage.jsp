<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <script src="/emergensee/js/getUserInfo.js" defer></script>
    <script src="/emergensee/js/admPost.js" defer></script>
    <style>
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container label,
        .form-container select,
        .form-container input,
        .form-container button, 
        .form-container span {
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
                            <li><a href="/emergensee/admin/user">회원정보 조회</a></li>
                            <li><a href="/emergensee/admin/leave">회원탈퇴 관리</a></li>
                            <li><a href="/emergensee/admin/dormant">휴면회원 관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="emphasize">게시판 관리</a>
                        <ul>
                            <li><a href="/emergensee/admin/board" class="emphasize">게시물 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <main>
                <div class="form-container">
                    <h1>게시물 관리</h1>
                    <div>
                        <label>게시판 선택</label>
                        <!-- 메인메뉴 선택 -->
                        <select id="selectBoard">
                            <option value="">---------선택---------</option>
                            <option value="disasterBoard">재난정보지도</option>
                            <option value="emergencyBoard">긴급상황게시판</option>
                            <option value="newsBoard">재난뉴스모아보기</option>
                            <option value="linkBoard">재난정보포털링크</option>
                        </select>
                        <!-- 서브메뉴 선택 -->
                        <select id="selectSubBoard">
                            <option value="">--선택--</option>
                        </select>
                        <button id="searchButton">검색</button>
                    </div>
                    <div>
                        <label>게시글찾기</label>
                        <select id="selectPost">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="writer">작성자</option>
                            <option value="all">전체검색</option>
                        </select>
                        <input type="text" id="inputUser" value="">
                    </div>
                    <div>
                        <label>작성일</label>
                        <button value="today">오늘</button>
                        <button value="sevenDays">일주일</button>
                        <button value="oneMonth">한달</button>
                    </div>
                    <div>
                        <label for="startDate">start</label>
                        <input type="date" id="startDate" />
                        <label for="endDate">end</label>
                        <input type="date" id="endDate" />
                    </div>
                    <div>
                        <span>답변상태</span>
                        <label for="viewAll">전체보기</label>
                        <input type="radio" id="viewAll" name="answerStatus" value="viewAll" checked>
                        <label for="completed">답변완료</label>
                        <input type="radio" id="completed" name="answerStatus" value="completed">
                        <label for="unanswered">미답변</label>
                        <input type="radio" id="unanswered" name="answerStatus" value="unanswered">
                    </div>
                    <button id="searchBtn" type="submit" value="검색" name="검색">검색</button>
                </div>
                <br>
                <br>
                <div class="form-container">
                    <h1>게시물 목록</h1>
                    <div class="result_text">
                        <span id="membersCnt">[총 게시글 n 개] 검색결과 n 개</span>
                        <input class="ban_btn dark" type="submit" value="삭제" name="삭제">
                        <table id="table">
                            <thead>
                                <tr>
                                    <th>선택</th>
                                    <th>등록일</th>
                                    <th>이름</th>
                                    <th>지역</th>
                                    <th>재난 유형</th>
                                    <th>제목</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" id="banCheck1"></td>
                                    <td>2023-09-07 10:20:05</td>
                                    <td>홍길동</td>
                                    <td>충청</td>
                                    <td>폭염</td>
                                    <td>[충청] 여긴 시원한데 [3]</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="banCheck1"></td>
                                    <td>2023-09-07 10:20:05</td>
                                    <td>김길동</td>
                                    <td>제주</td>
                                    <td>기타</td>
                                    <td>[제주] 비 오는거 보여드림 [0]</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="banCheck1"></td>
                                    <td>2023-09-07 10:20:05</td>
                                    <td>박길동</td>
                                    <td>서울</td>
                                    <td>기타</td>
                                    <td>[서울] 에어컨, 나의 사랑. 에어컨, 나의 빛. 에어컨, 나의 어둠. 에어컨, 나의 삶. [0]</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="banCheck1"></td>
                                    <td>2023-09-07 10:20:05</td>
                                    <td>최길동</td>
                                    <td>경기</td>
                                    <td>폭염</td>
                                    <td>[경기] 날씨 실화냐 [10]</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="banCheck1"></td>
                                    <td>2023-09-07 10:20:05</td>
                                    <td>zl존길동</td>
                                    <td>제주</td>
                                    <td>호우</td>
                                    <td>[제주] 다들 덥다 하는데 여긴 비옴ㅋㅋㅋㅋ [8]</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="banCheck1"></td>
                                    <td>2023-09-07 10:20:05</td>
                                    <td>길동love</td>
                                    <td>서울</td>
                                    <td>폭염</td>
                                    <td>[서울] 처서 지나면 시원해진다면서요ㅜㅠㅠㅠㅠ [7]</td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </main>
        </div>
    </div>
    <footer>
        <div class="footer">
            © 2023 모든 권리 보유. 멀티캠퍼스 세미프로젝트 8조에 있습니다.
        </div>
        <button class="backToTop dark" onclick="scrollToTop()">Top</button>
    </footer>
</body>

</html>