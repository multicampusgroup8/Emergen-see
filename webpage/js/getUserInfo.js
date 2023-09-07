window.onload = function() {
    fetch('/path/to/user/data')  // 백엔드 API 엔드포인트
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // 사용자 이름 및 프로필 이미지를 페이지에 채웁니다.
            document.getElementById('userName').textContent = data.name;
            document.getElementById('profileImg').src = data.profileImage;
        })
        .catch(error => {
            console.error('There was a problem fetching user data:', error);
            document.getElementById('userName').textContent = 'Error loading user name';
        });
}
