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
  <title>Second Life - 거래글 상세 조회</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="/secondlife/resources/css/board/boardDetail-style.css">
</head>

<body>
  <div id="container">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/navigation.jsp"/>

    <main id="main-container">
      <div class="marginer"></div>
      <div class="content">
        <div class="detail-content">
          <div class="detail-information">
            <div class="dif-1">
              <div class="detail-images">
                <div class="detail-wrapper">
                <c:if test="${board.biList.size() ne 0}">
                <c:forEach items="${board.biList }" var="bi">
                	<div class="imgDiv">
                		<img src="/secondlife/${bi.imgPath}/${bi.changeName}" alt="${board.productName}">
                	</div>
               	  
                </c:forEach>
				</c:if>
                </div>
                <button class="prev">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M15 6L9 12L15 18" stroke="#D9D9D9" stroke-width="2" />
                  </svg>
                </button>
                <button class="next">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M9 6L15 12L9 18" stroke="#D9D9D9" stroke-width="2" />
                  </svg>
                </button>
              </div>
            </div>
            <div class="dif-2">
              <div class="detail-summary">
                <div class="detail-category"><a href="/secondlife">홈</a> &gt; 카테고리 &gt; <a href="/secondlife/board/list?category=${board.categoryNo}">${categoryName}</a></div>
                <div class="detail-title">
                  <h1>${board.productName}</h1>
                </div>
                <div class="detail-price">
                  <h2><fmt:formatNumber value="${board.price}" pattern="#,###" />원</h2>
                  <c:if test="${not empty loginUser and loginUser.memberNo ne board.boardWriter}">
                  <button class="report-btn" id="openModalBtn">
                    <svg width="24" height="21" viewBox="0 0 24 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path
                        d="M12 15C11.8022 15 11.6089 15.0587 11.4445 15.1686C11.28 15.2784 11.1518 15.4346 11.0761 15.6173C11.0005 15.8001 10.9807 16.0011 11.0192 16.1951C11.0578 16.3891 11.1531 16.5673 11.2929 16.7071C11.4328 16.847 11.611 16.9422 11.8049 16.9808C11.9989 17.0194 12.2 16.9996 12.3827 16.9239C12.5654 16.8482 12.7216 16.72 12.8315 16.5556C12.9414 16.3911 13 16.1978 13 16C13 15.7348 12.8947 15.4805 12.7071 15.2929C12.5196 15.1054 12.2652 15 12 15ZM22.67 16.47L14.62 2.47003C14.3598 2.00354 13.9798 1.61498 13.5192 1.3445C13.0586 1.07401 12.5342 0.931396 12 0.931396C11.4659 0.931396 10.9414 1.07401 10.4808 1.3445C10.0202 1.61498 9.64022 2.00354 9.38003 2.47003L1.38003 16.47C1.11082 16.924 0.966171 17.441 0.960673 17.9688C0.955175 18.4966 1.08903 19.0166 1.34871 19.4761C1.6084 19.9356 1.98473 20.3185 2.43971 20.5861C2.89469 20.8536 3.41221 20.9964 3.94003 21H20.06C20.5921 21.0053 21.116 20.8689 21.5779 20.6049C22.0399 20.341 22.4234 19.9589 22.689 19.4978C22.9546 19.0368 23.0929 18.5134 23.0895 17.9814C23.0862 17.4493 22.9414 16.9277 22.67 16.47V16.47ZM20.94 18.47C20.8524 18.626 20.7245 18.7556 20.5697 18.8453C20.4149 18.935 20.2389 18.9815 20.06 18.98H3.94003C3.76114 18.9815 3.58513 18.935 3.43035 18.8453C3.27557 18.7556 3.14768 18.626 3.06003 18.47C2.97226 18.318 2.92605 18.1456 2.92605 17.97C2.92605 17.7945 2.97226 17.622 3.06003 17.47L11.06 3.47003C11.1439 3.30623 11.2714 3.16876 11.4285 3.07277C11.5855 2.97678 11.766 2.92599 11.95 2.92599C12.1341 2.92599 12.3146 2.97678 12.4716 3.07277C12.6286 3.16876 12.7561 3.30623 12.84 3.47003L20.89 17.47C20.9892 17.6199 21.0463 17.7937 21.055 17.9732C21.0638 18.1527 21.0241 18.3312 20.94 18.49V18.47ZM12 7.00003C11.7348 7.00003 11.4805 7.10538 11.2929 7.29292C11.1054 7.48046 11 7.73481 11 8.00003V12C11 12.2652 11.1054 12.5196 11.2929 12.7071C11.4805 12.8947 11.7348 13 12 13C12.2652 13 12.5196 12.8947 12.7071 12.7071C12.8947 12.5196 13 12.2652 13 12V8.00003C13 7.73481 12.8947 7.48046 12.7071 7.29292C12.5196 7.10538 12.2652 7.00003 12 7.00003Z"
                        fill="black" />
                    </svg>
                    신고하기
                  </button>
                  </c:if>
                </div>
                <div class="detail-viewers">
                  <span>${board.createDate }</span>
                  <span>조회&nbsp;${board.count }</span>
                  <span>찜&nbsp;${favCount }</span>
                  <c:if test="${not empty loginUser and loginUser.memberNo eq board.boardWriter}">
                  <div class="dropdown-category">
                    <button class="user-menu-btn" type="button" id="userDropdownBtn">
                      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="12" cy="12" r="1" stroke="#808080" stroke-width="2" stroke-linecap="round" />
                        <circle cx="6" cy="12" r="1" stroke="#808080" stroke-width="2" stroke-linecap="round" />
                        <circle cx="18" cy="12" r="1" stroke="#808080" stroke-width="2" stroke-linecap="round" />
                      </svg>
                    </button>
                    <div class="dropdown-items" id="userDropdownMenu">
                      <a class="dropdown-select" href="/secondlife/board/update/${board.boardNo}">수정하기</a>
                      <a class="dropdown-select" id="deleteButton">삭제하기</a>
                    </div>
                  </div>
                  </c:if>
                </div>
				
				<c:if test="${not empty loginUser and loginUser.memberNo ne board.boardWriter}">
                <div class="detail-purchace">
                  <button class="like-btn">
                      <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                          d="M17.4997 14C17.4997 14.2308 17.5681 14.4563 17.6963 14.6482C17.8245 14.84 18.0067 14.9896 18.2199 15.0779C18.4331 15.1662 18.6676 15.1893 18.8939 15.1443C19.1203 15.0993 19.3281 14.9881 19.4913 14.825C19.6545 14.6618 19.7656 14.4539 19.8106 14.2276C19.8556 14.0013 19.8325 13.7667 19.7442 13.5536C19.6559 13.3404 19.5064 13.1582 19.3145 13.03C19.1226 12.9018 18.8971 12.8334 18.6663 12.8334C18.3569 12.8334 18.0602 12.9563 17.8414 13.1751C17.6226 13.3939 17.4997 13.6906 17.4997 14ZM25.328 13.1717L19.4947 7.33835C19.3857 7.23022 19.2564 7.14468 19.1142 7.08662C18.9721 7.02856 18.8199 6.99913 18.6663 7.00002H5.83301C4.90475 7.00002 4.01451 7.36877 3.35813 8.02515C2.70176 8.68152 2.33301 9.57176 2.33301 10.5V17.5C2.33301 18.4283 2.70176 19.3185 3.35813 19.9749C4.01451 20.6313 4.90475 21 5.83301 21H18.6663C18.8199 21.0009 18.9721 20.9715 19.1142 20.9134C19.2564 20.8554 19.3857 20.7698 19.4947 20.6617L25.328 14.8284C25.4374 14.7199 25.5241 14.5909 25.5834 14.4487C25.6426 14.3065 25.6731 14.154 25.6731 14C25.6731 13.846 25.6426 13.6935 25.5834 13.5513C25.5241 13.4092 25.4374 13.2801 25.328 13.1717ZM18.188 18.6667H5.83301C5.52359 18.6667 5.22684 18.5438 5.00805 18.325C4.78926 18.1062 4.66634 17.8094 4.66634 17.5V10.5C4.66634 10.1906 4.78926 9.89385 5.00805 9.67506C5.22684 9.45627 5.52359 9.33335 5.83301 9.33335H18.188L22.8547 14L18.188 18.6667Z"
                          fill="#141414" />
                      </svg>
                      찜하기
                  </button>
                  <button class="chat-btn">
                    <a id="chat-link">
                      <svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                          d="M8.16634 8.16634C7.9356 8.16634 7.71003 8.23477 7.51818 8.36296C7.32632 8.49115 7.17678 8.67336 7.08848 8.88654C7.00018 9.09972 6.97708 9.3343 7.02209 9.56061C7.06711 9.78692 7.17822 9.9948 7.34138 10.158C7.50455 10.3211 7.71243 10.4322 7.93874 10.4773C8.16505 10.5223 8.39962 10.4992 8.61281 10.4109C8.82599 10.3226 9.00819 10.173 9.13639 9.98117C9.26458 9.78932 9.33301 9.56375 9.33301 9.33301C9.33301 9.02359 9.21009 8.72684 8.9913 8.50805C8.77251 8.28926 8.47576 8.16634 8.16634 8.16634ZM8.16634 12.833C7.9356 12.833 7.71003 12.9014 7.51818 13.0296C7.32632 13.1578 7.17678 13.34 7.08848 13.5532C7.00018 13.7664 6.97708 14.001 7.02209 14.2273C7.06711 14.4536 7.17822 14.6615 7.34138 14.8246C7.50455 14.9878 7.71243 15.0989 7.93874 15.1439C8.16505 15.1889 8.39962 15.1658 8.61281 15.0775C8.82599 14.9892 9.00819 14.8397 9.13639 14.6478C9.26458 14.456 9.33301 14.2304 9.33301 13.9997C9.33301 13.6903 9.21009 13.3935 8.9913 13.1747C8.77251 12.9559 8.47576 12.833 8.16634 12.833ZM19.833 12.833H12.833C12.5236 12.833 12.2268 12.9559 12.0081 13.1747C11.7893 13.3935 11.6663 13.6903 11.6663 13.9997C11.6663 14.3091 11.7893 14.6058 12.0081 14.8246C12.2268 15.0434 12.5236 15.1663 12.833 15.1663H19.833C20.1424 15.1663 20.4392 15.0434 20.658 14.8246C20.8768 14.6058 20.9997 14.3091 20.9997 13.9997C20.9997 13.6903 20.8768 13.3935 20.658 13.1747C20.4392 12.9559 20.1424 12.833 19.833 12.833ZM19.833 8.16634H12.833C12.5236 8.16634 12.2268 8.28926 12.0081 8.50805C11.7893 8.72684 11.6663 9.02359 11.6663 9.33301C11.6663 9.64243 11.7893 9.93917 12.0081 10.158C12.2268 10.3768 12.5236 10.4997 12.833 10.4997H19.833C20.1424 10.4997 20.4392 10.3768 20.658 10.158C20.8768 9.93917 20.9997 9.64243 20.9997 9.33301C20.9997 9.02359 20.8768 8.72684 20.658 8.50805C20.4392 8.28926 20.1424 8.16634 19.833 8.16634ZM22.1663 2.33301H5.83301C4.90475 2.33301 4.01451 2.70176 3.35813 3.35813C2.70176 4.01451 2.33301 4.90475 2.33301 5.83301V17.4997C2.33301 18.4279 2.70176 19.3182 3.35813 19.9745C4.01451 20.6309 4.90475 20.9997 5.83301 20.9997H19.3547L23.6713 25.328C23.7804 25.4361 23.9096 25.5217 24.0518 25.5797C24.1939 25.6378 24.3461 25.6672 24.4997 25.6663C24.6527 25.6703 24.8045 25.6383 24.943 25.573C25.1561 25.4855 25.3384 25.3369 25.4672 25.1458C25.5959 24.9548 25.6652 24.73 25.6663 24.4997V5.83301C25.6663 4.90475 25.2976 4.01451 24.6412 3.35813C23.9848 2.70176 23.0946 2.33301 22.1663 2.33301ZM23.333 21.688L20.6613 19.0047C20.5523 18.8965 20.423 18.811 20.2809 18.7529C20.1388 18.6949 19.9865 18.6655 19.833 18.6663H5.83301C5.52359 18.6663 5.22684 18.5434 5.00805 18.3246C4.78926 18.1058 4.66634 17.8091 4.66634 17.4997V5.83301C4.66634 5.52359 4.78926 5.22684 5.00805 5.00805C5.22684 4.78926 5.52359 4.66634 5.83301 4.66634H22.1663C22.4758 4.66634 22.7725 4.78926 22.9913 5.00805C23.2101 5.22684 23.333 5.52359 23.333 5.83301V21.688Z"
                          fill="#141414" />
                      </svg>
                      채팅하기
                    </a>
                  </button>
                </div>
				</c:if>
              </div>

            </div>
          </div>
          <div class="detail-specific">
            <div class="des-1">
              <div class="product-inform">
                <h2>상품 정보</h2>
              </div>
              <div class="product-detail">
                ${board.content}
                <br>
              	<br>
              
				<span style="font-weight: bold">거래방식 : 
					<c:choose>
						<c:when test="${board.tradeCategoryNo eq 0}">
							택배거래
						</c:when>
						<c:when test="${board.tradeCategoryNo eq 1}">
							직거래
						</c:when>
						<c:otherwise>
							택배 & 직거래 가능 
						</c:otherwise>
					</c:choose>
				</span>
				<br>
				<span style="font-weight: bold">상품상태 : 
					<c:choose>
						<c:when test="${board.condition eq 0 }">
							중고
						</c:when>
						<c:when test="${board.condition eq 1 }">
							새상품
						</c:when>
					</c:choose>
				</span>
				       
              </div>
            </div>
            <div class="des-2">
              <div class="seller-inform">
                <h2>판매자 정보</h2>
              </div>
              <div class="seller-detail">
                <div class="seller-profile">
                  <div class="seller-name"><a href="/secondlife/member/memberDetail/${member.memberNo }">${member.nickname}</a></div>
                  <div class="seller-img">
                  	<c:if test="${member.profileImg eq null}">
                 		<img src="/secondlife/resources/images/사이트 로고.png" alt=""> 
                  	</c:if>
                  </div>
                </div>
                <div class="seller-specific">
                  <div class="selling">
                    <span>판매중</span>
                    <span><a href="#">${salesCount.SALE_COUNT }</a></span>
                  </div>
                  <div class="sell-done">
                    <span>판매완료</span>
                    <span><a href="#">${salesCount.SOLD_COUNT }</a></span>
                  </div>
                  <div class="sell-review">
                    <span>고객 후기</span>
                    <span><a href="#">${reviewCount}</a></span>
                  </div>

                </div>
                <div class="seller-other">
                  <c:forEach items="${sellorList }" var="board">
                  <div class="seller-items">
                    <a href="/secondlife/board/detail/${board.boardNo }">
                      <div class="thumbnail">
                        <img src="/secondlife/${board.biList.get(0).imgPath }${board.biList.get(0).changeName}" alt="">
                      </div>
                      <div class="info">
                        <span>${board.productName }</span>
                        <span><fmt:formatNumber value="${board.price}" pattern="#,###" />원</span>
                      </div>
                    </a>
                  </div>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>

          <div class="detail-addition">
            <div class="da">
              <div class="da-title">
                <h2>같이 보면 좋은 상품들</h2>
                <span><a href="#">더보기</a></span>
              </div>
              <div class="da-content">
                <c:if test="${not empty list }">
                <c:forEach items="${list }" var="board">
              	<div class="da-items">
                  <a href="/secondlife/board/detail/${board.boardNo }">
                    <div class="da-img">
                      <c:if test="${board.biList.size() ne 0 }">
                      	<img src="/secondlife/${board.biList.get(0).imgPath}/${board.biList.get(0).changeName}">
                      </c:if>
                      <c:if test ="${board.biList.size() eq 0 }">
                      	<img src="/secondlife/resources/images/사이트 로고.png">
                      </c:if>
                    </div>
                    <div class="da-name">
                      <span> ${board.productName} </span>
                    </div>
                  </a>
                </div>
                </c:forEach>
                </c:if>
              </div>
            </div>
          </div>
        </div>

      </div>
      <div class="marginer"></div>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <div id="myModal" class="report-modal">
      <form action="#" method="post">
        <div class="report-modal-body">
          <div class="report-title">
            <h2>신고하기</h2>
            <span class="report-close-btn">&times;</span>
          </div>
          <div class="report-content">
            <div class="report-target">
              <label for="target-input" class="target-label">신고대상</label>
              <input type="text" id="target-input" />
            </div>
            <div class="report-detail">
              <label for="report-detail-input" class="report-detail-label">신고내용</label>
              <div class="report-textarea">
                <textarea name="" id="report-detail-input" placeholder="신고 내용을 직접 작성해 주세요. 자세하게 적어주시면 신고처리에 큰 도움이 됩니다."
                  maxlength="200"></textarea>
                <div class="text-length-limit">0 / 200자</div>
              </div>
              <div class="report-images">
                <div class="file-upload-container">
                  <input type="file" id="imageInput" multiple accept="image/*" style="display: none" />
                  <span id="fileName"></span>
                  <button type="button" id="uploadBtn">첨부파일 선택</button>
                </div>
                <div id="imagePreviewContainer"></div>
              </div>
              <div class="report-submit">
                <input type="submit" value="제출하기" />
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
	
  </div>
  <script src="/secondlife/resources/js/board/boardDetail.js"></script> 
  <script>
  		$(".like-btn").click(function(){
  			$.ajax({
  				url : `/secondlife/board/like/${board.boardNo}`,
  				type: "post",
  				success : function(response){
  					if(response.result > 0){
  						alert("게시글을 찜했습니다!");
  					} 
  					else{
  						alert("이미 찜한 게시글입니다.");
  					}
  					location.href = '/secondlife/board/detail/' + '${board.boardNo}';
  				},
  				error : function(xhr){
  					console.log(xhr.status);
  					console.log(xhr.responseText);
  					console.log("error");
  				}
  			})
  		});

      $(".chat-btn").click(function () {	
        $.ajax({
          url : '${contextPath}/chat/room/insert',
          method : 'post',
          data : {
            'boardNo' : '${board.boardNo}',
            'secondMemberNo' : '${board.boardWriter}'
          },
          success : function(result) {
            if(result > 0) {
              location.href="${contextPath}/chat/room";
            } else {
              alert("채팅 전송 실패");
              location.replace(location.href);
            }
          }
        })
      })
  </script>
  
  <script>
	$("#deleteButton").on("click", function(){
		var isDelete = confirm("게시글을 삭제하시겠습니까?");
		if(isDelete){
			
			$.ajax({
				url : `/secondlife/board/delete/${board.boardNo}`,
				type: "post",
				success : function(result){
					console.log(result);
					if(result > 0){
						alert("게시글을 삭제했습니다.");
						location.href="/secondlife/board/list";
					} else{
						alert("게시글 삭제에 실패했습니다.");
					}
				}, 
				error : function(xhr){
					console.log(xhr);
					console.log("에러가 발생했습니다.")
				}
			})
			
		} else{
			return;
		}
	});
  </script>

</html>