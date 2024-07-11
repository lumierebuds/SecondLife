<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Second Life - 상품의 새 삶</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/secondlife/resources/css/myPage.css">
<link rel="stylesheet"
	href="/secondlife/resources/css/admin/memberManage.css">
<link rel="stylesheet"
	href="/secondlife/resources/css/admin/reportManage.css">
<style>
.centered-content {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.content {
	display: flex;
	background-color: #EDE0D4;
}

.tap {
	height: 600px;
	width: 20%;
	background-color: #E6CCB2;
	display: flex;
}

.choice {
	width: 100%;
	height: 70%;
}

.선택들 {
	height: 84px;
	width: 100%;
	background-color: #DDB892;
	text-align: center;
	border: 1px solid #B08968;
	font-weight: bold;
}

.선택들 p {
	margin-top: 30px;
	color: #7F5539;
}

header {
	background-color: #E6CCB2;
}

.header-title h3, .footer-info h5 {
	color: #7F5539;
}

.header-menu-item a, .footer-term a {
	color: #9C6644;
	text-decoration: none;
	font-weight: bold;
}

.header-menu-item a:hover, .footer-term a:hover {
	color: #B08968;
}

.header-user-menu-item a {
	color: #7F5539;
}

/* 여기서 스타일 작업 */
.main .빈공간 {
	width: 817px;
	height: 50px;
}

.main .title p {
	font-size: 30px;
	font-weight: bold;
	margin-left: 40px;
}

.main .hello1 {
	margin: 0px 40px;
}

.main .member-search {
	margin-left: 40px;
	display: flex;
}

.main .member-search p {
	margin-top: 20px;
	font-size: 20px;
	font-weight: bold;
}

.main .member-search .search-box {
	width: 500px;
	height: 40px;
	margin-left: 20px;
	margin-top: 15px;
	border-radius: 5px;
}

.main .member-search .search-category {
	width: 100px;
	height: 40px;
	background-color: grey;
	border-radius: 5px;
	margin-top: 15px;
	margin-left: 15px;
}

.main .member-search .search-category p {
	font-size: 20px;
	margin-top: 6px;
	margin-left: 7px;
}

.member-content {
	margin-left: 40px;
	margin-top: 30px;
	width: 737px;
	height: 50px;
	border: 1px solid black;
}

.member-content th {
	border: 1px solid black;
	border-bottom: 3px solid black;
	text-align: center;
}

.member-content td {
	border: 1px solid black;
	text-align: center;
}

.main .buttons {
	margin: 20px 40px;
	display: flex;
	justify-content: flex-end;
}

.main .buttons button {
	width: 70px;
	height: 25px;
	border-radius: 5px;
}

.main .buttons p {
	font-size: 10px;
	margin-top: 2px;
}

.main .buttons .post {
	margin-right: 5px;
}

.main .buttons .delete {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<main class="centered-content">
			<div class="marginer"></div>











			<div class="content">
				<div class="tap">
					<div class="choice">
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/admin/memberManage/1"><p>회원관리</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/admin/postManage/1"><p>거래글관리</p></a>
							</div>
						</div>
						<div class="choices">
							<div class="선택들">
								<a href="/secondlife/admin/reportManage/1"><p>신고관리</p></a>
							</div>
						</div>
					</div>
				</div>

















				<div class="main">
					<!-- 여기서 작업 -->
					<div class="빈공간"></div>
					<div class="title">
						<p>신고관리</p>
					</div>
					<hr class="hello1">

					<table class="member-content">
						<tr class="table-title">
							<th>작성자</th>
							<th>거래글 번호</th>
							<th>신고 내용</th>
							<th>신고 일자</th>
						</tr>
						<tr class="더미">
							<td class="table-td">아줌씨</td>
							<td class="table-td">000001</td>
							<td class="table-td">거래매물이 이상합니다</td>
							<td class="table-td">2024-07-01</td>
						</tr>
					</table>
					<div class="buttons">
						<button class="post">
							<p>알림 전송</p>
						</button>
						<button class="delete">
							<p>회원삭제</p>
						</button>
						<button class="finish">
							<p>처리완료</p>
						</button>
					</div>




				</div>
			</div>















			<div class="marginer"></div>
		</main>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>





	<div class="modal-background1" id="modal-background1">
		<div class="modal-content">
			<div>
				<label for="report-writer">작성자</label> <input type="text" value=""
					id="report-writer" name="writer" class="report-writer" disabled>
			</div>

			<div class="report-area">
				<div class="report-info-area">
					<input type="text" name="reportNo" id="report-no"
						class="report-info" placeholder="신고 번호"> <input
						type="text" name="createDate" id="report-date" class="report-info"
						placeholder="신고 날짜">
				</div>
				<div class="report-content-area">
					<textarea name="content" id="report-content" class="report-input"
						placeholder="신고 내용"></textarea>
				</div>
				<div class="report-attach-area">
					<div class="report-input">
						<label for="report-attach"> <img
							src="SecondLifeViews/Main/resources/클립.png" alt="클립">
						</label> <input type="file" id="report-attach" class="report-attach"
							accept="image/*"> <input type="text"
							id="report-attach-name" class="report-attach-name"
							placeholder="첨부파일">
					</div>
				</div>
				<div class="report-submit-area">
					<button class="report-btn">확인</button>
				</div>
			</div>

		</div>
	</div>

	<div class="modal-background2" id="modal-background2">
		<div class="modal-content">
			<div class="alert-receiver-area">
				<label for="alert-receiver">To.</label> <input type="text" value=""
					id="receiver" class="alert-receiver" name="userNo" disabled>
			</div>

			<div class="alert-area">
				<div class="alert-title-area">
					<label for="alert-title"> 제목 </label> <input type="text"
						name="alert-title" id="alert-title" class="alert-input"
						placeholder="제목">
				</div>
				<div class="alert-content-area">
					<label for="alert-content"> 내용 </label>
					<textarea name="content" id="alert-content" class="alert-input"
						placeholder="알림 내용"></textarea>
				</div>
				<div class="alert-submit-area">
					<button class="alert-btn1">전송하기</button>
					<button class="alert-btn2">취소</button>
				</div>
			</div>

		</div>
	</div>
	</body>
</html>

<script>	

    // 테이블 더블클릭시 뜨는 모달창
    document.addEventListener('DOMContentLoaded', (event) => {
        const tableTds = document.querySelectorAll(".table-td");
        const okButton = document.querySelector(".report-btn");
        const modal = document.querySelector(".modal-background1");
        const reportWriterInput = document.getElementById("report-writer");
        const reportNo = document.getElementById("report-no");
        const reportDate = document.getElementById("report-date");
        const reportContent = document.getElementById("report-content");

        tableTds.forEach(td => {
            td.addEventListener('dblclick', (event) => {
                // 부모 행을 찾기
                const row = event.target.parentNode;
                
                const writer = row.children[0].innerText;
                const no = row.children[1].innerText;
                const date = row.children[3].innerText;
                const content = row.children[2].innerText;

                // 모달 창에 값을 채우기
                reportWriterInput.value = writer;
                reportNo.value = no;
                reportDate.value = date;
                reportContent.value = content;

                modal.style.display = 'flex';
                
                
            });
        });

        okButton.addEventListener('click', () => {
            modal.style.display = 'none';
        });
    });

    // 알림전송 클릭시 뜨는 모달창
    document.addEventListener('DOMContentLoaded', (event) => {
        const modal = document.querySelector(".modal-background2");
        const post = document.querySelector(".post");
        const cancel = document.querySelector(".alert-btn2");

        post.addEventListener('click', () => {
            modal.style.display = 'flex';
        })
        cancel.addEventListener('click', () => {
            modal.style.display = 'none';
        })
        
        
    })

    document.getElementById('modal-background1').addEventListener('mousedown', function(e) {
        if (e.target === e.currentTarget) {
            e.currentTarget.style.display = 'none';
        }
    });
    document.getElementById('modal-background2').addEventListener('mousedown', function(e) {
        if (e.target === e.currentTarget) {
            e.currentTarget.style.display = 'none';
        }
    });
</script>