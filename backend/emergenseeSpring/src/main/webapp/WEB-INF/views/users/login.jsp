<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <style>
        .login-container {
            width: 40%;
            padding: 20px;
            background-color: #F7F6F3;
            border: 1px solid #E8E5E2;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"] {
            width: 94%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .keep-login {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .additional-links {
            margin-top: 20px;
            text-align: center;
        }

        .additional-links a {
            margin: 20px;
            color: #222224;
            text-decoration: none;
        }

        .additional-links a:hover {
            text-decoration: underline;
        }

        button#loginBtn {
            width: 100%;
        }
    </style>
</head>
<body>
<main>
        <div class="container">
            <div class="login-container">
                <h2>Login</h2>
                <form action="/emergensee/login" method="post">
                    <div class="input-group">
                        <label for="userid">아이디:</label>
                        <input type="text" id="userid" name="userid" required oninput="checkInput()">
                    </div>
                    <div class="input-group">
                        <label for="password">비밀번호:</label>
                        <input type="password" id="password" name="password" required oninput="checkInput()">
                    </div>
                    <div class="keep-login">
                        <input type="checkbox" id="keep-login" name="keeplogin">
                        <label for="keep-login">로그인 유지</label>
                    </div>
                    <button type="submit" id="loginBtn" disabled>로그인</button>
                </form>
                <div class="additional-links">
                    <a href="/web/register">회원가입</a>
                    <a href="/web/findID">아이디 찾기</a>
                    <a href="/web/findPassword">비밀번호 찾기</a>
                </div>
            </div>
    </main>
    <script>
        function checkInput() {
            const userid = document.getElementById('userid').value.trim();
            const password = document.getElementById('password').value.trim();

            if (userid && password) {
                loginBtn.removeAttribute('disabled');
            } else {
                loginBtn.setAttribute('disabled', 'disabled');
            }
        }

        window.onload = checkInput;
    </script>
</body>