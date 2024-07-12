function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
    if (!event.target.matches('.rightbtn')) {
        var dropdowns = document.getElementsByClassName("user-profile-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}

const chatAlertToggle = document.getElementById('chatAlertToggle');
let alertOn = true;

chatAlertToggle.addEventListener('click', () => {
    alertOn = !alertOn;
    if (alertOn) {
        chatAlertToggle.textContent = '채팅 켜기 🔔';
        chatAlertToggle.classList.remove('active');
    } else {
        chatAlertToggle.textContent = '채팅 끄기 🔕';
        chatAlertToggle.classList.add('active');
    }
});

const fileInput = document.querySelector('.option-wrapper input[type="file"]');

fileInput.addEventListener('change', (event) => {
    const fileName = event.target.files[0].name;
    if (fileName) {
        alert(`선택된 파일: ${fileName}`);
    }
});

function toggleDeleteButton(button) {
    const deleteButton = button.nextElementSibling;
    if (deleteButton.style.display === "none" || !deleteButton.style.display) {
        deleteButton.style.display = "inline-block";
    } else {
        deleteButton.style.display = "none";
    }
}

function deleteChatRoom(chatRoomNo) {
    if (confirm("채팅방을 나가면 채팅 내역을 더이상 확인할 수 없어요. 정말 나가시겠어요?")) {
        // AJAX 요청을 통해 서버에 채팅방 삭제 요청
        fetch(`/deleteChatRoom?chatRoomNo=${chatRoomNo}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (response.ok) {
                // 페이지 새로고침 또는 채팅방 목록 갱신
                location.reload();
            } else {
                alert("채팅방 삭제에 실패했습니다.");
            }
        })
        .catch(error => {
            console.error("Error deleting chat room:", error);
            alert("채팅방 삭제 중 오류가 발생했습니다.");
        });
    }
}

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
}

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

// shift + tab 시 키다운
 function handleMessageKeyDown(event) {
            if (event.key === 'Enter' && !event.shiftKey) {
                event.preventDefault(); // Enter 키의 기본 동작인 줄바꿈을 방지
                sendMessage(); // 메시지 전송 함수 호출
            } else if (event.key === 'Tab' && event.shiftKey) {
                event.preventDefault(); // Shift + Tab의 기본 동작인 역방향 포커스 이동 방지
                document.getElementById('chatMessage').focus(); // 이전 입력 필드로 포커스 이동
            }
        }

        function sendMessage() {
            // 메시지 전송 로직을 구현하는 함수
            var message = document.getElementById('chatMessage').value;
            // 메시지 전송 처리 (예: 서버에 전송, 화면에 추가 등)
            console.log('전송된 메시지:', message);
            document.getElementById('chatMessage').value = ''; // 전송 후 입력 필드 비우기
        }
