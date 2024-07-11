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
  <title>Second Life - 거래글 조회 결과</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/secondlife/resources/css/board/boardList-style.css">
</head>

<body>
  <div id="container">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/navigation.jsp"/>
	
    <main id="main-container">
      <div class="marginer"></div>
      <div class="content">
       <div class="list">
          <div class="list-top">
            <div class="list-description">
              <c:if test="${empty param.search and empty param.category}">
              	<span class="list-search">전체 상품</span>
              </c:if>              	
              <c:if test="${not empty param.search and empty param.category}">
              	<span class="list-search">'${param.search }' 검색결과</span>
              </c:if>
              <c:if test="${not empty param.category and empty param.search }">
              	<span class="list-search">${categoryName} 검색결과</span>
              </c:if>
              
              <span class="list-count">${listCount } 개</span>
            </div>
            <div class="list-assort">
              <!-- 최신순, 인기순, 저가순, 고가순-->
              <ul id="sort">
                <li><a href="">최신순</a></li>
                <li><a href="">인기순</a></li>
                <li><a href="">저가순</a></li>
                <li><a href="">고가순</a></li>
              </ul>
            </div>
          </div>
          <div class="list-mid">
          <c:if test="${not empty list }">
	          <c:forEach items="${list }" var="board">
	          
	            <div class="board-card">
	              <a href="/secondlife/board/detail/${board.boardNo}" class="card-anchor">
	                <div class="board-thumbnail">
	                  <c:if test="${board.biList.size() ne 0 }">
	                  	<img src="/secondlife/${board.biList.get(0).imgPath}/${board.biList.get(0).changeName}" alt="${board.productName}" />
	                  </c:if>
					  <c:if test="${board.biList.size() eq 0 }"> <!-- 이미지가 존재하지 않을때 (사이트 로고) -->
					  	<img src="/secondlife/resources/images/사이트 로고.png" alt="${board.productName}" />
					  </c:if>
	                </div>
	
	                <div class="board-description">
	                  <div class="board-title">${board.productName}</div>
	                  <div class="board-information">
	                    <div class="board-price"><fmt:formatNumber value="${board.price}" pattern="#,###" />원</div>
	                    <div class="board-writed">${board.createDate}</div>
	                  </div>
	                </div>
	              </a>
	            </div>
	            </c:forEach>
            </c:if>
            <c:if test="${empty list }">
            	<h2 style="margin-left: 300px; font-weight: bold">게시글이 존재하지 않습니다.</h2>
            </c:if>
          </div>
		  
		  
		  <!-- 전체, 카테고리, 검색조회시에 필요한 쿼리스트링을 포함한 url  -->
		  
		  <c:choose>
		  	<c:when test="${not empty param.search and empty param.category}">
		  		<c:set var="url" value="?search=${param.search}&pageNo="/>
		  	</c:when>
		  	<c:when test="${not empty param.category and empty param.search}">
		  		<c:if test="${param.category >= 0 and param.category <= 12}">
		  			<c:set var="url" value="?category=${param.category}&pageNo="/>
		  		</c:if>
		  		
		  		<c:if test="${param.category < 0 or param.category > 12}">
		  			<script>
		  				location.href = "/secondlife/board/list?pageNo=1"
		  			</script>
		  		</c:if>
		  	</c:when>
		  	<c:when test="${not empty param.category and not empty param.search}">
		  		<script>
		  			location.href = "/secondlife/board/list?pageNo=1"
		  		</script>
		  	</c:when>
		  	<c:otherwise>
				<c:set var="url" value="?pageNo="/>	  		
		  	</c:otherwise>
		  </c:choose>
	
		  
          <div class="list-bottom">
            <div class="page-bar">
              	
              <c:if test="${pi.currentPage ne 1 }">
              	<a href="${url }${pi.currentPage - 1}" class="page-item">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M15.1602 7.41L10.5802 12L15.1602 16.59L13.7502 18L7.75016 12L13.7502 6L15.1602 7.41Z" fill="black"/>
                  </svg>
              	</a>
              </c:if>
              
              <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
              	<a href="${url }${i}" class="page-item ${i eq pi.currentPage ? 'page-on' : ''}">${i}</a>
              </c:forEach>
              
              <c:if test="${pi.currentPage ne pi.maxPage }">
             	<a href="${url }${pi.currentPage + 1}" class="page-item">
                	<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                	<path d="M8.83984 7.41L13.4198 12L8.83984 16.59L10.2498 18L16.2498 12L10.2498 6L8.83984 7.41Z" fill="black"/>
                </svg>
              </a>
              </c:if> 
            </div>
            
          </div>
        </div>
      </div>
      <div class="marginer"></div>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  </div>
<<<<<<< HEAD
=======
  
>>>>>>> origin/kjh
	
</html>