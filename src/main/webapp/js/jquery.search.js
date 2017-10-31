/**
 * Created by msi on 2016/12/18.
 */

var datas = ["蓝天环保社团", "师大学生会", "经济管理学社", "社调研", "英语俱乐部", "青春之旅", "同舟学习会", "街舞协会", "武术协会", "旱冰协会"];
var $input1;
var selectIndex = -1;//聚焦位置
var p;//用于存放p元素
var oldValue="";//用于存放之前自己输入的值
$(document).ready(function () {
    $input1 = $("#input1");
    /*数据*/

    /*1.键盘随便输入一个值的时候弹出搜索框*/
    /*2.按住上下键的时候,焦点位置改变*/

    $input1.keyup(function () {

        if (event.keyCode == 40 || event.keyCode == 38) {
            if (event.keyCode == 40) {
                selectIndex++;


            }
            else {
                selectIndex--;
            }
            if (selectIndex < -1) {
                selectIndex = datas.length - 1;
            }
            if (selectIndex >= datas.length) {
                selectIndex = -1;
            }
            /*改变当前索引位置的颜色*/



            //alert(oldValue);/*我不太理解为什么这里的oldValue为什么会随着我的selectIndex的改变而改变,我是想把它单独存起来的,这怎么改,如果会变我存着也没意义了*/

            changeColorAndSetInputValue(selectIndex);


        }
        else {
            oldValue=$input1.val();
            createKuangKuang();
        }

    });
    $input1.blur(function () {
        $("#div02").css("display","none");
    });


});


function createKuangKuang() {
    var $div02 = $("#div02");
    $("#div02").css("display","block");
    $div02.css("border-color", "lightgray");

    if ($div02.html()) {
        $div02.html("");
    }


    /*把数据放到div02里面显示*/
    for (var i = 0; i < datas.length; i++) {


        p = $("<p>" + datas[i] + "</p>");
        $div02.append(p);
        p.mouseover(function () {
            this.style.backgroundColor="#f4c821";
        });
        p.mouseout(function () {
            this.style.backgroundColor="white";
        });

    }

}
/*改变索引位置颜色的方法*/
function changeColorAndSetInputValue(index) {
    var $p = $("p");
    if(index==-1)
    {

        $input1.val

        (oldValue);
    }
    else
    {
        $input1.val(datas[index]);
    }

    /*清空之前的所有颜色*/


    $p.each(function (index1,p) {
        this.style.backgroundColor=null;
    });
    $p.each(function (index1, p) {
        /*获取p对象,改变p的颜色*/
        if (index1 == index) {
            this.style.backgroundColor = "blue";

        }
    });





}
