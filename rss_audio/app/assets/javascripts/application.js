// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
jQuery(function($){
  var counter = 0;
  $(".deleteAction").click(function(){
    counter += 1;
    $.ajax({
      url: '/audio/' + counter,
      type: 'POST',
      data: {},
      success: function(result) {
        var foo = eval(result);
        nextSong(foo.success);
      }
    });
  });

  function nextSong(link){
    if(link){
      var audio = $('audio');
      audio[0].src = link;
      audio[0].load();
      audio[0].play();
    }
  };
});
