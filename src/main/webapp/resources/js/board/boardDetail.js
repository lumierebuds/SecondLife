/**
 * 게시글 상세정보 스크립트
 */

// 이미지 슬라이드바 스크립트
$(document).ready(function () {
  let slideIndex = 0;
  const slides = $(".detail-wrapper img");
  console.log(slides);
  const totalSlides = slides.length;

  function showSlide(index) {
    if (index >= totalSlides) {
      slideIndex = 0;
    } else if (index < 0) {
      slideIndex = totalSlides - 1;
    }
    const offset = -slideIndex * 100 + "%";
    $(".detail-wrapper").css("transform", `translateX(${offset})`);
  }

  $(".next").click(function () {
    slideIndex++;
    showSlide(slideIndex);
  });

  $(".prev").click(function () {
    slideIndex--;
    showSlide(slideIndex);
  });

  showSlide(slideIndex);
});

// 모달창 스크립트
$(document).ready(function () {
  const modal = $("#myModal");
  const btn = $("#openModalBtn");
  const span = $(".report-close-btn");

  btn.on("click", function () {
    modal.show();
  });

  span.on("click", function () {
    modal.hide();
  });

  $(window).on("click", function (event) {
    if ($(event.target).is(modal)) {
      modal.hide();
    }
  });
});

//  신고내용 글자수 추적 스크립트
$(document).ready(function () {
  const textarea = $("#report-detail-input");
  const charCount = $(".text-length-limit");
  const maxLength = textarea.attr("maxlength");

  textarea.on("input", function () {
    const currentLength = $(this).val().length;
    charCount.text(`${currentLength} / ${maxLength}자`);
  });
});

// 신고 첨부파일 선택 스크립트
$(document).ready(function () {
  const maxImages = 5;
  const imageInput = $("#imageInput");
  const uploadBtn = $("#uploadBtn");
  const fileName = $("#fileName");
  const imagePreviewContainer = $("#imagePreviewContainer");

  // 업로드 버튼 클릭 시 파일 선택 창 열기
  uploadBtn.on("click", function () {
    if (imagePreviewContainer.children().length < maxImages) {
      imageInput.click();
    } else {
      alert("최대 5개의 이미지를 업로드할 수 있습니다.");
    }
  });

  // 파일 선택 시 이미지 미리 보기 추가
  imageInput.on("change", function (event) {
    const files = event.target.files;
    if (files.length + imagePreviewContainer.children().length > maxImages) {
      alert("최대 5개의 이미지를 업로드할 수 있습니다.");
      return;
    }

    fileName.text(
      files.length > 1 ? files.length + "개의 파일 선택됨" : files[0].name
    );

    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      const reader = new FileReader();

      reader.onload = function (e) {
        const imgElement = $(
          '<div class="image-preview">' +
            '<img src="' +
            e.target.result +
            '" alt="Image">' +
            '<button class="remove-btn">&times;</button>' +
            "</div>"
        );

        imgElement.find(".remove-btn").on("click", function () {
          imgElement.remove();
          updateFileName();
        });

        imagePreviewContainer.append(imgElement);
      };

      reader.readAsDataURL(file);
    }

    imageInput.val(""); // 파일 입력 값 초기화하여 동일 파일 재업로드 가능
  });

  // 파일 이름 업데이트 함수
  function updateFileName() {
    const previewCount = imagePreviewContainer.children().length;
    fileName.text(
      previewCount > 0 ? previewCount + "개의 파일 선택됨" : "선택된 파일 없음"
    );
  }
});

// 햄버거 메뉴 스크립트
$(document).ready(function () {
  // 버튼 클릭 시 드롭다운 토글
  $("#userDropdownBtn").on("click", function (event) {
    event.stopPropagation(); // 이벤트 버블링 중지
    $("#userDropdownMenu").toggleClass("show");
  });

  // 드롭다운 외부 클릭 시 드롭다운 메뉴 닫기
  $(document).on("click", function (event) {
    if (
      !$(event.target).closest("#userDropdownBtn, #userDropdownMenu").length
    ) {
      $("#userDropdownMenu").removeClass("show");
    }
  });
});
