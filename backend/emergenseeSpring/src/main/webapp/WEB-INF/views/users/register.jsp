<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <style>
       .register-container {
            width: 40%;
            margin: 0 auto;
            padding: 20px;
            background-color: #F7F6F3;
            border: 1px solid #E8E5E2;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .container form {
            display: flex;
            flex-direction: column;
            width: 90%;
            margin: 0 auto;
        }

        .container label {
            font-weight: bold;
        }

        .container input[type="text"],
        .container input[type="password"],
        .container input[type="email"],
        .container input[type="tel"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .container input[type="submit"] {
            background-color: #252526;
            border: 3px solid #252526;
            color: #f7f5f4;
            border-radius: 5px;
            padding: 10px;
            font-size: 18px;
            cursor: pointer;
        }

        .container input[type="submit"]:hover {
            cursor: pointer;
            background: #fbc328;
            color: #252526;
        }

        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }

        .terms-content {
            width: 94%;
            height: 150px;
            overflow-y: scroll;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
        }
    </style>
 <script>
        function validateForm() {
            var username = document.getElementById("userid").value;
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
            var name = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var address = document.getElementById("address").value;
            var addressDetail = document.getElementById("address_detail").value;
            var phone = document.getElementById("phone").value;


            var usernamePattern = /^[a-zA-Z0-9]{3,20}$/;
            var passwordPattern = /^.{6,20}$/;
            var namePattern = /^.{2,40}$/;
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            var phonePattern = /^[0-9]{10,11}$/;
            var termsChecked = document.querySelector('input[name="terms"]:checked');
            var userTypeChecked = document.querySelector('input[name="userType"]:checked');

            if (!usernamePattern.test(username)) {
                alert("아이디는 3~20자의 영문 + 숫자로 이루어져야 합니다.");
                return false;
            }

            if (!passwordPattern.test(password)) {
                alert("비밀번호는 6~20자여야 합니다.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }

            if (!namePattern.test(name)) {
                alert("이름은 2~40자 이내여야 합니다.");
                return false;
            }

            if (address.trim() === "" || addressDetail.trim() === "") {
                alert("주소와 상세 주소를 입력해주세요!");
                return false;
            }

            if (!emailPattern.test(email)) {
                alert("유효하지 않은 이메일 주소입니다.");
                return false;
            }

            if (!phonePattern.test(phone)) {
                alert("유효하지 않은 휴대폰 번호입니다.");
                return false;
            }
            if (!termsChecked) {
                alert("이용약관에 동의해주세요.");
                return false;
            }

            if (!userTypeChecked) {
                alert("유저 유형을 선택해주세요.");
                return false;
            }

            return true;
        }
    </script>
<div class="container">
        <div class="register-container">
            <h1>회원 가입</h1>
            <form onsubmit="return validateForm()" action="${pageContext.servletContext.contextPath }/registerOk" method="post" novalidate>
                <label for="username">아이디:</label>
                <input type="text" name="userid" id="userid" required pattern="[a-zA-Z0-9]{3,20}"><br>
                <label for="password">비밀번호:</label>
                <input type="password" name="userpwd" id="password" required pattern=".{6,20}"><br>
                <label for="confirm_password">비밀번호 확인:</label>
                <input type="password" name="confirmpassword" id="confirm_password" required><br>
                <label for="username">이름:</label>
                <input type="text" name="username" id="username" required pattern=".{2,40}"><br>
                <label for="email">이메일 주소:</label>
                <input type="email" name="email" id="email" required
                    pattern="[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}"><br>
                <label for="address">주소:</label>
                <input type="text" name="address" id="address" required><br>
                <label for="address_detail">상세 주소:</label>
                <input type="text" name="addressdetail" id="address_detail" required><br>
                <label for="phone">휴대폰 번호:</label>
                <input type="tel" name="phone" id="phone" required pattern="[0-9]{10,11}"><br>
                <div style="display: flex; margin-bottom: 10px;"> <br> 이용약관: </div>
                <div class="terms-content">
                    <h1>회원가입 이용약관</h1>

                    <h2>제 1 조 (목적)</h2>
                    <p>이 약관은 [회사명] (이하 "회사" 또는 "서비스 제공자")가 제공하는 온라인 서비스 이용과 관련한 회원의 권리, 의무 및 책임사항을 규정하는 것을 목적으로 합니다.</p>
                
                    <h2>제 2 조 (정의)</h2>
                    <ol>
                        <li>"서비스"라 함은 회사가 제공하는 모든 온라인 서비스를 의미합니다.</li>
                        <li>"회원"이라 함은 회사에 개인정보를 제공하고 이 약관에 따라 회사와 이용계약을 체결한 자를 의미합니다.</li>
                    </ol>
                
                    <h2>제 3 조 (이용약관의 효력과 변경)</h2>
                    <ol>
                        <li>본 약관은 회원가입 시 동의함으로써 효력이 발생합니다.</li>
                        <li>회사는 본 약관을 변경할 권리를 갖으며, 변경된 약관은 서비스 내 또는 이메일을 통해 공지함으로써 효력이 발생합니다. 회원은 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단할 수 있습니다.</li>
                    </ol>

                </div>

                <label>
                    <input type="checkbox" name="terms" required oninput="validateForm()">
                    동의합니다

                    <div style="display: flex; margin-bottom: 10px;"> <br> 유저 유형: </div>
                    <div style="display: flex; justify-content: center; margin-bottom: 10px;">
                        <label style="display: inline-block; margin-right: 10px;">
                            <input type="radio" name="userType" value="user" required>
                            일반 유저
                        </label>

                        <label style="display: inline-block;">
                            <input type="radio" name="userType" value="admin">
                            관리자 유저
                        </label>
                    </div>
                    <div class="center-container">
                        <input type="submit" value="가입하기">
                    </div>
                </label>
            </form>
        </div>
    </div>
    
    
    
</body>