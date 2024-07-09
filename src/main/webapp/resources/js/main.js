document.addEventListener('DOMContentLoaded', function () {
    const cardsContainer = document.getElementById('cardsContainer');

    let isDown = false;
    let startX;
    let scrollLeft;

    cardsContainer.addEventListener('mousedown', (e) => {
        isDown = true;
        cardsContainer.classList.add('active');
        startX = e.pageX - cardsContainer.offsetLeft;
        scrollLeft = cardsContainer.scrollLeft;
    });
    cardsContainer.addEventListener('mouseleave', () => {
        isDown = false;
        cardsContainer.classList.remove('active');
    });
    cardsContainer.addEventListener('mouseup', () => {
        isDown = false;
        cardsContainer.classList.remove('active');
    });
    cardsContainer.addEventListener('mousemove', (e) => {
        if (!isDown) return;
        e.preventDefault();
        const x = e.pageX - cardsContainer.offsetLeft;
        const walk = (x - startX) * 2; //scroll-fast
        cardsContainer.scrollLeft = scrollLeft - walk;
    });

    $('#login').on('click', function () {
        $('#modalBackground').css('display', 'flex');
    });

    $('#modalBackground').on('mousedown', function (e) {
        if (e.target === e.currentTarget) {
            $(e.currentTarget).css('display', 'none');
            $('.modal-login').css('display', 'flex');
            $('.modal-find-form').css('display', 'none');
        }
    });

    $('#find-id').on('click', function () {
        $('.modal-login').css('display', 'none');
        $('.modal-find-form').css('display', 'flex');
    });

    $('.find-btn').each(function () {
        $(this).on('click', function (e) {
            e.preventDefault();
            $('.find-btn').each(function () {
                if (e.target === this) {
                    $(this).css({
                        'background-color': '#7F5539',
                        'color': '#fff'
                    });
                    
                    $(`.${$(this).val()}`).css('display', 'flex');
                } else {
                    $(this).css({
                        'background-color': '#B08968',
                        'color': '#000'
                    });
                    $(`.${$(this).val()}`).css('display', 'none');
                }
            });
        });
    });

    $('.find-btn').first().trigger('click');
});