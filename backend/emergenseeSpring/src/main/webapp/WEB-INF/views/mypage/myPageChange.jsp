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

        .checkbox-description {
            margin-left: 5px;
            display: inline-block;
        }
    </style>
    
            <!-- 메인 컨텐츠 -->
            <main>
                <h1>설정</h1>
                <div class="form-container">
                    <div class="form-group">
                        <label for="nickname">닉네임:</label>
                        <input type="text" id="nickname" placeholder="닉네임을 입력해주세요">
                    </div>

                    <div class="form-group">
                        <label for="password">비밀번호:</label>
                        <input type="password" id="password" placeholder="비밀번호를 입력해주세요">
                    </div>

                    <div class="form-group">
                        <label for="passwordConfirm">비밀번호 확인:</label>
                        <input type="password" id="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요">
                    </div>

                    <p id="passwordError" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</p>
                    <br>
                    <div class="form-group">
                        <label>회원 탈퇴:</label>
                        <button id="deleteAccount">회원탈퇴</button>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="location">관심지역 설정:</label>
                        <input type="text" id="location" placeholder="관심지역을 입력해주세요">
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="kakaoNotif">카카오톡 알림설정:</label>
                        <input type="checkbox" id="kakaoNotif">
                        <span class="checkbox-description">알림을 수신합니다.</span>
                    </div>

                    <button id="updateSettings">변경</button>
                </div>
            </main>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // 버튼을 비활성화 시키는 함수
            function disableButton() {
                $('#updateSettings').prop('disabled', true);
            }

            // 버튼을 활성화 시키는 함수
            function enableButton() {
                $('#updateSettings').prop('disabled', false);
            }

            // 모든 입력값들을 체크하는 함수
            function checkInputs() {
                let nickname = $("#nickname").val();
                let password = $("#password").val();
                let passwordConfirm = $("#passwordConfirm").val();
                let location = $("#location").val();

                if (!nickname || !password || !passwordConfirm || !location) {
                    disableButton();
                    return;
                }

                if (password !== passwordConfirm) {
                    $('#passwordError').show();
                    disableButton();
                    return;
                }

                $('#passwordError').hide();
                enableButton();
            }

            // 인풋 값들이 변경될 때마다 체크 함수를 실행
            $('input').on('input', checkInputs);

            $("#updateSettings").click(function () {
                // 백엔드와 통신하는 코드를 여기에 작성합니다...
            });
        });

    </script>