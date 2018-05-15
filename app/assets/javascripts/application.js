// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// parallax header
var windowY;
/* Dom Ready ?*/
document.addEventListener('DOMContentLoaded',function(event){
    // get window size
    windowX = window.innerWidth;
    // parallax layers
    function doParallax(cursorY){
        var pointX = (windowX/2) - cursorY;
        document.getElementById('layer-1').style.transform = 'translate3d('+(pointX/40)+'px, '+'0px, 0px)';
        document.getElementById('layer-2').style.transform = 'translate3d('+(pointX/30)+'px, '+'0px, 0px)';
        document.getElementById('chest1').style.transform = 'translate3d('+(pointX/20)+'px, '+'0px, 0px)';
        document.getElementById('chest2').style.transform = 'translate3d('+(pointX/30)+'px, '+'0px, 0px)';
        document.getElementById('chest3').style.transform = 'translate3d('+(pointX/60)+'px, '+'0px, 0px)';
        document.getElementById('chest123').style.transform = 'translate3d('+(pointX/60)+'px, '+'0px, 0px)';
        document.getElementById('tree1').style.transform = 'translate3d('+(pointX/20)+'px, '+'0px, 0px)';
        document.getElementById('tree2').style.transform = 'translate3d('+(pointX/40)+'px, '+'0px, 0px)';
    }
    // do parallax on mouse move
    window.addEventListener('mousemove',function(move){
        doParallax(move.pageX);
    });
});
this.move = function(){

}



