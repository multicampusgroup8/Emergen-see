const messages = [
    "[☀️폭염☀️] 경기도 성남시 분당구 | 2023년 09월 09일 09시 27분 | 폭염 경보 발령",
    "[☀️폭염☀️] 경기도 성남시 수정구 | 2023년 09월 09일 13시 52분 | 폭염 주의보 발령",
    "[🌧호우🌧] 제주도 서귀포시 일대 | 2023년 09월 09일 15시 14분 | 국지성 호우 주의",
    // 필요한 만큼 메시지 추가
];

let currentMessageIndex = 0;
const notificationBar = document.getElementById('notificationBar');

function changeNotificationMessage() {
    notificationBar.innerText = messages[currentMessageIndex];
    currentMessageIndex = (currentMessageIndex + 1) % messages.length;
}
// 알림바 메시지 초기화
changeNotificationMessage();

// 5초마다 메시지 변경 (5000ms = 5초)
setInterval(changeNotificationMessage, 5000);
