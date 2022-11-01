/**
 * Version:
 * $Rev: $
 * $Author: $
 * $Date: $
 *
 * Created with IntelliJ IDEA.
 * User: twan
 * Date: 12-10-13
 * Time: 02:39
 */


window.twan = {};
window.twan.com = {};
window.twan.com.blog = {};

(function (ctx) {
    var floater_color = "rgb(192, 236, 251)";
    
    $(document).ready(function () {
        
        
        // TO DO: simpify & reduce.
        ctx.indexmenu = IndexMenu("#floater-bottom");
        ctx.floaterbottom = FloaterFlag("#floater-bottom", "left");
        ctx.floatertop = FloaterFlag("#floater-top", "right");
        
        var floater_color = "rgba(192, 236, 251, 0.8)";
        
        $("#floater-top").on('click', function (evt) { location.href = "http://www.twan.com"; });
        $("#floater-top").hover(
            function (evt) {
                $("#floater-top").css("color", "rgb(192, 236, 251)");
            },
            function (evt) {
                $("#floater-top").css("color", "rgba(0,0,0,0)");
            }

        );
        
        $("#floater-bottom").hover(
            function (evt) {
                $("#index").css("color", "white");
                $("#floater-bottom").css("color", "white");
            },
            function (evt) {
                $("#index").css("color", "rgba(255,255,255,0.5)");  
                $("#floater-bottom").css("color", floater_color);
            }
        );
         $("#floater-bottom").on('click', function (evt) {
            ctx.indexmenu.toggle();
        });
        
        
        $("#footer").hover(
        function (evt) {
            $("#index").css("color", "white")
        },
        function (evt) {
            $("#index").css("color", "rgba(255,255,255,0.5)")
        });
        
        $("#footer").on('click', function (evt) {
            ctx.indexmenu.toggle();
        });
        

        
        // Resolve <skip> and <stop>:
        
        $("skip").each(function (e, i) {
            // Find the concomitant  <stop>.
            // -- isolate the to-attribute
            // -- construct the search query for the <stop here=id>
            // -- append a child to the the found <stop> element with a <margin class="left skip"><a id="#"+to>closed downward triangle</a></margin>
            // -- append a child to the current skip element <margin class="left stop"><a href="#"+to>open right triangle</a></margin>
        });
        
        console.log("done");
    });
    
    
    var FloaterFlag = function (element, direction) {
        function expand() {
            $(element).animate({
                width: '200px', height: '50px', opacity: 1.0, color: 'white'
            },
            {
                duration: "fast"
            });
        }
        
        function collapse() {
            $(element).animate({
                width: '50px', height: '50px', opacity: 0.8, color: floater_color
            },
            {
                duration: "fast"
            });
        }
        
        $(element).hover(expand, collapse);
        
        return this;
    };
    
    var IndexMenu = function (element) {
        this.expanded = false;
        
        this.toggle = function () {
            $(element).animate(
            (this.expanded) ? {
                width: '50px', height: '50px', opacity: 0.8
            }: {
                width: '300px', height: '300px', opacity: 1.0
            },
            {
                duration: "fast"
            });
            this.expanded = ! this.expanded;
        };
        
        return this;
    }
})(window.twan.com.blog);