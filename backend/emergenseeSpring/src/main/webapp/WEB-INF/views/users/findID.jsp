<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/topButtonScript.js" defer></script>
    <script src="../js/notification.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>아이디 찾기</title>
    <style>
        .find-id-container {
            width: 40%;
            padding: 20px;
            background-color: #F7F6F3;
            border: 1px solid #E8E5E2;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="tel"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        input[type="text"],
        input[type="tel"] {
            flex: 2;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #E8E5E2;
        }

        button#findIDBtn {
            width: 100%;
        }
    </style>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<main>
        <div class="container">
            <div class="find-id-container">
                <h2>아이디 찾기</h2>
                <form action="findIDProcess.jsp" method="post">
                    <div class="input-group">
                        <label for="name">이름:</label>
                        <input type="text" id="name" name="name" required oninput="checkInput()">
                    </div>

                    <div class="input-group">
                        <label for="phone">전화번호:</label>
                        <input type="tel" id="phone" name="phone" required oninput="checkInput()">
                    </div>

                    <button type="submit" id="findIDBtn" disabled>아이디 찾기</button>
                </form>
            </div>
        </div>
    </main>
    
     <script>
        function checkInput() {
            const name = document.getElementById('name').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const findIDBtn = document.getElementById('findIDBtn');

            if (name && phone) {
                findIDBtn.removeAttribute('disabled');
            } else {
                findIDBtn.setAttribute('disabled', 'disabled');
            }
        }

        window.onload = checkInput;
    </script>
</body>
</html>