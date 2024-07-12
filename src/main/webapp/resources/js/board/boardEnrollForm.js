var biList = [];

$(document).ready(function() {

    // 이미지 추가 버튼 클릭 시 파일 업로드 창 열기
    $('.imgUpload').on('click', function() {
      $('#fileInput').click();
    });
   
    // 파일 업로드 시 이미지 추가 및 삭제 버튼 생성
   $('#fileInput').on('change', function() {
    var files = this.files;
    var currentCount = $('.additionalDiv').length;
   
    if (files.length + currentCount > 10) {
      alert("상품 사진은 최대 10개까지 등록 가능합니다.");
      return;
    }
    biList = [...biList , ...files];
   
    $(".additionalBox").html("");
    biList.forEach((file , i) => {
      if (file) {            
        var reader = new FileReader();
        reader.onload = function(e) {
          // 새로운 이미지 요소 생성
          var newImageDiv = $(`<div class="additionalDiv" data-index="${i}"></div>`);
   
          var img = $('<img>');
          img.attr('src', e.target.result);
   
          // 삭제 버튼 생성
          var removeButton = $('<button class="removeButton">✕</button>');
   
          // 삭제 버튼 클릭 시 해당 이미지 제거
          removeButton.on('click', function(e) {
            // 이미지 제거 시 해당 이미지의 인덱스 얻어내서 biList에서 삭제
            e.preventDefault();
   
            var index = $(e.target).parent().data('index');
   
            console.log("삭제될 div : ", index);
   
            // splice를 사용하면 알아서 삭제 후 뒤의 값을 앞으로 당겨줌
            biList.splice(index, 1);
   
            newImageDiv.remove();
            updateFileIndexes();
            updateImageCount();
            updateThumb();
            
            $('.additionalDiv').each(function (index, elem) {
              console.log(index, '번 : ', $(elem), ", index값 : ", $(elem).data('index'));
            })
          });
   
          // 새로운 이미지 요소를 추가
          newImageDiv.append(img);
          newImageDiv.append(removeButton);
   
          $('.additionalBox').append(newImageDiv);
          updateImageCount();
          updateThumb();
        }
        
        reader.readAsDataURL(file);
      }
    });
    
    // 파일 입력 필드를 초기화하여 동일한 파일을 다시 선택할 수 있도록 함
    $('#fileInput').val('');
   });
   
   function updateFileIndexes() {
    console.log("update indexes");
    $('.additionalDiv').each(function(index) {          
      $(this).attr('data-index', index);
      console.log(this, index);
    });
   }
   
   // 이미지 개수 업데이트 함수
   function updateImageCount() {
    var currentCount = $('.additionalDiv').length;
    $('.imgUpload p').text(currentCount + '/10');
   }
   
    $('.twotypebutton button').click(function() {
   
      var isSelected = $(this).hasClass('selected');
   
      // 클릭된 버튼이 이미 선택된 상태가 아닌 경우에만 처리
      if(!isSelected){
        // 모든 버튼의 선택 상태 제거
        $('.twotypebutton button').removeClass('selected');
        // 클릭한 버튼에 선택 상태 추가
        $(this).addClass('selected');
        // 선택된 버튼의 값을 숨겨진 필드에 저장
        $('#condition').val($(this).val());
      }
    });
    
    $('.categoryList > li > button').click(function(){
      var isSelected = $(this).parent().hasClass('selected2');
   
      // 클릭된 버튼이 이미 선택된 상태가 아닌 경우에만 처리
      if(!isSelected){
        // 모든 버튼의 선택 상태 제거
        $('.categoryList > li').removeClass('selected2');
        // 클릭한 버튼에 선택 상태 추가
        $(this).parent().addClass('selected2');
        
        if($('#freeSharing').is(':checked')){
          $('#freeSharing').click();
        }
   
        // 선택된 버튼의 값을 숨겨진 필드에 저장
        $('#categoryNo').val($(this).val());
        
        if($(this).is($('#category-13 > button'))){
          $('#freeSharing').click();
        }
      }
    });
   
    // 판매가격에 숫자만 들어올 수 있게
    $('#price').on('input', function() {
      var value = $(this).val();
      // 숫자가 아닌 문자 제거
      value = value.replace(/[^0-9]/g, '');
      
      // 최대값 제한 (1억)
      if (value > 100000000) {
          value = '100000000';
      }
   
      // 숫자가 없는 경우 필드를 비우기
      if (value === '') {
          $(this).val('');
          return;
      }
   
      // 쉼표 추가
      var formattedValue = new Intl.NumberFormat('ko-KR').format(value);
      
      $(this).val(formattedValue);
   
    });
   
    $('.uploadButton').click(function(e){
   
      e.preventDefault;
   
      if($('#price').val() == '무료나눔'){
        $('#price').val('0');
        $('#price').prop('disabled', false);
      }
      
      $('#price').val($('#price').val().replace(/[^0-9]/g, ''));
   
      return true;
    });
   
    $('#writing').on('input', function() {
        var textLength = $(this).val().length;
        $('.writing-length').text(textLength + '/1000');
    });
   
   const additionalBox = document.querySelector('.additionalBox');
   const customScrollbar = document.getElementById('custom-scrollbar');
   const customThumb = document.getElementById('custom-thumb');
   
   // ----- timelineaer 추가본
   function updateThumb() {
    const scrollWidth = additionalBox.scrollWidth;
    const clientWidth = additionalBox.clientWidth;
    const scrollLeft = additionalBox.scrollLeft;
    if(scrollWidth <= clientWidth) {
      customScrollbar.style.display = 'none';
    } else {
      customScrollbar.style.display = 'flex';
    }
   
    const thumbWidth = clientWidth / scrollWidth * clientWidth;
    const thumbPosition = scrollLeft / scrollWidth * clientWidth;
   
    customThumb.style.width = `${thumbWidth}px`;
    customThumb.style.transform = `translateX(${thumbPosition}px)`;
   }
   
   additionalBox.addEventListener('scroll', updateThumb);
   window.addEventListener('resize', updateThumb);
   
   customThumb.addEventListener('mousedown', function(e) {
      e.preventDefault();
      const startX = e.pageX;
      const startScrollLeft = additionalBox.scrollLeft;
      const onMouseMove = function(e) {
          const deltaX = e.pageX - startX;
          additionalBox.scrollLeft = startScrollLeft + deltaX / customScrollbar.clientWidth * additionalBox.scrollWidth;
      };
      const onMouseUp = function() {
          document.removeEventListener('mousemove', onMouseMove);
          document.removeEventListener('mouseup', onMouseUp);
      };
      document.addEventListener('mousemove', onMouseMove);
      document.addEventListener('mouseup', onMouseUp);
   });
   
   updateThumb();
   // ---------------
   
});

var originalColor = $('.price-container > span').css("color");
var originalPlaceholder = $('#writing').attr('placeholder');

function free(){
   
   
    if($('#freeSharing').is(':checked')){
      $('#price').attr('placeholder', '무료나눔').prop('disabled', true).addClass('disabled-input');
      $('#price').val('무료나눔');
      $('.price-container > span').css("color", "#DDB892");
      //무료나눔 체크를 하면 카테고리에 selected2 클래스 추가
      $('#category-13 > button').click();
      $('#writing').attr('placeholder', '- 나눔 진행 사유\n- 상품 설명\n- 사용 기간\n- 나눔 장소\n* 실제 촬영한 사진과 함께 상세 정보를 입력해주세요.\n* 카카오톡 아이디 첨부 시 게시물 삭제 및 이용제재 처리될 수 있어요.\n안전하고 건전한 거래환경을 위해 과학기술정보통신부, 한국인터넷진흥원, 세컨드라이프가 함께합니다.');
    }else{
      $("input[name='price']").attr('placeholder', '판매가격').prop('disabled', false).removeClass('disabled-input');
      $('.price-container > span').css("color", originalColor);
      $('#category-13').removeClass('selected2');
      $('#categoryNo').val('');
      $('#writing').attr('placeholder', originalPlaceholder);
      $('#price').val('');
    }
}

