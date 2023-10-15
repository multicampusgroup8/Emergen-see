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
    
    
    <main>
                <h1>내 게시글 목록</h1>
                <div class="form-container">
                    <table id="table">
                        <thead>
                            <tr>
                                <th style="width: 10%;">글<br>번호</th>
                                <th style="width: 70%;">제목</th>
                                <th style="width: 20%;">작성 일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><a href="#">[경기] 요즘 진짜 덥네요ㅠㅠㅠㅠ [6]</a></td>
                                <td>23.09.09.</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><a href="#">[경기] 와 처서 지났는데 아직도 30도 넘음 ㄷㄷ [2]</a></td>
                                <td>23.09.09.</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><a href="#">[전국] 열대야... 지구를 좀 더 소중히 여겨야 겠어요... [3]</a></td>
                                <td>23.09.07.</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td><a href="#">[경기] 헐 정전됨;;; [4]</a></td>
                                <td>23.09.06.</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td><a href="#">[경기] 안녕하세요~ [5]</a></td>
                                <td>23.09.06.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>