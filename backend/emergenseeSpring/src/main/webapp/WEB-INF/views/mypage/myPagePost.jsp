<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <c:forEach var="item" items="${list}">
                        	<tr>
                                <td>${item.post_no}</td>
                                <td><a href="#">[${item.location }] ${item.subject } [${item.cnt }]</a></td>
                                <td>${item.writedate }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>