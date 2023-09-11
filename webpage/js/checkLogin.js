document.addEventListener('DOMContentLoaded', function() {
    fetch('/path/to/user/data')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // 사용자 정보를 페이지에 채웁니다.
            document.getElementById('userName').textContent = data.name;
            document.getElementById('profileImg').src = data.profileImage;

            // 로그인 상태이므로 로그아웃 버튼을 보여줍니다.
            document.getElementById('logoutButton').style.display = "inline-block";

            // 로그인 및 회원가입 버튼 숨기기
            document.getElementById('loginButton').style.display = "none";
            document.getElementById('signupButton').style.display = "none";
        })
        .catch(error => {
            console.error('There was a problem fetching user data:', error);
            document.getElementById('userName').textContent = '로그인이 필요합니다.';
            
            // 유저 프로필 이미지와 유저 이름 숨기기
            document.getElementById('userName').style.display = "none";
            document.getElementById('profileImg').style.display = "none";
        
            // 로그인 및 회원가입 버튼 보여주기
            document.getElementById('loginButton').style.display = "inline-block";
            document.getElementById('signupButton').style.display = "inline-block";
        
            // 로그아웃 버튼 숨기기
            document.getElementById('logoutButton').style.display = "none";
        });
        
});
