$(function(){
    $("#messageshow .replybutton").click(function(){
        var focus = $(this).parents("ul li").find(".reply");
        if(focus.css("display")=="none")
        {
            focus.show();
            this.innerHTML = "收起";
        }else
        {
            focus.hide();
            this.innerHTML = "回复";
        }
    });
    $(".reply form").submit(function(){
        var textarea = $(this).find(".replytextarea");
        if(textarea.val()==""||textarea.val()=="请输入内容")
        {
            textarea.blur();
            return false;
        }
    });
});