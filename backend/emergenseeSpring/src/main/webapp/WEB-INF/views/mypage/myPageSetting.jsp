<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
	<main>
                <h1>설정</h1>
                <div class="form-container">
                    <div class="form-group">
                        <p>비밀번호를 재확인 합니다.</p>
                        <input type="password" id="passwordConfirm" placeholder="비밀번호를 입력해주세요">
                        <br>
                        <button>확인</button>
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    
    <script>
        $(document).ready(function () {
            // 버튼을 클릭했을 때의 이벤트 핸들러
            $("button").click(function () {
                // 입력한 비밀번호를 가져옴
                const password = $("#passwordConfirm").val();

                // 백엔드로 전송
                $.ajax({
                    type: "POST",
                    url: "/backend-endpoint",
                    data: { password: password },  // 전송할 데이터
                    dataType: "json",  // 서버로부터 받을 데이터의 타입을 지정
                    success: function (response) {
                        if (response.success) {
                            // 결과가 true일 경우, myPageChange.html로 리디렉션
                            window.location.href = "myPageChange.html";
                        } else {
                            // 결과가 false일 경우
                            alert("비밀번호 확인에 실패했습니다. 다시 시도해주세요.");
                        }
                    },
                    error: function () {
                        // 서버 에러 발생시
                        alert("서버 오류가 발생했습니다. 나중에 다시 시도해주세요.");
                    }
                });
            });
        });
    </script>