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
        })
        .catch(error => {
            console.error('There was a problem fetching user data:', error);
            document.getElementById('userName').textContent = 'Network error';

        });
        
});