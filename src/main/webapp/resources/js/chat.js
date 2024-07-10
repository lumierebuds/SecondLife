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
    const fileName = event.target.files[0]?.name;
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
