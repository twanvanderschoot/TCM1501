/**
 * Version: 1.0
 * $Rev: 1031 $
 * $Author: twan $
 * $Date: 2013-10-07 02:43:16 +0200 (Mon, 07 Oct 2013) $
 *
 * Wordt aangeroepen in index.html
 * User: twan
 * Date: 07-10-13
 * Time: 02:39
 */


var current_menu="",
    SECONDS =1000,
    delay=300 * SECONDS,
    fading= 2 * SECONDS;

$(document).ready(function () {
    var menuitems = $("div.menu_item img");

    menuitems.on("mouseout",  function(evt){
        $(evt.target).each(function(i,e){
            if(current_menu!=e.id)$(e).attr("src", "images/bar-"+evt.target.id+"_light.png");
        });
    });
    menuitems.on('mouseover',  function (evt) {
        $(evt.target).attr("src", "images/bar-"+evt.target.id+"_dark.png");
    });

    menuitems.on("click touchstart", function(evt){
        var content =$("div.content"),
            middle_spacer =$("div#middle_spacer");

        content.stop(true, true);
        middle_spacer.stop(true,true);

        current_menu = evt.target.id;
        if(current_menu!="menu_ellipses") {
            middle_spacer.fadeTo(100, 1);
        } else {
            middle_spacer.fadeTo(100, 0);
        }
        menuitems.each(function(i,e){
            if(current_menu!=e.id || current_menu=="menu_ellipses"){
                $(e).attr("src", "images/bar-"+e.id+"_light.png");
            }
        });

        console.log("current menu:" + current_menu);

        var current_id = current_menu.slice(current_menu.indexOf("_")+1);

        content.each(function(i,e){
            console.log(e.id);
            $(e).css("opacity", (e.id==current_id)?"1":"0");
            $(e).css("z-index", (e.id==current_id)?"10":"-1");
        });


        content.delay(delay).fadeTo(fading, 0, function(){
            menuitems.each(function(i,e){
                $(e).attr("src", "images/bar-"+e.id+"_light.png");
            });
            current_menu="";
        });
        middle_spacer.delay(delay).fadeTo(delay,0);
    });
});

// eof(index.js).