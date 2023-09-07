// 페이지 상단으로 부드럽게 스크롤하는 함수
function scrollToTop() {
    window.scrollTo({top: 0, behavior: 'smooth'});
}

// 사용자가 스크롤할 때마다 버튼의 표시 여부를 결정하는 이벤트 리스너
window.addEventListener('scroll', function() {
    let topButton = document.getElementById('backToTop');
    if (window.pageYOffset > 1) {
        topButton.style.display = "block";
    } else {
        topButton.style.display = "none";
    }
});
