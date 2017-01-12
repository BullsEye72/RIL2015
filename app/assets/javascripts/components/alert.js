$(function(){

    // Alert dismiss
    $alert = $('.alert');
    $alert.find('button.close').on('click', function () {
        console.log('action');
        $alert.addClass('animated zoomOutUp');
        $alert.css({
            'transition': 'all ease .5s',
            'transition-delay': '.5s',
            'padding': 0,
            'margin-bottom': 0,
            'height': 0
        });
    });

});