/**
 * Created by Administrator on 10/30/2016.
 */
function Setbackground() {
    $("#numA").css("background-image", "url('picture/bg11.jpg')").css("width", "1920px").css("height", "1044px").css("background-position", "center")
}
function SetDivA() {
    /*
     * #divA{
     width: auto;
     height: 230px;
     border: solid 1px deepskyblue;
     }
     #divB{
     width: auto;
     height: 500px;
     border: solid 1px deepskyblue;

     }
     #divC{
     width: auto;
     height: 500px;
     border: solid 1px deepskyblue;
     }
     * */
    $("#numAA").css("width", "auto").css("height", "230px").css("border", "solid 1px deepskyblue");
    $("#numAB").css("width", "auto").css("height", "500px").css("border", "solid 1px deepskyblue");
    $("#numAC").css("width", "auto").css("height", "500px").css("border", "solid 1px deepskyblue");
}
function SetDivAA() {
    /*
     width: auto;
     height: 60px;
     border: solid 1px lightgray;
     text-align: right;
     */
    $("#numAAA,#numAAB").css("width", "auto").css("height", "60px").css("border", "solid 1px lightgray").css("text-align", "right");
}

function findStImg() {
    for (var i = 1; i < 9; i++) {

        $("#st0" + i).html("<img   style='margin: 0px auto auto auto;' src='stPicture/stbg" + i + ".jpg' alt='stbg" + i + ".jpg'>");
    }
}


