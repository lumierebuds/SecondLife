<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Second Life - 상품의 새 삶</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/secondlife/resources/css/common.css">
</head>
<body>
      
	  <nav>
      <div class="marginer"></div>
      <div class="nav-area">
        <div class="category">
          <div class="category-bar">
            <svg width="29" height="17" viewBox="0 0 29 17" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path
                d="M2.125 3H26.875C27.2397 3 27.5894 2.85513 27.8473 2.59727C28.1051 2.33941 28.25 1.98967 28.25 1.625C28.25 1.26033 28.1051 0.910591 27.8473 0.652728C27.5894 0.394866 27.2397 0.25 26.875 0.25H2.125C1.76033 0.25 1.41059 0.394866 1.15273 0.652728C0.894866 0.910591 0.75 1.26033 0.75 1.625C0.75 1.98967 0.894866 2.33941 1.15273 2.59727C1.41059 2.85513 1.76033 3 2.125 3ZM26.875 14H2.125C1.76033 14 1.41059 14.1449 1.15273 14.4027C0.894866 14.6606 0.75 15.0103 0.75 15.375C0.75 15.7397 0.894866 16.0894 1.15273 16.3473C1.41059 16.6051 1.76033 16.75 2.125 16.75H26.875C27.2397 16.75 27.5894 16.6051 27.8473 16.3473C28.1051 16.0894 28.25 15.7397 28.25 15.375C28.25 15.0103 28.1051 14.6606 27.8473 14.4027C27.5894 14.1449 27.2397 14 26.875 14ZM26.875 7.125H2.125C1.76033 7.125 1.41059 7.26987 1.15273 7.52773C0.894866 7.78559 0.75 8.13533 0.75 8.5C0.75 8.86467 0.894866 9.21441 1.15273 9.47227C1.41059 9.73013 1.76033 9.875 2.125 9.875H26.875C27.2397 9.875 27.5894 9.73013 27.8473 9.47227C28.1051 9.21441 28.25 8.86467 28.25 8.5C28.25 8.13533 28.1051 7.78559 27.8473 7.52773C27.5894 7.26987 27.2397 7.125 26.875 7.125Z"
                fill="#141414" />
            </svg>
            <span>카테고리</span>
          </div>
          <div class="category-dropdown">
            <a href="#">수입명품</a>
            <a href="#">패션의류</a>
            <a href="#">패션잡화</a>
            <a href="#">도서/음반/문구</a>
            <a href="#">출산/유아동</a>
            <a href="#">모바일/태블릿</a>
            <a href="#">가전제품</a>
            <a href="#">노트북/PC</a>
            <a href="#">가구/인테리어</a>
            <a href="#">리빙/생활</a>
            <a href="#">게임</a>
            <a href="#">오토바이</a>
            <a href="#">무료나눔</a>
          </div>
        </div>
        <form action="/secondlife/board/list" method="get">
          <div class="search-bar">
            <svg id="search-icon" width="18" height="18" viewBox="0 0 18 18" fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <path
                d="M17.1107 15.6317L13.2272 11.7482C14.1652 10.4392 14.5765 8.82531 14.3794 7.22705C14.1823 5.62879 13.3912 4.16316 12.1632 3.12132C10.9353 2.07948 9.36035 1.53766 7.75133 1.60351C6.14231 1.66937 4.61693 2.33806 3.47823 3.47677C2.33953 4.61547 1.67083 6.14085 1.60498 7.74987C1.53913 9.35889 2.08094 10.9338 3.12278 12.1617C4.16463 13.3897 5.63026 14.1808 7.22852 14.3779C8.82678 14.575 10.4407 14.1637 11.7497 13.2257L15.6332 17.1092C15.8347 17.274 16.0903 17.358 16.3503 17.345C16.6103 17.332 16.8562 17.2228 17.0402 17.0388C17.2243 16.8547 17.3334 16.6088 17.3465 16.3488C17.3595 16.0888 17.2754 15.8333 17.1107 15.6317ZM3.53268 8.02821C3.53268 7.1382 3.7966 6.26817 4.29106 5.52815C4.78553 4.78812 5.48833 4.21135 6.3106 3.87075C7.13287 3.53016 8.03767 3.44104 8.91058 3.61468C9.7835 3.78831 10.5853 4.21689 11.2147 4.84623C11.844 5.47557 12.2726 6.27739 12.4462 7.1503C12.6198 8.02322 12.5307 8.92802 12.1901 9.75029C11.8495 10.5726 11.2728 11.2754 10.5327 11.7698C9.79272 12.2643 8.92269 12.5282 8.03268 12.5282C6.8392 12.5282 5.69461 12.0541 4.8507 11.2102C4.00678 10.3663 3.53268 9.22169 3.53268 8.02821Z"
                fill="#959595" />
            </svg>
            <input type="text" class="search-input" placeholder="검색어를 입력해주세요." name="search" />
          </div>
        </form>

        <div class="writer">
          <svg width="17" height="27" viewBox="0 0 17 27" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path
              d="M6.7112 0V3.33891H4.20702C1.93657 3.33891 0.0333891 5.24208 0.0333891 7.51254V9.18199C0.0333891 11.4525 1.50251 13.3222 3.6728 13.8899L12.2204 16.0935C12.6878 16.2271 13.3556 17.0618 13.3556 17.5627V19.2321C13.3556 19.6996 12.9883 20.0668 12.5209 20.0668H4.17363C3.77296 20.0668 3.47246 19.9333 3.33891 19.8665V16.7279H0V20.0668C0 21.2021 0.667781 22.1703 1.46912 22.6712C2.23707 23.2054 3.20535 23.4057 4.17363 23.4057H6.67781V26.7446H10.0167V23.4057H12.5209C14.8247 23.4057 16.6945 21.5359 16.6945 19.2321V17.5627C16.6945 15.2922 15.2254 13.4224 13.0551 12.8548L4.50752 10.6511C4.04008 10.5176 3.3723 9.68283 3.3723 9.18199V7.51254C3.3723 7.04509 3.73958 6.67781 4.20702 6.67781H12.5543C12.9216 6.67781 13.2555 6.81137 13.389 6.87815V10.0167H16.7279V6.67781C16.7279 5.54259 16.0601 4.5743 15.2588 4.07347C14.4909 3.53924 13.5226 3.33891 12.5543 3.33891H10.0501V0L6.7112 0Z"
              fill="black" />
          </svg>
          <span>판매하기</span>
        </div>
      </div>
      <div class="marginer"></div>
    </nav>
</body>
</html>