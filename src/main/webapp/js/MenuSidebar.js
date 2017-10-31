$(document).ready(function (){
    menu();
    sidebar();
});
function menu(){
    $('.list >li').hover(function(){
        $(this).children('.hide').toggle();
        $(this).children('.hengtiao').toggle();
    });
};
function sidebar(){
    t = $('#rightBar').offset().top;
    ut=$('#unprocessedMessageWrapper').offset().top;
    $(window).scroll(function(e){
        s = $(document).scrollTop();
        if(s > t){
            $('#rightBar').css('position','fixed');
            $('#rightBar').css('top',100+'px');
            $('#leftBar').css('position','fixed');
            $('#leftBar').css('top',100+'px');

        }else{
            $('#rightBar').css('position','');
            $('#rightBar').css('top',600+'px');
            $('#leftBar').css('position','');
            $('#leftBar').css('top',600+'px');
        }
        if (s > ut) {
            $('#unprocessedMessageWrapper').css('position', 'fixed');
            $('#unprocessedMessageWrapper').css('top', 0 + 'px');
        } else{
            $('#unprocessedMessageWrapper').css('position', '');
            $('#unprocessedMessageWrapper').css('top', 30 + 'px');
        }
    })
};
