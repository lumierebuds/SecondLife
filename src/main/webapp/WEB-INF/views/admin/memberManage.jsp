<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    width: 520px;
    height: 40px;
    margin-left: 20px;
    margin-top: 15px;
    border-radius: 5px;
}

.main .member-search .search-category {
    width: 100px;
    height: 40px;
    background-color: #B08968;
    border-radius: 5px;
    margin-top: 15px;
    margin-left: 15px;
}

.main .member-search .search-category p {
    font-size: 20px;
    margin-top: 6px;
    margin-left: 7px;
}

.member-table {
    width: 736px;
    height: 299px;
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

#pageArea {
    text-align: center;
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

#pageArea .pagination {
    margin-bottom: 0px;
}

.pageLink {
    color: #B08968;
    position: relative;
    display: block;
    padding: .5rem .75rem;
    margin-left: -1px;
    line-height: 1.25;
    background-color: #fff;
    border: 1px solid #dee2e6;
}

.main .buttons {
    margin: 0px 40px;
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

.selected-row {
    background-color: #B08968;
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
                    </div>
                </div>

                <div class="main">
                    <div class="빈공간"></div>
                    <div class="title">
                        <p>회원관리</p>
                    </div>
                    <hr class="hello1">
                    <div class="member-search">
                        <div class="search-title">
                            <p>회원검색</p>
                        </div>
                        <form>
                            <select class="search-category" name="searchCategory">
                                <option value="none" ${searchCategory == 'none' ? 'selected' : ''}>==선택==</option>
                                <option value="memberNo" ${searchCategory == 'memberNo' ? 'selected' : ''}>회원 번호</option>
                                <option value="id" ${searchCategory == 'id' ? 'selected' : ''}>회원 아이디</option>
                                <option value="nickname" ${searchCategory == 'nickname' ? 'selected' : ''}>닉네임</option>
                                <option value="name" ${searchCategory == 'name' ? 'selected' : ''}>이름</option>
                            </select>
                            <input type="text" class="search-box" name="searchKeyword" value="${searchKeyword}">
                        </form>
                    </div>
                    <div class="member-table">
                        <table class="member-content">
                            <tr class="table-title">
                                <th>회원 번호</th>
                                <th>회원 아이디</th>
                                <th>닉네임</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>가입일</th>
                            </tr>
                            <c:forEach items="${mList}" var="member">
                                <tr class="member-row" data-member-id="${member.id}">
                                    <td>${member.memberNo}</td>
                                    <td>${member.id}</td>
                                    <td>${member.nickname}</td>
                                    <td>${member.name}</td>
                                    <td>${member.email}</td>
                                    <td>${member.createDate}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div id="pageArea">
                        <ul class="pagination">
                            <c:if test="${pi.currentPage eq 1}">
                                <li class='page-item'><a class="pageLink">이전</a></li>
                            </c:if>
                            <c:if test="${pi.currentPage ne 1}">
                                <li class='page-item'><a class="pageLink"
                                    href="/secondlife/admin/memberManage/${pi.currentPage - 1}">이전</a></li>
                            </c:if>

                            <c:forEach var='i' begin="${pi.startPage}" end="${pi.endPage}">
                                <li class="page-link ${i eq pi.currentPage ? 'on' : ''}"
                                    href="/secondlife/admin/memberManage/${i}"><a
                                    href="/secondlife/admin/memberManage/${i}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${pi.currentPage eq pi.maxPage}">
                                <li class='page-item'><a class="pageLink">다음</a></li>
                            </c:if>
                            <c:if test="${pi.currentPage ne pi.maxPage}">
                                <li class='page-item'><a class="pageLink"
                                    href="/secondlife/admin/memberManage/${pi.currentPage + 1}">다음</a></li>
                            </c:if>
                        </ul>
                    </div>

                    <div class="buttons">
                        <button class="post">
                            <p>알림 전송</p>
                        </button>
                        <button class="delete">
                            <p>회원삭제</p>
                        </button>
                    </div>
                </div>
            </div>

            <div class="marginer"></div>
        </main>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
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
</html>

<script>
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
    });

    document.getElementById('modal-background2').addEventListener('mousedown', function(e) {
        if (e.target === e.currentTarget) {
            e.currentTarget.style.display = 'none';
        }
    });

    $(document).ready(function() {
        if (test=${not empty alertMsg}) {
            alert("${alertMsg}")
        }
    });

    // 회원 삭제 버튼 클릭 시 확인 대화상자
    document.querySelector('.delete').addEventListener('click', function() {
        var selectedRow = document.querySelector('.member-row.selected-row');
        if (selectedRow) {
            var memberId = selectedRow.getAttribute('data-member-id');
            if (confirm('정말 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/secondlife/admin/deleteMember',
                    type: 'POST',
                    data: { id: memberId },
                    success: function(response) {
                        if (response.success) {
                            alert('회원이 삭제되었습니다.');
                            location.reload(); // 페이지 새로고침
                        } else {
                            alert('회원 삭제에 실패했습니다.');
                        }
                    }
                });
            }
        } else {
            alert('삭제할 회원을 선택해주세요.');
        }
    });

    // 회원 행 클릭 시 선택 및 색상 변경
    document.querySelectorAll('.member-row').forEach(function(row) {
        row.addEventListener('click', function() {
            document.querySelectorAll('.member-row').forEach(function(r) {
                r.classList.remove('selected-row');
            });
            this.classList.add('selected-row');
        });
    });
</script>
