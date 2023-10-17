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
                        <c:forEach var="item" items="${list}">
                        	<tr>
                                <td>${item.comment_no }</td>
                                <td><a href="#">${item.contents }<br><span style="font-size: 0.8em;">글 제목 : ${item.subject }</span></a></td>
                                <td>${item.writedate }</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>