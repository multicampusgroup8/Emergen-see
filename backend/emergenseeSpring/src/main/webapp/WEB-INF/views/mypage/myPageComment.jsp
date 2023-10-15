<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
    <style>
        button#updateSettings {
            width: 100%;
            margin-top: 20px;
            padding: 15px;
            font-size: 16px;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            justify-content: space-between;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        .form-group label {
            flex: 1;
            margin-right: 20px;
        }

        .form-group input {
            flex: 2;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #E8E5E2;
        }

        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
    </style>
    
            <!-- 메인 컨텐츠 -->
            <main>
                <h1>내 댓글 목록</h1>
                <div class="form-container">
                    <table id="table">
                        <thead>
                            <tr>
                                <th style="width: 10%;">댓글 번호</th>
                                <th style="width: 70%;">댓글 내용</th>
                                <th style="width: 20%;">작성 일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><a href="#">그러니까요ㅠ<br><span style="font-size: 0.8em;">[경기] 요즘 진짜 덥네요ㅠㅠㅠㅠ
                                            [6]</span></a></td>
                                <td>23.09.09.</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><a href="#">저희 동네도 그래요 ㅠㅠㅠ<br><span style="font-size: 0.8em;">[경기] 요즘 진짜 덥네요ㅠㅠㅠㅠ
                                            [6]</span></a></td>
                                <td>23.09.09.</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><a href="#">아직 에어컨 못 끄는 중 ㅎ<br><span style="font-size: 0.8em;">[경기] 요즘 진짜 덥네요ㅠㅠㅠㅠ
                                            [6]</span></a></td>
                                <td>23.09.09.</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><a href="#">지구야 아프지마<br><span style="font-size: 0.8em;">[전국] 열대야... 지구를 좀 더 소중히 여겨야
                                            겠어요... [3]</span></a></td>
                                <td>23.09.07.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>