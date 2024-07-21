const fileInput = document.querySelector('.option-wrapper input[type="file"]');

fileInput.addEventListener('change', (event) => {
    const fileName = event.target.files[0].name;
    if (fileName) {
        alert(`선택된 파일: ${fileName}`);
    }
});

$('.delete-btn').on('click', function(e) {
    if (confirm("채팅방을 나가면 채팅 내역을 더이상 확인할 수 없어요. 정말 나가시겠어요?")) {
        // AJAX 요청을 통해 서버에 채팅방 삭제 요청
        $.ajax({
            url: `/secondlife/chat/room/leave/${$(this).val()}`,
            method: 'post',
            success: function(result) {
                if (result > 0) {
                	chattingSocket.close();
                    location.replace(location.href);
                } else {
                    alert("채팅방이 이미 삭제되었거나, 채팅방 나가기에 실패했습니다.");
                }
            },
            error: function(xhr) {
                console.log(xhr);
            }
        });
    }
});

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// 클릭 외부 영역 닫기 기능 추가
window.onclick = function(event) {
    if (!event.target.matches('.rightbtn, .rightbtn *')) {
        var dropdowns = document.getElementsByClassName("user-profile-content");
        for (var i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
};

// 삭제 버튼 토글 함수
function toggleDeleteButton(button) {
    var deleteBtn = button.nextElementSibling;
    if (deleteBtn.style.display === "none" || deleteBtn.style.display === "") {
        deleteBtn.style.display = "block";
    } else {
        deleteBtn.style.display = "none";
    }
}

// 텍스트 크기에 따른 text-length 카운트 증가
document.addEventListener("DOMContentLoaded", function() {
    const textArea = document.querySelector('.chat-message-area');
    const textLength = document.querySelector('.text-length');

    textArea.addEventListener('input', function() {
        const textLengthValue = textArea.value.length;
        textLength.textContent = `${textLengthValue}/1000`;

        // Calculate the width of the textLength element based on the length of the text
        const width = (textLengthValue.toString().length + 5) * 10; // Adjust the multiplier as needed
        textLength.style.width = `${width}px`;
    });
});

// shift + enter 시 줄바꿈
function handleMessageKeyDown(event) {
    if (event.key === 'Enter' && !event.shiftKey) {
        event.preventDefault(); // Enter 키의 기본 동작인 줄바꿈을 방지
        $('.send-message-btn').click(); // 메시지 전송
    } else if (event.key === 'Enter' && event.shiftKey) {
        event.preventDefault();
        $('.chat-message-area').val($('.chat-message-area').val() + "\n");
    }
}

$('.chat-message-area').on('keydown', handleMessageKeyDown);

// 채팅 시간 표시용 날짜 포멧터
function currentTime() {
    var now = new Date();
    var month = now.getMonth() + 1 < 10 ? ('0' + (now.getMonth() + 1)) : (now.getMonth() + 1);
    var date = now.getDate() + 1 < 10 ? ('0' + now.getDate()) : now.getDate();
    return `${now.getFullYear()}-${month}-${date}`; // 2024-06-21
}

$('.send-message-btn').on('click', function (e) {
    // 메시지 전송 로직을 구현하는 함수
    e.preventDefault();

    nextChatMessageNo = $('.message-collect').find('p').length;
    console.log(nextChatMessageNo);

    $(this).attr('disabled', true);

    var $inputMessage = $('.chat-message-area');

    if(!$.trim($inputMessage.val())) {
        alert("빈 메세지는 보낼 수 없습니다.");
        $inputMessage.val('');
        $inputMessage.focus();
        return;
    }

    // 전달할 데이터 가공
    var chatMessage = {
        chatMessageNo : nextChatMessageNo,
        memberNo,
        message : $inputMessage.val(),
        chatRoomNo : $currChatRoom.val(),
    };

    // 메시지 전송 처리 (예: 서버에 전송, 화면에 추가 등)
    // JSON 객체로 파싱해서 보내기
    var jsonParsedMessage = JSON.stringify(chatMessage);
    chattingSocket.send(jsonParsedMessage);

    document.querySelector('.chat-message-area').value = ''; // 전송 후 입력 필드 비우기

    $(this).removeAttr('disabled');
});