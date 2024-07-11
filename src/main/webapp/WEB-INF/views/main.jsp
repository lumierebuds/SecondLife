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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/secondlife/resources/css/main.css">
<link rel="stylesheet" href="/secondlife/resources/css/common.css">
</head>

<body onselectstart="return false">
	<div id="container">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
		<main id="main-container">
			<div class="marginer"></div>
			
			
			
			
			<div class="content">
				<div class="intro">
					<div class="section-divider">
						<div class="section-quarter intro-title">
							<h1 class="bold">함께해 온 추억에게</h1>
							<h1 class="bold">찾아온 두번째 삶</h1>
						</div>
						<div class="section-quarter"></div>
					</div>
					<div class="section-divider">
						<div class="section-quarter"></div>
						<div class="section-quarter intro-content">
							<p>모두가 함께 만드는 신뢰성 있는 중고 거래</p>
							<p>세컨드라이프가 함께합니다.</p>
						</div>
					</div>
				</div>
				<hr>
				<div class="show">
					<h2 class="section-title">최근 거래 품목</h2>
					<div class="cards-container" id="cardsContainer">
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
						<div class="card">
							<img src="https://via.placeholder.com/180x150" alt="Item">
							<div class="card-title">거래물 제목</div>
							<div class="card-subtitle">거래 물품명</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			<div class="marginer"></div>
		</main>

		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>
	
	<script>
        $(document).ready(function() {
            /* if test=${not empty alertMsg}
                alert("${alertMsg}"); */
           if(test=${not empty alertMsg}){
               alert("${alertMsg}")
            }
        });
        
        
    </script>
	
	<script src="/secondlife/resources/js/main.js">
    </script>
	
</body>

</html>