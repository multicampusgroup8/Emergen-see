const messages = [
    "여기에 중요한 알림 또는 메시지를 입력하세요.",
    "두 번째 중요한 알림 메시지입니다.",
    "세 번째 알림 메시지입니다.",
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
