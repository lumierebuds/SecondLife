$(document).ready(function() {
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

    $('#drop-btn').on('click', function(e) {
        e.preventDefault();

        if($('.drop-box').css('display') == 'none') {
            $('.drop-box').css('display', 'block');
        } else {
            $('.drop-box').css('display', 'none');
        }
    })
})

function loginView() {
    $('.login-menu').css('display', 'flex');
    $('.logout-menu').css('display', 'none');
}