<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Second Life - 상품의 새 삶</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/secondlife/resources/css/main.css">
</head>
<body>
    <div class="border-container">
        <header>
            <div class="marginer"></div>
            <div class="header-area">
                <div class="header-title">
                    <img src="/secondlife/resources/images/사이트 로고.png" alt="사이트로고">
                    <h3>SecondLife</h3>
                </div>
                <div class="header-menu">
                    <div class="header-menu-item">
                        <a href="">거래 장터</a>
                    </div>
                </div>
                <div class="header-user-menu">
                    <div class="header-user-menu-item">
                        <button onclick="return false">
                            <img src="/secondlife/resources/images/세라톡 아이콘.png" alt="세라톡 아이콘">
                            세라톡
                        </button>
                    </div>
                    <div class="header-user-menu-item">
                        <button id="login" onclick="return false">
                            <img src="/secondlife/resources/images/로그인 아이콘.png" alt="로그인 아이콘">
                            로그인
                        </button>
                    </div>
                </div>
            </div>
            <div class="marginer"></div>
        </header>
    </div>
</body>
</html>