function reservationCheck() {
    var date = document.getElementById('date').value;
    var time = document.getElementById('time').value;
    var quantity = document.getElementById('quantity').value;

    if (!date) {
        alert('날짜를 선택하세요.');
        return false; // 제출 중단
    }

    if (!time) {
        alert('시간대를 선택하세요.');
        return false; // 제출 중단
    }

    if (!quantity) {
        alert('관람인원을 선택하세요.');
        return false; // 제출 중단
    }

    // 모든 조건이 만족되면 true를 반환하여 폼이 제출되도록 함
    return true;
}